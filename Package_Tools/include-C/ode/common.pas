unit common;

interface

uses
  fp_ode, odeconfig;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PPdReal = ^PdReal;
  PdReal = ^TdReal;
  TdReal = double;

type
  PdTriIndex = ^TdTriIndex;
  TdTriIndex = Tduint32;

type
  PdSpaceAxis = ^TdSpaceAxis;
  TdSpaceAxis = longint;

const
  dSA__MIN = 0;
  dSA_X = dSA__MIN;
  dSA_Y = (dSA__MIN) + 1;
  dSA_Z = (dSA__MIN) + 2;
  dSA__MAX = (dSA__MIN) + 3;

type
  PdMotionDynamics = ^TdMotionDynamics;
  TdMotionDynamics = longint;

const
  dMD__MIN = 0;
  dMD_LINEAR = dMD__MIN;
  dMD_ANGULAR = (dMD__MIN) + 1;
  dMD__MAX = (dMD__MIN) + 2;

type
  PdDynamicsAxis = ^TdDynamicsAxis;
  TdDynamicsAxis = longint;

const
  dDA__MIN = 0;
  dDA__L_MIN = dDA__MIN + (dMD_LINEAR * dSA__MAX);
  dDA_LX = dDA__L_MIN + dSA_X;
  dDA_LY = dDA__L_MIN + dSA_Y;
  dDA_LZ = dDA__L_MIN + dSA_Z;
  dDA__L_MAX = dDA__L_MIN + dSA__MAX;
  dDA__A_MIN = dDA__MIN + (dMD_ANGULAR * dSA__MAX);
  dDA_AX = dDA__A_MIN + dSA_X;
  dDA_AY = dDA__A_MIN + dSA_Y;
  dDA_AZ = dDA__A_MIN + dSA_Z;
  dDA__A_MAX = dDA__A_MIN + dSA__MAX;
  dDA__MAX = dDA__MIN + (dMD__MAX * dSA__MAX);

type
  PdVec3Element = ^TdVec3Element;
  TdVec3Element = longint;

const
  dV3E__MIN = 0;
  dV3E__AXES_MIN = dV3E__MIN;
  dV3E_X = dV3E__AXES_MIN + dSA_X;
  dV3E_Y = dV3E__AXES_MIN + dSA_Y;
  dV3E_Z = dV3E__AXES_MIN + dSA_Z;
  dV3E__AXES_MAX = dV3E__AXES_MIN + dSA__MAX;
  dV3E_PAD = dV3E__AXES_MAX;
  dV3E__MAX = (dV3E__AXES_MAX) + 1;
  dV3E__AXES_COUNT = dV3E__AXES_MAX - dV3E__AXES_MIN;

type
  PdVec4Element = ^TdVec4Element;
  TdVec4Element = longint;

const
  dV4E__MIN = 0;
  dV4E_X = dV4E__MIN + dSA_X;
  dV4E_Y = dV4E__MIN + dSA_Y;
  dV4E_Z = dV4E__MIN + dSA_Z;
  dV4E_O = dV4E__MIN + dSA__MAX;
  dV4E__MAX = (dV4E__MIN + dSA__MAX) + 1;

type
  PdMat3Element = ^TdMat3Element;
  TdMat3Element = longint;

const
  dM3E__MIN = 0;
  dM3E__X_MIN = dM3E__MIN + (dSA_X * dV3E__MAX);
  dM3E__X_AXES_MIN = dM3E__X_MIN + dV3E__AXES_MIN;
  dM3E_XX = dM3E__X_MIN + dV3E_X;
  dM3E_XY = dM3E__X_MIN + dV3E_Y;
  dM3E_XZ = dM3E__X_MIN + dV3E_Z;
  dM3E__X_AXES_MAX = dM3E__X_MIN + dV3E__AXES_MAX;
  dM3E_XPAD = dM3E__X_MIN + dV3E_PAD;
  dM3E__X_MAX = dM3E__X_MIN + dV3E__MAX;
  dM3E__Y_MIN = dM3E__MIN + (dSA_Y * dV3E__MAX);
  dM3E__Y_AXES_MIN = dM3E__Y_MIN + dV3E__AXES_MIN;
  dM3E_YX = dM3E__Y_MIN + dV3E_X;
  dM3E_YY = dM3E__Y_MIN + dV3E_Y;
  dM3E_YZ = dM3E__Y_MIN + dV3E_Z;
  dM3E__Y_AXES_MAX = dM3E__Y_MIN + dV3E__AXES_MAX;
  dM3E_YPAD = dM3E__Y_MIN + dV3E_PAD;
  dM3E__Y_MAX = dM3E__Y_MIN + dV3E__MAX;
  dM3E__Z_MIN = dM3E__MIN + (dSA_Z * dV3E__MAX);
  dM3E__Z_AXES_MIN = dM3E__Z_MIN + dV3E__AXES_MIN;
  dM3E_ZX = dM3E__Z_MIN + dV3E_X;
  dM3E_ZY = dM3E__Z_MIN + dV3E_Y;
  dM3E_ZZ = dM3E__Z_MIN + dV3E_Z;
  dM3E__Z_AXES_MAX = dM3E__Z_MIN + dV3E__AXES_MAX;
  dM3E_ZPAD = dM3E__Z_MIN + dV3E_PAD;
  dM3E__Z_MAX = dM3E__Z_MIN + dV3E__MAX;
  dM3E__MAX = dM3E__MIN + (dSA__MAX * dV3E__MAX);

