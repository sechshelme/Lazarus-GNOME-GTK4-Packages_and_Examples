
unit common;
interface

{
  Automatically converted by H2Pas 1.0.0 from common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    common.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PdBodyID  = ^dBodyID;
PdDynamicsAxis  = ^dDynamicsAxis;
PdGeomID  = ^dGeomID;
PdJointFeedback  = ^dJointFeedback;
PdJointGroupID  = ^dJointGroupID;
PdJointID  = ^dJointID;
PdJointType  = ^dJointType;
PdMat3Element  = ^dMat3Element;
PdMat4Element  = ^dMat4Element;
PdMatrix3  = ^dMatrix3;
PdMatrix4  = ^dMatrix4;
PdMotionDynamics  = ^dMotionDynamics;
PdQuatElement  = ^dQuatElement;
PdQuaternion  = ^dQuaternion;
PdReal  = ^dReal;
PdSpaceAxis  = ^dSpaceAxis;
PdSpaceID  = ^dSpaceID;
PdTriIndex  = ^dTriIndex;
PdVec3Element  = ^dVec3Element;
PdVec4Element  = ^dVec4Element;
PdVector3  = ^dVector3;
PdVector4  = ^dVector4;
PdWorldID  = ^dWorldID;
PdxBody  = ^dxBody;
PdxGeom  = ^dxGeom;
PdxJoint  = ^dxJoint;
PdxJointGroup  = ^dxJointGroup;
PdxSpace  = ^dxSpace;
PdxWorld  = ^dxWorld;
Pxxxx  = ^xxxx;
Pxxxxx  = ^xxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001,2002 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 ************************************************************************ }
{$ifndef _ODE_COMMON_H_}
{$define _ODE_COMMON_H_}
{$include <ode/odeconfig.h>}
{$include <ode/error.h>}
{ C++ extern C conditionnal removed }
{ configuration stuff  }
{ constants  }
{ pi and 1/sqrt(2) are defined here if necessary because they don't get
 * defined in <math.h> on some platforms (like MS-Windows)
  }
{$ifndef M_PI}

