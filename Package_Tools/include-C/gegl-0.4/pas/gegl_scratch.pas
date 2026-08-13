unit gegl_scratch;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function gegl_scratch_alloc(size: Tgsize): Tgpointer; cdecl; external libgegl;
function gegl_scratch_alloc0(size: Tgsize): Tgpointer; cdecl; external libgegl;
procedure gegl_scratch_free(ptr: Tgpointer); cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:23:28 ===

implementation

end.
