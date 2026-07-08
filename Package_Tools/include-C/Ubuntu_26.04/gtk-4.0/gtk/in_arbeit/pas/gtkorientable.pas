unit gtkorientable;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkOrientable = type Pointer;

  PGtkOrientableIface = ^TGtkOrientableIface;
  TGtkOrientableIface = record
    base_iface: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_orientable_get_type: TGType; cdecl; external libgtk4;
procedure gtk_orientable_set_orientation(orientable: PGtkOrientable; orientation: TGtkOrientation); cdecl; external libgtk4;
function gtk_orientable_get_orientation(orientable: PGtkOrientable): TGtkOrientation; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:07:18 ===

function GTK_TYPE_ORIENTABLE: TGType;
function GTK_ORIENTABLE(obj: Pointer): PGtkOrientable;
function GTK_IS_ORIENTABLE(obj: Pointer): Tgboolean;
function GTK_ORIENTABLE_GET_IFACE(obj: Pointer): PGtkOrientableIface;
{$ENDIF read_function}

implementation

function GTK_TYPE_ORIENTABLE: TGType;
begin
  GTK_TYPE_ORIENTABLE := gtk_orientable_get_type;
end;

function GTK_ORIENTABLE(obj: Pointer): PGtkOrientable;
begin
  Result := PGtkOrientable(g_type_check_instance_cast(obj, GTK_TYPE_ORIENTABLE));
end;

function GTK_IS_ORIENTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ORIENTABLE);
end;

function GTK_ORIENTABLE_GET_IFACE(obj: Pointer): PGtkOrientableIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ORIENTABLE);
end;



end.