{ was #define dname def_expr }
function M_PI : longint; { return type might be wrong }

{$endif}
{$ifndef M_PI_2}

{ was #define dname def_expr }
function M_PI_2 : longint; { return type might be wrong }

{$endif}
{$ifndef M_SQRT1_2}

{ was #define dname def_expr }
function M_SQRT1_2 : longint; { return type might be wrong }

{$endif}
{ floating point data type, vector, matrix and quaternion types  }
{$if defined(dSINGLE)}
type
  PdReal = ^TdReal;
  TdReal = single;
{$ifdef dDOUBLE}
{$error You can only #define dSINGLE or dDOUBLE, not both.}
{$endif}
{ dDOUBLE  }
(*** was #elif ****){$else defined(dDOUBLE)}
type
  PdReal = ^TdReal;
  TdReal = Tdouble;
{$else}
{$error You must #define dSINGLE or dDOUBLE}
{$endif}
{ Detect if we've got both trimesh engines enabled.  }
{$if dTRIMESH_ENABLED}
{$if dTRIMESH_OPCODE && dTRIMESH_GIMPACT}
{$error You can only #define dTRIMESH_OPCODE or dTRIMESH_GIMPACT, not both.}
{$endif}
{$endif}
{ dTRIMESH_ENABLED  }
{
 * Define a type for indices, either 16 or 32 bit, based on build option
 * TODO: Currently GIMPACT only supports 32 bit indices.
  }
{$if dTRIMESH_16BIT_INDICES}
{$if dTRIMESH_GIMPACT}
type
  PdTriIndex = ^TdTriIndex;
  TdTriIndex = Tduint32;
{$else}
{ dTRIMESH_GIMPACT  }
type
  PdTriIndex = ^TdTriIndex;
  TdTriIndex = Tduint16;
{$endif}
{ dTRIMESH_GIMPACT  }
{$else}
{ dTRIMESH_16BIT_INDICES  }
type
  PdTriIndex = ^TdTriIndex;
  TdTriIndex = Tduint32;
{$endif}
{ dTRIMESH_16BIT_INDICES  }
{ round an integer up to a multiple of 4, except that 0 and 1 are unmodified
 * (used to compute matrix leading dimensions)
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function dPAD(a : longint) : longint;

type
  PdSpaceAxis = ^TdSpaceAxis;
  TdSpaceAxis =  Longint;
  Const
    dSA__MIN = 0;
    dSA_X = dSA__MIN;
    dSA_Y = (dSA__MIN)+1;
    dSA_Z = (dSA__MIN)+2;
    dSA__MAX = (dSA__MIN)+3;
;
type
  PdMotionDynamics = ^TdMotionDynamics;
  TdMotionDynamics =  Longint;
  Const
    dMD__MIN = 0;
    dMD_LINEAR = dMD__MIN;
    dMD_ANGULAR = (dMD__MIN)+1;
    dMD__MAX = (dMD__MIN)+2;
;
type
  PdDynamicsAxis = ^TdDynamicsAxis;
  TdDynamicsAxis =  Longint;
  Const
    dDA__MIN = 0;
    dDA__L_MIN = dDA__MIN+(dMD_LINEAR*dSA__MAX);
    dDA_LX = dDA__L_MIN+dSA_X;
    dDA_LY = dDA__L_MIN+dSA_Y;
    dDA_LZ = dDA__L_MIN+dSA_Z;
    dDA__L_MAX = dDA__L_MIN+dSA__MAX;
    dDA__A_MIN = dDA__MIN+(dMD_ANGULAR*dSA__MAX);
    dDA_AX = dDA__A_MIN+dSA_X;
    dDA_AY = dDA__A_MIN+dSA_Y;
    dDA_AZ = dDA__A_MIN+dSA_Z;
    dDA__A_MAX = dDA__A_MIN+dSA__MAX;
    dDA__MAX = dDA__MIN+(dMD__MAX*dSA__MAX);
;
type
  PdVec3Element = ^TdVec3Element;
  TdVec3Element =  Longint;
  Const
    dV3E__MIN = 0;
    dV3E__AXES_MIN = dV3E__MIN;
    dV3E_X = dV3E__AXES_MIN+dSA_X;
    dV3E_Y = dV3E__AXES_MIN+dSA_Y;
    dV3E_Z = dV3E__AXES_MIN+dSA_Z;
    dV3E__AXES_MAX = dV3E__AXES_MIN+dSA__MAX;
    dV3E_PAD = dV3E__AXES_MAX;
    dV3E__MAX = (dV3E__AXES_MAX)+1;
    dV3E__AXES_COUNT = dV3E__AXES_MAX-dV3E__AXES_MIN;
;
type
  PdVec4Element = ^TdVec4Element;
  TdVec4Element =  Longint;
  Const
    dV4E__MIN = 0;
    dV4E_X = dV4E__MIN+dSA_X;
    dV4E_Y = dV4E__MIN+dSA_Y;
    dV4E_Z = dV4E__MIN+dSA_Z;
    dV4E_O = dV4E__MIN+dSA__MAX;
    dV4E__MAX = (dV4E__MIN+dSA__MAX)+1;
;
type
  PdMat3Element = ^TdMat3Element;
  TdMat3Element =  Longint;
  Const
    dM3E__MIN = 0;
    dM3E__X_MIN = dM3E__MIN+(dSA_X*dV3E__MAX);
    dM3E__X_AXES_MIN = dM3E__X_MIN+dV3E__AXES_MIN;
    dM3E_XX = dM3E__X_MIN+dV3E_X;
    dM3E_XY = dM3E__X_MIN+dV3E_Y;
    dM3E_XZ = dM3E__X_MIN+dV3E_Z;
    dM3E__X_AXES_MAX = dM3E__X_MIN+dV3E__AXES_MAX;
    dM3E_XPAD = dM3E__X_MIN+dV3E_PAD;
    dM3E__X_MAX = dM3E__X_MIN+dV3E__MAX;
    dM3E__Y_MIN = dM3E__MIN+(dSA_Y*dV3E__MAX);
    dM3E__Y_AXES_MIN = dM3E__Y_MIN+dV3E__AXES_MIN;
    dM3E_YX = dM3E__Y_MIN+dV3E_X;
    dM3E_YY = dM3E__Y_MIN+dV3E_Y;
    dM3E_YZ = dM3E__Y_MIN+dV3E_Z;
    dM3E__Y_AXES_MAX = dM3E__Y_MIN+dV3E__AXES_MAX;
    dM3E_YPAD = dM3E__Y_MIN+dV3E_PAD;
    dM3E__Y_MAX = dM3E__Y_MIN+dV3E__MAX;
    dM3E__Z_MIN = dM3E__MIN+(dSA_Z*dV3E__MAX);
    dM3E__Z_AXES_MIN = dM3E__Z_MIN+dV3E__AXES_MIN;
    dM3E_ZX = dM3E__Z_MIN+dV3E_X;
    dM3E_ZY = dM3E__Z_MIN+dV3E_Y;
    dM3E_ZZ = dM3E__Z_MIN+dV3E_Z;
    dM3E__Z_AXES_MAX = dM3E__Z_MIN+dV3E__AXES_MAX;
    dM3E_ZPAD = dM3E__Z_MIN+dV3E_PAD;
    dM3E__Z_MAX = dM3E__Z_MIN+dV3E__MAX;
    dM3E__MAX = dM3E__MIN+(dSA__MAX*dV3E__MAX);
;
type
  PdMat4Element = ^TdMat4Element;
  TdMat4Element =  Longint;
  Const
    dM4E__MIN = 0;
    dM4E__X_MIN = dM4E__MIN+(dV4E_X*dV4E__MAX);
    dM4E_XX = dM4E__X_MIN+dV4E_X;
    dM4E_XY = dM4E__X_MIN+dV4E_Y;
    dM4E_XZ = dM4E__X_MIN+dV4E_Z;
    dM4E_XO = dM4E__X_MIN+dV4E_O;
    dM4E__X_MAX = dM4E__X_MIN+dV4E__MAX;
    dM4E__Y_MIN = dM4E__MIN+(dV4E_Y*dV4E__MAX);
    dM4E_YX = dM4E__Y_MIN+dV4E_X;
    dM4E_YY = dM4E__Y_MIN+dV4E_Y;
    dM4E_YZ = dM4E__Y_MIN+dV4E_Z;
    dM4E_YO = dM4E__Y_MIN+dV4E_O;
    dM4E__Y_MAX = dM4E__Y_MIN+dV4E__MAX;
    dM4E__Z_MIN = dM4E__MIN+(dV4E_Z*dV4E__MAX);
    dM4E_ZX = dM4E__Z_MIN+dV4E_X;
    dM4E_ZY = dM4E__Z_MIN+dV4E_Y;
    dM4E_ZZ = dM4E__Z_MIN+dV4E_Z;
    dM4E_ZO = dM4E__Z_MIN+dV4E_O;
    dM4E__Z_MAX = dM4E__Z_MIN+dV4E__MAX;
    dM4E__O_MIN = dM4E__MIN+(dV4E_O*dV4E__MAX);
    dM4E_OX = dM4E__O_MIN+dV4E_X;
    dM4E_OY = dM4E__O_MIN+dV4E_Y;
    dM4E_OZ = dM4E__O_MIN+dV4E_Z;
    dM4E_OO = dM4E__O_MIN+dV4E_O;
    dM4E__O_MAX = dM4E__O_MIN+dV4E__MAX;
    dM4E__MAX = dM4E__MIN+(dV4E__MAX*dV4E__MAX);
;
type
  PdQuatElement = ^TdQuatElement;
  TdQuatElement =  Longint;
  Const
    dQUE__MIN = 0;
    dQUE_R = dQUE__MIN;
    dQUE__AXIS_MIN = (dQUE__MIN)+1;
    dQUE_I = dQUE__AXIS_MIN+dSA_X;
    dQUE_J = dQUE__AXIS_MIN+dSA_Y;
    dQUE_K = dQUE__AXIS_MIN+dSA_Z;
    dQUE__AXIS_MAX = dQUE__AXIS_MIN+dSA__MAX;
    dQUE__MAX = dQUE__AXIS_MAX;
;
{ these types are mainly just used in headers  }
type
  PdVector3 = ^TdVector3;
  TdVector3 = array[0..(dV3E__MAX)-1] of TdReal;

  PdVector4 = ^TdVector4;
  TdVector4 = array[0..(dV4E__MAX)-1] of TdReal;

  PdMatrix3 = ^TdMatrix3;
  TdMatrix3 = array[0..(dM3E__MAX)-1] of TdReal;

  PdMatrix4 = ^TdMatrix4;
  TdMatrix4 = array[0..(dM4E__MAX)-1] of TdReal;
{xxxxxxtypedef dReal dMatrix6[(dMD__MAX * dV3E__MAX) * (dMD__MAX * dSA__MAX)]; }

  PdQuaternion = ^TdQuaternion;
  TdQuaternion = array[0..(dQUE__MAX)-1] of TdReal;
{ precision dependent scalar math functions  }
{ xxxxxxx ODE_PURE_INLINE dReal dMin(dReal x, dReal y)  return x <= y ? x : y;  }
{ xxxxxxxxxxxxxODE_PURE_INLINE dReal dMax(dReal x, dReal y)  return x <= y ? y : x;  }
{ internal object types (all prefixed with `dx')  }
  PdxWorld = ^TdxWorld;
  TdxWorld = record
      {undefined structure}
    end;

{ dynamics world  }
  PdxSpace = ^TdxSpace;
  TdxSpace = record
      {undefined structure}
    end;

{ collision space  }
  PdxBody = ^TdxBody;
  TdxBody = record
      {undefined structure}
    end;

{ rigid body (dynamics object)  }
  PdxGeom = ^TdxGeom;
  TdxGeom = record
      {undefined structure}
    end;

{ geometry (collision object)  }
  PdxJoint = ^TdxJoint;
  TdxJoint = record
      {undefined structure}
    end;

{ joint  }
  PdxJointGroup = ^TdxJointGroup;
  TdxJointGroup = record
      {undefined structure}
    end;

{ joint group  }

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
{ error numbers  }
{ unknown error  }
{ internal assertion failed  }
{ user assertion failed  }
{ user assertion failed  }
  Txxxxx =  Longint;
  Const
    d_ERR_UNKNOWN = 0;
    d_ERR_IASSERT = 1;
    d_ERR_UASSERT = 2;
    d_ERR_LCP = 3;

{ joint type numbers  }
{ or "unknown"  }
type
  PdJointType = ^TdJointType;
  TdJointType =  Longint;
  Const
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
;
{ an alternative way of setting joint parameters, using joint parameter
 * structures and member constants. we don't actually do this yet.
  }
{
typedef struct dLimot 
  int mode;
  dReal lostop, histop;
  dReal vel, fmax;
  dReal fudge_factor;
  dReal bounce, soft;
  dReal suspension_erp, suspension_cfm;
 dLimot;

enum 
  dLimotLoStop		= 0x0001,
  dLimotHiStop		= 0x0002,
  dLimotVel		= 0x0004,
  dLimotFMax		= 0x0008,
  dLimotFudgeFactor	= 0x0010,
  dLimotBounce		= 0x0020,
  dLimotSoft		= 0x0040
;
 }
{ standard joint parameter names. why are these here? - because we don't want
 * to include all the joint function definitions in joint.cpp. hmmmm.
 * MSVC complains if we call D_ALL_PARAM_NAMES_X with a blank second argument,
 * which is why we have the D_ALL_PARAM_NAMES macro as well. please copy and
 * paste between these two.
  }
{ Achse 1 / Standard  }
{ Achse 2 (Start 0x100)  }
{ Achse 3 (Start 0x200)  }
{ Hilfskonstante  }
type
  Txxxx =  Longint;
  Const
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

{ angular motor mode numbers  }
type
  Txxxx =  Longint;
  Const
    dAMotorUser = 0;
    dAMotorEuler = 1;

{ transmission joint mode numbers  }
type
  Txxxx =  Longint;
  Const
    dTransmissionParallelAxes = 0;
    dTransmissionIntersectingAxes = 1;
    dTransmissionChainDrive = 2;

{ joint force feedback information  }
{ force applied to body 1  }
{ torque applied to body 1  }
{ force applied to body 2  }
{ torque applied to body 2  }
type
  PdJointFeedback = ^TdJointFeedback;
  TdJointFeedback = record
      f1 : TdVector3;
      t1 : TdVector3;
      f2 : TdVector3;
      t2 : TdVector3;
    end;
{ private functions that must be implemented by the collision library:
 * (1) indicate that a geom has moved, (2) get the next geom in a body list.
 * these functions are called whenever the position of geoms connected to a
 * body have changed, e.g. with dBodySetPosition(), dBodySetRotation(), or
 * when the ODE step function updates the body state.
  }

procedure dGeomMoved(para1:TdGeomID);cdecl;external;
function dGeomGetBodyNext(para1:TdGeomID):TdGeomID;cdecl;external;
{*
 * dGetConfiguration returns the specific ODE build configuration as
 * a string of tokens. The string can be parsed in a similar way to
 * the OpenGL extension mechanism, the naming convention should be
 * familiar too. The following extensions are reported:
 *
 * ODE
 * ODE_single_precision
 * ODE_double_precision
 * ODE_EXT_no_debug
 * ODE_EXT_trimesh
 * ODE_EXT_opcode
 * ODE_EXT_gimpact
 * ODE_OPC_16bit_indices
 * ODE_OPC_new_collider
 * ODE_EXT_mt_collisions
 * ODE_EXT_threading
 * ODE_THR_builtin_impl
  }
(* Const before type ignored *)
function dGetConfiguration:Pchar;cdecl;external;
{*
 * Helper to check for a token in the ODE configuration string.
 * Caution, this function is case sensitive.
 *
 * @param token A configuration token, see dGetConfiguration for details
 *
 * @return 1 if exact token is present, 0 if not present
  }
(* Const before type ignored *)
function dCheckConfiguration(token:Pchar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function M_PI : longint; { return type might be wrong }
  begin
    M_PI:=REAL(3.1415926535897932384626433832795029);
  end;

{ was #define dname def_expr }
function M_PI_2 : longint; { return type might be wrong }
  begin
    M_PI_2:=REAL(1.5707963267948966192313216916398);
  end;

{ was #define dname def_expr }
function M_SQRT1_2 : longint; { return type might be wrong }
  begin
    M_SQRT1_2:=REAL(0.7071067811865475244008443621048490);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function dPAD(a : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if a>1 then
    if_local1:=(Ta(+(3))) and (longint( not (3)))
  else
    if_local1:=a;
  dPAD:=if_local1;
end;


end.
