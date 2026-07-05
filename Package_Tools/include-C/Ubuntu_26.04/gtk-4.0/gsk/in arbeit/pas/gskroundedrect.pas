unit gskroundedrect;

interface

uses
  fp_glib2, fp_graphene, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGskRoundedRect = ^TGskRoundedRect;
  TGskRoundedRect = record
    bounds: Tgraphene_rect_t;
    corner: array[0..3] of Tgraphene_size_t;
  end;

function gsk_rounded_rect_init(self: PGskRoundedRect; bounds: Pgraphene_rect_t; top_left: Pgraphene_size_t; top_right: Pgraphene_size_t; bottom_right: Pgraphene_size_t;
  bottom_left: Pgraphene_size_t): PGskRoundedRect; cdecl; external libgtk4;
function gsk_rounded_rect_init_copy(self: PGskRoundedRect; src: PGskRoundedRect): PGskRoundedRect; cdecl; external libgtk4;
function gsk_rounded_rect_init_from_rect(self: PGskRoundedRect; bounds: Pgraphene_rect_t; radius: single): PGskRoundedRect; cdecl; external libgtk4;
function gsk_rounded_rect_normalize(self: PGskRoundedRect): PGskRoundedRect; cdecl; external libgtk4;
function gsk_rounded_rect_offset(self: PGskRoundedRect; dx: single; dy: single): PGskRoundedRect; cdecl; external libgtk4;
function gsk_rounded_rect_shrink(self: PGskRoundedRect; top: single; right: single; bottom: single; left: single): PGskRoundedRect; cdecl; external libgtk4;
function gsk_rounded_rect_is_rectilinear(self: PGskRoundedRect): Tgboolean; cdecl; external libgtk4;
function gsk_rounded_rect_contains_point(self: PGskRoundedRect; point: Pgraphene_point_t): Tgboolean; cdecl; external libgtk4;
function gsk_rounded_rect_contains_rect(self: PGskRoundedRect; rect: Pgraphene_rect_t): Tgboolean; cdecl; external libgtk4;
function gsk_rounded_rect_intersects_rect(self: PGskRoundedRect; rect: Pgraphene_rect_t): Tgboolean; cdecl; external libgtk4;

function GSK_ROUNDED_RECT_INIT(x, y, w, h: single): TGskRoundedRect; inline;


// === Konventiert am: 5-7-26 13:35:35 ===


implementation

function GSK_ROUNDED_RECT_INIT(x, y, w, h: single): TGskRoundedRect; inline;
begin
  Result.bounds := GRAPHENE_RECT_INIT(x, y, w, h);
  Result.corner[0] := GRAPHENE_SIZE_INIT(0, 0);
  Result.corner[1] := GRAPHENE_SIZE_INIT(0, 0);
  Result.corner[2] := GRAPHENE_SIZE_INIT(0, 0);
  Result.corner[3] := GRAPHENE_SIZE_INIT(0, 0);
end;

end.
