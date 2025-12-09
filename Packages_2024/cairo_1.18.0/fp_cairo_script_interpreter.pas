unit fp_cairo_script_interpreter;

interface

uses
  fp_cairo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tcairo_script_interpreter_t = type Pointer;
  Pcairo_script_interpreter_t = ^Tcairo_script_interpreter_t;
  Tcairo_script_interpreter = Tcairo_script_interpreter_t;

  Tcsi_destroy_func_t = procedure(closure: pointer; ptr: pointer); cdecl;
  Tcsi_surface_create_func_t = function(closure: pointer; content: Tcairo_content_t; Width: double; Height: double; uid: Tclong): Pcairo_surface_t; cdecl;
  Tcsi_context_create_func_t = function(closure: pointer; surface: Pcairo_surface_t): Pcairo_t; cdecl;
  Tcsi_show_page_func_t = procedure(closure: pointer; cr: Pcairo_t); cdecl;
  Tcsi_copy_page_func_t = procedure(closure: pointer; cr: Pcairo_t); cdecl;
  Tcsi_create_source_image_t = function(closure: pointer; format: Tcairo_format_t; Width: longint; Height: longint; uid: Tclong): Pcairo_surface_t; cdecl;

  Tcairo_script_interpreter_hooks = record
    closure: pointer;
    surface_create: Tcsi_surface_create_func_t;
    surface_destroy: Tcsi_destroy_func_t;
    context_create: Tcsi_context_create_func_t;
    context_destroy: Tcsi_destroy_func_t;
    show_page: Tcsi_show_page_func_t;
    copy_page: Tcsi_copy_page_func_t;
    create_source_image: Tcsi_create_source_image_t;
  end;
  Pcairo_script_interpreter_hooks = ^Tcairo_script_interpreter_hooks;

  Tcairo_script_interpreter_hooks_t = Tcairo_script_interpreter_hooks;
  Pcairo_script_interpreter_hooks_t = ^Tcairo_script_interpreter_hooks_t;

function cairo_script_interpreter_create: Pcairo_script_interpreter_t; cdecl; external cairo_lib;
procedure cairo_script_interpreter_install_hooks(ctx: Pcairo_script_interpreter_t; hooks: Pcairo_script_interpreter_hooks_t); cdecl; external cairo_lib;
function cairo_script_interpreter_run(ctx: Pcairo_script_interpreter_t; filename: PChar): Tcairo_status_t; cdecl; external cairo_lib;
function cairo_script_interpreter_feed_stream(ctx: Pcairo_script_interpreter_t; stream: PFILE): Tcairo_status_t; cdecl; external cairo_lib;
function cairo_script_interpreter_feed_string(ctx: Pcairo_script_interpreter_t; line: PChar; len: longint): Tcairo_status_t; cdecl; external cairo_lib;
function cairo_script_interpreter_get_line_number(ctx: Pcairo_script_interpreter_t): dword; cdecl; external cairo_lib;
function cairo_script_interpreter_reference(ctx: Pcairo_script_interpreter_t): Pcairo_script_interpreter_t; cdecl; external cairo_lib;
function cairo_script_interpreter_finish(ctx: Pcairo_script_interpreter_t): Tcairo_status_t; cdecl; external cairo_lib;
function cairo_script_interpreter_destroy(ctx: Pcairo_script_interpreter_t): Tcairo_status_t; cdecl; external cairo_lib;
function cairo_script_interpreter_translate_stream(stream: PFILE; write_func: Tcairo_write_func_t; closure: pointer): Tcairo_status_t; cdecl; external cairo_lib;

implementation

end.
