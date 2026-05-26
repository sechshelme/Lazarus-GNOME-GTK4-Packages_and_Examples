unit MPDurationBox;

interface

uses
  fp_glib2, fp_GTK4, fp_gst,
  MPStreamer;

type
  PMDurationBox = type Pointer;
  PMDurationBoxClass = type Pointer;

function mp_duration_box_get_type: TGType;
function mp_duration_box_new: PGTKWidget;
procedure mp_duration_box_set_duration(w: PMDurationBox; d: TGstClockTime);
procedure mp_duration_box_set_position(w: PMDurationBox; p: TGstClockTime);

implementation

// ==== private

type
  TInstPriv = record
    LabelPosition, LabelDuration: PGtkWidget;
  end;
  PInstPriv = ^TInstPriv;

  TClassPriv = record
  end;
  PClassPriv = ^TClassPriv;

var
  parent_class: Tgpointer = nil;
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
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init_cp(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  priv: PInstPriv;
begin
  priv := GetPriv(instance);
end;


// ==== public

function mp_duration_box_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_BOX, @query);
    instance_size := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_BOX, 'MPVUDurationBox',
      query.class_size + SizeOf(TClassPriv), @class_init_cp,
      query.instance_size + SizeOf(TInstPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_duration_box_new: PGTKWidget;
var
  priv: PInstPriv;
  lab1: PGtkWidget;
begin
  Result := g_object_new(mp_duration_box_get_type, nil);
  gtk_orientable_set_orientation(GTK_ORIENTABLE(Result), GTK_ORIENTATION_HORIZONTAL);
  gtk_box_set_spacing(GTK_BOX(Result), 10);

  priv := GetPriv(Result);
  with priv^ do begin
    gtk_widget_set_margin_start(Result, 15);

    lab1 := gtk_label_new('Position:');
    gtk_box_append(GTK_BOX(Result), lab1);
    LabelPosition := gtk_label_new('00:00:0');
    gtk_widget_set_size_request(LabelPosition, 60, -1);
    gtk_label_set_xalign(GTK_LABEL(LabelPosition), 1.0);
    gtk_box_append(GTK_BOX(Result), LabelPosition);

    lab1 := gtk_label_new('Duration:');
    gtk_box_append(GTK_BOX(Result), lab1);
    LabelDuration := gtk_label_new('00:00:0');
    gtk_widget_set_size_request(LabelDuration, 60, -1);
    gtk_label_set_xalign(GTK_LABEL(LabelDuration), 1.0);
    gtk_box_append(GTK_BOX(Result), LabelDuration);
  end;
end;

procedure mp_duration_box_set_duration(w: PMDurationBox; d: TGstClockTime);
var
  priv: PInstPriv;
  s: string;
begin
  priv := GetPriv(w);

  s := GstClockToStr(d);
  gtk_label_set_label(GTK_LABEL(priv^.LabelDuration), pchar(s));
end;

procedure mp_duration_box_set_position(w: PMDurationBox; p: TGstClockTime);
var
  priv: PInstPriv;
  s: string;
begin
  priv := GetPriv(w);

  if p = GST_CLOCK_TIME_NONE then begin
    s := '--.--';
  end else begin
    s := GstClockToStr(p);
  end;
  gtk_label_set_label(GTK_LABEL(priv^.LabelPosition), pchar(s));
end;

end.
