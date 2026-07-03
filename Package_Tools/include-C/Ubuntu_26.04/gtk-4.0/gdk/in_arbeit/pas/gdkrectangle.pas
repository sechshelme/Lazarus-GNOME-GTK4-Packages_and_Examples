unit gdkrectangle;

interface

uses
  fp_glib2, fp_gtk4, gdktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gdk_rectangle_intersect(src1: PGdkRectangle; src2: PGdkRectangle; dest: PGdkRectangle): Tgboolean; cdecl; external libgtk4;
procedure gdk_rectangle_union(src1: PGdkRectangle; src2: PGdkRectangle; dest: PGdkRectangle); cdecl; external libgtk4;
function gdk_rectangle_equal(rect1: PGdkRectangle; rect2: PGdkRectangle): Tgboolean; cdecl; external libgtk4;
function gdk_rectangle_contains_point(rect: PGdkRectangle; x: longint; y: longint): Tgboolean; cdecl; external libgtk4;
function gdk_rectangle_get_type: TGType; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:26:38 ===

function GDK_TYPE_RECTANGLE: TGType;

implementation

function GDK_TYPE_RECTANGLE: TGType;
begin
  GDK_TYPE_RECTANGLE := gdk_rectangle_get_type;
end;



end.
