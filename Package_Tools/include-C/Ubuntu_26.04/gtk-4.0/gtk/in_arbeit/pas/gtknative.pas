unit gtknative;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkNative = type Pointer;
  PGtkNativeInterface = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_native_get_type: TGType; cdecl; external libgtk4;
procedure gtk_native_realize(self: PGtkNative); cdecl; external libgtk4;
procedure gtk_native_unrealize(self: PGtkNative); cdecl; external libgtk4;
function gtk_native_get_for_surface(surface: PGdkSurface): PGtkNative; cdecl; external libgtk4;
function gtk_native_get_surface(self: PGtkNative): PGdkSurface; cdecl; external libgtk4;
function gtk_native_get_renderer(self: PGtkNative): PGskRenderer; cdecl; external libgtk4;
procedure gtk_native_get_surface_transform(self: PGtkNative; x: Pdouble; y: Pdouble); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:14:30 ===

function GTK_TYPE_NATIVE: TGType;
function GTK_NATIVE(obj: Pointer): PGtkNative;
function GTK_IS_NATIVE(obj: Pointer): Tgboolean;
function GTK_NATIVE_GET_IFACE(obj: Pointer): PGtkNativeInterface;
{$ENDIF read_function}

implementation

function GTK_TYPE_NATIVE: TGType;
begin
  Result := gtk_native_get_type;
end;

function GTK_NATIVE(obj: Pointer): PGtkNative;
begin
  Result := PGtkNative(g_type_check_instance_cast(obj, GTK_TYPE_NATIVE));
end;

function GTK_IS_NATIVE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_NATIVE);
end;

function GTK_NATIVE_GET_IFACE(obj: Pointer): PGtkNativeInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_NATIVE);
end;

end.
