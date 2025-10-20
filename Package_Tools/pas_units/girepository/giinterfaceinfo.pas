unit giinterfaceinfo;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function GI_IS_INTERFACE_INFO(info: Pointer): boolean;

function g_interface_info_get_n_prerequisites(info: PGIInterfaceInfo): Tgint; cdecl; external libgirepository;
function g_interface_info_get_prerequisite(info: PGIInterfaceInfo; n: Tgint): PGIBaseInfo; cdecl; external libgirepository;
function g_interface_info_get_n_properties(info: PGIInterfaceInfo): Tgint; cdecl; external libgirepository;
function g_interface_info_get_property(info: PGIInterfaceInfo; n: Tgint): PGIPropertyInfo; cdecl; external libgirepository;
function g_interface_info_get_n_methods(info: PGIInterfaceInfo): Tgint; cdecl; external libgirepository;
function g_interface_info_get_method(info: PGIInterfaceInfo; n: Tgint): PGIFunctionInfo; cdecl; external libgirepository;
function g_interface_info_find_method(info: PGIInterfaceInfo; name: Pgchar): PGIFunctionInfo; cdecl; external libgirepository;
function g_interface_info_get_n_signals(info: PGIInterfaceInfo): Tgint; cdecl; external libgirepository;
function g_interface_info_get_signal(info: PGIInterfaceInfo; n: Tgint): PGISignalInfo; cdecl; external libgirepository;
function g_interface_info_find_signal(info: PGIInterfaceInfo; name: Pgchar): PGISignalInfo; cdecl; external libgirepository;
function g_interface_info_get_n_vfuncs(info: PGIInterfaceInfo): Tgint; cdecl; external libgirepository;
function g_interface_info_get_vfunc(info: PGIInterfaceInfo; n: Tgint): PGIVFuncInfo; cdecl; external libgirepository;
function g_interface_info_find_vfunc(info: PGIInterfaceInfo; name: Pgchar): PGIVFuncInfo; cdecl; external libgirepository;
function g_interface_info_get_n_constants(info: PGIInterfaceInfo): Tgint; cdecl; external libgirepository;
function g_interface_info_get_constant(info: PGIInterfaceInfo; n: Tgint): PGIConstantInfo; cdecl; external libgirepository;
function g_interface_info_get_iface_struct(info: PGIInterfaceInfo): PGIStructInfo; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:00 ===


implementation


function GI_IS_INTERFACE_INFO(info: Pointer): boolean;
begin
  GI_IS_INTERFACE_INFO := g_base_info_get_type(PGIBaseInfo(info)) = GI_INFO_TYPE_INTERFACE;
end;


end.
