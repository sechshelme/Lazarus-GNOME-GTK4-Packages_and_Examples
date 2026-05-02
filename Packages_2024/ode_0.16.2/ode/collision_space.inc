{$IFDEF read_interface}


type
  TdNearCallback = procedure(data: pointer; o1: TdGeomID; o2: TdGeomID); cdecl;

function dSimpleSpaceCreate(space: TdSpaceID): TdSpaceID; cdecl; external libodes;
function dHashSpaceCreate(space: TdSpaceID): TdSpaceID; cdecl; external libodes;
function dQuadTreeSpaceCreate(space: TdSpaceID; Center: TdVector3; Extents: TdVector3; Depth: longint): TdSpaceID; cdecl; external libodes;

const
  dSAP_AXES_XYZ = (0 or (1 shl 2)) or (2 shl 4);
  dSAP_AXES_XZY = (0 or (2 shl 2)) or (1 shl 4);
  dSAP_AXES_YXZ = (1 or (0 shl 2)) or (2 shl 4);
  dSAP_AXES_YZX = (1 or (2 shl 2)) or (0 shl 4);
  dSAP_AXES_ZXY = (2 or (0 shl 2)) or (1 shl 4);
  dSAP_AXES_ZYX = (2 or (1 shl 2)) or (0 shl 4);

function dSweepAndPruneSpaceCreate(space: TdSpaceID; axisorder: longint): TdSpaceID; cdecl; external libodes;
procedure dSpaceDestroy(para1: TdSpaceID); cdecl; external libodes;
procedure dHashSpaceSetLevels(space: TdSpaceID; minlevel: longint; maxlevel: longint); cdecl; external libodes;
procedure dHashSpaceGetLevels(space: TdSpaceID; minlevel: Plongint; maxlevel: Plongint); cdecl; external libodes;
procedure dSpaceSetCleanup(space: TdSpaceID; mode: longint); cdecl; external libodes;
function dSpaceGetCleanup(space: TdSpaceID): longint; cdecl; external libodes;
procedure dSpaceSetSublevel(space: TdSpaceID; sublevel: longint); cdecl; external libodes;
function dSpaceGetSublevel(space: TdSpaceID): longint; cdecl; external libodes;
procedure dSpaceSetManualCleanup(space: TdSpaceID; mode: longint); cdecl; external libodes;
function dSpaceGetManualCleanup(space: TdSpaceID): longint; cdecl; external libodes;
procedure dSpaceAdd(para1: TdSpaceID; para2: TdGeomID); cdecl; external libodes;
procedure dSpaceRemove(para1: TdSpaceID; para2: TdGeomID); cdecl; external libodes;
function dSpaceQuery(para1: TdSpaceID; para2: TdGeomID): longint; cdecl; external libodes;
procedure dSpaceClean(para1: TdSpaceID); cdecl; external libodes;
function dSpaceGetNumGeoms(para1: TdSpaceID): longint; cdecl; external libodes;
function dSpaceGetGeom(para1: TdSpaceID; i: longint): TdGeomID; cdecl; external libodes;
function dSpaceGetClass(space: TdSpaceID): longint; cdecl; external libodes;

// === Konventiert am: 30-4-26 17:10:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
