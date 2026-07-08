unit gtkiconpaintable;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkIconPaintable = type Pointer;

  TGtkIconPaintableClass = record
    parent_class: TGObjectClass;
  end;
  PGtkIconPaintableClass = ^TGtkIconPaintableClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_icon_paintable_get_type: TGType; cdecl; external libgtk4;
function gtk_icon_paintable_new_for_file(file_: PGFile; size: longint; scale: longint): PGtkIconPaintable; cdecl; external libgtk4;
function gtk_icon_paintable_get_file(self: PGtkIconPaintable): PGFile; cdecl; external libgtk4;
function gtk_icon_paintable_get_icon_name(self: PGtkIconPaintable): pchar; cdecl; external libgtk4; deprecated;
function gtk_icon_paintable_is_symbolic(self: PGtkIconPaintable): Tgboolean; cdecl; external libgtk4; deprecated;

// === Konventiert am: 6-7-26 17:10:39 ===

function GTK_TYPE_ICON_PAINTABLE: TGType;
function GTK_ICON_PAINTABLE(obj: Pointer): PGtkIconPaintable;
function GTK_IS_ICON_PAINTABLE(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_ICON_PAINTABLE: TGType;
begin
  Result := gtk_icon_paintable_get_type;
end;

function GTK_ICON_PAINTABLE(obj: Pointer): PGtkIconPaintable;
begin
  Result := PGtkIconPaintable(g_type_check_instance_cast(obj, GTK_TYPE_ICON_PAINTABLE));
end;

function GTK_IS_ICON_PAINTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ICON_PAINTABLE);
end;

end.
