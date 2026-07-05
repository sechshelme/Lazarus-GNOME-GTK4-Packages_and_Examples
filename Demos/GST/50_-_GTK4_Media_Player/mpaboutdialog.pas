unit MPAboutDialog;

interface

uses
  fp_glib2, fp_gst, fp_GTK4;

type
  PMPAboutDialog = type Pointer;
  PMPAboutDialogClass = type Pointer;

function mp_about_dialog_get_type: TGType;
function mp_about_dialog_new: PGTKWidget;

implementation

// ==== private

type
  TInstPriv = record
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: PMPAboutDialogClass = nil;
  instance_size: integer = 0;

function GetPriv(w: Tgpointer): PInstPriv; inline;
begin
  Result := PInstPriv(w + instance_size);
end;


procedure finalize_cp(obj: PGObject); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(obj);
  with priv^ do begin
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure on_close_clicked(widget: PGtkWidget; uses_data: Tgpointer); cdecl;
begin
  gtk_window_close(GTK_WINDOW(uses_data));
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  window: PGtkWindow absolute instance;
  priv: PInstPriv;
  box, title_label, version_label, close_button: PGtkWidget;
  s: Pgchar;
  gst_maj, gst_min, gst_mic, gst_nan: Tguint;
begin
  priv := GetPriv(instance);
  with priv^ do begin
  end;

  gtk_window_set_title(window, 'About');
  gtk_window_set_default_size(window, 300, 200);
  gtk_window_set_resizable(window, False);

  box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 15);
  gtk_widget_set_margin_top(box, 20);
  gtk_widget_set_margin_bottom(box, 20);
  gtk_widget_set_margin_start(box, 20);
  gtk_widget_set_margin_end(box, 20);
  gtk_window_set_child(window, box);

  title_label := gtk_label_new(nil);
  gtk_label_set_markup(GTK_LABEL(title_label), '<span weight=''bold'' size=''large''>GST Media Player</span>');
  gtk_box_append(GTK_BOX(box), title_label);

  gst_version(@gst_maj, @gst_min, @gst_mic, @gst_nan);
  s := g_strdup_printf('GLIB-Version: %d.%d.%d'#10'GST-Version: %d.%d.%d.%d'#10'GTK-Version: %d.%d.%d'#10,
    glib_major_version, glib_minor_version, glib_micro_version,
    gst_maj, gst_min, gst_mic, gst_nan,
    gtk_get_major_version, gtk_get_minor_version, gtk_get_micro_version);
  version_label := gtk_label_new(s);
  g_free(s);

  gtk_label_set_justify(GTK_LABEL(version_label), GTK_JUSTIFY_CENTER);
  gtk_box_append(GTK_BOX(box), version_label);

  close_button := gtk_button_new_with_label('close');
  gtk_widget_set_valign(close_button, GTK_ALIGN_END);
  gtk_widget_set_vexpand(close_button, True);

  g_signal_connect(close_button, 'clicked', G_CALLBACK(@on_close_clicked), window);
  gtk_box_append(GTK_BOX(box), close_button);
end;


// ==== public

function mp_about_dialog_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_WINDOW, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_WINDOW, 'About',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_about_dialog_new: PGTKWidget;
var
  priv: PInstPriv;
begin
  Result := g_object_new(mp_about_dialog_get_type, nil);
  priv := GetPriv(Result);
end;

end.
