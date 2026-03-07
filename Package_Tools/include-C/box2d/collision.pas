unit collision;

interface

uses
  fp_box2d;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-FileCopyrightText: 2023 Erin Catto }
{ SPDX-License-Identifier: MIT }
(** unsupported pragma#pragma once*)
{$include "base.h"}
{$include "math_functions.h"}
{$include <stdbool.h>}
type
{*
 * @defgroup geometry Geometry
 * @brief Geometry types and algorithms
 *
 * Definitions of circles, capsules, segments, and polygons. Various algorithms to compute hulls, mass properties, and so on.
 * Functions should take the shape as the first argument to assist editor auto-complete.
 * @
  }
{/ The maximum number of vertices on a convex polygon. Changing this affects performance even if you }
{/ don't use more vertices. }

const
  B2_MAX_POLYGON_VERTICES = 8;  
{/ Low level ray cast input data }
{/ Start point of the ray cast }
{/ Translation of the ray cast }
{/ The maximum fraction of the translation to consider, typically 1 }
type
  Pb2RayCastInput = ^Tb2RayCastInput;
  Tb2RayCastInput = record
      origin : Tb2Vec2;
      translation : Tb2Vec2;
      maxFraction : single;
    end;
{/ A distance proxy is used by the GJK algorithm. It encapsulates any shape. }
{/ You can provide between 1 and B2_MAX_POLYGON_VERTICES and a radius. }
{/ The point cloud }
{/ The number of points. Must be greater than 0. }
{/ The external radius of the point cloud. May be zero. }

  Pb2ShapeProxy = ^Tb2ShapeProxy;
  Tb2ShapeProxy = record
      points : array[0..(B2_MAX_POLYGON_VERTICES)-1] of Tb2Vec2;
      count : longint;
      radius : single;
    end;
{/ Low level shape cast input in generic form. This allows casting an arbitrary point }
{/ cloud wrap with a radius. For example, a circle is a single point with a non-zero radius. }
{/ A capsule is two points with a non-zero radius. A box is four points with a zero radius. }
{/ A generic shape }
{/ The translation of the shape cast }
{/ The maximum fraction of the translation to consider, typically 1 }
{/ Allow shape cast to encroach when initially touching. This only works if the radius is greater than zero. }

  Pb2ShapeCastInput = ^Tb2ShapeCastInput;
  Tb2ShapeCastInput = record
      proxy : Tb2ShapeProxy;
      translation : Tb2Vec2;
      maxFraction : single;
      canEncroach : Tbool;
    end;
{/ Low level ray cast or shape-cast output data. Returns a zero fraction and normal in the case of initial overlap. }
{/ The surface normal at the hit point }
{/ The surface hit point }
{/ The fraction of the input translation at collision }
{/ The number of iterations used }
{/ Did the cast hit? }

  Pb2CastOutput = ^Tb2CastOutput;
  Tb2CastOutput = record
      normal : Tb2Vec2;
      point : Tb2Vec2;
      fraction : single;
      iterations : longint;
      hit : Tbool;
    end;
{/ This holds the mass data computed for a shape. }
{/ The mass of the shape, usually in kilograms. }
{/ The position of the shape's centroid relative to the shape's origin. }
{/ The rotational inertia of the shape about the shape center. }

  Pb2MassData = ^Tb2MassData;
  Tb2MassData = record
      mass : single;
      center : Tb2Vec2;
      rotationalInertia : single;
    end;
{/ A solid circle }
{/ The local center }
{/ The radius }

  Pb2Circle = ^Tb2Circle;
  Tb2Circle = record
      center : Tb2Vec2;
      radius : single;
    end;
{/ A solid capsule can be viewed as two semicircles connected }
{/ by a rectangle. }
{/ Local center of the first semicircle }
{/ Local center of the second semicircle }
{/ The radius of the semicircles }

  Pb2Capsule = ^Tb2Capsule;
  Tb2Capsule = record
      center1 : Tb2Vec2;
      center2 : Tb2Vec2;
      radius : single;
    end;
{/ A solid convex polygon. It is assumed that the interior of the polygon is to }
{/ the left of each edge. }
{/ Polygons have a maximum number of vertices equal to B2_MAX_POLYGON_VERTICES. }
{/ In most cases you should not need many vertices for a convex polygon. }
{/ @warning DO NOT fill this out manually, instead use a helper function like }
{/ b2MakePolygon or b2MakeBox. }
{/ The polygon vertices }
{/ The outward normal vectors of the polygon sides }
{/ The centroid of the polygon }
{/ The external radius for rounded polygons }
{/ The number of polygon vertices }

  Pb2Polygon = ^Tb2Polygon;
  Tb2Polygon = record
      vertices : array[0..(B2_MAX_POLYGON_VERTICES)-1] of Tb2Vec2;
      normals : array[0..(B2_MAX_POLYGON_VERTICES)-1] of Tb2Vec2;
      centroid : Tb2Vec2;
      radius : single;
      count : longint;
    end;
{/ A line segment with two-sided collision. }
{/ The first point }
{/ The second point }

  Pb2Segment = ^Tb2Segment;
  Tb2Segment = record
      point1 : Tb2Vec2;
      point2 : Tb2Vec2;
    end;
{/ A line segment with one-sided collision. Only collides on the right side. }
{/ Several of these are generated for a chain shape. }
{/ ghost1 -> point1 -> point2 -> ghost2 }
{/ The tail ghost vertex }
{/ The line segment }
{/ The head ghost vertex }
{/ The owning chain shape index (internal usage only) }

  Pb2ChainSegment = ^Tb2ChainSegment;
  Tb2ChainSegment = record
      ghost1 : Tb2Vec2;
      segment : Tb2Segment;
      ghost2 : Tb2Vec2;
      chainId : longint;
    end;
{/ Validate ray cast input data (NaN, etc) }

function b2IsValidRay(input:Pb2RayCastInput):Tbool;cdecl;external libbox2d;
{/ Make a convex polygon from a convex hull. This will assert if the hull is not valid. }
{/ @warning Do not manually fill in the hull data, it must come directly from b2ComputeHull }
function b2MakePolygon(hull:Pb2Hull; radius:single):Tb2Polygon;cdecl;external libbox2d;
{/ Make an offset convex polygon from a convex hull. This will assert if the hull is not valid. }
{/ @warning Do not manually fill in the hull data, it must come directly from b2ComputeHull }
function b2MakeOffsetPolygon(hull:Pb2Hull; position:Tb2Vec2; rotation:Tb2Rot):Tb2Polygon;cdecl;external libbox2d;
{/ Make an offset convex polygon from a convex hull. This will assert if the hull is not valid. }
{/ @warning Do not manually fill in the hull data, it must come directly from b2ComputeHull }
function b2MakeOffsetRoundedPolygon(hull:Pb2Hull; position:Tb2Vec2; rotation:Tb2Rot; radius:single):Tb2Polygon;cdecl;external libbox2d;
{/ Make a square polygon, bypassing the need for a convex hull. }
{/ @param halfWidth the half-width }
function b2MakeSquare(halfWidth:single):Tb2Polygon;cdecl;external libbox2d;
{/ Make a box (rectangle) polygon, bypassing the need for a convex hull. }
{/ @param halfWidth the half-width (x-axis) }
{/ @param halfHeight the half-height (y-axis) }
function b2MakeBox(halfWidth:single; halfHeight:single):Tb2Polygon;cdecl;external libbox2d;
{/ Make a rounded box, bypassing the need for a convex hull. }
{/ @param halfWidth the half-width (x-axis) }
{/ @param halfHeight the half-height (y-axis) }
{/ @param radius the radius of the rounded extension }
function b2MakeRoundedBox(halfWidth:single; halfHeight:single; radius:single):Tb2Polygon;cdecl;external libbox2d;
{/ Make an offset box, bypassing the need for a convex hull. }
{/ @param halfWidth the half-width (x-axis) }
{/ @param halfHeight the half-height (y-axis) }
{/ @param center the local center of the box }
{/ @param rotation the local rotation of the box }
function b2MakeOffsetBox(halfWidth:single; halfHeight:single; center:Tb2Vec2; rotation:Tb2Rot):Tb2Polygon;cdecl;external libbox2d;
{/ Make an offset rounded box, bypassing the need for a convex hull. }
{/ @param halfWidth the half-width (x-axis) }
{/ @param halfHeight the half-height (y-axis) }
{/ @param center the local center of the box }
{/ @param rotation the local rotation of the box }
{/ @param radius the radius of the rounded extension }
function b2MakeOffsetRoundedBox(halfWidth:single; halfHeight:single; center:Tb2Vec2; rotation:Tb2Rot; radius:single):Tb2Polygon;cdecl;external libbox2d;
{/ Transform a polygon. This is useful for transferring a shape from one body to another. }
function b2TransformPolygon(transform:Tb2Transform; polygon:Pb2Polygon):Tb2Polygon;cdecl;external libbox2d;
{/ Compute mass properties of a circle }
function b2ComputeCircleMass(shape:Pb2Circle; density:single):Tb2MassData;cdecl;external libbox2d;
{/ Compute mass properties of a capsule }
function b2ComputeCapsuleMass(shape:Pb2Capsule; density:single):Tb2MassData;cdecl;external libbox2d;
{/ Compute mass properties of a polygon }
function b2ComputePolygonMass(shape:Pb2Polygon; density:single):Tb2MassData;cdecl;external libbox2d;
{/ Compute the bounding box of a transformed circle }
function b2ComputeCircleAABB(shape:Pb2Circle; transform:Tb2Transform):Tb2AABB;cdecl;external libbox2d;
{/ Compute the bounding box of a transformed capsule }
function b2ComputeCapsuleAABB(shape:Pb2Capsule; transform:Tb2Transform):Tb2AABB;cdecl;external libbox2d;
{/ Compute the bounding box of a transformed polygon }
function b2ComputePolygonAABB(shape:Pb2Polygon; transform:Tb2Transform):Tb2AABB;cdecl;external libbox2d;
{/ Compute the bounding box of a transformed line segment }
function b2ComputeSegmentAABB(shape:Pb2Segment; transform:Tb2Transform):Tb2AABB;cdecl;external libbox2d;
{/ Test a point for overlap with a circle in local space }
function b2PointInCircle(shape:Pb2Circle; point:Tb2Vec2):Tbool;cdecl;external libbox2d;
{/ Test a point for overlap with a capsule in local space }
function b2PointInCapsule(shape:Pb2Capsule; point:Tb2Vec2):Tbool;cdecl;external libbox2d;
{/ Test a point for overlap with a convex polygon in local space }
function b2PointInPolygon(shape:Pb2Polygon; point:Tb2Vec2):Tbool;cdecl;external libbox2d;
{/ Ray cast versus circle shape in local space. }
function b2RayCastCircle(shape:Pb2Circle; input:Pb2RayCastInput):Tb2CastOutput;cdecl;external libbox2d;
{/ Ray cast versus capsule shape in local space. }
function b2RayCastCapsule(shape:Pb2Capsule; input:Pb2RayCastInput):Tb2CastOutput;cdecl;external libbox2d;
{/ Ray cast versus segment shape in local space. Optionally treat the segment as one-sided with hits from }
{/ the left side being treated as a miss. }
function b2RayCastSegment(shape:Pb2Segment; input:Pb2RayCastInput; oneSided:Tbool):Tb2CastOutput;cdecl;external libbox2d;
{/ Ray cast versus polygon shape in local space. }
function b2RayCastPolygon(shape:Pb2Polygon; input:Pb2RayCastInput):Tb2CastOutput;cdecl;external libbox2d;
{/ Shape cast versus a circle. }
function b2ShapeCastCircle(shape:Pb2Circle; input:Pb2ShapeCastInput):Tb2CastOutput;cdecl;external libbox2d;
{/ Shape cast versus a capsule. }
function b2ShapeCastCapsule(shape:Pb2Capsule; input:Pb2ShapeCastInput):Tb2CastOutput;cdecl;external libbox2d;
{/ Shape cast versus a line segment. }
function b2ShapeCastSegment(shape:Pb2Segment; input:Pb2ShapeCastInput):Tb2CastOutput;cdecl;external libbox2d;
{/ Shape cast versus a convex polygon. }
function b2ShapeCastPolygon(shape:Pb2Polygon; input:Pb2ShapeCastInput):Tb2CastOutput;cdecl;external libbox2d;
{/ A convex hull. Used to create convex polygons. }
{/ @warning Do not modify these values directly, instead use b2ComputeHull() }
{/ The final points of the hull }
{/ The number of points }
type
  Pb2Hull = ^Tb2Hull;
  Tb2Hull = record
      points : array[0..(B2_MAX_POLYGON_VERTICES)-1] of Tb2Vec2;
      count : longint;
    end;
{/ Compute the convex hull of a set of points. Returns an empty hull if it fails. }
{/ Some failure cases: }
{/ - all points very close together }
{/ - all points on a line }
{/ - less than 3 points }
{/ - more than B2_MAX_POLYGON_VERTICES points }
{/ This welds close points and removes collinear points. }
{/ @warning Do not modify a hull once it has been computed }

function b2ComputeHull(points:Pb2Vec2; count:longint):Tb2Hull;cdecl;external libbox2d;
{/ This determines if a hull is valid. Checks for: }
{/ - convexity }
{/ - collinear points }
{/ This is expensive and should not be called at runtime. }
function b2ValidateHull(hull:Pb2Hull):Tbool;cdecl;external libbox2d;
{*@ }
{*
 * @defgroup distance Distance
 * Functions for computing the distance between shapes.
 *
 * These are advanced functions you can use to perform distance calculations. There
 * are functions for computing the closest points between shapes, doing linear shape casts,
 * and doing rotational shape casts. The latter is called time of impact (TOI).
 * @
  }
{/ Result of computing the distance between two line segments }
{/ The closest point on the first segment }
{/ The closest point on the second segment }
{/ The barycentric coordinate on the first segment }
{/ The barycentric coordinate on the second segment }
{/ The squared distance between the closest points }
type
  Pb2SegmentDistanceResult = ^Tb2SegmentDistanceResult;
  Tb2SegmentDistanceResult = record
      closest1 : Tb2Vec2;
      closest2 : Tb2Vec2;
      fraction1 : single;
      fraction2 : single;
      distanceSquared : single;
    end;
{/ Compute the distance between two line segments, clamping at the end points if needed. }

function b2SegmentDistance(p1:Tb2Vec2; q1:Tb2Vec2; p2:Tb2Vec2; q2:Tb2Vec2):Tb2SegmentDistanceResult;cdecl;external libbox2d;
{/ Used to warm start the GJK simplex. If you call this function multiple times with nearby }
{/ transforms this might improve performance. Otherwise you can zero initialize this. }
{/ The distance cache must be initialized to zero on the first call. }
{/ Users should generally just zero initialize this structure for each call. }
{/ The number of stored simplex points }
{/ The cached simplex indices on shape A }
{/ The cached simplex indices on shape B }
type
  Pb2SimplexCache = ^Tb2SimplexCache;
  Tb2SimplexCache = record
      count : Tuint16_t;
      indexA : array[0..2] of Tuint8_t;
      indexB : array[0..2] of Tuint8_t;
    end;
{ xxxxxxxxxxx static const b2SimplexCache b2_emptySimplexCache = B2_ZERO_INIT; }
{/ Input for b2ShapeDistance }
{/ The proxy for shape A }
{/ The proxy for shape B }
{/ The world transform for shape A }
{/ The world transform for shape B }
{/ Should the proxy radius be considered? }

  Pb2DistanceInput = ^Tb2DistanceInput;
  Tb2DistanceInput = record
      proxyA : Tb2ShapeProxy;
      proxyB : Tb2ShapeProxy;
      transformA : Tb2Transform;
      transformB : Tb2Transform;
      useRadii : Tbool;
    end;
{/ Output for b2ShapeDistance }
{/< Closest point on shapeA }
{/< Closest point on shapeB }
{/< Normal vector that points from A to B. Invalid if distance is zero. }
{/< The final distance, zero if overlapped }
{/< Number of GJK iterations used }
{/< The number of simplexes stored in the simplex array }

  Pb2DistanceOutput = ^Tb2DistanceOutput;
  Tb2DistanceOutput = record
      pointA : Tb2Vec2;
      pointB : Tb2Vec2;
      normal : Tb2Vec2;
      distance : single;
      iterations : longint;
      simplexCount : longint;
    end;
{/ Simplex vertex for debugging the GJK algorithm }
{/< support point in proxyA }
{/< support point in proxyB }
{/< wB - wA }
{/< barycentric coordinate for closest point }
{/< wA index }
{/< wB index }

  Pb2SimplexVertex = ^Tb2SimplexVertex;
  Tb2SimplexVertex = record
      wA : Tb2Vec2;
      wB : Tb2Vec2;
      w : Tb2Vec2;
      a : single;
      indexA : longint;
      indexB : longint;
    end;
{/ Simplex from the GJK algorithm }
{/< vertices }
{/< number of valid vertices }

  Pb2Simplex = ^Tb2Simplex;
  Tb2Simplex = record
      v1 : Tb2SimplexVertex;
      v2 : Tb2SimplexVertex;
      v3 : Tb2SimplexVertex;
      count : longint;
    end;
{/ Compute the closest points between two shapes represented as point clouds. }
{/ b2SimplexCache cache is input/output. On the first call set b2SimplexCache.count to zero. }
{/ The underlying GJK algorithm may be debugged by passing in debug simplexes and capacity. You may pass in NULL and 0 for these. }

function b2ShapeDistance(input:Pb2DistanceInput; cache:Pb2SimplexCache; simplexes:Pb2Simplex; simplexCapacity:longint):Tb2DistanceOutput;cdecl;external libbox2d;
{/ Input parameters for b2ShapeCast }
{/< The proxy for shape A }
{/< The proxy for shape B }
{/< The world transform for shape A }
{/< The world transform for shape B }
{/< The translation of shape B }
{/< The fraction of the translation to consider, typically 1 }
{/< Allows shapes with a radius to move slightly closer if already touching }
type
  Pb2ShapeCastPairInput = ^Tb2ShapeCastPairInput;
  Tb2ShapeCastPairInput = record
      proxyA : Tb2ShapeProxy;
      proxyB : Tb2ShapeProxy;
      transformA : Tb2Transform;
      transformB : Tb2Transform;
      translationB : Tb2Vec2;
      maxFraction : single;
      canEncroach : Tbool;
    end;
{/ Perform a linear shape cast of shape B moving and shape A fixed. Determines the hit point, normal, and translation fraction. }
{/ Initially touching shapes are treated as a miss. }

function b2ShapeCast(input:Pb2ShapeCastPairInput):Tb2CastOutput;cdecl;external libbox2d;
{/ Make a proxy for use in overlap, shape cast, and related functions. This is a deep copy of the points. }
function b2MakeProxy(points:Pb2Vec2; count:longint; radius:single):Tb2ShapeProxy;cdecl;external libbox2d;
{/ Make a proxy with a transform. This is a deep copy of the points. }
function b2MakeOffsetProxy(points:Pb2Vec2; count:longint; radius:single; position:Tb2Vec2; rotation:Tb2Rot):Tb2ShapeProxy;cdecl;external libbox2d;
{/ This describes the motion of a body/shape for TOI computation. Shapes are defined with respect to the body origin, }
{/ which may not coincide with the center of mass. However, to support dynamics we must interpolate the center of mass }
{/ position. }
{/< Local center of mass position }
{/< Starting center of mass world position }
{/< Ending center of mass world position }
{/< Starting world rotation }
{/< Ending world rotation }
type
  Pb2Sweep = ^Tb2Sweep;
  Tb2Sweep = record
      localCenter : Tb2Vec2;
      c1 : Tb2Vec2;
      c2 : Tb2Vec2;
      q1 : Tb2Rot;
      q2 : Tb2Rot;
    end;
{/ Evaluate the transform sweep at a specific time. }

function b2GetSweepTransform(sweep:Pb2Sweep; time:single):Tb2Transform;cdecl;external libbox2d;
{/ Time of impact input }
{/< The proxy for shape A }
{/< The proxy for shape B }
{/< The movement of shape A }
{/< The movement of shape B }
{/< Defines the sweep interval [0, maxFraction] }
type
  Pb2TOIInput = ^Tb2TOIInput;
  Tb2TOIInput = record
      proxyA : Tb2ShapeProxy;
      proxyB : Tb2ShapeProxy;
      sweepA : Tb2Sweep;
      sweepB : Tb2Sweep;
      maxFraction : single;
    end;
{/ Describes the TOI output }

  Pb2TOIState = ^Tb2TOIState;
  Tb2TOIState =  Longint;
  Const
    b2_toiStateUnknown = 0;
    b2_toiStateFailed = 1;
    b2_toiStateOverlapped = 2;
    b2_toiStateHit = 3;
    b2_toiStateSeparated = 4;
;
{/ Time of impact output }
{/ The type of result }
{/ The hit point }
{/ The hit normal }
{/ The sweep time of the collision  }
type
  Pb2TOIOutput = ^Tb2TOIOutput;
  Tb2TOIOutput = record
      state : Tb2TOIState;
      point : Tb2Vec2;
      normal : Tb2Vec2;
      fraction : single;
    end;
{/ Compute the upper bound on time before two shapes penetrate. Time is represented as }
{/ a fraction between [0,tMax]. This uses a swept separating axis and may miss some intermediate, }
{/ non-tunneling collisions. If you change the time interval, you should call this function }
{/ again. }

function b2TimeOfImpact(input:Pb2TOIInput):Tb2TOIOutput;cdecl;external libbox2d;
{*@ }
{*
 * @defgroup collision Collision
 * @brief Functions for colliding pairs of shapes
 * @
  }
{/ A manifold point is a contact point belonging to a contact manifold. }
{/ It holds details related to the geometry and dynamics of the contact points. }
{/ Box2D uses speculative collision so some contact points may be separated. }
{/ You may use the totalNormalImpulse to determine if there was an interaction during }
{/ the time step. }
{/ Location of the contact point in world space. Subject to precision loss at large coordinates. }
{/ @note Should only be used for debugging. }
{/ Location of the contact point relative to shapeA's origin in world space }
{/ @note When used internally to the Box2D solver, this is relative to the body center of mass. }
{/ Location of the contact point relative to shapeB's origin in world space }
{/ @note When used internally to the Box2D solver, this is relative to the body center of mass. }
{/ The separation of the contact point, negative if penetrating }
{/ The impulse along the manifold normal vector. }
{/ The friction impulse }
{/ The total normal impulse applied across sub-stepping and restitution. This is important }
{/ to identify speculative contact points that had an interaction in the time step. }
{/ This includes the warm starting impulse, the sub-step delta impulse, and the restitution }
{/ impulse. }
{/ Relative normal velocity pre-solve. Used for hit events. If the normal impulse is }
{/ zero then there was no hit. Negative means shapes are approaching. }
{/ Uniquely identifies a contact point between two shapes }
{/ Did this contact point exist the previous step? }
type
  Pb2ManifoldPoint = ^Tb2ManifoldPoint;
  Tb2ManifoldPoint = record
      point : Tb2Vec2;
      anchorA : Tb2Vec2;
      anchorB : Tb2Vec2;
      separation : single;
      normalImpulse : single;
      tangentImpulse : single;
      totalNormalImpulse : single;
      normalVelocity : single;
      id : Tuint16_t;
      persisted : Tbool;
    end;
{/ A contact manifold describes the contact points between colliding shapes. }
{/ @note Box2D uses speculative collision so some contact points may be separated. }
{/ The unit normal vector in world space, points from shape A to bodyB }
{/ Angular impulse applied for rolling resistance. N * m * s = kg * m^2 / s }
{/ The manifold points, up to two are possible in 2D }
{/ The number of contacts points, will be 0, 1, or 2 }

  Pb2Manifold = ^Tb2Manifold;
  Tb2Manifold = record
      normal : Tb2Vec2;
      rollingImpulse : single;
      points : array[0..1] of Tb2ManifoldPoint;
      pointCount : longint;
    end;
{/ Compute the contact manifold between two circles }

function b2CollideCircles(circleA:Pb2Circle; xfA:Tb2Transform; circleB:Pb2Circle; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between a capsule and circle }
function b2CollideCapsuleAndCircle(capsuleA:Pb2Capsule; xfA:Tb2Transform; circleB:Pb2Circle; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between an segment and a circle }
function b2CollideSegmentAndCircle(segmentA:Pb2Segment; xfA:Tb2Transform; circleB:Pb2Circle; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between a polygon and a circle }
function b2CollidePolygonAndCircle(polygonA:Pb2Polygon; xfA:Tb2Transform; circleB:Pb2Circle; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between a capsule and circle }
function b2CollideCapsules(capsuleA:Pb2Capsule; xfA:Tb2Transform; capsuleB:Pb2Capsule; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between an segment and a capsule }
function b2CollideSegmentAndCapsule(segmentA:Pb2Segment; xfA:Tb2Transform; capsuleB:Pb2Capsule; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between a polygon and capsule }
function b2CollidePolygonAndCapsule(polygonA:Pb2Polygon; xfA:Tb2Transform; capsuleB:Pb2Capsule; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between two polygons }
function b2CollidePolygons(polygonA:Pb2Polygon; xfA:Tb2Transform; polygonB:Pb2Polygon; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between an segment and a polygon }
function b2CollideSegmentAndPolygon(segmentA:Pb2Segment; xfA:Tb2Transform; polygonB:Pb2Polygon; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between a chain segment and a circle }
function b2CollideChainSegmentAndCircle(segmentA:Pb2ChainSegment; xfA:Tb2Transform; circleB:Pb2Circle; xfB:Tb2Transform):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between a chain segment and a capsule }
function b2CollideChainSegmentAndCapsule(segmentA:Pb2ChainSegment; xfA:Tb2Transform; capsuleB:Pb2Capsule; xfB:Tb2Transform; cache:Pb2SimplexCache):Tb2Manifold;cdecl;external libbox2d;
{/ Compute the contact manifold between a chain segment and a rounded polygon }
function b2CollideChainSegmentAndPolygon(segmentA:Pb2ChainSegment; xfA:Tb2Transform; polygonB:Pb2Polygon; xfB:Tb2Transform; cache:Pb2SimplexCache):Tb2Manifold;cdecl;external libbox2d;
{*@ }
{*
 * @defgroup tree Dynamic Tree
 * The dynamic tree is a binary AABB tree to organize and query large numbers of geometric objects
 *
 * Box2D uses the dynamic tree internally to sort collision shapes into a binary bounding volume hierarchy.
 * This data structure may have uses in games for organizing other geometry data and may be used independently
 * of Box2D rigid body simulation.
 *
 * A dynamic AABB tree broad-phase, inspired by Nathanael Presson's btDbvt.
 * A dynamic tree arranges data in a binary tree to accelerate
 * queries such as AABB queries and ray casts. Leaf nodes are proxies
 * with an AABB. These are used to hold a user collision object.
 * Nodes are pooled and relocatable, so I use node indices rather than pointers.
 * The dynamic tree is made available for advanced users that would like to use it to organize
 * spatial game data besides rigid bodies.
 * @
  }
{/ The dynamic tree structure. This should be considered private data. }
{/ It is placed here for performance reasons. }
{/ The tree nodes }
{/ The root index }
{/ The number of nodes }
{/ The allocated node space }
{/ Node free list }
{/ Number of proxies created }
{/ Leaf indices for rebuild }
{/ Leaf bounding boxes for rebuild }
{/ Leaf bounding box centers for rebuild }
{/ Bins for sorting during rebuild }
{/ Allocated space for rebuilding }
type
  Pb2DynamicTree = ^Tb2DynamicTree;
  Tb2DynamicTree = record
      nodes : Pb2TreeNode;
      root : longint;
      nodeCount : longint;
      nodeCapacity : longint;
      freeList : longint;
      proxyCount : longint;
      leafIndices : Plongint;
      leafBoxes : Pb2AABB;
      leafCenters : Pb2Vec2;
      binIndices : Plongint;
      rebuildCapacity : longint;
    end;
{/ These are performance results returned by dynamic tree queries. }
{/ Number of internal nodes visited during the query }
{/ Number of leaf nodes visited during the query }

  Pb2TreeStats = ^Tb2TreeStats;
  Tb2TreeStats = record
      nodeVisits : longint;
      leafVisits : longint;
    end;
{/ Constructing the tree initializes the node pool. }

function b2DynamicTree_Create:Tb2DynamicTree;cdecl;external libbox2d;
{/ Destroy the tree, freeing the node pool. }
procedure b2DynamicTree_Destroy(tree:Pb2DynamicTree);cdecl;external libbox2d;
{/ Create a proxy. Provide an AABB and a userData value. }
function b2DynamicTree_CreateProxy(tree:Pb2DynamicTree; aabb:Tb2AABB; categoryBits:Tuint64_t; userData:Tuint64_t):longint;cdecl;external libbox2d;
{/ Destroy a proxy. This asserts if the id is invalid. }
procedure b2DynamicTree_DestroyProxy(tree:Pb2DynamicTree; proxyId:longint);cdecl;external libbox2d;
{/ Move a proxy to a new AABB by removing and reinserting into the tree. }
procedure b2DynamicTree_MoveProxy(tree:Pb2DynamicTree; proxyId:longint; aabb:Tb2AABB);cdecl;external libbox2d;
{/ Enlarge a proxy and enlarge ancestors as necessary. }
procedure b2DynamicTree_EnlargeProxy(tree:Pb2DynamicTree; proxyId:longint; aabb:Tb2AABB);cdecl;external libbox2d;
{/ Modify the category bits on a proxy. This is an expensive operation. }
procedure b2DynamicTree_SetCategoryBits(tree:Pb2DynamicTree; proxyId:longint; categoryBits:Tuint64_t);cdecl;external libbox2d;
{/ Get the category bits on a proxy. }
function b2DynamicTree_GetCategoryBits(tree:Pb2DynamicTree; proxyId:longint):Tuint64_t;cdecl;external libbox2d;
{/ This function receives proxies found in the AABB query. }
{/ @return true if the query should continue }
type

  Tb2TreeQueryCallbackFcn = function (proxyId:longint; userData:Tuint64_t; context:pointer):Tbool;cdecl;
{/ Query an AABB for overlapping proxies. The callback class is called for each proxy that overlaps the supplied AABB. }
{/	@return performance data }

function b2DynamicTree_Query(tree:Pb2DynamicTree; aabb:Tb2AABB; maskBits:Tuint64_t; callback:Pb2TreeQueryCallbackFcn; context:pointer):Tb2TreeStats;cdecl;external libbox2d;
{/ Query an AABB for overlapping proxies. The callback class is called for each proxy that overlaps the supplied AABB. }
{/ No filtering is performed. }
{/	@return performance data }
function b2DynamicTree_QueryAll(tree:Pb2DynamicTree; aabb:Tb2AABB; callback:Pb2TreeQueryCallbackFcn; context:pointer):Tb2TreeStats;cdecl;external libbox2d;
{/ This function receives clipped ray cast input for a proxy. The function }
{/ returns the new ray fraction. }
{/ - return a value of 0 to terminate the ray cast }
{/ - return a value less than input->maxFraction to clip the ray }
{/ - return a value of input->maxFraction to continue the ray cast without clipping }
type

  Tb2TreeRayCastCallbackFcn = function (input:Pb2RayCastInput; proxyId:longint; userData:Tuint64_t; context:pointer):single;cdecl;
{/ Ray cast against the proxies in the tree. This relies on the callback }
{/ to perform a exact ray cast in the case were the proxy contains a shape. }
{/ The callback also performs the any collision filtering. This has performance }
{/ roughly equal to k * log(n), where k is the number of collisions and n is the }
{/ number of proxies in the tree. }
{/ Bit-wise filtering using mask bits can greatly improve performance in some scenarios. }
{/	However, this filtering may be approximate, so the user should still apply filtering to results. }
{/ @param tree the dynamic tree to ray cast }
{/ @param input the ray cast input data. The ray extends from p1 to p1 + maxFraction * (p2 - p1) }
{/ @param maskBits mask bit hint: `bool accept = (maskBits & node->categoryBits) != 0;` }
{/ @param callback a callback class that is called for each proxy that is hit by the ray }
{/ @param context user context that is passed to the callback }
{/	@return performance data }

function b2DynamicTree_RayCast(tree:Pb2DynamicTree; input:Pb2RayCastInput; maskBits:Tuint64_t; callback:Pb2TreeRayCastCallbackFcn; context:pointer):Tb2TreeStats;cdecl;external libbox2d;
{/ This function receives clipped ray cast input for a proxy. The function }
{/ returns the new ray fraction. }
{/ - return a value of 0 to terminate the ray cast }
{/ - return a value less than input->maxFraction to clip the ray }
{/ - return a value of input->maxFraction to continue the ray cast without clipping }
type

  Tb2TreeShapeCastCallbackFcn = function (input:Pb2ShapeCastInput; proxyId:longint; userData:Tuint64_t; context:pointer):single;cdecl;
{/ Ray cast against the proxies in the tree. This relies on the callback }
{/ to perform a exact ray cast in the case were the proxy contains a shape. }
{/ The callback also performs the any collision filtering. This has performance }
{/ roughly equal to k * log(n), where k is the number of collisions and n is the }
{/ number of proxies in the tree. }
{/ @param tree the dynamic tree to ray cast }
{/ @param input the ray cast input data. The ray extends from p1 to p1 + maxFraction * (p2 - p1). }
{/ @param maskBits filter bits: `bool accept = (maskBits & node->categoryBits) != 0;` }
{/ @param callback a callback class that is called for each proxy that is hit by the shape }
{/ @param context user context that is passed to the callback }
{/	@return performance data }

function b2DynamicTree_ShapeCast(tree:Pb2DynamicTree; input:Pb2ShapeCastInput; maskBits:Tuint64_t; callback:Pb2TreeShapeCastCallbackFcn; context:pointer):Tb2TreeStats;cdecl;external libbox2d;
{/ Get the height of the binary tree. }
function b2DynamicTree_GetHeight(tree:Pb2DynamicTree):longint;cdecl;external libbox2d;
{/ Get the ratio of the sum of the node areas to the root area. }
function b2DynamicTree_GetAreaRatio(tree:Pb2DynamicTree):single;cdecl;external libbox2d;
{/ Get the bounding box that contains the entire tree }
function b2DynamicTree_GetRootBounds(tree:Pb2DynamicTree):Tb2AABB;cdecl;external libbox2d;
{/ Get the number of proxies created }
function b2DynamicTree_GetProxyCount(tree:Pb2DynamicTree):longint;cdecl;external libbox2d;
{/ Rebuild the tree while retaining subtrees that haven't changed. Returns the number of boxes sorted. }
function b2DynamicTree_Rebuild(tree:Pb2DynamicTree; fullBuild:Tbool):longint;cdecl;external libbox2d;
{/ Get the number of bytes used by this tree }
function b2DynamicTree_GetByteCount(tree:Pb2DynamicTree):longint;cdecl;external libbox2d;
{/ Get proxy user data }
function b2DynamicTree_GetUserData(tree:Pb2DynamicTree; proxyId:longint):Tuint64_t;cdecl;external libbox2d;
{/ Get the AABB of a proxy }
function b2DynamicTree_GetAABB(tree:Pb2DynamicTree; proxyId:longint):Tb2AABB;cdecl;external libbox2d;
{/ Validate this tree. For testing. }
procedure b2DynamicTree_Validate(tree:Pb2DynamicTree);cdecl;external libbox2d;
{/ Validate this tree has no enlarged AABBs. For testing. }
procedure b2DynamicTree_ValidateNoEnlarged(tree:Pb2DynamicTree);cdecl;external libbox2d;
{*@ }
{*
 * @defgroup character Character mover
 * Character movement solver
 * @
  }
{/ These are the collision planes returned from b2World_CollideMover }
{/ The collision plane between the mover and a convex shape }
{ The collision point on the shape. }
{/ Did the collision register a hit? If not this plane should be ignored. }
type
  Pb2PlaneResult = ^Tb2PlaneResult;
  Tb2PlaneResult = record
      plane : Tb2Plane;
      point : Tb2Vec2;
      hit : Tbool;
    end;
{/ These are collision planes that can be fed to b2SolvePlanes. Normally }
{/ this is assembled by the user from plane results in b2PlaneResult }
{/ The collision plane between the mover and some shape }
{/ Setting this to FLT_MAX makes the plane as rigid as possible. Lower values can }
{/ make the plane collision soft. Usually in meters. }
{/ The push on the mover determined by b2SolvePlanes. Usually in meters. }
{/ Indicates if b2ClipVector should clip against this plane. Should be false for soft collision. }

  Pb2CollisionPlane = ^Tb2CollisionPlane;
  Tb2CollisionPlane = record
      plane : Tb2Plane;
      pushLimit : single;
      push : single;
      clipVelocity : Tbool;
    end;
{/ Result returned by b2SolvePlanes }
{/ The translation of the mover }
{/ The number of iterations used by the plane solver. For diagnostics. }

  Pb2PlaneSolverResult = ^Tb2PlaneSolverResult;
  Tb2PlaneSolverResult = record
      translation : Tb2Vec2;
      iterationCount : longint;
    end;
{/ Solves the position of a mover that satisfies the given collision planes. }
{/ @param targetDelta the desired movement from the position used to generate the collision planes }
{/ @param planes the collision planes }
{/ @param count the number of collision planes }

function b2SolvePlanes(targetDelta:Tb2Vec2; planes:Pb2CollisionPlane; count:longint):Tb2PlaneSolverResult;cdecl;external libbox2d;
{/ Clips the velocity against the given collision planes. Planes with zero push or clipVelocity }
{/ set to false are skipped. }
function b2ClipVector(vector:Tb2Vec2; planes:Pb2CollisionPlane; count:longint):Tb2Vec2;cdecl;external libbox2d;
{*@ }

// === Konventiert am: 7-3-26 16:28:31 ===


implementation



end.
