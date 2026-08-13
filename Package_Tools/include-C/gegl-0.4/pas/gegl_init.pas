unit gegl_init;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl, gegl_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
procedure gegl_init(argc: Pgint; argv: PPPgchar); cdecl; external libgegl;
function gegl_get_option_group: PGOptionGroup; cdecl; external libgegl;
procedure gegl_exit; cdecl; external libgegl;
procedure gegl_load_module_directory(path: Pgchar); cdecl; external libgegl;
function gegl_config: PGeglConfig; cdecl; external libgegl;
function gegl_stats: PGeglStats; cdecl; external libgegl;
procedure gegl_reset_stats; cdecl; external libgegl;
function gegl_is_main_thread: Tgboolean; cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 14:47:12 ===


implementation



end.
