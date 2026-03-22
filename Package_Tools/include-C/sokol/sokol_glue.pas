unit sokol_glue;

interface

uses
  fp_sokol, sokol_gfx;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function sglue_environment:Tsg_environment;cdecl;external libsokol;
function sglue_swapchain:Tsg_swapchain;cdecl;external libsokol;

// === Konventiert am: 22-3-26 16:22:47 ===


implementation



end.
