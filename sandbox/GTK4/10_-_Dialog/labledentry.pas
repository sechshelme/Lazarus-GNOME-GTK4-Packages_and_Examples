unit LabledEntry;

interface

uses
  fp_glib2, fp_pango, fp_GTK4;

type
  TLabeledEntry = record
    parent_instance: TGtkBox;
    lab, entry: PGtkWidget;
  end;
  PLabeledEntry = ^TLabeledEntry;

  TLabeledEntryClass = record
    parent_class: TGtkBoxClass;
  end;
  PLabeledEntryClass = ^TLabeledEntryClass;

function labeled_entry_get_type: TGType;
function labeled_entry_new(s: Pgchar): PGTKWidget;
function labeled_entry_get_text(self: PLabeledEntry): Pgchar;
procedure labeled_entry_set_label(self: PLabeledEntry; s: Pgchar);

implementation

// ==== private

var
  parent_class: PLabeledEntryClass = nil;

procedure class_init(g_class: Tgpointer; {%H-}class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; {%H-}g_class: Tgpointer); cdecl;
var
  self: PLabeledEntry absolute instance;
begin
  gtk_widget_set_hexpand(GTK_WIDGET(self), True);
  gtk_orientable_set_orientation(GTK_ORIENTABLE(self), GTK_ORIENTATION_HORIZONTAL);
  gtk_box_set_spacing(GTK_BOX(self), 10);
  gtk_widget_set_margin_top(GTK_WIDGET(self), 5);

  with self^ do begin
    lab := gtk_label_new(nil);
    gtk_label_set_ellipsize(GTK_LABEL(lab), PANGO_ELLIPSIZE_END);
    gtk_widget_set_has_tooltip(lab, True);
    gtk_label_set_xalign(GTK_LABEL(lab), 0.0);
    gtk_widget_set_halign(lab, GTK_ALIGN_START);
    gtk_widget_set_margin_start(lab, 10);
    gtk_label_set_width_chars(GTK_LABEL(lab), 15);
    gtk_label_set_max_width_chars(GTK_LABEL(lab), 15);
    gtk_widget_set_hexpand(lab, False);
    gtk_box_append(GTK_BOX(self), lab);

    entry := gtk_entry_new;
    gtk_widget_set_hexpand(entry, True);
    gtk_widget_set_margin_end(entry, 10);
    gtk_box_append(GTK_BOX(self), entry);
  end;
end;


// ==== public

function labeled_entry_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_BOX, 'LabledEntry', SizeOf(TLabeledEntryClass), @class_init, SizeOf(TLabeledEntry), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function labeled_entry_new(s: Pgchar): PGTKWidget;
var
  self: PLabeledEntry absolute Result;
begin
  Result := g_object_new(labeled_entry_get_type, nil);
  labeled_entry_set_label(self, s);
end;

function labeled_entry_get_text(self: PLabeledEntry): Pgchar;
begin
  Result := gtk_editable_get_text(GTK_EDITABLE(self^.entry));
end;

procedure labeled_entry_set_label(self: PLabeledEntry; s: Pgchar);
begin
  with self^ do begin
    gtk_label_set_label(GTK_LABEL(lab), s);
    gtk_widget_set_tooltip_text(lab, s);
  end;
end;


end.