type
  PdMat4Element = ^TdMat4Element;
  TdMat4Element = longint;

const
  dM4E__MIN = 0;
  dM4E__X_MIN = dM4E__MIN + (dV4E_X * dV4E__MAX);
  dM4E_XX = dM4E__X_MIN + dV4E_X;
  dM4E_XY = dM4E__X_MIN + dV4E_Y;
  dM4E_XZ = dM4E__X_MIN + dV4E_Z;
  dM4E_XO = dM4E__X_MIN + dV4E_O;
  dM4E__X_MAX = dM4E__X_MIN + dV4E__MAX;
  dM4E__Y_MIN = dM4E__MIN + (dV4E_Y * dV4E__MAX);
  dM4E_YX = dM4E__Y_MIN + dV4E_X;
  dM4E_YY = dM4E__Y_MIN + dV4E_Y;
  dM4E_YZ = dM4E__Y_MIN + dV4E_Z;
  dM4E_YO = dM4E__Y_MIN + dV4E_O;
  dM4E__Y_MAX = dM4E__Y_MIN + dV4E__MAX;
  dM4E__Z_MIN = dM4E__MIN + (dV4E_Z * dV4E__MAX);
  dM4E_ZX = dM4E__Z_MIN + dV4E_X;
  dM4E_ZY = dM4E__Z_MIN + dV4E_Y;
  dM4E_ZZ = dM4E__Z_MIN + dV4E_Z;
  dM4E_ZO = dM4E__Z_MIN + dV4E_O;
  dM4E__Z_MAX = dM4E__Z_MIN + dV4E__MAX;
  dM4E__O_MIN = dM4E__MIN + (dV4E_O * dV4E__MAX);
  dM4E_OX = dM4E__O_MIN + dV4E_X;
  dM4E_OY = dM4E__O_MIN + dV4E_Y;
  dM4E_OZ = dM4E__O_MIN + dV4E_Z;
  dM4E_OO = dM4E__O_MIN + dV4E_O;
  dM4E__O_MAX = dM4E__O_MIN + dV4E__MAX;
  dM4E__MAX = dM4E__MIN + (dV4E__MAX * dV4E__MAX);

type
  PdQuatElement = ^TdQuatElement;
  TdQuatElement = longint;

const
  dQUE__MIN = 0;
  dQUE_R = dQUE__MIN;
  dQUE__AXIS_MIN = (dQUE__MIN) + 1;
  dQUE_I = dQUE__AXIS_MIN + dSA_X;
  dQUE_J = dQUE__AXIS_MIN + dSA_Y;
  dQUE_K = dQUE__AXIS_MIN + dSA_Z;
  dQUE__AXIS_MAX = dQUE__AXIS_MIN + dSA__MAX;
  dQUE__MAX = dQUE__AXIS_MAX;

