unit fp_jolt;

interface

const
  {$IFDEF Linux}
  joltc = 'joltc';
  {$ENDIF}

  {$IFDEF Windows}
  joltc = 'joltc.dll';
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;
  Tuint = uint32;

  Tbool=Boolean;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== Emuns.h

const
  JPC_MAX_PHYSICS_JOBS = 2048;
  JPC_MAX_PHYSICS_BARRIERS = 8;
  JPC_DEFAULT_COLLISION_TOLERANCE = 1.0e-4;
  JPC_DEFAULT_PENETRATION_TOLERANCE = 1.0e-4;
  JPC_DEFAULT_CONVEX_RADIUS = 0.05;
  JPC_CAPSULE_PROJECTION_SLOP = 0.02;

type
  PJPC_ShapeType = ^TJPC_ShapeType;
  TJPC_ShapeType = byte;

const
  JPC_SHAPE_TYPE_CONVEX = 0;
  JPC_SHAPE_TYPE_COMPOUND = 1;
  JPC_SHAPE_TYPE_DECORATED = 2;
  JPC_SHAPE_TYPE_MESH = 3;
  JPC_SHAPE_TYPE_HEIGHT_FIELD = 4;
  JPC_SHAPE_TYPE_SOFTBODY = 5;
  JPC_SHAPE_TYPE_USER1 = 6;
  JPC_SHAPE_TYPE_USER2 = 7;
  JPC_SHAPE_TYPE_USER3 = 8;
  JPC_SHAPE_TYPE_USER4 = 9;

type
  PJPC_ShapeSubType = ^TJPC_ShapeSubType;
  TJPC_ShapeSubType = byte;

const
  JPC_SHAPE_SUB_TYPE_SPHERE = 0;
  JPC_SHAPE_SUB_TYPE_BOX = 1;
  JPC_SHAPE_SUB_TYPE_TRIANGLE = 2;
  JPC_SHAPE_SUB_TYPE_CAPSULE = 3;
  JPC_SHAPE_SUB_TYPE_TAPEREDCAPSULE = 4;
  JPC_SHAPE_SUB_TYPE_CYLINDER = 5;
  JPC_SHAPE_SUB_TYPE_CONVEX_HULL = 6;
  JPC_SHAPE_SUB_TYPE_STATIC_COMPOUND = 7;
  JPC_SHAPE_SUB_TYPE_MUTABLE_COMPOUND = 8;
  JPC_SHAPE_SUB_TYPE_ROTATED_TRANSLATED = 9;
  JPC_SHAPE_SUB_TYPE_SCALED = 10;
  JPC_SHAPE_SUB_TYPE_OFFSET_CENTER_OF_MASS = 11;
  JPC_SHAPE_SUB_TYPE_MESH = 12;
  JPC_SHAPE_SUB_TYPE_HEIGHT_FIELD = 13;
  JPC_SHAPE_SUB_TYPE_SOFT_BODY = 14;
  JPC_SHAPE_SUB_TYPE_USER1 = 15;
  JPC_SHAPE_SUB_TYPE_USER2 = 16;
  JPC_SHAPE_SUB_TYPE_USER3 = 17;
  JPC_SHAPE_SUB_TYPE_USER4 = 18;
  JPC_SHAPE_SUB_TYPE_USER5 = 19;
  JPC_SHAPE_SUB_TYPE_USER6 = 20;
  JPC_SHAPE_SUB_TYPE_USER7 = 21;
  JPC_SHAPE_SUB_TYPE_USER8 = 22;
  JPC_SHAPE_SUB_TYPE_USER_CONVEX1 = 23;
  JPC_SHAPE_SUB_TYPE_USER_CONVEX2 = 24;
  JPC_SHAPE_SUB_TYPE_USER_CONVEX3 = 25;
  JPC_SHAPE_SUB_TYPE_USER_CONVEX4 = 26;
  JPC_SHAPE_SUB_TYPE_USER_CONVEX5 = 27;
  JPC_SHAPE_SUB_TYPE_USER_CONVEX6 = 28;
  JPC_SHAPE_SUB_TYPE_USER_CONVEX7 = 29;
  JPC_SHAPE_SUB_TYPE_USER_CONVEX8 = 30;

type
  PJPC_PhysicsUpdateError = ^TJPC_PhysicsUpdateError;
  TJPC_PhysicsUpdateError = Tuint32_t;

const
  JPC_PHYSICS_UPDATE_ERROR_NONE = 0;
  JPC_PHYSICS_UPDATE_ERROR_MANIFOLD_CACHE_FULL = 1 shl 0;
  JPC_PHYSICS_UPDATE_ERROR_BODY_PAIR_CACHE_FULL = 1 shl 1;
  JPC_PHYSICS_UPDATE_ERROR_CONTACT_CONSTRAINTS_FULL = 1 shl 2;

type
  PJPC_ConstraintType = ^TJPC_ConstraintType;
  TJPC_ConstraintType = longint;

const
  JPC_CONSTRAINT_TYPE_CONSTRAINT = 0;
  JPC_CONSTRAINT_TYPE_TWO_BODY_CONSTRAINT = 1;

type
  PJPC_ConstraintSubType = ^TJPC_ConstraintSubType;
  TJPC_ConstraintSubType = longint;

const
  JPC_CONSTRAINT_SUB_TYPE_FIXED = 0;
  JPC_CONSTRAINT_SUB_TYPE_POINT = 1;
  JPC_CONSTRAINT_SUB_TYPE_HINGE = 2;
  JPC_CONSTRAINT_SUB_TYPE_SLIDER = 3;
  JPC_CONSTRAINT_SUB_TYPE_DISTANCE = 4;
  JPC_CONSTRAINT_SUB_TYPE_CONE = 5;
  JPC_CONSTRAINT_SUB_TYPE_SWING_TWIST = 6;
  JPC_CONSTRAINT_SUB_TYPE_SIX_DOF = 7;
  JPC_CONSTRAINT_SUB_TYPE_PATH = 8;
  JPC_CONSTRAINT_SUB_TYPE_VEHICLE = 9;
  JPC_CONSTRAINT_SUB_TYPE_RACK_AND_PINION = 10;
  JPC_CONSTRAINT_SUB_TYPE_GEAR = 11;
  JPC_CONSTRAINT_SUB_TYPE_PULLEY = 12;
  JPC_CONSTRAINT_SUB_TYPE_USER1 = 13;
  JPC_CONSTRAINT_SUB_TYPE_USER2 = 14;
  JPC_CONSTRAINT_SUB_TYPE_USER3 = 15;
  JPC_CONSTRAINT_SUB_TYPE_USER4 = 16;

type
  PJPC_ConstraintSpace = ^TJPC_ConstraintSpace;
  TJPC_ConstraintSpace = longint;

const
  JPC_CONSTRAINT_SPACE_LOCAL_TO_BODY_COM = 0;
  JPC_CONSTRAINT_SPACE_WORLD_SPACE = 1;

type
  PJPC_MotionType = ^TJPC_MotionType;
  TJPC_MotionType = byte;

const
  JPC_MOTION_TYPE_STATIC = 0;
  JPC_MOTION_TYPE_KINEMATIC = 1;
  JPC_MOTION_TYPE_DYNAMIC = 2;

type
  PJPC_MotionQuality = ^TJPC_MotionQuality;
  TJPC_MotionQuality = byte;

const
  JPC_MOTION_QUALITY_DISCRETE = 0;
  JPC_MOTION_QUALITY_LINEAR_CAST = 1;

type
  PJPC_OverrideMassProperties = ^TJPC_OverrideMassProperties;
  TJPC_OverrideMassProperties = byte;

const
  JPC_OVERRIDE_MASS_PROPS_CALC_MASS_INERTIA = 0;
  JPC_OVERRIDE_MASS_PROPS_CALC_INERTIA = 1;
  JPC_OVERRIDE_MASS_PROPS_MASS_INERTIA_PROVIDED = 2;

type
  PJPC_GroundState = ^TJPC_GroundState;
  TJPC_GroundState = longint;

const
  JPC_CHARACTER_GROUND_STATE_ON_GROUND = 0;
  JPC_CHARACTER_GROUND_STATE_ON_STEEP_GROUND = 1;
  JPC_CHARACTER_GROUND_STATE_NOT_SUPPORTED = 2;
  JPC_CHARACTER_GROUND_STATE_IN_AIR = 3;

type
  PJPC_Activation = ^TJPC_Activation;
  TJPC_Activation = longint;

const
  JPC_ACTIVATION_ACTIVATE = 0;
  JPC_ACTIVATION_DONT_ACTIVATE = 1;

type
  PJPC_ValidateResult = ^TJPC_ValidateResult;
  TJPC_ValidateResult = longint;

const
  JPC_VALIDATE_RESULT_ACCEPT_ALL_CONTACTS = 0;
  JPC_VALIDATE_RESULT_ACCEPT_CONTACT = 1;
  JPC_VALIDATE_RESULT_REJECT_CONTACT = 2;
  JPC_VALIDATE_RESULT_REJECT_ALL_CONTACTS = 3;

type
  TJPC_BackFaceMode = byte;

const
  JPC_BACK_FACE_MODE_IGNORE = 0;
  JPC_BACK_FACE_MODE_COLLIDE = 1;

type
  PJPC_BodyType = ^TJPC_BodyType;
  TJPC_BodyType = byte;

const
  JPC_BODY_TYPE_RIGID_BODY = 0;
  JPC_BODY_TYPE_SOFT_BODY = 1;

type
  PJPC_AllowedDOFs = ^TJPC_AllowedDOFs;
  TJPC_AllowedDOFs = byte;

const
  JPC_ALLOWED_DOFS_NONE = %000000;
  JPC_ALLOWED_DOFS_ALL = %111111;
  JPC_ALLOWED_DOFS_TRANSLATIONX = %000001;
  JPC_ALLOWED_DOFS_TRANSLATIONY = %000010;
  JPC_ALLOWED_DOFS_TRANSLATIONZ = %000100;
  JPC_ALLOWED_DOFS_ROTATIONX = %001000;
  JPC_ALLOWED_DOFS_ROTATIONY = %010000;
  JPC_ALLOWED_DOFS_ROTATIONZ = %100000;
  JPC_ALLOWED_DOFS_PLANE2D = (JPC_ALLOWED_DOFS_TRANSLATIONX or JPC_ALLOWED_DOFS_TRANSLATIONY) or JPC_ALLOWED_DOFS_ROTATIONZ;

type
  PJPC_Features = ^TJPC_Features;
  TJPC_Features = longint;

const
  JPC_FEATURE_DOUBLE_PRECISION = 1 shl 0;
  JPC_FEATURE_NEON = 1 shl 1;
  JPC_FEATURE_SSE = 1 shl 2;
  JPC_FEATURE_SSE4_1 = 1 shl 3;
  JPC_FEATURE_SSE4_2 = 1 shl 4;
  JPC_FEATURE_AVX = 1 shl 5;
  JPC_FEATURE_AVX2 = 1 shl 6;
  JPC_FEATURE_AVX512 = 1 shl 7;
  JPC_FEATURE_F16C = 1 shl 8;
  JPC_FEATURE_LZCNT = 1 shl 9;
  JPC_FEATURE_TZCNT = 1 shl 10;
  JPC_FEATURE_FMADD = 1 shl 11;
  JPC_FEATURE_PLATFORM_DETERMINISTIC = 1 shl 12;
  JPC_FEATURE_FLOATING_POINT_EXCEPTIONS = 1 shl 13;
  JPC_FEATURE_DEBUG = 1 shl 14;

