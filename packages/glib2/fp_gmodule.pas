unit fp_gmodule;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGModuleFlags = ^TGModuleFlags;
  TGModuleFlags = longint;

const
  G_MODULE_BIND_LAZY = 1 shl 0;
  G_MODULE_BIND_LOCAL = 1 shl 1;
  G_MODULE_BIND_MASK = $03;

type
  TGModule = record
  end;
  PGModule = ^TGModule;

  PGModuleCheckInit = ^TGModuleCheckInit;
  TGModuleCheckInit = function(module: PGModule): Pgchar; cdecl;
  TGModuleUnload = procedure(module: PGModule); cdecl;

function g_module_error_quark: TGQuark; cdecl; external libgmodule;

type
  PGModuleError = ^TGModuleError;
  TGModuleError = longint;

const
  G_MODULE_ERROR_FAILED = 0;
  G_MODULE_ERROR_CHECK_FAILED = 1;

function g_module_supported: Tgboolean; cdecl; external libgmodule;
function g_module_open(file_name: Pgchar; flags: TGModuleFlags): PGModule; cdecl; external libgmodule;
function g_module_open_full(file_name: Pgchar; flags: TGModuleFlags; error: PPGError): PGModule; cdecl; external libgmodule;
function g_module_close(module: PGModule): Tgboolean; cdecl; external libgmodule;
procedure g_module_make_resident(module: PGModule); cdecl; external libgmodule;
function g_module_error: Pgchar; cdecl; external libgmodule;
function g_module_symbol(module: PGModule; symbol_name: Pgchar; symbol: Pgpointer): Tgboolean; cdecl; external libgmodule;
function g_module_name(module: PGModule): Pgchar; cdecl; external libgmodule;
function g_module_build_path(directory: Pgchar; module_name: Pgchar): Pgchar; cdecl; external libgmodule;

function G_MODULE_ERROR_: TGQuark;

// === Konventiert am: 8-11-24 13:39:28 ===


implementation

function G_MODULE_ERROR_: TGQuark;
begin
  Result := g_module_error_quark;
end;


end.