type
  PdVector3 = ^TdVector3;
  TdVector3 = array[0..(dV3E__MAX) - 1] of TdReal;

  PdVector4 = ^TdVector4;
  TdVector4 = array[0..(dV4E__MAX) - 1] of TdReal;

  PdMatrix3 = ^TdMatrix3;
  TdMatrix3 = array[0..(dM3E__MAX) - 1] of TdReal;

  PdMatrix4 = ^TdMatrix4;
  TdMatrix4 = array[0..(dM4E__MAX) - 1] of TdReal;

  PdMatrix6 = ^TdMatrix6;
  TdMatrix6 = array[0..(dMD__MAX * dV3E__MAX) * (dMD__MAX * dSA__MAX) - 1] of TdReal;

  PdQuaternion = ^TdQuaternion;
  TdQuaternion = array[0..(dQUE__MAX) - 1] of TdReal;

  PdxWorld = type Pointer;
  PdxSpace = type Pointer;
  PdxBody = type Pointer;
  PdxGeom = type Pointer;
  PdxJoint = type Pointer;
  PdxJointGroup = type Pointer;

  PdWorldID = ^TdWorldID;
  TdWorldID = PdxWorld;

  PdSpaceID = ^TdSpaceID;
  TdSpaceID = PdxSpace;

  PdBodyID = ^TdBodyID;
  TdBodyID = PdxBody;

  PdGeomID = ^TdGeomID;
  TdGeomID = PdxGeom;

  PdJointID = ^TdJointID;
  TdJointID = PdxJoint;

  PdJointGroupID = ^TdJointGroupID;
  TdJointGroupID = PdxJointGroup;

const
  d_ERR_UNKNOWN = 0;
  d_ERR_IASSERT = 1;
  d_ERR_UASSERT = 2;
  d_ERR_LCP = 3;

type
  PdJointType = ^TdJointType;
  TdJointType = longint;

const
  dJointTypeNone = 0;
  dJointTypeBall = 1;
  dJointTypeHinge = 2;
  dJointTypeSlider = 3;
  dJointTypeContact = 4;
  dJointTypeUniversal = 5;
  dJointTypeHinge2 = 6;
  dJointTypeFixed = 7;
  dJointTypeNull = 8;
  dJointTypeAMotor = 9;
  dJointTypeLMotor = 10;
  dJointTypePlane2D = 11;
  dJointTypePR = 12;
  dJointTypePU = 13;
  dJointTypePiston = 14;
  dJointTypeDBall = 15;
  dJointTypeDHinge = 16;
  dJointTypeTransmission = 17;

const
  dParamLoStop = 0;
  dParamHiStop = 1;
  dParamVel = 2;
  dParamLoVel = 3;
  dParamHiVel = 4;
  dParamFMax = 5;
  dParamFudgeFactor = 6;
  dParamBounce = 7;
  dParamCFM = 8;
  dParamStopERP = 9;
  dParamStopCFM = 10;
  dParamSuspensionERP = 11;
  dParamSuspensionCFM = 12;
  dParamERP = 13;
  dParamsInGroup = 14;
  dParamGroup2 = $100;
  dParamLoStop2 = $100;
  dParamHiStop2 = 257;
  dParamVel2 = 258;
  dParamLoVel2 = 259;
  dParamHiVel2 = 260;
  dParamFMax2 = 261;
  dParamFudgeFactor2 = 262;
  dParamBounce2 = 263;
  dParamCFM2 = 264;
  dParamStopERP2 = 265;
  dParamStopCFM2 = 266;
  dParamSuspensionERP2 = 267;
  dParamSuspensionCFM2 = 268;
  dParamERP2 = 269;
  dParamGroup3 = $200;
  dParamLoStop3 = $200;
  dParamHiStop3 = 513;
  dParamVel3 = 514;
  dParamLoVel3 = 515;
  dParamHiVel3 = 516;
  dParamFMax3 = 517;
  dParamFudgeFactor3 = 518;
  dParamBounce3 = 519;
  dParamCFM3 = 520;
  dParamStopERP3 = 521;
  dParamStopCFM3 = 522;
  dParamSuspensionERP3 = 523;
  dParamSuspensionCFM3 = 524;
  dParamERP3 = 525;
  dParamGroup = $100;

const
  dAMotorUser = 0;
  dAMotorEuler = 1;

const
  dTransmissionParallelAxes = 0;
  dTransmissionIntersectingAxes = 1;
  dTransmissionChainDrive = 2;

type
  TdJointFeedback = record
    f1: TdVector3;
    t1: TdVector3;
    f2: TdVector3;
    t2: TdVector3;
  end;
  PdJointFeedback = ^TdJointFeedback;

procedure dGeomMoved(para1: TdGeomID); cdecl; external libodes;
function dGeomGetBodyNext(para1: TdGeomID): TdGeomID; cdecl; external libodes;
function dGetConfiguration: pchar; cdecl; external libodes;
function dCheckConfiguration(token: pchar): longint; cdecl; external libodes;

// === Konventiert am: 30-4-26 17:10:02 ===


implementation


end.
