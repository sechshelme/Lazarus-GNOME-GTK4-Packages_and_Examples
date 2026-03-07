unit math_functions;

interface

uses
  fp_box2d;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Tb2Vec2 = record
      x : single;
      y : single;
    end;
  Pb2Vec2 = ^Tb2Vec2;

  Tb2CosSin = record
      cosine : single;
      sine : single;
    end;
  Pb2CosSin = ^Tb2CosSin;

  Tb2Rot = record
      c : single;
      s : single;
    end;
  Pb2Rot = ^Tb2Rot;

  Tb2Transform = record
      p : Tb2Vec2;
      q : Tb2Rot;
    end;
  Pb2Transform = ^Tb2Transform;

  Tb2Mat22 = record
      cx : Tb2Vec2;
      cy : Tb2Vec2;
    end;
  Pb2Mat22 = ^Tb2Mat22;

  Tb2AABB = record
      lowerBound : Tb2Vec2;
      upperBound : Tb2Vec2;
    end;
  Pb2AABB = ^Tb2AABB;

  Tb2Plane = record
      normal : Tb2Vec2;
      offset : single;
    end;
  Pb2Plane = ^Tb2Plane;

const
  B2_PI = 3.14159265359;  
{ xxxxxxxxxxx
static const b2Vec2 b2Vec2_zero =  0.0f, 0.0f ;
static const b2Rot b2Rot_identity =  1.0f, 0.0f ;
static const b2Transform b2Transform_identity =   0.0f, 0.0f ,  1.0f, 0.0f  ;
static const b2Mat22 b2Mat22_zero =   0.0f, 0.0f ,  0.0f, 0.0f  ;
 }
{/ Is this a valid number? Not NaN or infinity. }

