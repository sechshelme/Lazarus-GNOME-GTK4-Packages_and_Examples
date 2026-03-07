
unit box2d;
interface

{
  Automatically converted by H2Pas 1.0.0 from box2d.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    box2d.h
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
Pb2BodyDef  = ^b2BodyDef;
Pb2Capsule  = ^b2Capsule;
Pb2CastResultFcn  = ^b2CastResultFcn;
Pb2ChainDef  = ^b2ChainDef;
Pb2Circle  = ^b2Circle;
Pb2ContactData  = ^b2ContactData;
Pb2CustomFilterFcn  = ^b2CustomFilterFcn;
Pb2DebugDraw  = ^b2DebugDraw;
Pb2DistanceJointDef  = ^b2DistanceJointDef;
Pb2ExplosionDef  = ^b2ExplosionDef;
Pb2FilterJointDef  = ^b2FilterJointDef;
Pb2FrictionCallback  = ^b2FrictionCallback;
Pb2JointId  = ^b2JointId;
Pb2MotorJointDef  = ^b2MotorJointDef;
Pb2OverlapResultFcn  = ^b2OverlapResultFcn;
Pb2PlaneResultFcn  = ^b2PlaneResultFcn;
Pb2Polygon  = ^b2Polygon;
Pb2PreSolveFcn  = ^b2PreSolveFcn;
Pb2PrismaticJointDef  = ^b2PrismaticJointDef;
Pb2RayCastInput  = ^b2RayCastInput;
Pb2RestitutionCallback  = ^b2RestitutionCallback;
Pb2RevoluteJointDef  = ^b2RevoluteJointDef;
Pb2Segment  = ^b2Segment;
Pb2ShapeDef  = ^b2ShapeDef;
Pb2ShapeId  = ^b2ShapeId;
Pb2ShapeProxy  = ^b2ShapeProxy;
Pb2SurfaceMaterial  = ^b2SurfaceMaterial;
Pb2WeldJointDef  = ^b2WeldJointDef;
Pb2WheelJointDef  = ^b2WheelJointDef;
Pb2WorldDef  = ^b2WorldDef;
Pchar  = ^char;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-FileCopyrightText: 2023 Erin Catto }
{ SPDX-License-Identifier: MIT }
(** unsupported pragma#pragma once*)
{$include "base.h"}
{$include "collision.h"}
{$include "id.h"}
{$include "types.h"}
{$include <stdbool.h>}
{*
 * @defgroup world World
 * These functions allow you to create a simulation world.
 *
 * You can add rigid bodies and joint constraints to the world and run the simulation. You can get contact
 * information to get contact points and normals as well as events. You can query to world, checking for overlaps and casting rays
 * or shapes. There is also debugging information such as debug draw, timing information, and counters. You can find documentation
 * here: https://box2d.org/
 * @
  }
{/ Create a world for rigid body simulation. A world contains bodies, shapes, and constraints. You make create }
{/ up to 128 worlds. Each world is completely independent and may be simulated in parallel. }
{/ @return the world id. }
(* Const before type ignored *)

function b2CreateWorld(def:Pb2WorldDef):Tb2WorldId;cdecl;external;
{/ Destroy a world }
procedure b2DestroyWorld(worldId:Tb2WorldId);cdecl;external;
{/ World id validation. Provides validation for up to 64K allocations. }
function b2World_IsValid(id:Tb2WorldId):Tbool;cdecl;external;
{/ Simulate a world for one time step. This performs collision detection, integration, and constraint solution. }
{/ @param worldId The world to simulate }
{/ @param timeStep The amount of time to simulate, this should be a fixed number. Usually 1/60. }
{/ @param subStepCount The number of sub-steps, increasing the sub-step count can increase accuracy. Usually 4. }
procedure b2World_Step(worldId:Tb2WorldId; timeStep:single; subStepCount:longint);cdecl;external;
{/ Call this to draw shapes and other debug draw data }
procedure b2World_Draw(worldId:Tb2WorldId; draw:Pb2DebugDraw);cdecl;external;
{/ Get the body events for the current time step. The event data is transient. Do not store a reference to this data. }
function b2World_GetBodyEvents(worldId:Tb2WorldId):Tb2BodyEvents;cdecl;external;
{/ Get sensor events for the current time step. The event data is transient. Do not store a reference to this data. }
function b2World_GetSensorEvents(worldId:Tb2WorldId):Tb2SensorEvents;cdecl;external;
{/ Get contact events for this current time step. The event data is transient. Do not store a reference to this data. }
function b2World_GetContactEvents(worldId:Tb2WorldId):Tb2ContactEvents;cdecl;external;
{/ Get the joint events for the current time step. The event data is transient. Do not store a reference to this data. }
function b2World_GetJointEvents(worldId:Tb2WorldId):Tb2JointEvents;cdecl;external;
{/ Overlap test for all shapes that *potentially* overlap the provided AABB }
function b2World_OverlapAABB(worldId:Tb2WorldId; aabb:Tb2AABB; filter:Tb2QueryFilter; fcn:Pb2OverlapResultFcn; context:pointer):Tb2TreeStats;cdecl;external;
{/ Overlap test for all shapes that overlap the provided shape proxy. }
(* Const before type ignored *)
function b2World_OverlapShape(worldId:Tb2WorldId; proxy:Pb2ShapeProxy; filter:Tb2QueryFilter; fcn:Pb2OverlapResultFcn; context:pointer):Tb2TreeStats;cdecl;external;
{/ Cast a ray into the world to collect shapes in the path of the ray. }
{/ Your callback function controls whether you get the closest point, any point, or n-points. }
{/ @note The callback function may receive shapes in any order }
{/ @param worldId The world to cast the ray against }
{/ @param origin The start point of the ray }
{/ @param translation The translation of the ray from the start point to the end point }
{/ @param filter Contains bit flags to filter unwanted shapes from the results }
{/ @param fcn A user implemented callback function }
{/ @param context A user context that is passed along to the callback function }
{/	@return traversal performance counters }
function b2World_CastRay(worldId:Tb2WorldId; origin:Tb2Vec2; translation:Tb2Vec2; filter:Tb2QueryFilter; fcn:Pb2CastResultFcn; 
           context:pointer):Tb2TreeStats;cdecl;external;
{/ Cast a ray into the world to collect the closest hit. This is a convenience function. Ignores initial overlap. }
{/ This is less general than b2World_CastRay() and does not allow for custom filtering. }
function b2World_CastRayClosest(worldId:Tb2WorldId; origin:Tb2Vec2; translation:Tb2Vec2; filter:Tb2QueryFilter):Tb2RayResult;cdecl;external;
{/ Cast a shape through the world. Similar to a cast ray except that a shape is cast instead of a point. }
{/	@see b2World_CastRay }
(* Const before type ignored *)
function b2World_CastShape(worldId:Tb2WorldId; proxy:Pb2ShapeProxy; translation:Tb2Vec2; filter:Tb2QueryFilter; fcn:Pb2CastResultFcn; 
           context:pointer):Tb2TreeStats;cdecl;external;
{/ Cast a capsule mover through the world. This is a special shape cast that handles sliding along other shapes while reducing }
{/ clipping. }
(* Const before type ignored *)
function b2World_CastMover(worldId:Tb2WorldId; mover:Pb2Capsule; translation:Tb2Vec2; filter:Tb2QueryFilter):single;cdecl;external;
{/ Collide a capsule mover with the world, gathering collision planes that can be fed to b2SolvePlanes. Useful for }
{/ kinematic character movement. }
(* Const before type ignored *)
procedure b2World_CollideMover(worldId:Tb2WorldId; mover:Pb2Capsule; filter:Tb2QueryFilter; fcn:Pb2PlaneResultFcn; context:pointer);cdecl;external;
{/ Enable/disable sleep. If your application does not need sleeping, you can gain some performance }
{/ by disabling sleep completely at the world level. }
{/ @see b2WorldDef }
procedure b2World_EnableSleeping(worldId:Tb2WorldId; flag:Tbool);cdecl;external;
{/ Is body sleeping enabled? }
function b2World_IsSleepingEnabled(worldId:Tb2WorldId):Tbool;cdecl;external;
{/ Enable/disable continuous collision between dynamic and static bodies. Generally you should keep continuous }
{/ collision enabled to prevent fast moving objects from going through static objects. The performance gain from }
{/ disabling continuous collision is minor. }
{/ @see b2WorldDef }
procedure b2World_EnableContinuous(worldId:Tb2WorldId; flag:Tbool);cdecl;external;
{/ Is continuous collision enabled? }
function b2World_IsContinuousEnabled(worldId:Tb2WorldId):Tbool;cdecl;external;
{/ Adjust the restitution threshold. It is recommended not to make this value very small }
{/ because it will prevent bodies from sleeping. Usually in meters per second. }
{/ @see b2WorldDef }
procedure b2World_SetRestitutionThreshold(worldId:Tb2WorldId; value:single);cdecl;external;
{/ Get the the restitution speed threshold. Usually in meters per second. }
function b2World_GetRestitutionThreshold(worldId:Tb2WorldId):single;cdecl;external;
{/ Adjust the hit event threshold. This controls the collision speed needed to generate a b2ContactHitEvent. }
{/ Usually in meters per second. }
{/ @see b2WorldDef::hitEventThreshold }
procedure b2World_SetHitEventThreshold(worldId:Tb2WorldId; value:single);cdecl;external;
{/ Get the the hit event speed threshold. Usually in meters per second. }
function b2World_GetHitEventThreshold(worldId:Tb2WorldId):single;cdecl;external;
{/ Register the custom filter callback. This is optional. }
procedure b2World_SetCustomFilterCallback(worldId:Tb2WorldId; fcn:Pb2CustomFilterFcn; context:pointer);cdecl;external;
{/ Register the pre-solve callback. This is optional. }
procedure b2World_SetPreSolveCallback(worldId:Tb2WorldId; fcn:Pb2PreSolveFcn; context:pointer);cdecl;external;
{/ Set the gravity vector for the entire world. Box2D has no concept of an up direction and this }
{/ is left as a decision for the application. Usually in m/s^2. }
{/ @see b2WorldDef }
procedure b2World_SetGravity(worldId:Tb2WorldId; gravity:Tb2Vec2);cdecl;external;
{/ Get the gravity vector }
function b2World_GetGravity(worldId:Tb2WorldId):Tb2Vec2;cdecl;external;
{/ Apply a radial explosion }
{/ @param worldId The world id }
{/ @param explosionDef The explosion definition }
(* Const before type ignored *)
procedure b2World_Explode(worldId:Tb2WorldId; explosionDef:Pb2ExplosionDef);cdecl;external;
{/ Adjust contact tuning parameters }
{/ @param worldId The world id }
{/ @param hertz The contact stiffness (cycles per second) }
{/ @param dampingRatio The contact bounciness with 1 being critical damping (non-dimensional) }
{/ @param pushSpeed The maximum contact constraint push out speed (meters per second) }
{/ @note Advanced feature }
procedure b2World_SetContactTuning(worldId:Tb2WorldId; hertz:single; dampingRatio:single; pushSpeed:single);cdecl;external;
{/ Set the maximum linear speed. Usually in m/s. }
procedure b2World_SetMaximumLinearSpeed(worldId:Tb2WorldId; maximumLinearSpeed:single);cdecl;external;
{/ Get the maximum linear speed. Usually in m/s. }
function b2World_GetMaximumLinearSpeed(worldId:Tb2WorldId):single;cdecl;external;
{/ Enable/disable constraint warm starting. Advanced feature for testing. Disabling }
{/ warm starting greatly reduces stability and provides no performance gain. }
procedure b2World_EnableWarmStarting(worldId:Tb2WorldId; flag:Tbool);cdecl;external;
{/ Is constraint warm starting enabled? }
function b2World_IsWarmStartingEnabled(worldId:Tb2WorldId):Tbool;cdecl;external;
{/ Get the number of awake bodies. }
function b2World_GetAwakeBodyCount(worldId:Tb2WorldId):longint;cdecl;external;
{/ Get the current world performance profile }
function b2World_GetProfile(worldId:Tb2WorldId):Tb2Profile;cdecl;external;
{/ Get world counters and sizes }
function b2World_GetCounters(worldId:Tb2WorldId):Tb2Counters;cdecl;external;
{/ Set the user data pointer. }
procedure b2World_SetUserData(worldId:Tb2WorldId; userData:pointer);cdecl;external;
{/ Get the user data pointer. }
function b2World_GetUserData(worldId:Tb2WorldId):pointer;cdecl;external;
{/ Set the friction callback. Passing NULL resets to default. }
procedure b2World_SetFrictionCallback(worldId:Tb2WorldId; callback:Pb2FrictionCallback);cdecl;external;
{/ Set the restitution callback. Passing NULL resets to default. }
procedure b2World_SetRestitutionCallback(worldId:Tb2WorldId; callback:Pb2RestitutionCallback);cdecl;external;
{/ Dump memory stats to box2d_memory.txt }
procedure b2World_DumpMemoryStats(worldId:Tb2WorldId);cdecl;external;
{/ This is for internal testing }
procedure b2World_RebuildStaticTree(worldId:Tb2WorldId);cdecl;external;
{/ This is for internal testing }
procedure b2World_EnableSpeculative(worldId:Tb2WorldId; flag:Tbool);cdecl;external;
{* @  }
{*
 * @defgroup body Body
 * This is the body API.
 * @
  }
{/ Create a rigid body given a definition. No reference to the definition is retained. So you can create the definition }
{/ on the stack and pass it as a pointer. }
{/ @code.c }
{/ b2BodyDef bodyDef = b2DefaultBodyDef(); }
{/ b2BodyId myBodyId = b2CreateBody(myWorldId, &bodyDef); }
{/ @endcode }
{/ @warning This function is locked during callbacks. }
(* Const before type ignored *)
function b2CreateBody(worldId:Tb2WorldId; def:Pb2BodyDef):Tb2BodyId;cdecl;external;
{/ Destroy a rigid body given an id. This destroys all shapes and joints attached to the body. }
{/ Do not keep references to the associated shapes and joints. }
procedure b2DestroyBody(bodyId:Tb2BodyId);cdecl;external;
{/ Body identifier validation. A valid body exists in a world and is non-null. }
{/ This can be used to detect orphaned ids. Provides validation for up to 64K allocations. }
function b2Body_IsValid(id:Tb2BodyId):Tbool;cdecl;external;
{/ Get the body type: static, kinematic, or dynamic }
function b2Body_GetType(bodyId:Tb2BodyId):Tb2BodyType;cdecl;external;
{/ Change the body type. This is an expensive operation. This automatically updates the mass }
{/ properties regardless of the automatic mass setting. }
procedure b2Body_SetType(bodyId:Tb2BodyId; _type:Tb2BodyType);cdecl;external;
{/ Set the body name. Up to 31 characters excluding 0 termination. }
(* Const before type ignored *)
procedure b2Body_SetName(bodyId:Tb2BodyId; name:Pchar);cdecl;external;
{/ Get the body name. }
(* Const before type ignored *)
function b2Body_GetName(bodyId:Tb2BodyId):Pchar;cdecl;external;
{/ Set the user data for a body }
procedure b2Body_SetUserData(bodyId:Tb2BodyId; userData:pointer);cdecl;external;
{/ Get the user data stored in a body }
function b2Body_GetUserData(bodyId:Tb2BodyId):pointer;cdecl;external;
{/ Get the world position of a body. This is the location of the body origin. }
function b2Body_GetPosition(bodyId:Tb2BodyId):Tb2Vec2;cdecl;external;
{/ Get the world rotation of a body as a cosine/sine pair (complex number) }
function b2Body_GetRotation(bodyId:Tb2BodyId):Tb2Rot;cdecl;external;
{/ Get the world transform of a body. }
function b2Body_GetTransform(bodyId:Tb2BodyId):Tb2Transform;cdecl;external;
{/ Set the world transform of a body. This acts as a teleport and is fairly expensive. }
{/ @note Generally you should create a body with then intended transform. }
{/ @see b2BodyDef::position and b2BodyDef::rotation }
procedure b2Body_SetTransform(bodyId:Tb2BodyId; position:Tb2Vec2; rotation:Tb2Rot);cdecl;external;
{/ Get a local point on a body given a world point }
function b2Body_GetLocalPoint(bodyId:Tb2BodyId; worldPoint:Tb2Vec2):Tb2Vec2;cdecl;external;
{/ Get a world point on a body given a local point }
function b2Body_GetWorldPoint(bodyId:Tb2BodyId; localPoint:Tb2Vec2):Tb2Vec2;cdecl;external;
{/ Get a local vector on a body given a world vector }
function b2Body_GetLocalVector(bodyId:Tb2BodyId; worldVector:Tb2Vec2):Tb2Vec2;cdecl;external;
{/ Get a world vector on a body given a local vector }
function b2Body_GetWorldVector(bodyId:Tb2BodyId; localVector:Tb2Vec2):Tb2Vec2;cdecl;external;
{/ Get the linear velocity of a body's center of mass. Usually in meters per second. }
function b2Body_GetLinearVelocity(bodyId:Tb2BodyId):Tb2Vec2;cdecl;external;
{/ Get the angular velocity of a body in radians per second }
function b2Body_GetAngularVelocity(bodyId:Tb2BodyId):single;cdecl;external;
{/ Set the linear velocity of a body. Usually in meters per second. }
procedure b2Body_SetLinearVelocity(bodyId:Tb2BodyId; linearVelocity:Tb2Vec2);cdecl;external;
{/ Set the angular velocity of a body in radians per second }
procedure b2Body_SetAngularVelocity(bodyId:Tb2BodyId; angularVelocity:single);cdecl;external;
{/ Set the velocity to reach the given transform after a given time step. }
{/ The result will be close but maybe not exact. This is meant for kinematic bodies. }
{/ The target is not applied if the velocity would be below the sleep threshold and }
{/ the body is currently asleep. }
{/ @param bodyId The body id }
{/ @param target The target transform for the body }
{/ @param timeStep The time step of the next call to b2World_Step }
{/ @param wake Option to wake the body or not }
procedure b2Body_SetTargetTransform(bodyId:Tb2BodyId; target:Tb2Transform; timeStep:single; wake:Tbool);cdecl;external;
{/ Get the linear velocity of a local point attached to a body. Usually in meters per second. }
function b2Body_GetLocalPointVelocity(bodyId:Tb2BodyId; localPoint:Tb2Vec2):Tb2Vec2;cdecl;external;
{/ Get the linear velocity of a world point attached to a body. Usually in meters per second. }
function b2Body_GetWorldPointVelocity(bodyId:Tb2BodyId; worldPoint:Tb2Vec2):Tb2Vec2;cdecl;external;
{/ Apply a force at a world point. If the force is not applied at the center of mass, }
{/ it will generate a torque and affect the angular velocity. This optionally wakes up the body. }
{/ The force is ignored if the body is not awake. }
{/ @param bodyId The body id }
{/ @param force The world force vector, usually in newtons (N) }
{/ @param point The world position of the point of application }
{/ @param wake Option to wake up the body }
procedure b2Body_ApplyForce(bodyId:Tb2BodyId; force:Tb2Vec2; point:Tb2Vec2; wake:Tbool);cdecl;external;
{/ Apply a force to the center of mass. This optionally wakes up the body. }
{/ The force is ignored if the body is not awake. }
{/ @param bodyId The body id }
{/ @param force the world force vector, usually in newtons (N). }
{/ @param wake also wake up the body }
procedure b2Body_ApplyForceToCenter(bodyId:Tb2BodyId; force:Tb2Vec2; wake:Tbool);cdecl;external;
{/ Apply a torque. This affects the angular velocity without affecting the linear velocity. }
{/ This optionally wakes the body. The torque is ignored if the body is not awake. }
{/ @param bodyId The body id }
{/ @param torque about the z-axis (out of the screen), usually in N*m. }
{/ @param wake also wake up the body }
procedure b2Body_ApplyTorque(bodyId:Tb2BodyId; torque:single; wake:Tbool);cdecl;external;
{/ Clear the force and torque on this body. Forces and torques are automatically cleared after each world }
{/ step. So this only needs to be called if the application wants to remove the effect of previous }
{/ calls to apply forces and torques before the world step is called. }
{/ @param bodyId The body id }
procedure b2Body_ClearForces(bodyId:Tb2BodyId);cdecl;external;
{/ Apply an impulse at a point. This immediately modifies the velocity. }
{/ It also modifies the angular velocity if the point of application }
{/ is not at the center of mass. This optionally wakes the body. }
{/ The impulse is ignored if the body is not awake. }
{/ @param bodyId The body id }
{/ @param impulse the world impulse vector, usually in N*s or kg*m/s. }
{/ @param point the world position of the point of application. }
{/ @param wake also wake up the body }
{/ @warning This should be used for one-shot impulses. If you need a steady force, }
{/ use a force instead, which will work better with the sub-stepping solver. }
procedure b2Body_ApplyLinearImpulse(bodyId:Tb2BodyId; impulse:Tb2Vec2; point:Tb2Vec2; wake:Tbool);cdecl;external;
{/ Apply an impulse to the center of mass. This immediately modifies the velocity. }
{/ The impulse is ignored if the body is not awake. This optionally wakes the body. }
{/ @param bodyId The body id }
{/ @param impulse the world impulse vector, usually in N*s or kg*m/s. }
{/ @param wake also wake up the body }
{/ @warning This should be used for one-shot impulses. If you need a steady force, }
{/ use a force instead, which will work better with the sub-stepping solver. }
procedure b2Body_ApplyLinearImpulseToCenter(bodyId:Tb2BodyId; impulse:Tb2Vec2; wake:Tbool);cdecl;external;
{/ Apply an angular impulse. The impulse is ignored if the body is not awake. }
{/ This optionally wakes the body. }
{/ @param bodyId The body id }
{/ @param impulse the angular impulse, usually in units of kg*m*m/s }
{/ @param wake also wake up the body }
{/ @warning This should be used for one-shot impulses. If you need a steady torque, }
{/ use a torque instead, which will work better with the sub-stepping solver. }
procedure b2Body_ApplyAngularImpulse(bodyId:Tb2BodyId; impulse:single; wake:Tbool);cdecl;external;
{/ Get the mass of the body, usually in kilograms }
function b2Body_GetMass(bodyId:Tb2BodyId):single;cdecl;external;
{/ Get the rotational inertia of the body, usually in kg*m^2 }
function b2Body_GetRotationalInertia(bodyId:Tb2BodyId):single;cdecl;external;
{/ Get the center of mass position of the body in local space }
function b2Body_GetLocalCenterOfMass(bodyId:Tb2BodyId):Tb2Vec2;cdecl;external;
{/ Get the center of mass position of the body in world space }
function b2Body_GetWorldCenterOfMass(bodyId:Tb2BodyId):Tb2Vec2;cdecl;external;
{/ Override the body's mass properties. Normally this is computed automatically using the }
{/ shape geometry and density. This information is lost if a shape is added or removed or if the }
{/ body type changes. }
procedure b2Body_SetMassData(bodyId:Tb2BodyId; massData:Tb2MassData);cdecl;external;
{/ Get the mass data for a body }
function b2Body_GetMassData(bodyId:Tb2BodyId):Tb2MassData;cdecl;external;
{/ This updates the mass properties to the sum of the mass properties of the shapes. }
{/ This normally does not need to be called unless you called SetMassData to override }
{/ the mass and you later want to reset the mass. }
{/ You may also use this when automatic mass computation has been disabled. }
{/ You should call this regardless of body type. }
{/ Note that sensor shapes may have mass. }
procedure b2Body_ApplyMassFromShapes(bodyId:Tb2BodyId);cdecl;external;
{/ Adjust the linear damping. Normally this is set in b2BodyDef before creation. }
procedure b2Body_SetLinearDamping(bodyId:Tb2BodyId; linearDamping:single);cdecl;external;
{/ Get the current linear damping. }
function b2Body_GetLinearDamping(bodyId:Tb2BodyId):single;cdecl;external;
{/ Adjust the angular damping. Normally this is set in b2BodyDef before creation. }
procedure b2Body_SetAngularDamping(bodyId:Tb2BodyId; angularDamping:single);cdecl;external;
{/ Get the current angular damping. }
function b2Body_GetAngularDamping(bodyId:Tb2BodyId):single;cdecl;external;
{/ Adjust the gravity scale. Normally this is set in b2BodyDef before creation. }
{/ @see b2BodyDef::gravityScale }
procedure b2Body_SetGravityScale(bodyId:Tb2BodyId; gravityScale:single);cdecl;external;
{/ Get the current gravity scale }
function b2Body_GetGravityScale(bodyId:Tb2BodyId):single;cdecl;external;
{/ @return true if this body is awake }
function b2Body_IsAwake(bodyId:Tb2BodyId):Tbool;cdecl;external;
{/ Wake a body from sleep. This wakes the entire island the body is touching. }
{/ @warning Putting a body to sleep will put the entire island of bodies touching this body to sleep, }
{/ which can be expensive and possibly unintuitive. }
procedure b2Body_SetAwake(bodyId:Tb2BodyId; awake:Tbool);cdecl;external;
{/ Wake bodies touching this body. Works for static bodies. }
procedure b2Body_WakeTouching(bodyId:Tb2BodyId);cdecl;external;
{/ Enable or disable sleeping for this body. If sleeping is disabled the body will wake. }
procedure b2Body_EnableSleep(bodyId:Tb2BodyId; enableSleep:Tbool);cdecl;external;
{/ Returns true if sleeping is enabled for this body }
function b2Body_IsSleepEnabled(bodyId:Tb2BodyId):Tbool;cdecl;external;
{/ Set the sleep threshold, usually in meters per second }
procedure b2Body_SetSleepThreshold(bodyId:Tb2BodyId; sleepThreshold:single);cdecl;external;
{/ Get the sleep threshold, usually in meters per second. }
function b2Body_GetSleepThreshold(bodyId:Tb2BodyId):single;cdecl;external;
{/ Returns true if this body is enabled }
function b2Body_IsEnabled(bodyId:Tb2BodyId):Tbool;cdecl;external;
{/ Disable a body by removing it completely from the simulation. This is expensive. }
procedure b2Body_Disable(bodyId:Tb2BodyId);cdecl;external;
{/ Enable a body by adding it to the simulation. This is expensive. }
procedure b2Body_Enable(bodyId:Tb2BodyId);cdecl;external;
{/ Set the motion locks on this body. }
procedure b2Body_SetMotionLocks(bodyId:Tb2BodyId; locks:Tb2MotionLocks);cdecl;external;
{/ Get the motion locks for this body. }
function b2Body_GetMotionLocks(bodyId:Tb2BodyId):Tb2MotionLocks;cdecl;external;
{/ Set this body to be a bullet. A bullet does continuous collision detection }
{/ against dynamic bodies (but not other bullets). }
procedure b2Body_SetBullet(bodyId:Tb2BodyId; flag:Tbool);cdecl;external;
{/ Is this body a bullet? }
function b2Body_IsBullet(bodyId:Tb2BodyId):Tbool;cdecl;external;
{/ Enable/disable contact events on all shapes. }
{/ @see b2ShapeDef::enableContactEvents }
{/ @warning changing this at runtime may cause mismatched begin/end touch events }
procedure b2Body_EnableContactEvents(bodyId:Tb2BodyId; flag:Tbool);cdecl;external;
{/ Enable/disable hit events on all shapes }
{/ @see b2ShapeDef::enableHitEvents }
procedure b2Body_EnableHitEvents(bodyId:Tb2BodyId; flag:Tbool);cdecl;external;
{/ Get the world that owns this body }
function b2Body_GetWorld(bodyId:Tb2BodyId):Tb2WorldId;cdecl;external;
{/ Get the number of shapes on this body }
function b2Body_GetShapeCount(bodyId:Tb2BodyId):longint;cdecl;external;
{/ Get the shape ids for all shapes on this body, up to the provided capacity. }
{/ @returns the number of shape ids stored in the user array }
function b2Body_GetShapes(bodyId:Tb2BodyId; shapeArray:Pb2ShapeId; capacity:longint):longint;cdecl;external;
{/ Get the number of joints on this body }
function b2Body_GetJointCount(bodyId:Tb2BodyId):longint;cdecl;external;
{/ Get the joint ids for all joints on this body, up to the provided capacity }
{/ @returns the number of joint ids stored in the user array }
function b2Body_GetJoints(bodyId:Tb2BodyId; jointArray:Pb2JointId; capacity:longint):longint;cdecl;external;
{/ Get the maximum capacity required for retrieving all the touching contacts on a body }
function b2Body_GetContactCapacity(bodyId:Tb2BodyId):longint;cdecl;external;
{/ Get the touching contact data for a body. }
{/ @note Box2D uses speculative collision so some contact points may be separated. }
{/ @returns the number of elements filled in the provided array }
{/ @warning do not ignore the return value, it specifies the valid number of elements }
function b2Body_GetContactData(bodyId:Tb2BodyId; contactData:Pb2ContactData; capacity:longint):longint;cdecl;external;
{/ Get the current world AABB that contains all the attached shapes. Note that this may not encompass the body origin. }
{/ If there are no shapes attached then the returned AABB is empty and centered on the body origin. }
function b2Body_ComputeAABB(bodyId:Tb2BodyId):Tb2AABB;cdecl;external;
{* @  }
{*
 * @defgroup shape Shape
 * Functions to create, destroy, and access.
 * Shapes bind raw geometry to bodies and hold material properties including friction and restitution.
 * @
  }
{/ Create a circle shape and attach it to a body. The shape definition and geometry are fully cloned. }
{/ Contacts are not created until the next time step. }
{/ @return the shape id for accessing the shape }
(* Const before type ignored *)
(* Const before type ignored *)
function b2CreateCircleShape(bodyId:Tb2BodyId; def:Pb2ShapeDef; circle:Pb2Circle):Tb2ShapeId;cdecl;external;
{/ Create a line segment shape and attach it to a body. The shape definition and geometry are fully cloned. }
{/ Contacts are not created until the next time step. }
{/ @return the shape id for accessing the shape }
(* Const before type ignored *)
(* Const before type ignored *)
function b2CreateSegmentShape(bodyId:Tb2BodyId; def:Pb2ShapeDef; segment:Pb2Segment):Tb2ShapeId;cdecl;external;
{/ Create a capsule shape and attach it to a body. The shape definition and geometry are fully cloned. }
{/ Contacts are not created until the next time step. }
{/ @return the shape id for accessing the shape, this will be b2_nullShapeId if the length is too small. }
(* Const before type ignored *)
(* Const before type ignored *)
function b2CreateCapsuleShape(bodyId:Tb2BodyId; def:Pb2ShapeDef; capsule:Pb2Capsule):Tb2ShapeId;cdecl;external;
{/ Create a polygon shape and attach it to a body. The shape definition and geometry are fully cloned. }
{/ Contacts are not created until the next time step. }
{/ @return the shape id for accessing the shape }
(* Const before type ignored *)
(* Const before type ignored *)
function b2CreatePolygonShape(bodyId:Tb2BodyId; def:Pb2ShapeDef; polygon:Pb2Polygon):Tb2ShapeId;cdecl;external;
{/ Destroy a shape. You may defer the body mass update which can improve performance if several shapes on a }
{/	body are destroyed at once. }
{/	@see b2Body_ApplyMassFromShapes }
procedure b2DestroyShape(shapeId:Tb2ShapeId; updateBodyMass:Tbool);cdecl;external;
{/ Shape identifier validation. Provides validation for up to 64K allocations. }
function b2Shape_IsValid(id:Tb2ShapeId):Tbool;cdecl;external;
{/ Get the type of a shape }
function b2Shape_GetType(shapeId:Tb2ShapeId):Tb2ShapeType;cdecl;external;
{/ Get the id of the body that a shape is attached to }
function b2Shape_GetBody(shapeId:Tb2ShapeId):Tb2BodyId;cdecl;external;
{/ Get the world that owns this shape }
function b2Shape_GetWorld(shapeId:Tb2ShapeId):Tb2WorldId;cdecl;external;
{/ Returns true if the shape is a sensor. It is not possible to change a shape }
{/ from sensor to solid dynamically because this breaks the contract for }
{/ sensor events. }
function b2Shape_IsSensor(shapeId:Tb2ShapeId):Tbool;cdecl;external;
{/ Set the user data for a shape }
procedure b2Shape_SetUserData(shapeId:Tb2ShapeId; userData:pointer);cdecl;external;
{/ Get the user data for a shape. This is useful when you get a shape id }
{/ from an event or query. }
function b2Shape_GetUserData(shapeId:Tb2ShapeId):pointer;cdecl;external;
{/ Set the mass density of a shape, usually in kg/m^2. }
{/ This will optionally update the mass properties on the parent body. }
{/ @see b2ShapeDef::density, b2Body_ApplyMassFromShapes }
procedure b2Shape_SetDensity(shapeId:Tb2ShapeId; density:single; updateBodyMass:Tbool);cdecl;external;
{/ Get the density of a shape, usually in kg/m^2 }
function b2Shape_GetDensity(shapeId:Tb2ShapeId):single;cdecl;external;
{/ Set the friction on a shape }
procedure b2Shape_SetFriction(shapeId:Tb2ShapeId; friction:single);cdecl;external;
{/ Get the friction of a shape }
function b2Shape_GetFriction(shapeId:Tb2ShapeId):single;cdecl;external;
{/ Set the shape restitution (bounciness) }
procedure b2Shape_SetRestitution(shapeId:Tb2ShapeId; restitution:single);cdecl;external;
{/ Get the shape restitution }
function b2Shape_GetRestitution(shapeId:Tb2ShapeId):single;cdecl;external;
{/ Set the user material identifier }
procedure b2Shape_SetUserMaterial(shapeId:Tb2ShapeId; material:Tuint64_t);cdecl;external;
{/ Get the user material identifier }
function b2Shape_GetUserMaterial(shapeId:Tb2ShapeId):Tuint64_t;cdecl;external;
{/ Set the shape surface material }
(* Const before type ignored *)
procedure b2Shape_SetSurfaceMaterial(shapeId:Tb2ShapeId; surfaceMaterial:Pb2SurfaceMaterial);cdecl;external;
{/ Get the shape surface material }
function b2Shape_GetSurfaceMaterial(shapeId:Tb2ShapeId):Tb2SurfaceMaterial;cdecl;external;
{/ Get the shape filter }
function b2Shape_GetFilter(shapeId:Tb2ShapeId):Tb2Filter;cdecl;external;
{/ Set the current filter. This is almost as expensive as recreating the shape. This may cause }
{/ contacts to be immediately destroyed. However contacts are not created until the next world step. }
{/ Sensor overlap state is also not updated until the next world step. }
{/ @see b2ShapeDef::filter }
procedure b2Shape_SetFilter(shapeId:Tb2ShapeId; filter:Tb2Filter);cdecl;external;
{/ Enable sensor events for this shape. }
{/ @see b2ShapeDef::enableSensorEvents }
procedure b2Shape_EnableSensorEvents(shapeId:Tb2ShapeId; flag:Tbool);cdecl;external;
{/ Returns true if sensor events are enabled. }
function b2Shape_AreSensorEventsEnabled(shapeId:Tb2ShapeId):Tbool;cdecl;external;
{/ Enable contact events for this shape. Only applies to kinematic and dynamic bodies. Ignored for sensors. }
{/ @see b2ShapeDef::enableContactEvents }
{/ @warning changing this at run-time may lead to lost begin/end events }
procedure b2Shape_EnableContactEvents(shapeId:Tb2ShapeId; flag:Tbool);cdecl;external;
{/ Returns true if contact events are enabled }
function b2Shape_AreContactEventsEnabled(shapeId:Tb2ShapeId):Tbool;cdecl;external;
{/ Enable pre-solve contact events for this shape. Only applies to dynamic bodies. These are expensive }
{/ and must be carefully handled due to multithreading. Ignored for sensors. }
{/ @see b2PreSolveFcn }
procedure b2Shape_EnablePreSolveEvents(shapeId:Tb2ShapeId; flag:Tbool);cdecl;external;
{/ Returns true if pre-solve events are enabled }
function b2Shape_ArePreSolveEventsEnabled(shapeId:Tb2ShapeId):Tbool;cdecl;external;
{/ Enable contact hit events for this shape. Ignored for sensors. }
{/ @see b2WorldDef.hitEventThreshold }
procedure b2Shape_EnableHitEvents(shapeId:Tb2ShapeId; flag:Tbool);cdecl;external;
{/ Returns true if hit events are enabled }
function b2Shape_AreHitEventsEnabled(shapeId:Tb2ShapeId):Tbool;cdecl;external;
{/ Test a point for overlap with a shape }
function b2Shape_TestPoint(shapeId:Tb2ShapeId; point:Tb2Vec2):Tbool;cdecl;external;
{/ Ray cast a shape directly }
(* Const before type ignored *)
function b2Shape_RayCast(shapeId:Tb2ShapeId; input:Pb2RayCastInput):Tb2CastOutput;cdecl;external;
{/ Get a copy of the shape's circle. Asserts the type is correct. }
function b2Shape_GetCircle(shapeId:Tb2ShapeId):Tb2Circle;cdecl;external;
{/ Get a copy of the shape's line segment. Asserts the type is correct. }
function b2Shape_GetSegment(shapeId:Tb2ShapeId):Tb2Segment;cdecl;external;
{/ Get a copy of the shape's chain segment. These come from chain shapes. }
{/ Asserts the type is correct. }
function b2Shape_GetChainSegment(shapeId:Tb2ShapeId):Tb2ChainSegment;cdecl;external;
{/ Get a copy of the shape's capsule. Asserts the type is correct. }
function b2Shape_GetCapsule(shapeId:Tb2ShapeId):Tb2Capsule;cdecl;external;
{/ Get a copy of the shape's convex polygon. Asserts the type is correct. }
function b2Shape_GetPolygon(shapeId:Tb2ShapeId):Tb2Polygon;cdecl;external;
{/ Allows you to change a shape to be a circle or update the current circle. }
{/ This does not modify the mass properties. }
{/ @see b2Body_ApplyMassFromShapes }
(* Const before type ignored *)
procedure b2Shape_SetCircle(shapeId:Tb2ShapeId; circle:Pb2Circle);cdecl;external;
{/ Allows you to change a shape to be a capsule or update the current capsule. }
{/ This does not modify the mass properties. }
{/ @see b2Body_ApplyMassFromShapes }
(* Const before type ignored *)
procedure b2Shape_SetCapsule(shapeId:Tb2ShapeId; capsule:Pb2Capsule);cdecl;external;
{/ Allows you to change a shape to be a segment or update the current segment. }
(* Const before type ignored *)
procedure b2Shape_SetSegment(shapeId:Tb2ShapeId; segment:Pb2Segment);cdecl;external;
{/ Allows you to change a shape to be a polygon or update the current polygon. }
{/ This does not modify the mass properties. }
{/ @see b2Body_ApplyMassFromShapes }
(* Const before type ignored *)
procedure b2Shape_SetPolygon(shapeId:Tb2ShapeId; polygon:Pb2Polygon);cdecl;external;
{/ Get the parent chain id if the shape type is a chain segment, otherwise }
{/ returns b2_nullChainId. }
function b2Shape_GetParentChain(shapeId:Tb2ShapeId):Tb2ChainId;cdecl;external;
{/ Get the maximum capacity required for retrieving all the touching contacts on a shape }
function b2Shape_GetContactCapacity(shapeId:Tb2ShapeId):longint;cdecl;external;
{/ Get the touching contact data for a shape. The provided shapeId will be either shapeIdA or shapeIdB on the contact data. }
{/ @note Box2D uses speculative collision so some contact points may be separated. }
{/ @returns the number of elements filled in the provided array }
{/ @warning do not ignore the return value, it specifies the valid number of elements }
function b2Shape_GetContactData(shapeId:Tb2ShapeId; contactData:Pb2ContactData; capacity:longint):longint;cdecl;external;
{/ Get the maximum capacity required for retrieving all the overlapped shapes on a sensor shape. }
{/ This returns 0 if the provided shape is not a sensor. }
{/ @param shapeId the id of a sensor shape }
{/ @returns the required capacity to get all the overlaps in b2Shape_GetSensorOverlaps }
function b2Shape_GetSensorCapacity(shapeId:Tb2ShapeId):longint;cdecl;external;
{/ Get the overlap data for a sensor shape. }
{/ @param shapeId the id of a sensor shape }
{/ @param visitorIds a user allocated array that is filled with the overlapping shapes (visitors) }
{/ @param capacity the capacity of overlappedShapes }
{/ @returns the number of elements filled in the provided array }
{/ @warning do not ignore the return value, it specifies the valid number of elements }
{/ @warning overlaps may contain destroyed shapes so use b2Shape_IsValid to confirm each overlap }
function b2Shape_GetSensorData(shapeId:Tb2ShapeId; visitorIds:Pb2ShapeId; capacity:longint):longint;cdecl;external;
{/ Get the current world AABB }
function b2Shape_GetAABB(shapeId:Tb2ShapeId):Tb2AABB;cdecl;external;
{/ Compute the mass data for a shape }
function b2Shape_ComputeMassData(shapeId:Tb2ShapeId):Tb2MassData;cdecl;external;
{/ Get the closest point on a shape to a target point. Target and result are in world space. }
{/ todo need sample }
function b2Shape_GetClosestPoint(shapeId:Tb2ShapeId; target:Tb2Vec2):Tb2Vec2;cdecl;external;
{/ Apply a wind force to the body for this shape using the density of air. This considers }
{/ the projected area of the shape in the wind direction. This also considers }
{/ the relative velocity of the shape. }
{/ @param shapeId the shape id }
{/ @param wind the wind velocity in world space }
{/ @param drag the drag coefficient, the force that opposes the relative velocity }
{/ @param lift the lift coefficient, the force that is perpendicular to the relative velocity }
{/ @param wake should this wake the body }
procedure b2Shape_ApplyWind(shapeId:Tb2ShapeId; wind:Tb2Vec2; drag:single; lift:single; wake:Tbool);cdecl;external;
{/ Chain Shape }
{/ Create a chain shape }
{/ @see b2ChainDef for details }
(* Const before type ignored *)
function b2CreateChain(bodyId:Tb2BodyId; def:Pb2ChainDef):Tb2ChainId;cdecl;external;
{/ Destroy a chain shape }
procedure b2DestroyChain(chainId:Tb2ChainId);cdecl;external;
{/ Get the world that owns this chain shape }
function b2Chain_GetWorld(chainId:Tb2ChainId):Tb2WorldId;cdecl;external;
{/ Get the number of segments on this chain }
function b2Chain_GetSegmentCount(chainId:Tb2ChainId):longint;cdecl;external;
{/ Fill a user array with chain segment shape ids up to the specified capacity. Returns }
{/ the actual number of segments returned. }
function b2Chain_GetSegments(chainId:Tb2ChainId; segmentArray:Pb2ShapeId; capacity:longint):longint;cdecl;external;
{/ Get the number of materials used on this chain. Must be 1 or the number of segments. }
function b2Chain_GetSurfaceMaterialCount(chainId:Tb2ChainId):longint;cdecl;external;
{/ Set a chain material. If the chain has only one material, this material is applied to all }
{/ segments. Otherwise it is applied to a single segment. }
(* Const before type ignored *)
procedure b2Chain_SetSurfaceMaterial(chainId:Tb2ChainId; material:Pb2SurfaceMaterial; materialIndex:longint);cdecl;external;
{/ Get a chain material by index. }
function b2Chain_GetSurfaceMaterial(chainId:Tb2ChainId; materialIndex:longint):Tb2SurfaceMaterial;cdecl;external;
{/ Chain identifier validation. Provides validation for up to 64K allocations. }
function b2Chain_IsValid(id:Tb2ChainId):Tbool;cdecl;external;
{* @  }
{*
 * @defgroup joint Joint
 * @brief Joints allow you to connect rigid bodies together while allowing various forms of relative motions.
 * @
  }
{/ Destroy a joint. Optionally wake attached bodies. }
procedure b2DestroyJoint(jointId:Tb2JointId; wakeAttached:Tbool);cdecl;external;
{/ Joint identifier validation. Provides validation for up to 64K allocations. }
function b2Joint_IsValid(id:Tb2JointId):Tbool;cdecl;external;
{/ Get the joint type }
function b2Joint_GetType(jointId:Tb2JointId):Tb2JointType;cdecl;external;
{/ Get body A id on a joint }
function b2Joint_GetBodyA(jointId:Tb2JointId):Tb2BodyId;cdecl;external;
{/ Get body B id on a joint }
function b2Joint_GetBodyB(jointId:Tb2JointId):Tb2BodyId;cdecl;external;
{/ Get the world that owns this joint }
function b2Joint_GetWorld(jointId:Tb2JointId):Tb2WorldId;cdecl;external;
{/ Set the local frame on bodyA }
procedure b2Joint_SetLocalFrameA(jointId:Tb2JointId; localFrame:Tb2Transform);cdecl;external;
{/ Get the local frame on bodyA }
function b2Joint_GetLocalFrameA(jointId:Tb2JointId):Tb2Transform;cdecl;external;
{/ Set the local frame on bodyB }
procedure b2Joint_SetLocalFrameB(jointId:Tb2JointId; localFrame:Tb2Transform);cdecl;external;
{/ Get the local frame on bodyB }
function b2Joint_GetLocalFrameB(jointId:Tb2JointId):Tb2Transform;cdecl;external;
{/ Toggle collision between connected bodies }
procedure b2Joint_SetCollideConnected(jointId:Tb2JointId; shouldCollide:Tbool);cdecl;external;
{/ Is collision allowed between connected bodies? }
function b2Joint_GetCollideConnected(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the user data on a joint }
procedure b2Joint_SetUserData(jointId:Tb2JointId; userData:pointer);cdecl;external;
{/ Get the user data on a joint }
function b2Joint_GetUserData(jointId:Tb2JointId):pointer;cdecl;external;
{/ Wake the bodies connect to this joint }
procedure b2Joint_WakeBodies(jointId:Tb2JointId);cdecl;external;
{/ Get the current constraint force for this joint. Usually in Newtons. }
function b2Joint_GetConstraintForce(jointId:Tb2JointId):Tb2Vec2;cdecl;external;
{/ Get the current constraint torque for this joint. Usually in Newton * meters. }
function b2Joint_GetConstraintTorque(jointId:Tb2JointId):single;cdecl;external;
{/ Get the current linear separation error for this joint. Does not consider admissible movement. Usually in meters. }
function b2Joint_GetLinearSeparation(jointId:Tb2JointId):single;cdecl;external;
{/ Get the current angular separation error for this joint. Does not consider admissible movement. Usually in meters. }
function b2Joint_GetAngularSeparation(jointId:Tb2JointId):single;cdecl;external;
{/ Set the joint constraint tuning. Advanced feature. }
{/ @param jointId the joint }
{/ @param hertz the stiffness in Hertz (cycles per second) }
{/ @param dampingRatio the non-dimensional damping ratio (one for critical damping) }
procedure b2Joint_SetConstraintTuning(jointId:Tb2JointId; hertz:single; dampingRatio:single);cdecl;external;
{/ Get the joint constraint tuning. Advanced feature. }
procedure b2Joint_GetConstraintTuning(jointId:Tb2JointId; hertz:Psingle; dampingRatio:Psingle);cdecl;external;
{/ Set the force threshold for joint events (Newtons) }
procedure b2Joint_SetForceThreshold(jointId:Tb2JointId; threshold:single);cdecl;external;
{/ Get the force threshold for joint events (Newtons) }
function b2Joint_GetForceThreshold(jointId:Tb2JointId):single;cdecl;external;
{/ Set the torque threshold for joint events (N-m) }
procedure b2Joint_SetTorqueThreshold(jointId:Tb2JointId; threshold:single);cdecl;external;
{/ Get the torque threshold for joint events (N-m) }
function b2Joint_GetTorqueThreshold(jointId:Tb2JointId):single;cdecl;external;
{*
 * @defgroup distance_joint Distance Joint
 * @brief Functions for the distance joint.
 * @
  }
{/ Create a distance joint }
{/ @see b2DistanceJointDef for details }
(* Const before type ignored *)
function b2CreateDistanceJoint(worldId:Tb2WorldId; def:Pb2DistanceJointDef):Tb2JointId;cdecl;external;
{/ Set the rest length of a distance joint }
{/ @param jointId The id for a distance joint }
{/ @param length The new distance joint length }
procedure b2DistanceJoint_SetLength(jointId:Tb2JointId; length:single);cdecl;external;
{/ Get the rest length of a distance joint }
function b2DistanceJoint_GetLength(jointId:Tb2JointId):single;cdecl;external;
{/ Enable/disable the distance joint spring. When disabled the distance joint is rigid. }
procedure b2DistanceJoint_EnableSpring(jointId:Tb2JointId; enableSpring:Tbool);cdecl;external;
{/ Is the distance joint spring enabled? }
function b2DistanceJoint_IsSpringEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the force range for the spring. }
procedure b2DistanceJoint_SetSpringForceRange(jointId:Tb2JointId; lowerForce:single; upperForce:single);cdecl;external;
{/ Get the force range for the spring. }
procedure b2DistanceJoint_GetSpringForceRange(jointId:Tb2JointId; lowerForce:Psingle; upperForce:Psingle);cdecl;external;
{/ Set the spring stiffness in Hertz }
procedure b2DistanceJoint_SetSpringHertz(jointId:Tb2JointId; hertz:single);cdecl;external;
{/ Set the spring damping ratio, non-dimensional }
procedure b2DistanceJoint_SetSpringDampingRatio(jointId:Tb2JointId; dampingRatio:single);cdecl;external;
{/ Get the spring Hertz }
function b2DistanceJoint_GetSpringHertz(jointId:Tb2JointId):single;cdecl;external;
{/ Get the spring damping ratio }
function b2DistanceJoint_GetSpringDampingRatio(jointId:Tb2JointId):single;cdecl;external;
{/ Enable joint limit. The limit only works if the joint spring is enabled. Otherwise the joint is rigid }
{/ and the limit has no effect. }
procedure b2DistanceJoint_EnableLimit(jointId:Tb2JointId; enableLimit:Tbool);cdecl;external;
{/ Is the distance joint limit enabled? }
function b2DistanceJoint_IsLimitEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the minimum and maximum length parameters of a distance joint }
procedure b2DistanceJoint_SetLengthRange(jointId:Tb2JointId; minLength:single; maxLength:single);cdecl;external;
{/ Get the distance joint minimum length }
function b2DistanceJoint_GetMinLength(jointId:Tb2JointId):single;cdecl;external;
{/ Get the distance joint maximum length }
function b2DistanceJoint_GetMaxLength(jointId:Tb2JointId):single;cdecl;external;
{/ Get the current length of a distance joint }
function b2DistanceJoint_GetCurrentLength(jointId:Tb2JointId):single;cdecl;external;
{/ Enable/disable the distance joint motor }
procedure b2DistanceJoint_EnableMotor(jointId:Tb2JointId; enableMotor:Tbool);cdecl;external;
{/ Is the distance joint motor enabled? }
function b2DistanceJoint_IsMotorEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the distance joint motor speed, usually in meters per second }
procedure b2DistanceJoint_SetMotorSpeed(jointId:Tb2JointId; motorSpeed:single);cdecl;external;
{/ Get the distance joint motor speed, usually in meters per second }
function b2DistanceJoint_GetMotorSpeed(jointId:Tb2JointId):single;cdecl;external;
{/ Set the distance joint maximum motor force, usually in newtons }
procedure b2DistanceJoint_SetMaxMotorForce(jointId:Tb2JointId; force:single);cdecl;external;
{/ Get the distance joint maximum motor force, usually in newtons }
function b2DistanceJoint_GetMaxMotorForce(jointId:Tb2JointId):single;cdecl;external;
{/ Get the distance joint current motor force, usually in newtons }
function b2DistanceJoint_GetMotorForce(jointId:Tb2JointId):single;cdecl;external;
{* @  }
{*
 * @defgroup motor_joint Motor Joint
 * @brief Functions for the motor joint.
 *
 * The motor joint is designed to control the movement of a body while still being
 * responsive to collisions. A spring controls the position and rotation. A velocity motor
 * can be used to control velocity and allows for friction in top-down games. Both types
 * of control can be combined. For example, you can have a spring with friction.
 * Position and velocity control have force and torque limits.
 * @
  }
{/ Create a motor joint }
{/ @see b2MotorJointDef for details }
(* Const before type ignored *)
function b2CreateMotorJoint(worldId:Tb2WorldId; def:Pb2MotorJointDef):Tb2JointId;cdecl;external;
{/ Set the desired relative linear velocity in meters per second }
procedure b2MotorJoint_SetLinearVelocity(jointId:Tb2JointId; velocity:Tb2Vec2);cdecl;external;
{/ Get the desired relative linear velocity in meters per second }
function b2MotorJoint_GetLinearVelocity(jointId:Tb2JointId):Tb2Vec2;cdecl;external;
{/ Set the desired relative angular velocity in radians per second }
procedure b2MotorJoint_SetAngularVelocity(jointId:Tb2JointId; velocity:single);cdecl;external;
{/ Get the desired relative angular velocity in radians per second }
function b2MotorJoint_GetAngularVelocity(jointId:Tb2JointId):single;cdecl;external;
{/ Set the motor joint maximum force, usually in newtons }
procedure b2MotorJoint_SetMaxVelocityForce(jointId:Tb2JointId; maxForce:single);cdecl;external;
{/ Get the motor joint maximum force, usually in newtons }
function b2MotorJoint_GetMaxVelocityForce(jointId:Tb2JointId):single;cdecl;external;
{/ Set the motor joint maximum torque, usually in newton-meters }
procedure b2MotorJoint_SetMaxVelocityTorque(jointId:Tb2JointId; maxTorque:single);cdecl;external;
{/ Get the motor joint maximum torque, usually in newton-meters }
function b2MotorJoint_GetMaxVelocityTorque(jointId:Tb2JointId):single;cdecl;external;
{/ Set the spring linear hertz stiffness }
procedure b2MotorJoint_SetLinearHertz(jointId:Tb2JointId; hertz:single);cdecl;external;
{/ Get the spring linear hertz stiffness }
function b2MotorJoint_GetLinearHertz(jointId:Tb2JointId):single;cdecl;external;
{/ Set the spring linear damping ratio. Use 1.0 for critical damping. }
procedure b2MotorJoint_SetLinearDampingRatio(jointId:Tb2JointId; damping:single);cdecl;external;
{/ Get the spring linear damping ratio. }
function b2MotorJoint_GetLinearDampingRatio(jointId:Tb2JointId):single;cdecl;external;
{/ Set the spring angular hertz stiffness }
procedure b2MotorJoint_SetAngularHertz(jointId:Tb2JointId; hertz:single);cdecl;external;
{/ Get the spring angular hertz stiffness }
function b2MotorJoint_GetAngularHertz(jointId:Tb2JointId):single;cdecl;external;
{/ Set the spring angular damping ratio. Use 1.0 for critical damping. }
procedure b2MotorJoint_SetAngularDampingRatio(jointId:Tb2JointId; damping:single);cdecl;external;
{/ Get the spring angular damping ratio. }
function b2MotorJoint_GetAngularDampingRatio(jointId:Tb2JointId):single;cdecl;external;
{/ Set the maximum spring force in newtons. }
procedure b2MotorJoint_SetMaxSpringForce(jointId:Tb2JointId; maxForce:single);cdecl;external;
{/ Get the maximum spring force in newtons. }
function b2MotorJoint_GetMaxSpringForce(jointId:Tb2JointId):single;cdecl;external;
{/ Set the maximum spring torque in newtons * meters }
procedure b2MotorJoint_SetMaxSpringTorque(jointId:Tb2JointId; maxTorque:single);cdecl;external;
{/ Get the maximum spring torque in newtons * meters }
function b2MotorJoint_GetMaxSpringTorque(jointId:Tb2JointId):single;cdecl;external;
{*@ }
{*
 * @defgroup filter_joint Filter Joint
 * @brief Functions for the filter joint.
 *
 * The filter joint is used to disable collision between two bodies. As a side effect of being a joint, it also
 * keeps the two bodies in the same simulation island.
 * @
  }
{/ Create a filter joint. }
{/ @see b2FilterJointDef for details }
(* Const before type ignored *)
function b2CreateFilterJoint(worldId:Tb2WorldId; def:Pb2FilterJointDef):Tb2JointId;cdecl;external;
{*@ }
{*
 * @defgroup prismatic_joint Prismatic Joint
 * @brief A prismatic joint allows for translation along a single axis with no rotation.
 *
 * The prismatic joint is useful for things like pistons and moving platforms, where you want a body to translate
 * along an axis and have no rotation. Also called a *slider* joint.
 * @
  }
{/ Create a prismatic (slider) joint. }
{/ @see b2PrismaticJointDef for details }
(* Const before type ignored *)
function b2CreatePrismaticJoint(worldId:Tb2WorldId; def:Pb2PrismaticJointDef):Tb2JointId;cdecl;external;
{/ Enable/disable the joint spring. }
procedure b2PrismaticJoint_EnableSpring(jointId:Tb2JointId; enableSpring:Tbool);cdecl;external;
{/ Is the prismatic joint spring enabled or not? }
function b2PrismaticJoint_IsSpringEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the prismatic joint stiffness in Hertz. }
{/ This should usually be less than a quarter of the simulation rate. For example, if the simulation }
{/ runs at 60Hz then the joint stiffness should be 15Hz or less. }
procedure b2PrismaticJoint_SetSpringHertz(jointId:Tb2JointId; hertz:single);cdecl;external;
{/ Get the prismatic joint stiffness in Hertz }
function b2PrismaticJoint_GetSpringHertz(jointId:Tb2JointId):single;cdecl;external;
{/ Set the prismatic joint damping ratio (non-dimensional) }
procedure b2PrismaticJoint_SetSpringDampingRatio(jointId:Tb2JointId; dampingRatio:single);cdecl;external;
{/ Get the prismatic spring damping ratio (non-dimensional) }
function b2PrismaticJoint_GetSpringDampingRatio(jointId:Tb2JointId):single;cdecl;external;
{/ Set the prismatic joint spring target angle, usually in meters }
procedure b2PrismaticJoint_SetTargetTranslation(jointId:Tb2JointId; translation:single);cdecl;external;
{/ Get the prismatic joint spring target translation, usually in meters }
function b2PrismaticJoint_GetTargetTranslation(jointId:Tb2JointId):single;cdecl;external;
{/ Enable/disable a prismatic joint limit }
procedure b2PrismaticJoint_EnableLimit(jointId:Tb2JointId; enableLimit:Tbool);cdecl;external;
{/ Is the prismatic joint limit enabled? }
function b2PrismaticJoint_IsLimitEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Get the prismatic joint lower limit }
function b2PrismaticJoint_GetLowerLimit(jointId:Tb2JointId):single;cdecl;external;
{/ Get the prismatic joint upper limit }
function b2PrismaticJoint_GetUpperLimit(jointId:Tb2JointId):single;cdecl;external;
{/ Set the prismatic joint limits }
procedure b2PrismaticJoint_SetLimits(jointId:Tb2JointId; lower:single; upper:single);cdecl;external;
{/ Enable/disable a prismatic joint motor }
procedure b2PrismaticJoint_EnableMotor(jointId:Tb2JointId; enableMotor:Tbool);cdecl;external;
{/ Is the prismatic joint motor enabled? }
function b2PrismaticJoint_IsMotorEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the prismatic joint motor speed, usually in meters per second }
procedure b2PrismaticJoint_SetMotorSpeed(jointId:Tb2JointId; motorSpeed:single);cdecl;external;
{/ Get the prismatic joint motor speed, usually in meters per second }
function b2PrismaticJoint_GetMotorSpeed(jointId:Tb2JointId):single;cdecl;external;
{/ Set the prismatic joint maximum motor force, usually in newtons }
procedure b2PrismaticJoint_SetMaxMotorForce(jointId:Tb2JointId; force:single);cdecl;external;
{/ Get the prismatic joint maximum motor force, usually in newtons }
function b2PrismaticJoint_GetMaxMotorForce(jointId:Tb2JointId):single;cdecl;external;
{/ Get the prismatic joint current motor force, usually in newtons }
function b2PrismaticJoint_GetMotorForce(jointId:Tb2JointId):single;cdecl;external;
{/ Get the current joint translation, usually in meters. }
function b2PrismaticJoint_GetTranslation(jointId:Tb2JointId):single;cdecl;external;
{/ Get the current joint translation speed, usually in meters per second. }
function b2PrismaticJoint_GetSpeed(jointId:Tb2JointId):single;cdecl;external;
{* @  }
{*
 * @defgroup revolute_joint Revolute Joint
 * @brief A revolute joint allows for relative rotation in the 2D plane with no relative translation.
 *
 * The revolute joint is probably the most common joint. It can be used for ragdolls and chains.
 * Also called a *hinge* or *pin* joint.
 * @
  }
{/ Create a revolute joint }
{/ @see b2RevoluteJointDef for details }
(* Const before type ignored *)
function b2CreateRevoluteJoint(worldId:Tb2WorldId; def:Pb2RevoluteJointDef):Tb2JointId;cdecl;external;
{/ Enable/disable the revolute joint spring }
procedure b2RevoluteJoint_EnableSpring(jointId:Tb2JointId; enableSpring:Tbool);cdecl;external;
{/ It the revolute angular spring enabled? }
function b2RevoluteJoint_IsSpringEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the revolute joint spring stiffness in Hertz }
procedure b2RevoluteJoint_SetSpringHertz(jointId:Tb2JointId; hertz:single);cdecl;external;
{/ Get the revolute joint spring stiffness in Hertz }
function b2RevoluteJoint_GetSpringHertz(jointId:Tb2JointId):single;cdecl;external;
{/ Set the revolute joint spring damping ratio, non-dimensional }
procedure b2RevoluteJoint_SetSpringDampingRatio(jointId:Tb2JointId; dampingRatio:single);cdecl;external;
{/ Get the revolute joint spring damping ratio, non-dimensional }
function b2RevoluteJoint_GetSpringDampingRatio(jointId:Tb2JointId):single;cdecl;external;
{/ Set the revolute joint spring target angle, radians }
procedure b2RevoluteJoint_SetTargetAngle(jointId:Tb2JointId; angle:single);cdecl;external;
{/ Get the revolute joint spring target angle, radians }
function b2RevoluteJoint_GetTargetAngle(jointId:Tb2JointId):single;cdecl;external;
{/ Get the revolute joint current angle in radians relative to the reference angle }
{/ @see b2RevoluteJointDef::referenceAngle }
function b2RevoluteJoint_GetAngle(jointId:Tb2JointId):single;cdecl;external;
{/ Enable/disable the revolute joint limit }
procedure b2RevoluteJoint_EnableLimit(jointId:Tb2JointId; enableLimit:Tbool);cdecl;external;
{/ Is the revolute joint limit enabled? }
function b2RevoluteJoint_IsLimitEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Get the revolute joint lower limit in radians }
function b2RevoluteJoint_GetLowerLimit(jointId:Tb2JointId):single;cdecl;external;
{/ Get the revolute joint upper limit in radians }
function b2RevoluteJoint_GetUpperLimit(jointId:Tb2JointId):single;cdecl;external;
{/ Set the revolute joint limits in radians. It is expected that lower <= upper }
{/ and that -0.99 * B2_PI <= lower && upper <= -0.99 * B2_PI. }
procedure b2RevoluteJoint_SetLimits(jointId:Tb2JointId; lower:single; upper:single);cdecl;external;
{/ Enable/disable a revolute joint motor }
procedure b2RevoluteJoint_EnableMotor(jointId:Tb2JointId; enableMotor:Tbool);cdecl;external;
{/ Is the revolute joint motor enabled? }
function b2RevoluteJoint_IsMotorEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the revolute joint motor speed in radians per second }
procedure b2RevoluteJoint_SetMotorSpeed(jointId:Tb2JointId; motorSpeed:single);cdecl;external;
{/ Get the revolute joint motor speed in radians per second }
function b2RevoluteJoint_GetMotorSpeed(jointId:Tb2JointId):single;cdecl;external;
{/ Get the revolute joint current motor torque, usually in newton-meters }
function b2RevoluteJoint_GetMotorTorque(jointId:Tb2JointId):single;cdecl;external;
{/ Set the revolute joint maximum motor torque, usually in newton-meters }
procedure b2RevoluteJoint_SetMaxMotorTorque(jointId:Tb2JointId; torque:single);cdecl;external;
{/ Get the revolute joint maximum motor torque, usually in newton-meters }
function b2RevoluteJoint_GetMaxMotorTorque(jointId:Tb2JointId):single;cdecl;external;
{*@ }
{*
 * @defgroup weld_joint Weld Joint
 * @brief A weld joint fully constrains the relative transform between two bodies while allowing for springiness
 *
 * A weld joint constrains the relative rotation and translation between two bodies. Both rotation and translation
 * can have damped springs.
 *
 * @note The accuracy of weld joint is limited by the accuracy of the solver. Long chains of weld joints may flex.
 * @
  }
{/ Create a weld joint }
{/ @see b2WeldJointDef for details }
(* Const before type ignored *)
function b2CreateWeldJoint(worldId:Tb2WorldId; def:Pb2WeldJointDef):Tb2JointId;cdecl;external;
{/ Set the weld joint linear stiffness in Hertz. 0 is rigid. }
procedure b2WeldJoint_SetLinearHertz(jointId:Tb2JointId; hertz:single);cdecl;external;
{/ Get the weld joint linear stiffness in Hertz }
function b2WeldJoint_GetLinearHertz(jointId:Tb2JointId):single;cdecl;external;
{/ Set the weld joint linear damping ratio (non-dimensional) }
procedure b2WeldJoint_SetLinearDampingRatio(jointId:Tb2JointId; dampingRatio:single);cdecl;external;
{/ Get the weld joint linear damping ratio (non-dimensional) }
function b2WeldJoint_GetLinearDampingRatio(jointId:Tb2JointId):single;cdecl;external;
{/ Set the weld joint angular stiffness in Hertz. 0 is rigid. }
procedure b2WeldJoint_SetAngularHertz(jointId:Tb2JointId; hertz:single);cdecl;external;
{/ Get the weld joint angular stiffness in Hertz }
function b2WeldJoint_GetAngularHertz(jointId:Tb2JointId):single;cdecl;external;
{/ Set weld joint angular damping ratio, non-dimensional }
procedure b2WeldJoint_SetAngularDampingRatio(jointId:Tb2JointId; dampingRatio:single);cdecl;external;
{/ Get the weld joint angular damping ratio, non-dimensional }
function b2WeldJoint_GetAngularDampingRatio(jointId:Tb2JointId):single;cdecl;external;
{* @  }
{*
 * @defgroup wheel_joint Wheel Joint
 * The wheel joint can be used to simulate wheels on vehicles.
 *
 * The wheel joint restricts body B to move along a local axis in body A. Body B is free to
 * rotate. Supports a linear spring, linear limits, and a rotational motor.
 *
 * @
  }
{/ Create a wheel joint }
{/ @see b2WheelJointDef for details }
(* Const before type ignored *)
function b2CreateWheelJoint(worldId:Tb2WorldId; def:Pb2WheelJointDef):Tb2JointId;cdecl;external;
{/ Enable/disable the wheel joint spring }
procedure b2WheelJoint_EnableSpring(jointId:Tb2JointId; enableSpring:Tbool);cdecl;external;
{/ Is the wheel joint spring enabled? }
function b2WheelJoint_IsSpringEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the wheel joint stiffness in Hertz }
procedure b2WheelJoint_SetSpringHertz(jointId:Tb2JointId; hertz:single);cdecl;external;
{/ Get the wheel joint stiffness in Hertz }
function b2WheelJoint_GetSpringHertz(jointId:Tb2JointId):single;cdecl;external;
{/ Set the wheel joint damping ratio, non-dimensional }
procedure b2WheelJoint_SetSpringDampingRatio(jointId:Tb2JointId; dampingRatio:single);cdecl;external;
{/ Get the wheel joint damping ratio, non-dimensional }
function b2WheelJoint_GetSpringDampingRatio(jointId:Tb2JointId):single;cdecl;external;
{/ Enable/disable the wheel joint limit }
procedure b2WheelJoint_EnableLimit(jointId:Tb2JointId; enableLimit:Tbool);cdecl;external;
{/ Is the wheel joint limit enabled? }
function b2WheelJoint_IsLimitEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Get the wheel joint lower limit }
function b2WheelJoint_GetLowerLimit(jointId:Tb2JointId):single;cdecl;external;
{/ Get the wheel joint upper limit }
function b2WheelJoint_GetUpperLimit(jointId:Tb2JointId):single;cdecl;external;
{/ Set the wheel joint limits }
procedure b2WheelJoint_SetLimits(jointId:Tb2JointId; lower:single; upper:single);cdecl;external;
{/ Enable/disable the wheel joint motor }
procedure b2WheelJoint_EnableMotor(jointId:Tb2JointId; enableMotor:Tbool);cdecl;external;
{/ Is the wheel joint motor enabled? }
function b2WheelJoint_IsMotorEnabled(jointId:Tb2JointId):Tbool;cdecl;external;
{/ Set the wheel joint motor speed in radians per second }
procedure b2WheelJoint_SetMotorSpeed(jointId:Tb2JointId; motorSpeed:single);cdecl;external;
{/ Get the wheel joint motor speed in radians per second }
function b2WheelJoint_GetMotorSpeed(jointId:Tb2JointId):single;cdecl;external;
{/ Set the wheel joint maximum motor torque, usually in newton-meters }
procedure b2WheelJoint_SetMaxMotorTorque(jointId:Tb2JointId; torque:single);cdecl;external;
{/ Get the wheel joint maximum motor torque, usually in newton-meters }
function b2WheelJoint_GetMaxMotorTorque(jointId:Tb2JointId):single;cdecl;external;
{/ Get the wheel joint current motor torque, usually in newton-meters }
function b2WheelJoint_GetMotorTorque(jointId:Tb2JointId):single;cdecl;external;
{*@ }
{*@ }
{*
 * @defgroup contact Contact
 * Access to contacts
 * @
  }
{/ Contact identifier validation. Provides validation for up to 2^32 allocations. }
function b2Contact_IsValid(id:Tb2ContactId):Tbool;cdecl;external;
{/ Get the data for a contact. The manifold may have no points if the contact is not touching. }
function b2Contact_GetData(contactId:Tb2ContactId):Tb2ContactData;cdecl;external;
{*@ }

implementation


end.
