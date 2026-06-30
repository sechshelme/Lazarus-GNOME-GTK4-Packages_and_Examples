unit gdebugcontroller;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  G_DEBUG_CONTROLLER_EXTENSION_POINT_NAME = 'gio-debug-controller';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGDebugController = type Pointer;

  PGDebugControllerInterface = ^TGDebugControllerInterface;
  TGDebugControllerInterface = record
    g_iface: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_debug_controller_get_type: TGType; cdecl; external libgio2;
function g_debug_controller_get_debug_enabled(self: PGDebugController): Tgboolean; cdecl; external libgio2;
procedure g_debug_controller_set_debug_enabled(self: PGDebugController; debug_enabled: Tgboolean); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:17:58 ===

function g_TYPE_debug_controller: TGType;
function g_debug_controller(obj: Pointer): PGDebugController;
function g_IS_debug_controller(obj: Pointer): Tgboolean;
function g_debug_controller_GET_IFACE(obj: Pointer): PGDebugControllerInterface;
{$ENDIF read_function}

implementation

function g_TYPE_debug_controller: TGType;
begin
  Result := g_debug_controller_get_type;
end;

function g_debug_controller(obj: Pointer): PGDebugController;
begin
  Result := PGDebugController(g_type_check_instance_cast(obj, g_TYPE_debug_controller));
end;

function g_IS_debug_controller(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, g_TYPE_debug_controller);
end;

function g_debug_controller_GET_IFACE(obj: Pointer): PGDebugControllerInterface;
begin
  Result := g_type_interface_peek(obj, g_TYPE_debug_controller);
end;

end.