type
  PJPC_ShapeColor = ^TJPC_ShapeColor;
  TJPC_ShapeColor = longint;

const
  JPC_SHAPE_COLOR_INSTANCE_COLOR = 0;
  JPC_SHAPE_COLOR_SHAPE_TYPE_COLOR = 1;
  JPC_SHAPE_COLOR_MOTION_TYPE_COLOR = 2;
  JPC_SHAPE_COLOR_SLEEP_COLOR = 3;
  JPC_SHAPE_COLOR_ISLAND_COLOR = 4;
  JPC_SHAPE_COLOR_MATERIAL_COLOR = 5;

type
  PJPC_SoftBodyConstraintColor = ^TJPC_SoftBodyConstraintColor;
  TJPC_SoftBodyConstraintColor = longint;

const
  JPC_SOFT_BODY_CONSTRAINT_COLOR_CONSTRAINT_TYPE = 0;
  JPC_SOFT_BODY_CONSTRAINT_COLOR_CONSTRAINT_GROUP = 1;
  JPC_SOFT_BODY_CONSTRAINT_COLOR_CONSTRAINT_ORDER = 2;

type
  PJPC_ActiveEdgeMode = ^TJPC_ActiveEdgeMode;
  TJPC_ActiveEdgeMode = Tuint8_t;

const
  JPC_ACTIVE_EDGE_MODE_COLLIDE_ONLY_WITH_ACTIVE = 0;
  JPC_ACTIVE_EDGE_MODE_COLLIDE_WITH_ALL = 1;

type
  PJPC_CollectFacesMode = ^TJPC_CollectFacesMode;
  TJPC_CollectFacesMode = Tuint8_t;

const
  JPC_COLLECT_FACES_MODE_COLLECT_FACES = 0;
  JPC_COLLECT_FACES_MODE_NO_FACES = 1;

type
  PJPC_SwingType = ^TJPC_SwingType;
  TJPC_SwingType = Tuint8_t;

const
  JPC_SWING_TYPE_CONE = 0;
  JPC_SWING_TYPE_PYRAMID = 1;

type
  PJPC_SixDOFConstraint_Axis = ^TJPC_SixDOFConstraint_Axis;
  TJPC_SixDOFConstraint_Axis = Tuint32_t;

const
  JPC_SIX_DOF_CONSTRAINT_AXIS_TRANSLATION_X = 0;
  JPC_SIX_DOF_CONSTRAINT_AXIS_TRANSLATION_Y = 1;
  JPC_SIX_DOF_CONSTRAINT_AXIS_TRANSLATION_Z = 2;
  JPC_SIX_DOF_CONSTRAINT_AXIS_ROTATION_X = 3;
  JPC_SIX_DOF_CONSTRAINT_AXIS_ROTATION_Y = 4;
  JPC_SIX_DOF_CONSTRAINT_AXIS_ROTATION_Z = 5;
  JPC_SIX_DOF_CONSTRAINT_AXIS_NUM = 6;
  JPC_SIX_DOF_CONSTRAINT_AXIS_NUM_TRANSLATION = JPC_SIX_DOF_CONSTRAINT_AXIS_TRANSLATION_Z + 1;

type
  PJPC_SpringMode = ^TJPC_SpringMode;
  TJPC_SpringMode = byte;

const
  JPC_SPRING_MODE_FREQUENCY_AND_DAMPING = 0;
  JPC_SPRING_MODE_STIFFNESS_AND_DAMPING = 1;

type
  PJPC_MotorState = ^TJPC_MotorState;
  TJPC_MotorState = longint;

const
  JPC_MOTOR_STATE_OFF = 0;
  JPC_MOTOR_STATE_VELOCITY = 1;
  JPC_MOTOR_STATE_POSITION = 2;


  // ==== Funtions.h

const
  JPC_PI: single = 3.14159265358979323846;

procedure JPC_RegisterDefaultAllocator; cdecl; external joltc;
procedure JPC_FactoryInit; cdecl; external joltc;
procedure JPC_FactoryDelete; cdecl; external joltc;
procedure JPC_RegisterTypes; cdecl; external joltc;
procedure JPC_UnregisterTypes; cdecl; external joltc;

type
  TJPC_Float3 = record
    x: single;
    y: single;
    z: single;
  end;
  PJPC_Float3 = ^TJPC_Float3;

  TJPC_Vec2 = record
    x: single;
    y: single;
  end;
  PJPC_Vec2 = ^TJPC_Vec2;

  TJPC_Vec3 = record
    x: single;
    y: single;
    z: single;
    _w: single;
  end;
  PJPC_Vec3 = ^TJPC_Vec3;

  TJPC_Vec4 = record
    x: single;
    y: single;
    z: single;
    w: single;
  end;
  PJPC_Vec4 = ^TJPC_Vec4;

  TJPC_DVec3 = record
    x: double;
    y: double;
    z: double;
    _w: double;
  end;
  PJPC_DVec3 = ^TJPC_DVec3;

  TJPC_Quat = record
    x: single;
    y: single;
    z: single;
    w: single;
  end;
  PJPC_Quat = ^TJPC_Quat;

  TJPC_Mat44 = record
    col: array[0..2] of TJPC_Vec4;
    col3: TJPC_Vec3;
  end;
  PJPC_Mat44 = ^TJPC_Mat44;

  TJPC_DMat44 = record
    col: array[0..2] of TJPC_Vec4;
    col3: TJPC_DVec3;
  end;
  PJPC_DMat44 = ^TJPC_DMat44;

  TJPC_Color = record
    r: Tuint8_t;
    g: Tuint8_t;
    b: Tuint8_t;
    a: Tuint8_t;
  end;
  PJPC_Color = ^TJPC_Color;

  PJPC_RVec3 = ^TJPC_RVec3;
  TJPC_RVec3 = TJPC_Vec3;

  PJPC_RMat44 = ^TJPC_RMat44;
  TJPC_RMat44 = TJPC_Mat44;

  PReal = ^TReal;
  TReal = single;

  PJPC_BodyID = ^TJPC_BodyID;
  TJPC_BodyID = Tuint32_t;

  PJPC_SubShapeID = ^TJPC_SubShapeID;
  TJPC_SubShapeID = Tuint32_t;

  PJPC_BroadPhaseLayer = ^TJPC_BroadPhaseLayer;
  TJPC_BroadPhaseLayer = Tuint8_t;

const
  JPC_OBJECT_LAYER_BITS = 16;

type
  PJPC_ObjectLayer = ^TJPC_ObjectLayer;
  TJPC_ObjectLayer = Tuint16_t;

  TJPC_IndexedTriangleNoMaterial = record
    idx: array[0..2] of Tuint32_t;
  end;
  PJPC_IndexedTriangleNoMaterial = ^TJPC_IndexedTriangleNoMaterial;

  TJPC_IndexedTriangle = record
    idx: array[0..2] of Tuint32_t;
    materialIndex: Tuint32_t;
    userData: Tuint32_t;
  end;
  PJPC_IndexedTriangle = ^TJPC_IndexedTriangle;

  TJPC_RayCast = record
    Origin: TJPC_Vec3;
    Direction: TJPC_Vec3;
  end;
  PJPC_RayCast = ^TJPC_RayCast;

  TJPC_RRayCast = record
    Origin: TJPC_RVec3;
    Direction: TJPC_Vec3;
  end;
  PJPC_RRayCast = ^TJPC_RRayCast;

  TJPC_RayCastResult = record
    BodyID: TJPC_BodyID;
    Fraction: single;
    SubShapeID2: TJPC_SubShapeID;
  end;
  PJPC_RayCastResult = ^TJPC_RayCastResult;

  TJPC_ShapeCastResult = record
    ContactPointOn1: TJPC_Vec3;
    ContactPointOn2: TJPC_Vec3;
    PenetrationAxis: TJPC_Vec3;
    PenetrationDepth: single;
    SubShapeID1: TJPC_SubShapeID;
    SubShapeID2: TJPC_SubShapeID;
    BodyID2: TJPC_BodyID;
    Fraction: single;
    IsBackFaceHit: Tbool;
  end;
  PJPC_ShapeCastResult = ^TJPC_ShapeCastResult;

  TJPC_CollideShapeResult = record
    ContactPointOn1: TJPC_Vec3;
    ContactPointOn2: TJPC_Vec3;
    PenetrationAxis: TJPC_Vec3;
    PenetrationDepth: single;
    SubShapeID1: TJPC_SubShapeID;
    SubShapeID2: TJPC_SubShapeID;
    BodyID2: TJPC_BodyID;
  end;
  PJPC_CollideShapeResult = ^TJPC_CollideShapeResult;

  PJPC_Body = type Pointer;
  PPJPC_Body = ^PJPC_Body;
  PJPC_VertexList = type Pointer;

function JPC_VertexList_new(storage: PJPC_Float3; len: Tsize_t): PJPC_VertexList; cdecl; external joltc;
procedure JPC_VertexList_delete(obj: PJPC_VertexList); cdecl; external joltc;

type
  PJPC_IndexedTriangleList = type Pointer;

function JPC_IndexedTriangleList_new(storage: PJPC_IndexedTriangle; len: Tsize_t): PJPC_IndexedTriangleList; cdecl; external joltc;
procedure JPC_IndexedTriangleList_delete(obj: PJPC_IndexedTriangleList); cdecl; external joltc;

type
  PJPC_Shape = type Pointer;
  PPJPC_Shape = ^PJPC_Shape;

function JPC_Shape_GetRefCount(self: PJPC_Shape): Tuint32_t; cdecl; external joltc;
procedure JPC_Shape_AddRef(self: PJPC_Shape); cdecl; external joltc;
procedure JPC_Shape_Release(self: PJPC_Shape); cdecl; external joltc;
function JPC_Shape_GetUserData(self: PJPC_Shape): Tuint64_t; cdecl; external joltc;
procedure JPC_Shape_SetUserData(self: PJPC_Shape; userData: Tuint64_t); cdecl; external joltc;
function JPC_Shape_GetType(self: PJPC_Shape): TJPC_ShapeType; cdecl; external joltc;
function JPC_Shape_GetSubType(self: PJPC_Shape): TJPC_ShapeSubType; cdecl; external joltc;
function JPC_Shape_GetSubShapeUserData(self: PJPC_Shape; inSubShapeID: TJPC_SubShapeID): Tuint64_t; cdecl; external joltc;
function JPC_Shape_GetCenterOfMass(self: PJPC_Shape): TJPC_Vec3; cdecl; external joltc;
function JPC_Shape_GetVolume(self: PJPC_Shape): single; cdecl; external joltc;

type
  PJPC_CompoundShape = type Pointer;

function JPC_CompoundShape_GetSubShape_Shape(self: PJPC_CompoundShape; inIdx: Tuint): PJPC_Shape; cdecl; external joltc;
function JPC_CompoundShape_GetSubShapeIndexFromID(self: PJPC_CompoundShape; inSubShapeID: TJPC_SubShapeID; outRemainder: PJPC_SubShapeID): Tuint32_t; cdecl; external joltc;

type
  PJPC_TempAllocatorImpl = type Pointer;

function JPC_TempAllocatorImpl_new(size: Tuint): PJPC_TempAllocatorImpl; cdecl; external joltc;
procedure JPC_TempAllocatorImpl_delete(obj: PJPC_TempAllocatorImpl); cdecl; external joltc;

