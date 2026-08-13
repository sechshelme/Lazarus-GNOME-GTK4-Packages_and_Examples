unit gegl_buffer_swap;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function gegl_buffer_swap_create_file(suffix: Pgchar): Pgchar; cdecl; external libgegl;
procedure gegl_buffer_swap_remove_file(path: Pgchar); cdecl; external libgegl;
function gegl_buffer_swap_has_file(path: Pgchar): Tgboolean; cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 14:48:02 ===


implementation



end.
