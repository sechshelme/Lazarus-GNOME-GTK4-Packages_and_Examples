unit ColorButtonBox;

interface

uses
  fp_glib2, fp_GTK4;

type
  TColorButtonBox = record
    parent_instance: TGtkBox;
  end;
  PColorButtonBox = ^TColorButtonBox;

  TColorButtonBoxClass = record
    parent_class: TGtkBoxClass;
  end;
  PColorButtonBoxClass = ^TColorButtonBoxClass;

function color_button_box_get_type: TGType;
function color_button_box_new: PGTKWidget;
function color_button_box_new_with_buttons(cols: pchar): PGTKWidget;
procedure color_button_box_add_button(w: PColorButtonBox; col: pchar);
function color_button_box_insert_button(w: PColorButtonBox; col: pchar; index: uint32): boolean;
function color_button_box_remove(w: PColorButtonBox; index: uint32): boolean;


implementation

// ==== private

var
  parent_class: PColorButtonBoxClass = nil;
  signal_id: Tguint = 0;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  parent_class := g_type_class_peek_parent(g_class);
  signal_id := g_signal_new('color-set', G_TYPE_FROM_CLASS(g_class), G_SIGNAL_RUN_LAST or G_SIGNAL_DETAILED, 0, nil, nil, nil, G_TYPE_NONE, 1, GDK_TYPE_RGBA);
end;

procedure new_color_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  col: PGdkRGBA absolute user_data;
begin
  g_signal_emit(gtk_widget_get_parent(widget), signal_id, 0, col);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PColorButtonBox absolute instance;
begin
  gtk_orientable_set_orientation(GTK_ORIENTABLE(self), GTK_ORIENTATION_HORIZONTAL);
end;


// ==== public

function color_button_box_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_BOX, 'ColorButtonBox', SizeOf(TColorButtonBoxClass), @class_init, SizeOf(TColorButtonBox), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function color_button_box_new: PGTKWidget;
begin
  Result := g_object_new(color_button_box_get_type, nil);
end;

function color_button_box_new_with_buttons(cols: pchar): PGTKWidget;
var
  colors: PPgchar;
  i: integer = 0;
begin
  Result := color_button_box_new;
  if cols <> nil then begin
    colors := g_strsplit(cols, ',', -1);
    while colors[i] <> nil do begin
      color_button_box_add_button(PColorButtonBox(Result), colors[i]);
      Inc(i);
    end;
    g_strfreev(colors);
  end;
end;


// =====

function CreateButton(col: pchar): PGtkWidget;
var
  c: PGdkRGBA;
  bytes: PGBytes;
  texture: PGdkTexture;
  image: PGtkWidget;
begin
  c:=g_malloc(SizeOf(TGdkRGBA));
  gdk_rgba_parse(c, col);
  bytes := g_bytes_new(c, SizeOf(TGdkRGBA));
  texture := gdk_memory_texture_new(1, 1, GDK_MEMORY_R32G32B32A32_FLOAT, bytes, 4 * 4);
  g_bytes_unref(bytes);
  image := gtk_image_new_from_paintable(GDK_PAINTABLE(texture));
  g_object_unref(texture);

  Result := gtk_button_new;
  gtk_button_set_child(GTK_BUTTON(Result), image);

  g_object_set_data_full(G_OBJECT(Result),'key',c,@g_free);
  g_signal_connect(Result, 'clicked', G_CALLBACK(@new_color_cp), c);
end;

procedure color_button_box_add_button(w: PColorButtonBox; col: pchar);
var
  self: PGtkWidget absolute w;
begin
  gtk_box_append(GTK_BOX(self), CreateButton(col));
end;

function color_button_box_insert_button(w: PColorButtonBox; col: pchar; index: uint32): boolean;
var
  self: PGtkWidget absolute w;
  sibling: PGtkWidget = nil;
  i: integer;
begin
  if index > 0 then begin
    sibling := gtk_widget_get_first_child(self);
    i := 0;
    while (sibling <> nil) and (i < index - 1) do begin
      sibling := gtk_widget_get_next_sibling(sibling);
      Inc(i);
    end;
    if (sibling = nil) then begin
      Exit(False);
    end;
  end;
  gtk_box_insert_child_after(GTK_BOX(self), CreateButton(col), sibling);
  Result := True;
end;

function color_button_box_remove(w: PColorButtonBox; index: uint32): boolean;
var
  self: PGtkWidget absolute w;
  sibling: PGtkWidget;
  i: integer = 0;
begin
  sibling := gtk_widget_get_first_child(self);
  while (sibling <> nil) and (i < index) do begin
    sibling := gtk_widget_get_next_sibling(sibling);
    Inc(i);
  end;

  if (sibling <> nil) and (i = index) then begin
    gtk_box_remove(GTK_BOX(self), sibling);
    Result := True;
  end else begin
    Result := False;
  end;
end;

end.
