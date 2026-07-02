unit gdkcolorstate;

interface

uses
  fp_glib2, fp_gtk4, gdktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gdk_color_state_get_type: TGType; cdecl; external libgtk4;
function gdk_color_state_ref(self: PGdkColorState): PGdkColorState; cdecl; external libgtk4;
procedure gdk_color_state_unref(self: PGdkColorState); cdecl; external libgtk4;
function gdk_color_state_get_srgb: PGdkColorState; cdecl; external libgtk4;
function gdk_color_state_get_srgb_linear: PGdkColorState; cdecl; external libgtk4;
function gdk_color_state_get_rec2100_pq: PGdkColorState; cdecl; external libgtk4;
function gdk_color_state_get_rec2100_linear: PGdkColorState; cdecl; external libgtk4;
function gdk_color_state_get_oklab: PGdkColorState; cdecl; external libgtk4;
function gdk_color_state_get_oklch: PGdkColorState; cdecl; external libgtk4;
function gdk_color_state_equal(self: PGdkColorState; other: PGdkColorState): Tgboolean; cdecl; external libgtk4;
function gdk_color_state_equivalent(self: PGdkColorState; other: PGdkColorState): Tgboolean; cdecl; external libgtk4;
function gdk_color_state_create_cicp_params(self: PGdkColorState): PGdkCicpParams; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 17:35:04 ===

function GDK_TYPE_COLOR_STATE: TGType;

implementation

function GDK_TYPE_COLOR_STATE: TGType;
begin
  GDK_TYPE_COLOR_STATE := gdk_color_state_get_type;
end;



end.
