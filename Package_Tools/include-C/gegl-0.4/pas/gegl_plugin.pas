unit gegl_plugin;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GEGL_MODULE_ABI_VERSION = $000A;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGeglModuleInfo = ^TGeglModuleInfo;
  TGeglModuleInfo = record
    abi_version: Tguint32;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_module_register_type(module: PGTypeModule; parent_type: TGType; type_name: Pgchar; type_info: PGTypeInfo; flags: TGTypeFlags): TGType; cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:25:35 ===


implementation



end.
