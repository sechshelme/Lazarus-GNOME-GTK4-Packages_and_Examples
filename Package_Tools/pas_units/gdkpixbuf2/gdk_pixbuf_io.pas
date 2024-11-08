unit gdk_pixbuf_io;

interface

uses
  glib280, gmodule, gdk_pixbuf_core, gdk_pixbuf_animation;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGdkPixbufModulePattern = record
    prefix: pansichar;
    mask: pansichar;
    relevance: longint;
  end;
  PGdkPixbufModulePattern = ^TGdkPixbufModulePattern;

  TGdkPixbufFormat = record
    Name: Pgchar;
    signature: PGdkPixbufModulePattern;
    domain: Pgchar;
    description: Pgchar;
    mime_types: ^Pgchar;
    extensions: ^Pgchar;
    flags: Tguint32;
    disabled: Tgboolean;
    license: Pgchar;
  end;
  PGdkPixbufFormat = ^TGdkPixbufFormat;

function gdk_pixbuf_init_modules(path: pansichar; error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_get_type: TGType; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_formats: PGSList; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_get_name(format: PGdkPixbufFormat): Pgchar; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_get_description(format: PGdkPixbufFormat): Pgchar; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_get_mime_types(format: PGdkPixbufFormat): PPgchar; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_get_extensions(format: PGdkPixbufFormat): PPgchar; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_is_save_option_supported(format: PGdkPixbufFormat; option_key: Pgchar): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_is_writable(format: PGdkPixbufFormat): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_is_scalable(format: PGdkPixbufFormat): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_is_disabled(format: PGdkPixbufFormat): Tgboolean; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_format_set_disabled(format: PGdkPixbufFormat; disabled: Tgboolean); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_get_license(format: PGdkPixbufFormat): Pgchar; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_file_info(filename: Pgchar; Width: Pgint; Height: Pgint): PGdkPixbufFormat; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_get_file_info_async(filename: Pgchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_get_file_info_finish(async_result: PGAsyncResult; Width: Pgint; Height: Pgint; error: PPGError): PGdkPixbufFormat; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_format_copy(format: PGdkPixbufFormat): PGdkPixbufFormat; cdecl; external libgdk_pixbuf2;
procedure gdk_pixbuf_format_free(format: PGdkPixbufFormat); cdecl; external libgdk_pixbuf2;

type
  TGdkPixbufModuleSizeFunc = procedure(Width: Pgint; Height: Pgint; user_data: Tgpointer); cdecl;
  TGdkPixbufModulePreparedFunc = procedure(pixbuf: PGdkPixbuf; anim: PGdkPixbufAnimation; user_data: Tgpointer); cdecl;
  TGdkPixbufModuleUpdatedFunc = procedure(pixbuf: PGdkPixbuf; x: longint; y: longint; Width: longint; Height: longint;
    user_data: Tgpointer); cdecl;

  TGdkPixbufModuleLoadFunc = function(f: PFILE; error: PPGError): PGdkPixbuf; cdecl;
  PGdkPixbufModuleLoadFunc = ^TGdkPixbufModuleLoadFunc;

  TGdkPixbufModuleLoadXpmDataFunc = function(Data: PPansichar): PGdkPixbuf; cdecl;
  PGdkPixbufModuleLoadXpmDataFunc = ^TGdkPixbufModuleLoadXpmDataFunc;

  TGdkPixbufModuleLoadAnimationFunc = function(f: PFILE; error: PPGError): PGdkPixbufAnimation; cdecl;
  PGdkPixbufModuleLoadAnimationFunc = ^TGdkPixbufModuleLoadAnimationFunc;

  TGdkPixbufModuleBeginLoadFunc = function(size_func: TGdkPixbufModuleSizeFunc; prepared_func: TGdkPixbufModulePreparedFunc; updated_func: TGdkPixbufModuleUpdatedFunc; user_data: Tgpointer; error: PPGError): Tgpointer; cdecl;
  TGdkPixbufModuleStopLoadFunc = function(context: Tgpointer; error: PPGError): Tgboolean; cdecl;
  TGdkPixbufModuleIncrementLoadFunc = function(context: Tgpointer; buf: Pguchar; size: Tguint; error: PPGError): Tgboolean; cdecl;
  TGdkPixbufModuleSaveFunc = function(f: PFILE; pixbuf: PGdkPixbuf; param_keys: PPgchar; param_values: PPgchar; error: PPGError): Tgboolean; cdecl;
  TGdkPixbufModuleSaveCallbackFunc = function(save_func: TGdkPixbufSaveFunc; user_data: Tgpointer; pixbuf: PGdkPixbuf; option_keys: PPgchar; option_values: PPgchar;
    error: PPGError): Tgboolean; cdecl;
  TGdkPixbufModuleSaveOptionSupportedFunc = function(option_key: Pgchar): Tgboolean; cdecl;

  TGdkPixbufModule = record
    module_name: pansichar;
    module_path: pansichar;
    module: PGModule;
    info: PGdkPixbufFormat;
    load: TGdkPixbufModuleLoadFunc;
    load_xpm_data: TGdkPixbufModuleLoadXpmDataFunc;
    begin_load: TGdkPixbufModuleBeginLoadFunc;
    stop_load: TGdkPixbufModuleStopLoadFunc;
    load_increment: TGdkPixbufModuleIncrementLoadFunc;
    load_animation: TGdkPixbufModuleLoadAnimationFunc;
    save: TGdkPixbufModuleSaveFunc;
    save_to_callback: TGdkPixbufModuleSaveCallbackFunc;
    is_save_option_supported: TGdkPixbufModuleSaveOptionSupportedFunc;
    _reserved1: procedure; cdecl;
    _reserved2: procedure; cdecl;
    _reserved3: procedure; cdecl;
    _reserved4: procedure; cdecl;
  end;
  PGdkPixbufModule = ^TGdkPixbufModule;

  TGdkPixbufModuleFillVtableFunc = procedure(module: PGdkPixbufModule); cdecl;
  TGdkPixbufModuleFillInfoFunc = procedure(info: PGdkPixbufFormat); cdecl;

  PGdkPixbufFormatFlags = ^TGdkPixbufFormatFlags;
  TGdkPixbufFormatFlags = longint;

const
  GDK_PIXBUF_FORMAT_WRITABLE = 1 shl 0;
  GDK_PIXBUF_FORMAT_SCALABLE = 1 shl 1;
  GDK_PIXBUF_FORMAT_THREADSAFE = 1 shl 2;

  // === Konventiert am: 7-11-24 19:40:58 ===


implementation



end.