function b2IsValidFloat(a:single):Tbool;cdecl;external libbox2d;
{/ Is this a valid vector? Not NaN or infinity. }
function b2IsValidVec2(v:Tb2Vec2):Tbool;cdecl;external libbox2d;
{/ Is this a valid rotation? Not NaN or infinity. Is normalized. }
function b2IsValidRotation(q:Tb2Rot):Tbool;cdecl;external libbox2d;
{/ Is this a valid transform? Not NaN or infinity. Rotation is normalized. }
function b2IsValidTransform(t:Tb2Transform):Tbool;cdecl;external libbox2d;
{/ Is this a valid bounding box? Not Nan or infinity. Upper bound greater than or equal to lower bound. }
function b2IsValidAABB(aabb:Tb2AABB):Tbool;cdecl;external libbox2d;
{/ Is this a valid plane? Normal is a unit vector. Not Nan or infinity. }
function b2IsValidPlane(a:Tb2Plane):Tbool;cdecl;external libbox2d;
{/ @return the minimum of two integers }
function b2MinInt(a:longint; b:longint):longint;cdecl;external libbox2d;
function b2MaxInt(a:longint; b:longint):longint;cdecl;external libbox2d;
function b2AbsInt(a:longint):longint;cdecl;external libbox2d;
function b2ClampInt(a:longint; lower:longint; upper:longint):longint;cdecl;external libbox2d;
function b2MinFloat(a:single; b:single):single;cdecl;external libbox2d;
function b2MaxFloat(a:single; b:single):single;cdecl;external libbox2d;
function b2AbsFloat(a:single):single;cdecl;external libbox2d;
function b2ClampFloat(a:single; lower:single; upper:single):single;cdecl;external libbox2d;
{/ Compute an approximate arctangent in the range [-pi, pi] }
{/ This is hand coded for cross-platform determinism. The atan2f }
{/ function in the standard library is not cross-platform deterministic. }
{/	Accurate to around 0.0023 degrees }
function b2Atan2(y:single; x:single):single;cdecl;external libbox2d;
{/ Compute the cosine and sine of an angle in radians. Implemented }
{/ for cross-platform determinism. }
function b2ComputeCosSin(radians:single):Tb2CosSin;cdecl;external libbox2d;
{/ Vector dot product }
function b2Dot(a:Tb2Vec2; b:Tb2Vec2):single;cdecl;external libbox2d;
function b2Cross(a:Tb2Vec2; b:Tb2Vec2):single;cdecl;external libbox2d;
function b2CrossVS(v:Tb2Vec2; s:single):Tb2Vec2;cdecl;external libbox2d;
function b2CrossSV(s:single; v:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2LeftPerp(v:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2RightPerp(v:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2Add(a:Tb2Vec2; b:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2Sub(a:Tb2Vec2; b:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2Neg(a:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2Lerp(a:Tb2Vec2; b:Tb2Vec2; t:single):Tb2Vec2;cdecl;external libbox2d;
function b2Mul(a:Tb2Vec2; b:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2MulSV(s:single; v:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2MulAdd(a:Tb2Vec2; s:single; b:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2MulSub(a:Tb2Vec2; s:single; b:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2Abs(a:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2Min(a:Tb2Vec2; b:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2Max(a:Tb2Vec2; b:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2Clamp(v:Tb2Vec2; a:Tb2Vec2; b:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2Length(v:Tb2Vec2):single;cdecl;external libbox2d;
function b2Distance(a:Tb2Vec2; b:Tb2Vec2):single;cdecl;external libbox2d;
function b2Normalize(v:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2IsNormalized(a:Tb2Vec2):Tbool;cdecl;external libbox2d;
function b2GetLengthAndNormalize(length:Psingle; v:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2NormalizeRot(q:Tb2Rot):Tb2Rot;cdecl;external libbox2d;
function b2IntegrateRotation(q1:Tb2Rot; deltaAngle:single):Tb2Rot;cdecl;external libbox2d;
function b2LengthSquared(v:Tb2Vec2):single;cdecl;external libbox2d;
function b2DistanceSquared(a:Tb2Vec2; b:Tb2Vec2):single;cdecl;external libbox2d;
function b2MakeRot(radians:single):Tb2Rot;cdecl;external libbox2d;
function b2MakeRotFromUnitVector(unitVector:Tb2Vec2):Tb2Rot;cdecl;external libbox2d;
function b2ComputeRotationBetweenUnitVectors(v1:Tb2Vec2; v2:Tb2Vec2):Tb2Rot;cdecl;external libbox2d;
function b2IsNormalizedRot(q:Tb2Rot):Tbool;cdecl;external libbox2d;
function b2InvertRot(a:Tb2Rot):Tb2Rot;cdecl;external libbox2d;
function b2NLerp(q1:Tb2Rot; q2:Tb2Rot; t:single):Tb2Rot;cdecl;external libbox2d;
function b2ComputeAngularVelocity(q1:Tb2Rot; q2:Tb2Rot; inv_h:single):single;cdecl;external libbox2d;
function b2Rot_GetAngle(q:Tb2Rot):single;cdecl;external libbox2d;
function b2Rot_GetXAxis(q:Tb2Rot):Tb2Vec2;cdecl;external libbox2d;
function b2Rot_GetYAxis(q:Tb2Rot):Tb2Vec2;cdecl;external libbox2d;
function b2MulRot(q:Tb2Rot; r:Tb2Rot):Tb2Rot;cdecl;external libbox2d;
function b2InvMulRot(a:Tb2Rot; b:Tb2Rot):Tb2Rot;cdecl;external libbox2d;
function b2RelativeAngle(a:Tb2Rot; b:Tb2Rot):single;cdecl;external libbox2d;
function b2UnwindAngle(radians:single):single;cdecl;external libbox2d;
function b2RotateVector(q:Tb2Rot; v:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2InvRotateVector(q:Tb2Rot; v:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2TransformPoint(t:Tb2Transform; p:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2InvTransformPoint(t:Tb2Transform; p:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2MulTransforms(A:Tb2Transform; B:Tb2Transform):Tb2Transform;cdecl;external libbox2d;
function b2InvMulTransforms(A:Tb2Transform; B:Tb2Transform):Tb2Transform;cdecl;external libbox2d;
function b2MulMV(A:Tb2Mat22; v:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2GetInverse22(A:Tb2Mat22):Tb2Mat22;cdecl;external libbox2d;
function b2Solve22(A:Tb2Mat22; b:Tb2Vec2):Tb2Vec2;cdecl;external libbox2d;
function b2AABB_Contains(a:Tb2AABB; b:Tb2AABB):Tbool;cdecl;external libbox2d;
function b2AABB_Center(a:Tb2AABB):Tb2Vec2;cdecl;external libbox2d;
function b2AABB_Extents(a:Tb2AABB):Tb2Vec2;cdecl;external libbox2d;
function b2AABB_Union(a:Tb2AABB; b:Tb2AABB):Tb2AABB;cdecl;external libbox2d;
function b2AABB_Overlaps(a:Tb2AABB; b:Tb2AABB):Tbool;cdecl;external libbox2d;
function b2MakeAABB(points:Pb2Vec2; count:longint; radius:single):Tb2AABB;cdecl;external libbox2d;
function b2PlaneSeparation(plane:Tb2Plane; point:Tb2Vec2):single;cdecl;external libbox2d;
function b2SpringDamper(hertz:single; dampingRatio:single; position:single; velocity:single; timeStep:single):single;cdecl;external libbox2d;
procedure b2SetLengthUnitsPerMeter(lengthUnits:single);cdecl;external libbox2d;
{/ Get the current length units per meter. }
function b2GetLengthUnitsPerMeter:single;cdecl;external libbox2d;
{*@ }
{*
 * @defgroup math_cpp C++ Math
 * @brief Math operator overloads for C++
 *
 * See math_functions.h for details.
 * @
  }
{*@ }

// === Konventiert am: 7-3-26 16:28:37 ===


implementation



end.
