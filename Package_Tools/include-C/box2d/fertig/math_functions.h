// SPDX-FileCopyrightText: 2023 Erin Catto
// SPDX-License-Identifier: MIT

#pragma once

#include "base.h"

#include <float.h>
#include <math.h>
#include <stdbool.h>

/**
 * @defgroup math Math
 * @brief Vector math types and functions
 * @{
 */

/// 2D vector
/// This can be used to represent a point or free vector
typedef struct b2Vec2
{
	/// coordinates
	float x, y;
} b2Vec2;

/// Cosine and sine pair
/// This uses a custom implementation designed for cross-platform determinism
typedef struct b2CosSin
{
	/// cosine and sine
	float cosine;
	float sine;
} b2CosSin;

/// 2D rotation
/// This is similar to using a complex number for rotation
typedef struct b2Rot
{
	/// cosine and sine
	float c, s;
} b2Rot;

/// A 2D rigid transform
typedef struct b2Transform
{
	b2Vec2 p;
	b2Rot q;
} b2Transform;

/// A 2-by-2 Matrix
typedef struct b2Mat22
{
	/// columns
	b2Vec2 cx, cy;
} b2Mat22;

/// Axis-aligned bounding box
typedef struct b2AABB
{
	b2Vec2 lowerBound;
	b2Vec2 upperBound;
} b2AABB;

/// separation = dot(normal, point) - offset
typedef struct b2Plane
{
	b2Vec2 normal;
	float offset;
} b2Plane;

/**@}*/

/**
 * @addtogroup math
 * @{
 */

/// https://en.wikipedia.org/wiki/Pi
#define B2_PI 3.14159265359

/* xxxxxxxxxxx
static const b2Vec2 b2Vec2_zero = { 0.0f, 0.0f };
static const b2Rot b2Rot_identity = { 1.0f, 0.0f };
static const b2Transform b2Transform_identity = { { 0.0f, 0.0f }, { 1.0f, 0.0f } };
static const b2Mat22 b2Mat22_zero = { { 0.0f, 0.0f }, { 0.0f, 0.0f } };
*/

/// Is this a valid number? Not NaN or infinity.
extern bool b2IsValidFloat( float a );

/// Is this a valid vector? Not NaN or infinity.
extern bool b2IsValidVec2( b2Vec2 v );

/// Is this a valid rotation? Not NaN or infinity. Is normalized.
extern bool b2IsValidRotation( b2Rot q );

/// Is this a valid transform? Not NaN or infinity. Rotation is normalized.
extern bool b2IsValidTransform( b2Transform t );

/// Is this a valid bounding box? Not Nan or infinity. Upper bound greater than or equal to lower bound.
extern bool b2IsValidAABB( b2AABB aabb );

/// Is this a valid plane? Normal is a unit vector. Not Nan or infinity.
extern bool b2IsValidPlane( b2Plane a );

/// @return the minimum of two integers
extern  int b2MinInt( int a, int b );
extern  int b2MaxInt( int a, int b );
extern  int b2AbsInt( int a );
extern  int b2ClampInt( int a, int lower, int upper );
extern  float b2MinFloat( float a, float b );
extern  float b2MaxFloat( float a, float b );
extern  float b2AbsFloat( float a );
extern  float b2ClampFloat( float a, float lower, float upper );

/// Compute an approximate arctangent in the range [-pi, pi]
/// This is hand coded for cross-platform determinism. The atan2f
/// function in the standard library is not cross-platform deterministic.
///	Accurate to around 0.0023 degrees
extern float b2Atan2( float y, float x );

/// Compute the cosine and sine of an angle in radians. Implemented
/// for cross-platform determinism.
extern b2CosSin b2ComputeCosSin( float radians );