type
  PJPC_JobSystem = type Pointer;
  PJPC_JobSystemThreadPool = type Pointer;
  PJPC_JobSystemSingleThreaded = type Pointer;

function JPC_JobSystemThreadPool_new2(inMaxJobs: Tuint; inMaxBarriers: Tuint): PJPC_JobSystemThreadPool; cdecl; external joltc;
function JPC_JobSystemThreadPool_new3(inMaxJobs: Tuint; inMaxBarriers: Tuint; inNumThreads: longint): PJPC_JobSystemThreadPool; cdecl; external joltc;
procedure JPC_JobSystemThreadPool_delete(obj: PJPC_JobSystemThreadPool); cdecl; external joltc;
function JPC_JobSystemSingleThreaded_new(inMaxJobs: Tuint): PJPC_JobSystemSingleThreaded; cdecl; external joltc;
procedure JPC_JobSystemSingleThreaded_delete(obj: PJPC_JobSystemSingleThreaded); cdecl; external joltc;

type
  PJPC_GroupID = ^TJPC_GroupID;
  TJPC_GroupID = Tuint32_t;

  PJPC_SubGroupID = ^TJPC_SubGroupID;
  TJPC_SubGroupID = Tuint32_t;

  PJPC_GroupFilter = type Pointer;

  TJPC_CollisionGroup = record
    GroupFilter: PJPC_GroupFilter;
    GroupID: TJPC_GroupID;
    SubGroupID: TJPC_SubGroupID;
  end;
  PJPC_CollisionGroup = ^TJPC_CollisionGroup;

  TJPC_GroupFilterFns = record
    CanCollide: function(self: pointer; inGroup1: PJPC_CollisionGroup; inGroup2: PJPC_CollisionGroup): Tbool; cdecl;
  end;
  PJPC_GroupFilterFns = ^TJPC_GroupFilterFns;

function JPC_GroupFilter_new(self: pointer; fns: TJPC_GroupFilterFns): PJPC_GroupFilter; cdecl; external joltc;
procedure JPC_GroupFilter_delete(obj: PJPC_GroupFilter); cdecl; external joltc;

type
  TJPC_BroadPhaseLayerInterfaceFns = record
    GetNumBroadPhaseLayers: function(self: pointer): Tuint; cdecl;
    GetBroadPhaseLayer: function(self: pointer; inLayer: TJPC_ObjectLayer): TJPC_BroadPhaseLayer; cdecl;
  end;
  PJPC_BroadPhaseLayerInterfaceFns = ^TJPC_BroadPhaseLayerInterfaceFns;

  PJPC_BroadPhaseLayerInterface = type Pointer;

function JPC_BroadPhaseLayerInterface_new(self: pointer; fns: TJPC_BroadPhaseLayerInterfaceFns): PJPC_BroadPhaseLayerInterface; cdecl; external joltc;
procedure JPC_BroadPhaseLayerInterface_delete(obj: PJPC_BroadPhaseLayerInterface); cdecl; external joltc;

type
  TJPC_BroadPhaseLayerFilterFns = record
    ShouldCollide: function(self: pointer; inLayer: TJPC_BroadPhaseLayer): Tbool; cdecl;
  end;
  PJPC_BroadPhaseLayerFilterFns = ^TJPC_BroadPhaseLayerFilterFns;

  PJPC_BroadPhaseLayerFilter = type Pointer;

function JPC_BroadPhaseLayerFilter_new(self: pointer; fns: TJPC_BroadPhaseLayerFilterFns): PJPC_BroadPhaseLayerFilter; cdecl; external joltc;
procedure JPC_BroadPhaseLayerFilter_delete(obj: PJPC_BroadPhaseLayerFilter); cdecl; external joltc;

type
  TJPC_ObjectLayerFilterFns = record
    ShouldCollide: function(self: pointer; inLayer: TJPC_ObjectLayer): Tbool; cdecl;
  end;
  PJPC_ObjectLayerFilterFns = ^TJPC_ObjectLayerFilterFns;

  PJPC_ObjectLayerFilter = type Pointer;

function JPC_ObjectLayerFilter_new(self: pointer; fns: TJPC_ObjectLayerFilterFns): PJPC_ObjectLayerFilter; cdecl; external joltc;
procedure JPC_ObjectLayerFilter_delete(obj: PJPC_ObjectLayerFilter); cdecl; external joltc;

type
  TJPC_BodyFilterFns = record
    ShouldCollide: function(self: pointer; inBodyID: TJPC_BodyID): Tbool; cdecl;
    ShouldCollideLocked: function(self: pointer; inBodyID: PJPC_Body): Tbool; cdecl;
  end;
  PJPC_BodyFilterFns = ^TJPC_BodyFilterFns;

  PJPC_BodyFilter = type Pointer;

function JPC_BodyFilter_new(self: pointer; fns: TJPC_BodyFilterFns): PJPC_BodyFilter; cdecl; external joltc;
procedure JPC_BodyFilter_delete(obj: PJPC_BodyFilter); cdecl; external joltc;

type
  TJPC_ShapeFilterFns = record
    ShouldCollide: function(self: pointer; inShape2: PJPC_Shape; inSubShapeIDOfShape2: TJPC_SubShapeID): Tbool; cdecl;
    ShouldCollideTwoShapes: function(self: pointer; inShape1: PJPC_Shape; inSubShapeIDOfShape1: TJPC_SubShapeID; inShape2: PJPC_Shape; inSubShapeIDOfShape2: TJPC_SubShapeID): Tbool; cdecl;
  end;
  PJPC_ShapeFilterFns = ^TJPC_ShapeFilterFns;

  PJPC_ShapeFilter = type Pointer;

function JPC_ShapeFilter_new(self: pointer; fns: TJPC_ShapeFilterFns): PJPC_ShapeFilter; cdecl; external joltc;
procedure JPC_ShapeFilter_delete(obj: PJPC_ShapeFilter); cdecl; external joltc;

type
  TJPC_SimShapeFilterFns = record
    ShouldCollide: function(self: pointer; inBody1: PJPC_Body; inShape1: PJPC_Shape; inSubShapeIDOfShape1: TJPC_SubShapeID; inBody2: PJPC_Body;
      inShape2: PJPC_Shape; inSubShapeIDOfShape2: TJPC_SubShapeID): Tbool; cdecl;
  end;
  PJPC_SimShapeFilterFns = ^TJPC_SimShapeFilterFns;

  PJPC_SimShapeFilter = type Pointer;

function JPC_SimShapeFilter_new(self: pointer; fns: TJPC_SimShapeFilterFns): PJPC_SimShapeFilter; cdecl; external joltc;
procedure JPC_SimShapeFilter_delete(obj: PJPC_SimShapeFilter); cdecl; external joltc;

type
  TJPC_ObjectVsBroadPhaseLayerFilterFns = record
    ShouldCollide: function(self: pointer; inLayer1: TJPC_ObjectLayer; inLayer2: TJPC_BroadPhaseLayer): Tbool; cdecl;
  end;
  PJPC_ObjectVsBroadPhaseLayerFilterFns = ^TJPC_ObjectVsBroadPhaseLayerFilterFns;

  PJPC_ObjectVsBroadPhaseLayerFilter = type Pointer;

function JPC_ObjectVsBroadPhaseLayerFilter_new(self: pointer; fns: TJPC_ObjectVsBroadPhaseLayerFilterFns): PJPC_ObjectVsBroadPhaseLayerFilter; cdecl; external joltc;
procedure JPC_ObjectVsBroadPhaseLayerFilter_delete(obj: PJPC_ObjectVsBroadPhaseLayerFilter); cdecl; external joltc;

type
  TJPC_ObjectLayerPairFilterFns = record
    ShouldCollide: function(self: pointer; inLayer1: TJPC_ObjectLayer; inLayer2: TJPC_ObjectLayer): Tbool; cdecl;
  end;
  PJPC_ObjectLayerPairFilterFns = ^TJPC_ObjectLayerPairFilterFns;

  PJPC_ObjectLayerPairFilter = type Pointer;

function JPC_ObjectLayerPairFilter_new(self: pointer; fns: TJPC_ObjectLayerPairFilterFns): PJPC_ObjectLayerPairFilter; cdecl; external joltc;
procedure JPC_ObjectLayerPairFilter_delete(obj: PJPC_ObjectLayerPairFilter); cdecl; external joltc;

type
  TJPC_ContactPoints = record
    length: Tuint;
    points: array[0..63] of TJPC_Vec3;
  end;
  PJPC_ContactPoints = ^TJPC_ContactPoints;

  TJPC_ContactManifold = record
    BaseOffset: TJPC_RVec3;
    WorldSpaceNormal: TJPC_Vec3;
    PenetrationDepth: single;
    SubShapeID1: TJPC_SubShapeID;
    SubShapeID2: TJPC_SubShapeID;
    RelativeContactPointsOn1: TJPC_ContactPoints;
    RelativeContactPointsOn2: TJPC_ContactPoints;
  end;
  PJPC_ContactManifold = ^TJPC_ContactManifold;

  TJPC_ContactSettings = record
    CombinedFriction: single;
    CombinedRestitution: single;
    InvMassScale1: single;
    InvInertiaScale1: single;
    InvMassScale2: single;
    InvInertiaScale2: single;
    IsSensor: Tbool;
    RelativeLinearSurfaceVelocity: TJPC_Vec3;
    RelativeAngularSurfaceVelocity: TJPC_Vec3;
  end;
  PJPC_ContactSettings = ^TJPC_ContactSettings;

  TJPC_SubShapeIDPair = record
    Body1ID: TJPC_BodyID;
    SubShapeID1: TJPC_SubShapeID;
    Body2ID: TJPC_BodyID;
    SubShapeID2: TJPC_SubShapeID;
  end;
  PJPC_SubShapeIDPair = ^TJPC_SubShapeIDPair;

  TJPC_ShapeCastSettings = record
    ActiveEdgeMode: TJPC_ActiveEdgeMode;
    CollectFacesMode: TJPC_CollectFacesMode;
    CollisionTolerance: single;
    PenetrationTolerance: single;
    ActiveEdgeMovementDirection: TJPC_Vec3;
    BackFaceModeTriangles: TJPC_BackFaceMode;
    BackFaceModeConvex: TJPC_BackFaceMode;
    UseShrunkenShapeAndConvexRadius: Tbool;
    ReturnDeepestPoint: Tbool;
  end;
  PJPC_ShapeCastSettings = ^TJPC_ShapeCastSettings;

  TJPC_CollideShapeSettings = record
    ActiveEdgeMode: TJPC_ActiveEdgeMode;
    CollectFacesMode: TJPC_CollectFacesMode;
    CollisionTolerance: single;
    PenetrationTolerance: single;
    ActiveEdgeMovementDirection: TJPC_Vec3;
    MaxSeparationDistance: single;
    BackFaceMode: TJPC_BackFaceMode;
  end;
  PJPC_CollideShapeSettings = ^TJPC_CollideShapeSettings;

  TJPC_ContactListenerFns = record
    OnContactValidate: function(self: pointer; inBody1: PJPC_Body; inBody2: PJPC_Body; inBaseOffset: TJPC_RVec3; inCollisionResult: PJPC_CollideShapeResult): TJPC_ValidateResult; cdecl;
    OnContactAdded: procedure(self: pointer; inBody1: PJPC_Body; inBody2: PJPC_Body; inManifold: PJPC_ContactManifold; ioSettings: PJPC_ContactSettings); cdecl;
    OnContactPersisted: procedure(self: pointer; inBody1: PJPC_Body; inBody2: PJPC_Body; inManifold: PJPC_ContactManifold; ioSettings: PJPC_ContactSettings); cdecl;
    OnContactRemoved: procedure(self: pointer; inSubShapePair: PJPC_SubShapeIDPair); cdecl;
  end;
  PJPC_ContactListenerFns = ^TJPC_ContactListenerFns;

  PJPC_ContactListener = type Pointer;

