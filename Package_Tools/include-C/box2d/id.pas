unit id;

interface

uses
  fp_box2d;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tb2WorldId = record
    index1: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2WorldId = ^Tb2WorldId;

  Tb2BodyId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2BodyId = ^Tb2BodyId;

  Tb2ShapeId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2ShapeId = ^Tb2ShapeId;

  Tb2ChainId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2ChainId = ^Tb2ChainId;

  Tb2JointId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    generation: Tuint16_t;
  end;
  Pb2JointId = ^Tb2JointId;

  Pb2ContactId = ^Tb2ContactId;

  Tb2ContactId = record
    index1: Tint32_t;
    world0: Tuint16_t;
    padding: Tint16_t;
    generation: Tuint32_t;
  end;

  { xxxxxxxxxxx
static const b2WorldId b2_nullWorldId = B2_NULL_ID;
static const b2BodyId b2_nullBodyId = B2_NULL_ID;
static const b2ShapeId b2_nullShapeId = B2_NULL_ID;
static const b2ChainId b2_nullChainId = B2_NULL_ID;
static const b2JointId b2_nullJointId = B2_NULL_ID;
static const b2ContactId b2_nullContactId = B2_NULL_ID;
 }

function b2StoreWorldId(id: Tb2WorldId): Tuint32_t; cdecl; external libbox2d;
function b2LoadWorldId(x: Tuint32_t): Tb2WorldId; cdecl; external libbox2d;
function b2StoreBodyId(id: Tb2BodyId): Tuint64_t; cdecl; external libbox2d;
function b2LoadBodyId(x: Tuint64_t): Tb2BodyId; cdecl; external libbox2d;
function b2StoreShapeId(id: Tb2ShapeId): Tuint64_t; cdecl; external libbox2d;
function b2LoadShapeId(x: Tuint64_t): Tb2ShapeId; cdecl; external libbox2d;
function b2StoreChainId(id: Tb2ChainId): Tuint64_t; cdecl; external libbox2d;
function b2LoadChainId(x: Tuint64_t): Tb2ChainId; cdecl; external libbox2d;
function b2StoreJointId(id: Tb2JointId): Tuint64_t; cdecl; external libbox2d;
function b2LoadJointId(x: Tuint64_t): Tb2JointId; cdecl; external libbox2d;
procedure b2StoreContactId(id: Tb2ContactId; values: Puint32_t); cdecl; external libbox2d;
function b2LoadContactId(values: Puint32_t): Tb2ContactId; cdecl; external libbox2d;

// === Konventiert am: 7-3-26 17:01:54 ===


implementation


end.