/// Vector dot product



  extern  float b2Dot( b2Vec2 a, b2Vec2 b );
  extern  float b2Cross( b2Vec2 a, b2Vec2 b );
  extern  b2Vec2 b2CrossVS( b2Vec2 v, float s );
  extern  b2Vec2 b2CrossSV( float s, b2Vec2 v );
  extern  b2Vec2 b2LeftPerp( b2Vec2 v );
  extern  b2Vec2 b2RightPerp( b2Vec2 v );
  extern  b2Vec2 b2Add( b2Vec2 a, b2Vec2 b );
  extern  b2Vec2 b2Sub( b2Vec2 a, b2Vec2 b );
  extern  b2Vec2 b2Neg( b2Vec2 a );
  extern  b2Vec2 b2Lerp( b2Vec2 a, b2Vec2 b, float t );
  extern  b2Vec2 b2Mul( b2Vec2 a, b2Vec2 b );
  extern  b2Vec2 b2MulSV( float s, b2Vec2 v );
  extern  b2Vec2 b2MulAdd( b2Vec2 a, float s, b2Vec2 b );
  extern  b2Vec2 b2MulSub( b2Vec2 a, float s, b2Vec2 b );
  extern  b2Vec2 b2Abs( b2Vec2 a );
  extern  b2Vec2 b2Min( b2Vec2 a, b2Vec2 b );
  extern  b2Vec2 b2Max( b2Vec2 a, b2Vec2 b );
  extern  b2Vec2 b2Clamp( b2Vec2 v, b2Vec2 a, b2Vec2 b );
  extern  float b2Length( b2Vec2 v );
  extern  float b2Distance( b2Vec2 a, b2Vec2 b );
  extern  b2Vec2 b2Normalize( b2Vec2 v );
  extern  bool b2IsNormalized( b2Vec2 a );
  extern  b2Vec2 b2GetLengthAndNormalize( float* length, b2Vec2 v );
  extern  b2Rot b2NormalizeRot( b2Rot q );
  extern  b2Rot b2IntegrateRotation( b2Rot q1, float deltaAngle );
  extern  float b2LengthSquared( b2Vec2 v );
  extern  float b2DistanceSquared( b2Vec2 a, b2Vec2 b );
  extern  b2Rot b2MakeRot( float radians );
  extern  b2Rot b2MakeRotFromUnitVector( b2Vec2 unitVector );
  extern b2Rot b2ComputeRotationBetweenUnitVectors( b2Vec2 v1, b2Vec2 v2 );
  extern  bool b2IsNormalizedRot( b2Rot q );
  extern  b2Rot b2InvertRot( b2Rot a );
  extern  b2Rot b2NLerp( b2Rot q1, b2Rot q2, float t );
  extern  float b2ComputeAngularVelocity( b2Rot q1, b2Rot q2, float inv_h );
  extern  float b2Rot_GetAngle( b2Rot q );
  extern  b2Vec2 b2Rot_GetXAxis( b2Rot q );
  extern  b2Vec2 b2Rot_GetYAxis( b2Rot q );
  extern  b2Rot b2MulRot( b2Rot q, b2Rot r );
  extern  b2Rot b2InvMulRot( b2Rot a, b2Rot b );
  extern  float b2RelativeAngle( b2Rot a, b2Rot b );
  extern  float b2UnwindAngle( float radians );
  extern  b2Vec2 b2RotateVector( b2Rot q, b2Vec2 v );
  extern  b2Vec2 b2InvRotateVector( b2Rot q, b2Vec2 v );
  extern  b2Vec2 b2TransformPoint( b2Transform t, const b2Vec2 p );
  extern  b2Vec2 b2InvTransformPoint( b2Transform t, const b2Vec2 p );
  extern  b2Transform b2MulTransforms( b2Transform A, b2Transform B );
  extern  b2Transform b2InvMulTransforms( b2Transform A, b2Transform B );
  extern  b2Vec2 b2MulMV( b2Mat22 A, b2Vec2 v );
  extern  b2Mat22 b2GetInverse22( b2Mat22 A );
  extern  b2Vec2 b2Solve22( b2Mat22 A, b2Vec2 b );
  extern  bool b2AABB_Contains( b2AABB a, b2AABB b );
  extern  b2Vec2 b2AABB_Center( b2AABB a );
  extern  b2Vec2 b2AABB_Extents( b2AABB a );
  extern  b2AABB b2AABB_Union( b2AABB a, b2AABB b );
  extern  bool b2AABB_Overlaps( b2AABB a, b2AABB b );
  extern  b2AABB b2MakeAABB( const b2Vec2* points, int count, float radius );
  extern  float b2PlaneSeparation( b2Plane plane, b2Vec2 point );
  extern  float b2SpringDamper( float hertz, float dampingRatio, float position, float velocity, float timeStep );






extern void b2SetLengthUnitsPerMeter( float lengthUnits );

/// Get the current length units per meter.
extern float b2GetLengthUnitsPerMeter( void );

/**@}*/

/**
 * @defgroup math_cpp C++ Math
 * @brief Math operator overloads for C++
 *
 * See math_functions.h for details.
 * @{
 */

#ifdef __cplusplus

/// Unary add one vector to another
inline void operator+=( b2Vec2& a, b2Vec2 b )
{
	a.x += b.x;
	a.y += b.y;
}

/// Unary subtract one vector from another
inline void operator-=( b2Vec2& a, b2Vec2 b )
{
	a.x -= b.x;
	a.y -= b.y;
}

/// Unary multiply a vector by a scalar
inline void operator*=( b2Vec2& a, float b )
{
	a.x *= b;
	a.y *= b;
}

/// Unary negate a vector
inline b2Vec2 operator-( b2Vec2 a )
{
	return { -a.x, -a.y };
}

/// Binary vector addition
inline b2Vec2 operator+( b2Vec2 a, b2Vec2 b )
{
	return { a.x + b.x, a.y + b.y };
}

/// Binary vector subtraction
inline b2Vec2 operator-( b2Vec2 a, b2Vec2 b )
{
	return { a.x - b.x, a.y - b.y };
}

/// Binary scalar and vector multiplication
inline b2Vec2 operator*( float a, b2Vec2 b )
{
	return { a * b.x, a * b.y };
}

/// Binary scalar and vector multiplication
inline b2Vec2 operator*( b2Vec2 a, float b )
{
	return { a.x * b, a.y * b };
}

/// Binary vector equality
inline bool operator==( b2Vec2 a, b2Vec2 b )
{
	return a.x == b.x && a.y == b.y;
}

/// Binary vector inequality
inline bool operator!=( b2Vec2 a, b2Vec2 b )
{
	return a.x != b.x || a.y != b.y;
}

#endif

/**@}*/