function JPC_ContactListener_new(self: pointer; fns: TJPC_ContactListenerFns): PJPC_ContactListener; cdecl; external joltc;
procedure JPC_ContactListener_delete(obj: PJPC_ContactListener); cdecl; external joltc;

const
  JPC_ContactPointsCapacity = 64;

type
  TJPC_Impulse = record
    ContactImpulse: single;
    FrictionImpulse1: single;
    FrictionImpulse2: single;
  end;
  PJPC_Impulse = ^TJPC_Impulse;

  TJPC_CollisionEstimationResult = record
    LinearVelocity1: TJPC_Vec3;
    AngularVelocity1: TJPC_Vec3;
    LinearVelocity2: TJPC_Vec3;
    AngularVelocity2: TJPC_Vec3;
    Tangent1: TJPC_Vec3;
    Tangent2: TJPC_Vec3;
    NumImpulses: Tuint;
    Impulses: array[0..63] of TJPC_Impulse;
  end;
  PJPC_CollisionEstimationResult = ^TJPC_CollisionEstimationResult;

procedure JPC_EstimateCollisionResponse(inBody1: PJPC_Body; inBody2: PJPC_Body; inManifold: PJPC_ContactManifold; outResult: PJPC_CollisionEstimationResult; inCombinedFriction: single;
  inCombinedRestitution: single; inMinVelocityForRestitution: single; inNumIterations: Tuint); cdecl; external joltc;

type
  PJPC_CastShapeCollector = type Pointer;

  TJPC_CastShapeCollectorFns = record
    Reset: procedure(self: pointer); cdecl;
    AddHit: procedure(self: pointer; base: PJPC_CastShapeCollector; Result: PJPC_ShapeCastResult); cdecl;
  end;
  PJPC_CastShapeCollectorFns = ^TJPC_CastShapeCollectorFns;

function JPC_CastShapeCollector_new(self: pointer; fns: TJPC_CastShapeCollectorFns): PJPC_CastShapeCollector; cdecl; external joltc;
procedure JPC_CastShapeCollector_delete(obj: PJPC_CastShapeCollector); cdecl; external joltc;
procedure JPC_CastShapeCollector_UpdateEarlyOutFraction(self: PJPC_CastShapeCollector; inFraction: single); cdecl; external joltc;

type
  PJPC_CollideShapeCollector = type Pointer;

  TJPC_CollideShapeCollectorFns = record
    Reset: procedure(self: pointer); cdecl;
    AddHit: procedure(self: pointer; base: PJPC_CollideShapeCollector; Result: PJPC_CollideShapeResult); cdecl;
  end;
  PJPC_CollideShapeCollectorFns = ^TJPC_CollideShapeCollectorFns;

function JPC_CollideShapeCollector_new(self: pointer; fns: TJPC_CollideShapeCollectorFns): PJPC_CollideShapeCollector; cdecl; external joltc;
procedure JPC_CollideShapeCollector_delete(obj: PJPC_CollideShapeCollector); cdecl; external joltc;
procedure JPC_CollideShapeCollector_UpdateEarlyOutFraction(self: PJPC_CollideShapeCollector; inFraction: single); cdecl; external joltc;

type
  TJPC_BodyManager_DrawSettings = record
    mDrawGetSupportFunction: Tbool;
    mDrawSupportDirection: Tbool;
    mDrawGetSupportingFace: Tbool;
    mDrawShape: Tbool;
    mDrawShapeWireframe: Tbool;
    mDrawShapeColor: TJPC_ShapeColor;
    mDrawBoundingBox: Tbool;
    mDrawCenterOfMassTransform: Tbool;
    mDrawWorldTransform: Tbool;
    mDrawVelocity: Tbool;
    mDrawMassAndInertia: Tbool;
    mDrawSleepStats: Tbool;
    mDrawSoftBodyVertices: Tbool;
    mDrawSoftBodyVertexVelocities: Tbool;
    mDrawSoftBodyEdgeConstraints: Tbool;
    mDrawSoftBodyBendConstraints: Tbool;
    mDrawSoftBodyVolumeConstraints: Tbool;
    mDrawSoftBodySkinConstraints: Tbool;
    mDrawSoftBodyLRAConstraints: Tbool;
    mDrawSoftBodyPredictedBounds: Tbool;
    DrawSoftBodyConstraintColor: TJPC_SoftBodyConstraintColor;
  end;
  PJPC_BodyManager_DrawSettings = ^TJPC_BodyManager_DrawSettings;

procedure JPC_BodyManager_DrawSettings_default(obj: PJPC_BodyManager_DrawSettings); cdecl; external joltc;

type
  TJPC_DebugRendererSimpleFns = record
    DrawLine: procedure(self: pointer; inFrom: TJPC_RVec3; inTo: TJPC_RVec3; inColor: TJPC_Color); cdecl;
  end;
  PJPC_DebugRendererSimpleFns = ^TJPC_DebugRendererSimpleFns;

  PJPC_DebugRendererSimple = type Pointer;

function JPC_DebugRendererSimple_new(self: pointer; fns: TJPC_DebugRendererSimpleFns): PJPC_DebugRendererSimple; cdecl; external joltc;
procedure JPC_DebugRendererSimple_delete(obj: PJPC_DebugRendererSimple); cdecl; external joltc;

type
  PJPC_String = type Pointer;
  PPJPC_String = ^PJPC_String;

procedure JPC_String_delete(self: PJPC_String); cdecl; external joltc;
function JPC_String_c_str(self: PJPC_String): pchar; cdecl; external joltc;

type
  PJPC_Constraint = type Pointer;

function JPC_Constraint_GetRefCount(self: PJPC_Constraint): Tuint32_t; cdecl; external joltc;
procedure JPC_Constraint_AddRef(self: PJPC_Constraint); cdecl; external joltc;
procedure JPC_Constraint_Release(self: PJPC_Constraint); cdecl; external joltc;
procedure JPC_Constraint_delete(self: PJPC_Constraint); cdecl; external joltc;
function JPC_Constraint_GetConstraintPriority(self: PJPC_Constraint): Tuint32_t; cdecl; external joltc;
procedure JPC_Constraint_SetConstraintPriority(self: PJPC_Constraint; inPriority: Tuint32_t); cdecl; external joltc;
function JPC_Constraint_GetNumVelocityStepsOverride(self: PJPC_Constraint): Tuint; cdecl; external joltc;
procedure JPC_Constraint_SetNumVelocityStepsOverride(self: PJPC_Constraint; inN: Tuint); cdecl; external joltc;
function JPC_Constraint_GetNumPositionStepsOverride(self: PJPC_Constraint): Tuint; cdecl; external joltc;
procedure JPC_Constraint_SetNumPositionStepsOverride(self: PJPC_Constraint; inN: Tuint); cdecl; external joltc;
function JPC_Constraint_GetEnabled(self: PJPC_Constraint): Tbool; cdecl; external joltc;
procedure JPC_Constraint_SetEnabled(self: PJPC_Constraint; inEnabled: Tbool); cdecl; external joltc;
function JPC_Constraint_GetUserData(self: PJPC_Constraint): Tuint64_t; cdecl; external joltc;
procedure JPC_Constraint_SetUserData(self: PJPC_Constraint; inUserData: Tuint64_t); cdecl; external joltc;
procedure JPC_Constraint_NotifyShapeChanged(self: PJPC_Constraint; inBodyID: TJPC_BodyID; inDeltaCOM: TJPC_Vec3); cdecl; external joltc;

type
  PJPC_TwoBodyConstraint = type Pointer;

function JPC_TwoBodyConstraint_GetBody1(self: PJPC_TwoBodyConstraint): PJPC_Body; cdecl; external joltc;
function JPC_TwoBodyConstraint_GetBody2(self: PJPC_TwoBodyConstraint): PJPC_Body; cdecl; external joltc;
function JPC_TwoBodyConstraint_GetConstraintToBody1Matrix(self: PJPC_TwoBodyConstraint): TJPC_Mat44; cdecl; external joltc;
function JPC_TwoBodyConstraint_GetConstraintToBody2Matrix(self: PJPC_TwoBodyConstraint): TJPC_Mat44; cdecl; external joltc;

type
  PJPC_FixedConstraint = type Pointer;

function JPC_FixedConstraint_GetTotalLambdaPosition(self: PJPC_FixedConstraint): TJPC_Vec3; cdecl; external joltc;
function JPC_FixedConstraint_GetTotalLambdaRotation(self: PJPC_FixedConstraint): TJPC_Vec3; cdecl; external joltc;

type
  PJPC_DistanceConstraint = type Pointer;

function JPC_DistanceConstraint_GetTotalLambdaPosition(self: PJPC_DistanceConstraint): single; cdecl; external joltc;

type
  PJPC_SixDOFConstraint = type Pointer;

function JPC_SixDOFConstraint_GetTranslationLimitsMin(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
function JPC_SixDOFConstraint_GetTranslationLimitsMax(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
procedure JPC_SixDOFConstraint_SetTranslationLimits(self: PJPC_SixDOFConstraint; inLimitMin: TJPC_Vec3; inLimitMax: TJPC_Vec3); cdecl; external joltc;
function JPC_SixDOFConstraint_GetRotationLimitsMin(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
function JPC_SixDOFConstraint_GetRotationLimitsMax(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
procedure JPC_SixDOFConstraint_SetRotationLimits(self: PJPC_SixDOFConstraint; inLimitMin: TJPC_Vec3; inLimitMax: TJPC_Vec3); cdecl; external joltc;
function JPC_SixDOFConstraint_GetLimitsMin(self: PJPC_SixDOFConstraint; inAxis: TJPC_SixDOFConstraint_Axis): single; cdecl; external joltc;
function JPC_SixDOFConstraint_GetLimitsMax(self: PJPC_SixDOFConstraint; inAxis: TJPC_SixDOFConstraint_Axis): single; cdecl; external joltc;
function JPC_SixDOFConstraint_IsFreeAxis(self: PJPC_SixDOFConstraint; inAxis: TJPC_SixDOFConstraint_Axis): Tbool; cdecl; external joltc;
procedure JPC_SixDOFConstraint_SetMaxFriction(self: PJPC_SixDOFConstraint; inAxis: TJPC_SixDOFConstraint_Axis; inFriction: single); cdecl; external joltc;
function JPC_SixDOFConstraint_GetMaxFriction(self: PJPC_SixDOFConstraint; inAxis: TJPC_SixDOFConstraint_Axis): single; cdecl; external joltc;
function JPC_SixDOFConstraint_GetRotationInConstraintSpace(self: PJPC_SixDOFConstraint): TJPC_Quat; cdecl; external joltc;
function JPC_SixDOFConstraint_GetTargetVelocityCS(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
procedure JPC_SixDOFConstraint_SetTargetVelocityCS(self: PJPC_SixDOFConstraint; inVelocity: TJPC_Vec3); cdecl; external joltc;
function JPC_SixDOFConstraint_GetTargetAngularVelocityCS(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
procedure JPC_SixDOFConstraint_SetTargetAngularVelocityCS(self: PJPC_SixDOFConstraint; inAngularVelocity: TJPC_Vec3); cdecl; external joltc;
function JPC_SixDOFConstraint_GetTargetPositionCS(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
procedure JPC_SixDOFConstraint_SetTargetPositionCS(self: PJPC_SixDOFConstraint; inPosition: TJPC_Vec3); cdecl; external joltc;
function JPC_SixDOFConstraint_GetTargetOrientationCS(self: PJPC_SixDOFConstraint): TJPC_Quat; cdecl; external joltc;
procedure JPC_SixDOFConstraint_SetTargetOrientationCS(self: PJPC_SixDOFConstraint; inOrientation: TJPC_Quat); cdecl; external joltc;
procedure JPC_SixDOFConstraint_SetTargetOrientationBS(self: PJPC_SixDOFConstraint; inOrientation: TJPC_Quat); cdecl; external joltc;
function JPC_SixDOFConstraint_GetTotalLambdaPosition(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
function JPC_SixDOFConstraint_GetTotalLambdaRotation(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
function JPC_SixDOFConstraint_GetTotalLambdaMotorTranslation(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;
function JPC_SixDOFConstraint_GetTotalLambdaMotorRotation(self: PJPC_SixDOFConstraint): TJPC_Vec3; cdecl; external joltc;

type
  PJPC_HingeConstraint = type Pointer;

procedure JPC_HingeConstraint_SetMotorState(self: PJPC_HingeConstraint; inState: TJPC_MotorState); cdecl; external joltc;
function JPC_HingeConstraint_GetMotorState(self: PJPC_HingeConstraint): TJPC_MotorState; cdecl; external joltc;
procedure JPC_HingeConstraint_SetTargetAngularVelocity(self: PJPC_HingeConstraint; inAngularVelocity: single); cdecl; external joltc;
function JPC_HingeConstraint_GetTargetAngularVelocity(self: PJPC_HingeConstraint): single; cdecl; external joltc;
procedure JPC_HingeConstraint_SetTargetAngle(self: PJPC_HingeConstraint; inAngle: single); cdecl; external joltc;
function JPC_HingeConstraint_GetTargetAngle(self: PJPC_HingeConstraint): single; cdecl; external joltc;
function JPC_HingeConstraint_GetTotalLambdaPosition(self: PJPC_HingeConstraint): TJPC_Vec3; cdecl; external joltc;
function JPC_HingeConstraint_GetTotalLambdaRotation(self: PJPC_HingeConstraint): TJPC_Vec2; cdecl; external joltc;
function JPC_HingeConstraint_GetTotalLambdaRotationLimits(self: PJPC_HingeConstraint): single; cdecl; external joltc;
function JPC_HingeConstraint_GetTotalLambdaMotor(self: PJPC_HingeConstraint): single; cdecl; external joltc;

type
  PJPC_SliderConstraint = type Pointer;

procedure JPC_SliderConstraint_SetMotorState(self: PJPC_SliderConstraint; inState: TJPC_MotorState); cdecl; external joltc;
function JPC_SliderConstraint_GetMotorState(self: PJPC_SliderConstraint): TJPC_MotorState; cdecl; external joltc;
procedure JPC_SliderConstraint_SetTargetVelocity(self: PJPC_SliderConstraint; inVelocity: single); cdecl; external joltc;
function JPC_SliderConstraint_GetTargetVelocity(self: PJPC_SliderConstraint): single; cdecl; external joltc;
procedure JPC_SliderConstraint_SetTargetPosition(self: PJPC_SliderConstraint; inPosition: single); cdecl; external joltc;
function JPC_SliderConstraint_GetTargetPosition(self: PJPC_SliderConstraint): single; cdecl; external joltc;
function JPC_SliderConstraint_GetTotalLambdaPosition(self: PJPC_SliderConstraint): TJPC_Vec2; cdecl; external joltc;
function JPC_SliderConstraint_GetTotalLambdaPositionLimits(self: PJPC_SliderConstraint): single; cdecl; external joltc;
function JPC_SliderConstraint_GetTotalLambdaRotation(self: PJPC_SliderConstraint): TJPC_Vec3; cdecl; external joltc;
function JPC_SliderConstraint_GetTotalLambdaMotor(self: PJPC_SliderConstraint): single; cdecl; external joltc;

type
  TJPC_ConstraintSettings = record
    Enabled: Tbool;
    ConstraintPriority: Tuint32_t;
    NumVelocityStepsOverride: Tuint;
    NumPositionStepsOverride: Tuint;
    DrawConstraintSize: single;
    UserData: Tuint64_t;
  end;
  PJPC_ConstraintSettings = ^TJPC_ConstraintSettings;

procedure JPC_ConstraintSettings_default(settings: PJPC_ConstraintSettings); cdecl; external joltc;

type
  TJPC_SpringSettings = record
    Mode: TJPC_SpringMode;
    FrequencyOrStiffness: single;
    Damping: single;
  end;
  PJPC_SpringSettings = ^TJPC_SpringSettings;

procedure JPC_SpringSettings_default(settings: PJPC_SpringSettings); cdecl; external joltc;

type
  TJPC_MotorSettings = record
    SpringSettings: TJPC_SpringSettings;
    MinForceLimit: single;
    MaxForceLimit: single;
    MinTorqueLimit: single;
    MaxTorqueLimit: single;
  end;
  PJPC_MotorSettings = ^TJPC_MotorSettings;

procedure JPC_MotorSettings_default(settings: PJPC_MotorSettings); cdecl; external joltc;

type
  TJPC_FixedConstraintSettings = record
    ConstraintSettings: TJPC_ConstraintSettings;
    Space: TJPC_ConstraintSpace;
    AutoDetectPoint: Tbool;
    Point1: TJPC_RVec3;
    AxisX1: TJPC_Vec3;
    AxisY1: TJPC_Vec3;
    Point2: TJPC_RVec3;
    AxisX2: TJPC_Vec3;
    AxisY2: TJPC_Vec3;
  end;
  PJPC_FixedConstraintSettings = ^TJPC_FixedConstraintSettings;

procedure JPC_FixedConstraintSettings_default(settings: PJPC_FixedConstraintSettings); cdecl; external joltc;
function JPC_FixedConstraintSettings_Create(self: PJPC_FixedConstraintSettings; inBody1: PJPC_Body; inBody2: PJPC_Body): PJPC_Constraint; cdecl; external joltc;

type
  TJPC_SixDOFConstraintSettings = record
    ConstraintSettings: TJPC_ConstraintSettings;
    Space: TJPC_ConstraintSpace;
    Position1: TJPC_RVec3;
    AxisX1: TJPC_Vec3;
    AxisY1: TJPC_Vec3;
    Position2: TJPC_RVec3;
    AxisX2: TJPC_Vec3;
    AxisY2: TJPC_Vec3;
    MaxFriction: array[0..5] of single;
    LimitMin: array[0..5] of single;
    LimitMax: array[0..5] of single;
  end;
  PJPC_SixDOFConstraintSettings = ^TJPC_SixDOFConstraintSettings;

procedure JPC_SixDOFConstraintSettings_default(settings: PJPC_SixDOFConstraintSettings); cdecl; external joltc;
function JPC_SixDOFConstraintSettings_Create(self: PJPC_SixDOFConstraintSettings; inBody1: PJPC_Body; inBody2: PJPC_Body): PJPC_Constraint; cdecl; external joltc;

type
  TJPC_HingeConstraintSettings = record
    ConstraintSettings: TJPC_ConstraintSettings;
    Space: TJPC_ConstraintSpace;
    Point1: TJPC_RVec3;
    HingeAxis1: TJPC_Vec3;
    NormalAxis1: TJPC_Vec3;
    Point2: TJPC_RVec3;
    HingeAxis2: TJPC_Vec3;
    NormalAxis2: TJPC_Vec3;
    LimitsMin: single;
    LimitsMax: single;
    LimitsSpringSettings: TJPC_SpringSettings;
    MaxFrictionTorque: single;
    MotorSettings: TJPC_MotorSettings;
  end;
  PJPC_HingeConstraintSettings = ^TJPC_HingeConstraintSettings;

procedure JPC_HingeConstraintSettings_default(settings: PJPC_HingeConstraintSettings); cdecl; external joltc;
function JPC_HingeConstraintSettings_Create(self: PJPC_HingeConstraintSettings; inBody1: PJPC_Body; inBody2: PJPC_Body): PJPC_HingeConstraint; cdecl; external joltc;

type
  TJPC_DistanceConstraintSettings = record
    ConstraintSettings: TJPC_ConstraintSettings;
    Space: TJPC_ConstraintSpace;
    Point1: TJPC_RVec3;
    Point2: TJPC_RVec3;
    MinDistance: single;
    MaxDistance: single;
    LimitsSpringSettings: TJPC_SpringSettings;
  end;
  PJPC_DistanceConstraintSettings = ^TJPC_DistanceConstraintSettings;

procedure JPC_DistanceConstraintSettings_default(settings: PJPC_DistanceConstraintSettings); cdecl; external joltc;
function JPC_DistanceConstraintSettings_Create(self: PJPC_DistanceConstraintSettings; inBody1: PJPC_Body; inBody2: PJPC_Body): PJPC_DistanceConstraint; cdecl; external joltc;

type
  TJPC_SliderConstraintSettings = record
    ConstraintSettings: TJPC_ConstraintSettings;
    Space: TJPC_ConstraintSpace;
    AutoDetectPoint: Tbool;
    Point1: TJPC_RVec3;
    SliderAxis1: TJPC_Vec3;
    NormalAxis1: TJPC_Vec3;
    Point2: TJPC_RVec3;
    SliderAxis2: TJPC_Vec3;
    NormalAxis2: TJPC_Vec3;
    LimitsMin: single;
    LimitsMax: single;
    LimitsSpringSettings: TJPC_SpringSettings;
    MaxFrictionForce: single;
    MotorSettings: TJPC_MotorSettings;
  end;
  PJPC_SliderConstraintSettings = ^TJPC_SliderConstraintSettings;

procedure JPC_SliderConstraintSettings_default(settings: PJPC_SliderConstraintSettings); cdecl; external joltc;
function JPC_SliderConstraintSettings_Create(self: PJPC_SliderConstraintSettings; inBody1: PJPC_Body; inBody2: PJPC_Body): PJPC_SliderConstraint; cdecl; external joltc;

type
  TJPC_TriangleShapeSettings = record
    UserData: Tuint64_t;
    Density: single;
    V1: TJPC_Vec3;
    V2: TJPC_Vec3;
    V3: TJPC_Vec3;
    ConvexRadius: single;
  end;
  PJPC_TriangleShapeSettings = ^TJPC_TriangleShapeSettings;

procedure JPC_TriangleShapeSettings_default(obj: PJPC_TriangleShapeSettings); cdecl; external joltc;
function JPC_TriangleShapeSettings_Create(self: PJPC_TriangleShapeSettings; outShape: PPJPC_Shape; outError: PPJPC_String): Tbool; cdecl; external joltc;

type
  TJPC_MeshShapeSettings = record
    UserData: Tuint64_t;
    TriangleVertices: PJPC_Float3;
    TriangleVerticesLen: Tsize_t;
    IndexedTriangles: PJPC_IndexedTriangle;
    IndexedTrianglesLen: Tsize_t;
  end;
  PJPC_MeshShapeSettings = ^TJPC_MeshShapeSettings;

procedure JPC_MeshShapeSettings_default(obj: PJPC_MeshShapeSettings); cdecl; external joltc;
function JPC_MeshShapeSettings_Create(self: PJPC_MeshShapeSettings; outShape: PPJPC_Shape; outError: PPJPC_String): Tbool; cdecl; external joltc;

type
  TJPC_BoxShapeSettings = record
    UserData: Tuint64_t;
    Density: single;
    HalfExtent: TJPC_Vec3;
    ConvexRadius: single;
  end;
  PJPC_BoxShapeSettings = ^TJPC_BoxShapeSettings;

procedure JPC_BoxShapeSettings_default(obj: PJPC_BoxShapeSettings); cdecl; external joltc;
function JPC_BoxShapeSettings_Create(self: PJPC_BoxShapeSettings; outShape: PPJPC_Shape; outError: PPJPC_String): Tbool; cdecl; external joltc;

type
  TJPC_SphereShapeSettings = record
    UserData: Tuint64_t;
    Density: single;
    Radius: single;
  end;
  PJPC_SphereShapeSettings = ^TJPC_SphereShapeSettings;

procedure JPC_SphereShapeSettings_default(obj: PJPC_SphereShapeSettings); cdecl; external joltc;
function JPC_SphereShapeSettings_Create(self: PJPC_SphereShapeSettings; outShape: PPJPC_Shape; outError: PPJPC_String): Tbool; cdecl; external joltc;

type
  TJPC_CapsuleShapeSettings = record
    UserData: Tuint64_t;
    Density: single;
    Radius: single;
    HalfHeightOfCylinder: single;
  end;
  PJPC_CapsuleShapeSettings = ^TJPC_CapsuleShapeSettings;

procedure JPC_CapsuleShapeSettings_default(obj: PJPC_CapsuleShapeSettings); cdecl; external joltc;
function JPC_CapsuleShapeSettings_Create(self: PJPC_CapsuleShapeSettings; outShape: PPJPC_Shape; outError: PPJPC_String): Tbool; cdecl; external joltc;

type
  TJPC_CylinderShapeSettings = record
    UserData: Tuint64_t;
    Density: single;
    HalfHeight: single;
    Radius: single;
    ConvexRadius: single;
  end;
  PJPC_CylinderShapeSettings = ^TJPC_CylinderShapeSettings;

procedure JPC_CylinderShapeSettings_default(obj: PJPC_CylinderShapeSettings); cdecl; external joltc;
function JPC_CylinderShapeSettings_Create(self: PJPC_CylinderShapeSettings; outShape: PPJPC_Shape; outError: PPJPC_String): Tbool; cdecl; external joltc;

type
  TJPC_ConvexHullShapeSettings = record
    UserData: Tuint64_t;
    Density: single;
    Points: PJPC_Vec3;
    PointsLen: Tsize_t;
    MaxConvexRadius: single;
    MaxErrorConvexRadius: single;
    HullTolerance: single;
  end;
  PJPC_ConvexHullShapeSettings = ^TJPC_ConvexHullShapeSettings;

procedure JPC_ConvexHullShapeSettings_default(obj: PJPC_ConvexHullShapeSettings); cdecl; external joltc;
function JPC_ConvexHullShapeSettings_Create(self: PJPC_ConvexHullShapeSettings; outShape: PPJPC_Shape; outError: PPJPC_String): Tbool; cdecl; external joltc;

type
  TJPC_SubShapeSettings = record
    Shape: PJPC_Shape;
    Position: TJPC_Vec3;
    Rotation: TJPC_Quat;
    UserData: Tuint32_t;
  end;
  PJPC_SubShapeSettings = ^TJPC_SubShapeSettings;

procedure JPC_SubShapeSettings_default(obj: PJPC_SubShapeSettings); cdecl; external joltc;

type
  TJPC_StaticCompoundShapeSettings = record
    UserData: Tuint64_t;
    SubShapes: PJPC_SubShapeSettings;
    SubShapesLen: Tsize_t;
  end;
  PJPC_StaticCompoundShapeSettings = ^TJPC_StaticCompoundShapeSettings;

procedure JPC_StaticCompoundShapeSettings_default(obj: PJPC_StaticCompoundShapeSettings); cdecl; external joltc;
function JPC_StaticCompoundShapeSettings_Create(self: PJPC_StaticCompoundShapeSettings; outShape: PPJPC_Shape; outError: PPJPC_String): Tbool; cdecl; external joltc;

type
  PJPC_MutableCompoundShape = type Pointer;
  PPJPC_MutableCompoundShape = ^PJPC_MutableCompoundShape;

function JPC_MutableCompoundShape_AddShape(self: PJPC_MutableCompoundShape; inPosition: TJPC_Vec3; inRotation: TJPC_Quat; inShape: PJPC_Shape; inUserData: Tuint32_t): Tuint; cdecl; external joltc;
procedure JPC_MutableCompoundShape_RemoveShape(self: PJPC_MutableCompoundShape; inIndex: Tuint); cdecl; external joltc;
procedure JPC_MutableCompoundShape_ModifyShape(self: PJPC_MutableCompoundShape; inIndex: Tuint; inPosition: TJPC_Vec3; inRotation: TJPC_Quat); cdecl; external joltc;
procedure JPC_MutableCompoundShape_ModifyShape2(self: PJPC_MutableCompoundShape; inIndex: Tuint; inPosition: TJPC_Vec3; inRotation: TJPC_Quat; inShape: PJPC_Shape); cdecl; external joltc;
procedure JPC_MutableCompoundShape_AdjustCenterOfMass(self: PJPC_MutableCompoundShape); cdecl; external joltc;

type
  TJPC_MutableCompoundShapeSettings = record
    UserData: Tuint64_t;
    SubShapes: PJPC_SubShapeSettings;
    SubShapesLen: Tsize_t;
  end;
  PJPC_MutableCompoundShapeSettings = ^TJPC_MutableCompoundShapeSettings;

procedure JPC_MutableCompoundShapeSettings_default(obj: PJPC_MutableCompoundShapeSettings); cdecl; external joltc;
function JPC_MutableCompoundShapeSettings_Create(self: PJPC_MutableCompoundShapeSettings; outShape: PPJPC_MutableCompoundShape; outError: PPJPC_String): Tbool; cdecl; external joltc;

type
  TJPC_BodyCreationSettings = record
    Position: TJPC_RVec3;
    Rotation: TJPC_Quat;
    LinearVelocity: TJPC_Vec3;
    AngularVelocity: TJPC_Vec3;
    UserData: Tuint64_t;
    ObjectLayer: TJPC_ObjectLayer;
    MotionType: TJPC_MotionType;
    AllowedDOFs: TJPC_AllowedDOFs;
    AllowDynamicOrKinematic: Tbool;
    IsSensor: Tbool;
    CollideKinematicVsNonDynamic: Tbool;
    UseManifoldReduction: Tbool;
    ApplyGyroscopicForce: Tbool;
    MotionQuality: TJPC_MotionQuality;
    EnhancedInternalEdgeRemoval: Tbool;
    AllowSleeping: Tbool;
    Friction: single;
    Restitution: single;
    LinearDamping: single;
    AngularDamping: single;
    MaxLinearVelocity: single;
    MaxAngularVelocity: single;
    GravityFactor: single;
    NumVelocityStepsOverride: Tuint;
    NumPositionStepsOverride: Tuint;
    OverrideMassProperties: TJPC_OverrideMassProperties;
    InertiaMultiplier: single;
    Shape: PJPC_Shape;
    _pad: QWord;
  end;
  PJPC_BodyCreationSettings = ^TJPC_BodyCreationSettings;

procedure JPC_BodyCreationSettings_default(settings: PJPC_BodyCreationSettings); cdecl; external joltc;

function JPC_BodyCreationSettings_new: PJPC_BodyCreationSettings; cdecl; external joltc;
function JPC_Body_GetID(self: PJPC_Body): TJPC_BodyID; cdecl; external joltc;
function JPC_Body_GetBodyType(self: PJPC_Body): TJPC_BodyType; cdecl; external joltc;
function JPC_Body_IsRigidBody(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_IsSoftBody(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_IsActive(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_IsStatic(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_IsKinematic(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_IsDynamic(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_CanBeKinematicOrDynamic(self: PJPC_Body): Tbool; cdecl; external joltc;
procedure JPC_Body_SetIsSensor(self: PJPC_Body; inIsSensor: Tbool); cdecl; external joltc;
function JPC_Body_IsSensor(self: PJPC_Body): Tbool; cdecl; external joltc;
procedure JPC_Body_SetCollideKinematicVsNonDynamic(self: PJPC_Body; inCollide: Tbool); cdecl; external joltc;
function JPC_Body_GetCollideKinematicVsNonDynamic(self: PJPC_Body): Tbool; cdecl; external joltc;
procedure JPC_Body_SetUseManifoldReduction(self: PJPC_Body; inUseReduction: Tbool); cdecl; external joltc;
function JPC_Body_GetUseManifoldReduction(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_GetUseManifoldReductionWithBody(self: PJPC_Body; inBody2: PJPC_Body): Tbool; cdecl; external joltc;
procedure JPC_Body_SetApplyGyroscopicForce(self: PJPC_Body; inApply: Tbool); cdecl; external joltc;
function JPC_Body_GetApplyGyroscopicForce(self: PJPC_Body): Tbool; cdecl; external joltc;
procedure JPC_Body_SetEnhancedInternalEdgeRemoval(self: PJPC_Body; inApply: Tbool); cdecl; external joltc;
function JPC_Body_GetEnhancedInternalEdgeRemoval(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_GetEnhancedInternalEdgeRemovalWithBody(self: PJPC_Body; inBody2: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_GetMotionType(self: PJPC_Body): TJPC_MotionType; cdecl; external joltc;
procedure JPC_Body_SetMotionType(self: PJPC_Body; inMotionType: TJPC_MotionType); cdecl; external joltc;
function JPC_Body_GetBroadPhaseLayer(self: PJPC_Body): TJPC_BroadPhaseLayer; cdecl; external joltc;
function JPC_Body_GetObjectLayer(self: PJPC_Body): TJPC_ObjectLayer; cdecl; external joltc;
function JPC_Body_GetAllowSleeping(self: PJPC_Body): Tbool; cdecl; external joltc;
procedure JPC_Body_SetAllowSleeping(self: PJPC_Body; inAllow: Tbool); cdecl; external joltc;
procedure JPC_Body_ResetSleepTimer(self: PJPC_Body); cdecl; external joltc;
function JPC_Body_GetFriction(self: PJPC_Body): single; cdecl; external joltc;
procedure JPC_Body_SetFriction(self: PJPC_Body; inFriction: single); cdecl; external joltc;
function JPC_Body_GetRestitution(self: PJPC_Body): single; cdecl; external joltc;
procedure JPC_Body_SetRestitution(self: PJPC_Body; inRestitution: single); cdecl; external joltc;
function JPC_Body_GetLinearVelocity(self: PJPC_Body): TJPC_Vec3; cdecl; external joltc;
procedure JPC_Body_SetLinearVelocity(self: PJPC_Body; inLinearVelocity: TJPC_Vec3); cdecl; external joltc;
procedure JPC_Body_SetLinearVelocityClamped(self: PJPC_Body; inLinearVelocity: TJPC_Vec3); cdecl; external joltc;
function JPC_Body_GetAngularVelocity(self: PJPC_Body): TJPC_Vec3; cdecl; external joltc;
procedure JPC_Body_SetAngularVelocity(self: PJPC_Body; inAngularVelocity: TJPC_Vec3); cdecl; external joltc;
procedure JPC_Body_SetAngularVelocityClamped(self: PJPC_Body; inAngularVelocity: TJPC_Vec3); cdecl; external joltc;
function JPC_Body_GetPointVelocityCOM(self: PJPC_Body; inPointRelativeToCOM: TJPC_Vec3): TJPC_Vec3; cdecl; external joltc;
function JPC_Body_GetPointVelocity(self: PJPC_Body; inPoint: TJPC_RVec3): TJPC_Vec3; cdecl; external joltc;
procedure JPC_Body_AddForce(self: PJPC_Body; inForce: TJPC_Vec3); cdecl; external joltc;
procedure JPC_Body_AddForceAtPoint(self: PJPC_Body; inForce: TJPC_Vec3; inPosition: TJPC_RVec3); cdecl; external joltc;
procedure JPC_Body_AddTorque(self: PJPC_Body; inTorque: TJPC_Vec3); cdecl; external joltc;
function JPC_Body_GetAccumulatedForce(self: PJPC_Body): TJPC_Vec3; cdecl; external joltc;
function JPC_Body_GetAccumulatedTorque(self: PJPC_Body): TJPC_Vec3; cdecl; external joltc;
procedure JPC_Body_ResetForce(self: PJPC_Body); cdecl; external joltc;
procedure JPC_Body_ResetTorque(self: PJPC_Body); cdecl; external joltc;
procedure JPC_Body_ResetMotion(self: PJPC_Body); cdecl; external joltc;
procedure JPC_Body_GetInverseInertia(self: PJPC_Body; outMatrix: PJPC_Mat44); cdecl; external joltc;
procedure JPC_Body_AddImpulse(self: PJPC_Body; inImpulse: TJPC_Vec3); cdecl; external joltc;
procedure JPC_Body_AddImpulse2(self: PJPC_Body; inImpulse: TJPC_Vec3; inPosition: TJPC_RVec3); cdecl; external joltc;
procedure JPC_Body_AddAngularImpulse(self: PJPC_Body; inAngularImpulse: TJPC_Vec3); cdecl; external joltc;
procedure JPC_Body_MoveKinematic(self: PJPC_Body; inTargetPosition: TJPC_RVec3; inTargetRotation: TJPC_Quat; inDeltaTime: single); cdecl; external joltc;
function JPC_Body_ApplyBuoyancyImpulse(self: PJPC_Body; inSurfacePosition: TJPC_RVec3; inSurfaceNormal: TJPC_Vec3; inBuoyancy: single; inLinearDrag: single;
  inAngularDrag: single; inFluidVelocity: TJPC_Vec3; inGravity: TJPC_Vec3; inDeltaTime: single): Tbool; cdecl; external joltc;
function JPC_Body_IsInBroadPhase(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_IsCollisionCacheInvalid(self: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_Body_GetShape(self: PJPC_Body): PJPC_Shape; cdecl; external joltc;
function JPC_Body_GetPosition(self: PJPC_Body): TJPC_RVec3; cdecl; external joltc;
function JPC_Body_GetRotation(self: PJPC_Body): TJPC_Quat; cdecl; external joltc;
function JPC_Body_GetWorldTransform(self: PJPC_Body): TJPC_RMat44; cdecl; external joltc;
function JPC_Body_GetCenterOfMassPosition(self: PJPC_Body): TJPC_RVec3; cdecl; external joltc;
function JPC_Body_GetCenterOfMassTransform(self: PJPC_Body): TJPC_RMat44; cdecl; external joltc;
function JPC_Body_GetInverseCenterOfMassTransform(self: PJPC_Body): TJPC_RMat44; cdecl; external joltc;
function JPC_Body_GetUserData(self: PJPC_Body): Tuint64_t; cdecl; external joltc;
procedure JPC_Body_SetUserData(self: PJPC_Body; inUserData: Tuint64_t); cdecl; external joltc;
function JPC_Body_GetWorldSpaceSurfaceNormal(self: PJPC_Body; inSubShapeID: TJPC_SubShapeID; inPosition: TJPC_RVec3): TJPC_Vec3; cdecl; external joltc;

type
  PJPC_BodyLockInterface = type Pointer;
  PJPC_BodyLockRead = type Pointer;

function JPC_BodyLockRead_new(iface: PJPC_BodyLockInterface; bodyID: TJPC_BodyID): PJPC_BodyLockRead; cdecl; external joltc;
procedure JPC_BodyLockRead_delete(self: PJPC_BodyLockRead); cdecl; external joltc;
function JPC_BodyLockRead_Succeeded(self: PJPC_BodyLockRead): Tbool; cdecl; external joltc;
function JPC_BodyLockRead_GetBody(self: PJPC_BodyLockRead): PJPC_Body; cdecl; external joltc;

type
  PJPC_BodyLockWrite = type Pointer;

function JPC_BodyLockWrite_new(iface: PJPC_BodyLockInterface; bodyID: TJPC_BodyID): PJPC_BodyLockWrite; cdecl; external joltc;
procedure JPC_BodyLockWrite_delete(self: PJPC_BodyLockWrite); cdecl; external joltc;
function JPC_BodyLockWrite_Succeeded(self: PJPC_BodyLockWrite): Tbool; cdecl; external joltc;
function JPC_BodyLockWrite_GetBody(self: PJPC_BodyLockWrite): PJPC_Body; cdecl; external joltc;

type
  PJPC_BodyLockMultiRead = type Pointer;

function JPC_BodyLockMultiRead_new(iface: PJPC_BodyLockInterface; inBodyIDs: PJPC_BodyID; inNumber: longint): PJPC_BodyLockMultiRead; cdecl; external joltc;
procedure JPC_BodyLockMultiRead_delete(self: PJPC_BodyLockMultiRead); cdecl; external joltc;
function JPC_BodyLockMultiRead_GetBody(self: PJPC_BodyLockMultiRead; inBodyIndex: longint): PJPC_Body; cdecl; external joltc;

type
  PJPC_BodyLockMultiWrite = type Pointer;

function JPC_BodyLockMultiWrite_new(iface: PJPC_BodyLockInterface; inBodyIDs: PJPC_BodyID; inNumber: longint): PJPC_BodyLockMultiWrite; cdecl; external joltc;
procedure JPC_BodyLockMultiWrite_delete(self: PJPC_BodyLockMultiWrite); cdecl; external joltc;
function JPC_BodyLockMultiWrite_GetBody(self: PJPC_BodyLockMultiWrite; inBodyIndex: longint): PJPC_Body; cdecl; external joltc;

type
  PJPC_BodyInterface = type Pointer;

function JPC_BodyInterface_CreateBody(self: PJPC_BodyInterface; inSettings: PJPC_BodyCreationSettings): PJPC_Body; cdecl; external joltc;
function JPC_BodyInterface_CreateBodyWithID(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inSettings: PJPC_BodyCreationSettings): PJPC_Body; cdecl; external joltc;
function JPC_BodyInterface_CreateBodyWithoutID(self: PJPC_BodyInterface; inSettings: PJPC_BodyCreationSettings): PJPC_Body; cdecl; external joltc;
procedure JPC_BodyInterface_DestroyBodyWithoutID(self: PJPC_BodyInterface; inBody: PJPC_Body); cdecl; external joltc;
function JPC_BodyInterface_AssignBodyID(self: PJPC_BodyInterface; ioBody: PJPC_Body): Tbool; cdecl; external joltc;
function JPC_BodyInterface_UnassignBodyID(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): PJPC_Body; cdecl; external joltc;
procedure JPC_BodyInterface_UnassignBodyIDs(self: PJPC_BodyInterface; inBodyIDs: PJPC_BodyID; inNumber: longint; outBodies: PPJPC_Body); cdecl; external joltc;
procedure JPC_BodyInterface_DestroyBody(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID); cdecl; external joltc;
procedure JPC_BodyInterface_DestroyBodies(self: PJPC_BodyInterface; inBodyIDs: PJPC_BodyID; inNumber: longint); cdecl; external joltc;
procedure JPC_BodyInterface_AddBody(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inActivationMode: TJPC_Activation); cdecl; external joltc;
procedure JPC_BodyInterface_RemoveBody(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID); cdecl; external joltc;
function JPC_BodyInterface_IsAdded(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): Tbool; cdecl; external joltc;
function JPC_BodyInterface_CreateAndAddBody(self: PJPC_BodyInterface; inSettings: PJPC_BodyCreationSettings; inActivationMode: TJPC_Activation): TJPC_BodyID; cdecl; external joltc;
function JPC_BodyInterface_AddBodiesPrepare(self: PJPC_BodyInterface; ioBodies: PJPC_BodyID; inNumber: longint): pointer; cdecl; external joltc;
procedure JPC_BodyInterface_AddBodiesFinalize(self: PJPC_BodyInterface; ioBodies: PJPC_BodyID; inNumber: longint; inAddState: pointer; inActivationMode: TJPC_Activation); cdecl; external joltc;
procedure JPC_BodyInterface_AddBodiesAbort(self: PJPC_BodyInterface; ioBodies: PJPC_BodyID; inNumber: longint; inAddState: pointer); cdecl; external joltc;
procedure JPC_BodyInterface_RemoveBodies(self: PJPC_BodyInterface; ioBodies: PJPC_BodyID; inNumber: longint); cdecl; external joltc;
procedure JPC_BodyInterface_ActivateBody(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID); cdecl; external joltc;
procedure JPC_BodyInterface_ActivateBodies(self: PJPC_BodyInterface; inBodyIDs: PJPC_BodyID; inNumber: longint); cdecl; external joltc;
procedure JPC_BodyInterface_DeactivateBody(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID); cdecl; external joltc;
procedure JPC_BodyInterface_DeactivateBodies(self: PJPC_BodyInterface; inBodyIDs: PJPC_BodyID; inNumber: longint); cdecl; external joltc;
function JPC_BodyInterface_IsActive(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): Tbool; cdecl; external joltc;
function JPC_BodyInterface_GetShape(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): PJPC_Shape; cdecl; external joltc;
procedure JPC_BodyInterface_SetShape(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inShape: PJPC_Shape; inUpdateMassProperties: Tbool; inActivationMode: TJPC_Activation); cdecl; external joltc;
procedure JPC_BodyInterface_NotifyShapeChanged(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inPreviousCenterOfMass: TJPC_Vec3; inUpdateMassProperties: Tbool; inActivationMode: TJPC_Activation); cdecl; external joltc;
procedure JPC_BodyInterface_SetObjectLayer(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inLayer: TJPC_ObjectLayer); cdecl; external joltc;
function JPC_BodyInterface_GetObjectLayer(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_ObjectLayer; cdecl; external joltc;
procedure JPC_BodyInterface_SetPositionAndRotation(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inPosition: TJPC_RVec3; inRotation: TJPC_Quat; inActivationMode: TJPC_Activation); cdecl; external joltc;
procedure JPC_BodyInterface_SetPositionAndRotationWhenChanged(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inPosition: TJPC_RVec3; inRotation: TJPC_Quat; inActivationMode: TJPC_Activation); cdecl; external joltc;
procedure JPC_BodyInterface_GetPositionAndRotation(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; outPosition: PJPC_RVec3; outRotation: PJPC_Quat); cdecl; external joltc;
procedure JPC_BodyInterface_SetPosition(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inPosition: TJPC_RVec3; inActivationMode: TJPC_Activation); cdecl; external joltc;
function JPC_BodyInterface_GetPosition(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_RVec3; cdecl; external joltc;
function JPC_BodyInterface_GetCenterOfMassPosition(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_RVec3; cdecl; external joltc;
procedure JPC_BodyInterface_SetRotation(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inRotation: TJPC_Quat; inActivationMode: TJPC_Activation); cdecl; external joltc;
function JPC_BodyInterface_GetRotation(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_Quat; cdecl; external joltc;
function JPC_BodyInterface_GetWorldTransform(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_RMat44; cdecl; external joltc;
function JPC_BodyInterface_GetCenterOfMassTransform(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_RMat44; cdecl; external joltc;
procedure JPC_BodyInterface_MoveKinematic(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inTargetPosition: TJPC_RVec3; inTargetRotation: TJPC_Quat; inDeltaTime: single); cdecl; external joltc;
procedure JPC_BodyInterface_SetLinearAndAngularVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inLinearVelocity: TJPC_Vec3; inAngularVelocity: TJPC_Vec3); cdecl; external joltc;
procedure JPC_BodyInterface_GetLinearAndAngularVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; outLinearVelocity: PJPC_Vec3; outAngularVelocity: PJPC_Vec3); cdecl; external joltc;
procedure JPC_BodyInterface_SetLinearVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inLinearVelocity: TJPC_Vec3); cdecl; external joltc;
function JPC_BodyInterface_GetLinearVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_Vec3; cdecl; external joltc;
procedure JPC_BodyInterface_AddLinearVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inLinearVelocity: TJPC_Vec3); cdecl; external joltc;
procedure JPC_BodyInterface_AddLinearAndAngularVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inLinearVelocity: TJPC_Vec3; inAngularVelocity: TJPC_Vec3); cdecl; external joltc;
procedure JPC_BodyInterface_SetAngularVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inAngularVelocity: TJPC_Vec3); cdecl; external joltc;
function JPC_BodyInterface_GetAngularVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_Vec3; cdecl; external joltc;
function JPC_BodyInterface_GetPointVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inPoint: TJPC_RVec3): TJPC_Vec3; cdecl; external joltc;
procedure JPC_BodyInterface_SetPositionRotationAndVelocity(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inPosition: TJPC_RVec3; inRotation: TJPC_Quat; inLinearVelocity: TJPC_Vec3; inAngularVelocity: TJPC_Vec3); cdecl; external joltc;
procedure JPC_BodyInterface_AddForce(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inForce: TJPC_Vec3); cdecl; external joltc;
procedure JPC_BodyInterface_AddForceAtPoint(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inForce: TJPC_Vec3; inPoint: TJPC_RVec3); cdecl; external joltc;
procedure JPC_BodyInterface_AddTorque(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inTorque: TJPC_Vec3); cdecl; external joltc;
procedure JPC_BodyInterface_AddForceAndTorque(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inForce: TJPC_Vec3; inTorque: TJPC_Vec3); cdecl; external joltc;
procedure JPC_BodyInterface_AddImpulse(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inImpulse: TJPC_Vec3); cdecl; external joltc;
procedure JPC_BodyInterface_AddImpulse3(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inImpulse: TJPC_Vec3; inPoint: TJPC_RVec3); cdecl; external joltc;
procedure JPC_BodyInterface_AddAngularImpulse(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inAngularImpulse: TJPC_Vec3); cdecl; external joltc;
function JPC_BodyInterface_GetBodyType(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_BodyType; cdecl; external joltc;
procedure JPC_BodyInterface_SetMotionType(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inMotionType: TJPC_MotionType; inActivationMode: TJPC_Activation); cdecl; external joltc;
function JPC_BodyInterface_GetMotionType(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_MotionType; cdecl; external joltc;
procedure JPC_BodyInterface_SetMotionQuality(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inMotionQuality: TJPC_MotionQuality); cdecl; external joltc;
function JPC_BodyInterface_GetMotionQuality(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): TJPC_MotionQuality; cdecl; external joltc;
procedure JPC_BodyInterface_GetInverseInertia(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; outMatrix: PJPC_Mat44); cdecl; external joltc;
procedure JPC_BodyInterface_SetRestitution(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inRestitution: single); cdecl; external joltc;
function JPC_BodyInterface_GetRestitution(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): single; cdecl; external joltc;
procedure JPC_BodyInterface_SetFriction(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inFriction: single); cdecl; external joltc;
function JPC_BodyInterface_GetFriction(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): single; cdecl; external joltc;
procedure JPC_BodyInterface_SetGravityFactor(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inGravityFactor: single); cdecl; external joltc;
function JPC_BodyInterface_GetGravityFactor(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): single; cdecl; external joltc;
procedure JPC_BodyInterface_SetUseManifoldReduction(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inUseReduction: Tbool); cdecl; external joltc;
function JPC_BodyInterface_GetUseManifoldReduction(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): Tbool; cdecl; external joltc;
function JPC_BodyInterface_GetUserData(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID): Tuint64_t; cdecl; external joltc;
procedure JPC_BodyInterface_SetUserData(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID; inUserData: Tuint64_t); cdecl; external joltc;
procedure JPC_BodyInterface_InvalidateContactCache(self: PJPC_BodyInterface; inBodyID: TJPC_BodyID); cdecl; external joltc;

type
  PJPC_NarrowPhaseQuery = type Pointer;

  TJPC_NarrowPhaseQuery_CastRayArgs = record
    Ray: TJPC_RRayCast;
    Result: TJPC_RayCastResult;
    BroadPhaseLayerFilter: PJPC_BroadPhaseLayerFilter;
    ObjectLayerFilter: PJPC_ObjectLayerFilter;
    BodyFilter: PJPC_BodyFilter;
    ShapeFilter: PJPC_ShapeFilter;
  end;
  PJPC_NarrowPhaseQuery_CastRayArgs = ^TJPC_NarrowPhaseQuery_CastRayArgs;

function JPC_NarrowPhaseQuery_CastRay(self: PJPC_NarrowPhaseQuery; args: PJPC_NarrowPhaseQuery_CastRayArgs): Tbool; cdecl; external joltc;

type
  TJPC_RShapeCast = record
    Shape: PJPC_Shape;
    Scale: TJPC_Vec3;
    CenterOfMassStart: TJPC_RMat44;
    Direction: TJPC_Vec3;
  end;
  PJPC_RShapeCast = ^TJPC_RShapeCast;

procedure JPC_ShapeCastSettings_default(obj: PJPC_ShapeCastSettings); cdecl; external joltc;

type
  TJPC_NarrowPhaseQuery_CastShapeArgs = record
    ShapeCast: TJPC_RShapeCast;
    Settings: TJPC_ShapeCastSettings;
    BaseOffset: TJPC_RVec3;
    Collector: PJPC_CastShapeCollector;
    BroadPhaseLayerFilter: PJPC_BroadPhaseLayerFilter;
    ObjectLayerFilter: PJPC_ObjectLayerFilter;
    BodyFilter: PJPC_BodyFilter;
    ShapeFilter: PJPC_ShapeFilter;
  end;
  PJPC_NarrowPhaseQuery_CastShapeArgs = ^TJPC_NarrowPhaseQuery_CastShapeArgs;

procedure JPC_NarrowPhaseQuery_CastShape(self: PJPC_NarrowPhaseQuery; args: PJPC_NarrowPhaseQuery_CastShapeArgs); cdecl; external joltc;
procedure JPC_CollideShapeSettings_default(obj: PJPC_CollideShapeSettings); cdecl; external joltc;

type
  TJPC_NarrowPhaseQuery_CollideShapeArgs = record
    Shape: PJPC_Shape;
    ShapeScale: TJPC_Vec3;
    CenterOfMassTransform: TJPC_RMat44;
    Settings: TJPC_CollideShapeSettings;
    BaseOffset: TJPC_RVec3;
    Collector: PJPC_CollideShapeCollector;
    BroadPhaseLayerFilter: PJPC_BroadPhaseLayerFilter;
    ObjectLayerFilter: PJPC_ObjectLayerFilter;
    BodyFilter: PJPC_BodyFilter;
    ShapeFilter: PJPC_ShapeFilter;
  end;
  PJPC_NarrowPhaseQuery_CollideShapeArgs = ^TJPC_NarrowPhaseQuery_CollideShapeArgs;

procedure JPC_NarrowPhaseQuery_CollideShape(self: PJPC_NarrowPhaseQuery; args: PJPC_NarrowPhaseQuery_CollideShapeArgs); cdecl; external joltc;

type
  PJPC_PhysicsSystem = type Pointer;

function JPC_PhysicsSystem_new: PJPC_PhysicsSystem; cdecl; external joltc;
procedure JPC_PhysicsSystem_delete(obj: PJPC_PhysicsSystem); cdecl; external joltc;
procedure JPC_PhysicsSystem_Init(self: PJPC_PhysicsSystem; inMaxBodies: Tuint; inNumBodyMutexes: Tuint; inMaxBodyPairs: Tuint; inMaxContactConstraints: Tuint;
  inBroadPhaseLayerInterface: PJPC_BroadPhaseLayerInterface; inObjectVsBroadPhaseLayerFilter: PJPC_ObjectVsBroadPhaseLayerFilter; inObjectLayerPairFilter: PJPC_ObjectLayerPairFilter); cdecl; external joltc;
procedure JPC_PhysicsSystem_OptimizeBroadPhase(self: PJPC_PhysicsSystem); cdecl; external joltc;
function JPC_PhysicsSystem_Update(self: PJPC_PhysicsSystem; inDeltaTime: single; inCollisionSteps: longint; inTempAllocator: PJPC_TempAllocatorImpl; inJobSystem: PJPC_JobSystem): TJPC_PhysicsUpdateError; cdecl; external joltc;
procedure JPC_PhysicsSystem_AddConstraint(self: PJPC_PhysicsSystem; constraint: PJPC_Constraint); cdecl; external joltc;
procedure JPC_PhysicsSystem_RemoveConstraint(self: PJPC_PhysicsSystem; constraint: PJPC_Constraint); cdecl; external joltc;
function JPC_PhysicsSystem_GetBodyInterface(self: PJPC_PhysicsSystem): PJPC_BodyInterface; cdecl; external joltc;
function JPC_PhysicsSystem_GetBodyLockInterface(self: PJPC_PhysicsSystem): PJPC_BodyLockInterface; cdecl; external joltc;
function JPC_PhysicsSystem_GetNarrowPhaseQuery(self: PJPC_PhysicsSystem): PJPC_NarrowPhaseQuery; cdecl; external joltc;
procedure JPC_PhysicsSystem_DrawBodies(self: PJPC_PhysicsSystem; inSettings: PJPC_BodyManager_DrawSettings; inRenderer: PJPC_DebugRendererSimple; inBodyFilter: pointer); cdecl; external joltc;
procedure JPC_PhysicsSystem_DrawConstraints(self: PJPC_PhysicsSystem; inRenderer: PJPC_DebugRendererSimple); cdecl; external joltc;
procedure JPC_PhysicsSystem_SetSimShapeFilter(self: PJPC_PhysicsSystem; inShapeFilter: PJPC_SimShapeFilter); cdecl; external joltc;
procedure JPC_PhysicsSystem_SetContactListener(self: PJPC_PhysicsSystem; inContactListener: PJPC_ContactListener); cdecl; external joltc;

// === Konventiert am: 28-3-26 19:29:22 ===


implementation

// wegen "division_by_zero" in den clibs
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
end.
