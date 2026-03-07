unit types;

interface

uses
  fp_box2d, math_functions, id;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  B2_DEFAULT_CATEGORY_BITS = 1;  
  B2_DEFAULT_MASK_BITS = UINT64_MAX;  
type
  Tb2TaskCallback = procedure (startIndex:longint; endIndex:longint; workerIndex:Tuint32_t; taskContext:pointer);cdecl;
  Tb2EnqueueTaskCallback = function (task:Tb2TaskCallback; itemCount:longint; minRange:longint; taskContext:pointer; userContext:pointer):pointer;cdecl;
  Tb2FinishTaskCallback = procedure (userTask:pointer; userContext:pointer);cdecl;
  Tb2FrictionCallback = function (frictionA:single; userMaterialIdA:Tuint64_t; frictionB:single; userMaterialIdB:Tuint64_t):single;cdecl;
  Tb2RestitutionCallback = function (restitutionA:single; userMaterialIdA:Tuint64_t; restitutionB:single; userMaterialIdB:Tuint64_t):single;cdecl;

  Tb2RayResult = record
      shapeId : Tb2ShapeId;
      point : Tb2Vec2;
      normal : Tb2Vec2;
      fraction : single;
      nodeVisits : longint;
      leafVisits : longint;
      hit : Tbool;
    end;
  Pb2RayResult = ^Tb2RayResult;

  Tb2WorldDef = record
      gravity : Tb2Vec2;
      restitutionThreshold : single;
      hitEventThreshold : single;
      contactHertz : single;
      contactDampingRatio : single;
      contactSpeed : single;
      maximumLinearSpeed : single;
      frictionCallback : Tb2FrictionCallback;
      restitutionCallback : Tb2RestitutionCallback;
      enableSleep : Tbool;
      enableContinuous : Tbool;
      enableContactSoftening : Tbool;
      workerCount : longint;
      enqueueTask : Tb2EnqueueTaskCallback;
      finishTask : Tb2FinishTaskCallback;
      userTaskContext : pointer;
      userData : pointer;
      internalValue : longint;
    end;
  Pb2WorldDef = ^Tb2WorldDef;

function b2DefaultWorldDef:Tb2WorldDef;cdecl;external libbox2d;
type
  Pb2BodyType = ^Tb2BodyType;
  Tb2BodyType =  Longint;
  Const
    b2_staticBody = 0;
    b2_kinematicBody = 1;
    b2_dynamicBody = 2;
    b2_bodyTypeCount = 3;
type
  Tb2MotionLocks = record
      linearX : Tbool;
      linearY : Tbool;
      angularZ : Tbool;
    end;
  Pb2MotionLocks = ^Tb2MotionLocks;

  Tb2BodyDef = record
      _type : Tb2BodyType;
      position : Tb2Vec2;
      rotation : Tb2Rot;
      linearVelocity : Tb2Vec2;
      angularVelocity : single;
      linearDamping : single;
      angularDamping : single;
      gravityScale : single;
      sleepThreshold : single;
      name : Pchar;
      userData : pointer;
      motionLocks : Tb2MotionLocks;
      enableSleep : Tbool;
      isAwake : Tbool;
      isBullet : Tbool;
      isEnabled : Tbool;
      allowFastRotation : Tbool;
      internalValue : longint;
    end;
  Pb2BodyDef = ^Tb2BodyDef;

function b2DefaultBodyDef:Tb2BodyDef;cdecl;external libbox2d;
type
  Tb2Filter = record
      categoryBits : Tuint64_t;
      maskBits : Tuint64_t;
      groupIndex : longint;
    end;
  Pb2Filter = ^Tb2Filter;

function b2DefaultFilter:Tb2Filter;cdecl;external libbox2d;
type
  Tb2QueryFilter = record
      categoryBits : Tuint64_t;
      maskBits : Tuint64_t;
    end;
  Pb2QueryFilter = ^Tb2QueryFilter;

function b2DefaultQueryFilter:Tb2QueryFilter;cdecl;external libbox2d;
type
  Pb2ShapeType = ^Tb2ShapeType;
  Tb2ShapeType =  Longint;
  Const
    b2_circleShape = 0;
    b2_capsuleShape = 1;
    b2_segmentShape = 2;
    b2_polygonShape = 3;
    b2_chainSegmentShape = 4;
    b2_shapeTypeCount = 5;
type
  Tb2SurfaceMaterial = record
      friction : single;
      restitution : single;
      rollingResistance : single;
      tangentSpeed : single;
      userMaterialId : Tuint64_t;
      customColor : Tuint32_t;
    end;
  Pb2SurfaceMaterial = ^Tb2SurfaceMaterial;

function b2DefaultSurfaceMaterial:Tb2SurfaceMaterial;cdecl;external libbox2d;
type
  Tb2ShapeDef = record
      userData : pointer;
      material : Tb2SurfaceMaterial;
      density : single;
      filter : Tb2Filter;
      enableCustomFiltering : Tbool;
      isSensor : Tbool;
      enableSensorEvents : Tbool;
      enableContactEvents : Tbool;
      enableHitEvents : Tbool;
      enablePreSolveEvents : Tbool;
      invokeContactCreation : Tbool;
      updateBodyMass : Tbool;
      internalValue : longint;
    end;
  Pb2ShapeDef = ^Tb2ShapeDef;

function b2DefaultShapeDef:Tb2ShapeDef;cdecl;external libbox2d;
type
  Tb2ChainDef = record
      userData : pointer;
      points : Pb2Vec2;
      count : longint;
      materials : Pb2SurfaceMaterial;
      materialCount : longint;
      filter : Tb2Filter;
      isLoop : Tbool;
      enableSensorEvents : Tbool;
      internalValue : longint;
    end;
  Pb2ChainDef = ^Tb2ChainDef;

function b2DefaultChainDef:Tb2ChainDef;cdecl;external libbox2d;
type
  Tb2Profile = record
      step : single;
      pairs : single;
      collide : single;
      solve : single;
      prepareStages : single;
      solveConstraints : single;
      prepareConstraints : single;
      integrateVelocities : single;
      warmStart : single;
      solveImpulses : single;
      integratePositions : single;
      relaxImpulses : single;
      applyRestitution : single;
      storeImpulses : single;
      splitIslands : single;
      transforms : single;
      sensorHits : single;
      jointEvents : single;
      hitEvents : single;
      refit : single;
      bullets : single;
      sleepIslands : single;
      sensors : single;
    end;
  Pb2Profile = ^Tb2Profile;

  Tb2Counters = record
      bodyCount : longint;
      shapeCount : longint;
      contactCount : longint;
      jointCount : longint;
      islandCount : longint;
      stackUsed : longint;
      staticTreeHeight : longint;
      treeHeight : longint;
      byteCount : longint;
      taskCount : longint;
      colorCounts : array[0..23] of longint;
    end;
  Pb2Counters = ^Tb2Counters;
type
  Pb2JointType = ^Tb2JointType;
  Tb2JointType =  Longint;
  Const
    b2_distanceJoint = 0;
    b2_filterJoint = 1;
    b2_motorJoint = 2;
    b2_prismaticJoint = 3;
    b2_revoluteJoint = 4;
    b2_weldJoint = 5;
    b2_wheelJoint = 6;
type
  Tb2JointDef = record
      userData : pointer;
      bodyIdA : Tb2BodyId;
      bodyIdB : Tb2BodyId;
      localFrameA : Tb2Transform;
      localFrameB : Tb2Transform;
      forceThreshold : single;
      torqueThreshold : single;
      constraintHertz : single;
      constraintDampingRatio : single;
      drawScale : single;
      collideConnected : Tbool;
    end;
  Pb2JointDef = ^Tb2JointDef;
{/ Distance joint definition }
{/ Connects a point on body A with a point on body B by a segment. }
{/ Useful for ropes and springs. }
{/ @ingroup distance_joint }
{/ Base joint definition }
{/ The rest length of this joint. Clamped to a stable minimum value. }
{/ Enable the distance constraint to behave like a spring. If false }
{/ then the distance joint will be rigid, overriding the limit and motor. }
{/ The lower spring force controls how much tension it can sustain }
{/ The upper spring force controls how much compression it an sustain }
{/ The spring linear stiffness Hertz, cycles per second }
{/ The spring linear damping ratio, non-dimensional }
{/ Enable/disable the joint limit }
{/ Minimum length for limit. Clamped to a stable minimum value. }
{/ Maximum length for limit. Must be greater than or equal to the minimum length. }
{/ Enable/disable the joint motor }
{/ The maximum motor force, usually in newtons }
{/ The desired motor speed, usually in meters per second }
{/ Used internally to detect a valid definition. DO NOT SET. }

  Pb2DistanceJointDef = ^Tb2DistanceJointDef;
  Tb2DistanceJointDef = record
      base : Tb2JointDef;
      length : single;
      enableSpring : Tbool;
      lowerSpringForce : single;
      upperSpringForce : single;
      hertz : single;
      dampingRatio : single;
      enableLimit : Tbool;
      minLength : single;
      maxLength : single;
      enableMotor : Tbool;
      maxMotorForce : single;
      motorSpeed : single;
      internalValue : longint;
    end;
{/ Use this to initialize your joint definition }
{/ @ingroup distance_joint }

function b2DefaultDistanceJointDef:Tb2DistanceJointDef;cdecl;external libbox2d;
{/ A motor joint is used to control the relative velocity and or transform between two bodies. }
{/ With a velocity of zero this acts like top-down friction. }
{/ @ingroup motor_joint }
{/ Base joint definition }
{/ The desired linear velocity }
{/ The maximum motor force in newtons }
{/ The desired angular velocity }
{/ The maximum motor torque in newton-meters }
{/ Linear spring hertz for position control }
{/ Linear spring damping ratio }
{/ Maximum spring force in newtons }
{/ Angular spring hertz for position control }
{/ Angular spring damping ratio }
{/ Maximum spring torque in newton-meters }
{/ Used internally to detect a valid definition. DO NOT SET. }
type
  Pb2MotorJointDef = ^Tb2MotorJointDef;
  Tb2MotorJointDef = record
      base : Tb2JointDef;
      linearVelocity : Tb2Vec2;
      maxVelocityForce : single;
      angularVelocity : single;
      maxVelocityTorque : single;
      linearHertz : single;
      linearDampingRatio : single;
      maxSpringForce : single;
      angularHertz : single;
      angularDampingRatio : single;
      maxSpringTorque : single;
      internalValue : longint;
    end;
{/ Use this to initialize your joint definition }
{/ @ingroup motor_joint }

function b2DefaultMotorJointDef:Tb2MotorJointDef;cdecl;external libbox2d;
{/ A filter joint is used to disable collision between two specific bodies. }
{/ }
{/ @ingroup filter_joint }
{/ Base joint definition }
{/ Used internally to detect a valid definition. DO NOT SET. }
type
  Pb2FilterJointDef = ^Tb2FilterJointDef;
  Tb2FilterJointDef = record
      base : Tb2JointDef;
      internalValue : longint;
    end;
{/ Use this to initialize your joint definition }
{/ @ingroup filter_joint }

function b2DefaultFilterJointDef:Tb2FilterJointDef;cdecl;external libbox2d;
{/ Prismatic joint definition }
{/ Body B may slide along the x-axis in local frame A. Body B cannot rotate relative to body A. }
{/ The joint translation is zero when the local frame origins coincide in world space. }
{/ @ingroup prismatic_joint }
{/ Base joint definition }
{/ Enable a linear spring along the prismatic joint axis }
{/ The spring stiffness Hertz, cycles per second }
{/ The spring damping ratio, non-dimensional }
{/ The target translation for the joint in meters. The spring-damper will drive }
{/ to this translation. }
{/ Enable/disable the joint limit }
{/ The lower translation limit }
{/ The upper translation limit }
{/ Enable/disable the joint motor }
{/ The maximum motor force, typically in newtons }
{/ The desired motor speed, typically in meters per second }
{/ Used internally to detect a valid definition. DO NOT SET. }
type
  Pb2PrismaticJointDef = ^Tb2PrismaticJointDef;
  Tb2PrismaticJointDef = record
      base : Tb2JointDef;
      enableSpring : Tbool;
      hertz : single;
      dampingRatio : single;
      targetTranslation : single;
      enableLimit : Tbool;
      lowerTranslation : single;
      upperTranslation : single;
      enableMotor : Tbool;
      maxMotorForce : single;
      motorSpeed : single;
      internalValue : longint;
    end;
{/ Use this to initialize your joint definition }
{/ @ingroup prismatic_joint }

function b2DefaultPrismaticJointDef:Tb2PrismaticJointDef;cdecl;external libbox2d;
{/ Revolute joint definition }
{/ A point on body B is fixed to a point on body A. Allows relative rotation. }
{/ @ingroup revolute_joint }
{/ Base joint definition }
{/ The target angle for the joint in radians. The spring-damper will drive }
{/ to this angle. }
{/ Enable a rotational spring on the revolute hinge axis }
{/ The spring stiffness Hertz, cycles per second }
{/ The spring damping ratio, non-dimensional }
{/ A flag to enable joint limits }
{/ The lower angle for the joint limit in radians. Minimum of -0.99*pi radians. }
{/ The upper angle for the joint limit in radians. Maximum of 0.99*pi radians. }
{/ A flag to enable the joint motor }
{/ The maximum motor torque, typically in newton-meters }
{/ The desired motor speed in radians per second }
{/ Used internally to detect a valid definition. DO NOT SET. }
type
  Pb2RevoluteJointDef = ^Tb2RevoluteJointDef;
  Tb2RevoluteJointDef = record
      base : Tb2JointDef;
      targetAngle : single;
      enableSpring : Tbool;
      hertz : single;
      dampingRatio : single;
      enableLimit : Tbool;
      lowerAngle : single;
      upperAngle : single;
      enableMotor : Tbool;
      maxMotorTorque : single;
      motorSpeed : single;
      internalValue : longint;
    end;
{/ Use this to initialize your joint definition. }
{/ @ingroup revolute_joint }

function b2DefaultRevoluteJointDef:Tb2RevoluteJointDef;cdecl;external libbox2d;
{/ Weld joint definition }
{/ Connects two bodies together rigidly. This constraint provides springs to mimic }
{/ soft-body simulation. }
{/ @note The approximate solver in Box2D cannot hold many bodies together rigidly }
{/ @ingroup weld_joint }
{/ Base joint definition }
{/ Linear stiffness expressed as Hertz (cycles per second). Use zero for maximum stiffness. }
{/ Angular stiffness as Hertz (cycles per second). Use zero for maximum stiffness. }
{/ Linear damping ratio, non-dimensional. Use 1 for critical damping. }
{/ Linear damping ratio, non-dimensional. Use 1 for critical damping. }
{/ Used internally to detect a valid definition. DO NOT SET. }
type
  Pb2WeldJointDef = ^Tb2WeldJointDef;
  Tb2WeldJointDef = record
      base : Tb2JointDef;
      linearHertz : single;
      angularHertz : single;
      linearDampingRatio : single;
      angularDampingRatio : single;
      internalValue : longint;
    end;
{/ Use this to initialize your joint definition }
{/ @ingroup weld_joint }

function b2DefaultWeldJointDef:Tb2WeldJointDef;cdecl;external libbox2d;
{/ Wheel joint definition }
{/ Body B is a wheel that may rotate freely and slide along the local x-axis in frame A. }
{/ The joint translation is zero when the local frame origins coincide in world space. }
{/ @ingroup wheel_joint }
{/ Base joint definition }
{/ Enable a linear spring along the local axis }
{/ Spring stiffness in Hertz }
{/ Spring damping ratio, non-dimensional }
{/ Enable/disable the joint linear limit }
{/ The lower translation limit }
{/ The upper translation limit }
{/ Enable/disable the joint rotational motor }
{/ The maximum motor torque, typically in newton-meters }
{/ The desired motor speed in radians per second }
{/ Used internally to detect a valid definition. DO NOT SET. }
type
  Pb2WheelJointDef = ^Tb2WheelJointDef;
  Tb2WheelJointDef = record
      base : Tb2JointDef;
      enableSpring : Tbool;
      hertz : single;
      dampingRatio : single;
      enableLimit : Tbool;
      lowerTranslation : single;
      upperTranslation : single;
      enableMotor : Tbool;
      maxMotorTorque : single;
      motorSpeed : single;
      internalValue : longint;
    end;
{/ Use this to initialize your joint definition }
{/ @ingroup wheel_joint }

function b2DefaultWheelJointDef:Tb2WheelJointDef;cdecl;external libbox2d;
{/ The explosion definition is used to configure options for explosions. Explosions }
{/ consider shape geometry when computing the impulse. }
{/ @ingroup world }
{/ Mask bits to filter shapes }
{/ The center of the explosion in world space }
{/ The radius of the explosion }
{/ The falloff distance beyond the radius. Impulse is reduced to zero at this distance. }
{/ Impulse per unit length. This applies an impulse according to the shape perimeter that }
{/ is facing the explosion. Explosions only apply to circles, capsules, and polygons. This }
{/ may be negative for implosions. }
type
  Pb2ExplosionDef = ^Tb2ExplosionDef;
  Tb2ExplosionDef = record
      maskBits : Tuint64_t;
      position : Tb2Vec2;
      radius : single;
      falloff : single;
      impulsePerLength : single;
    end;
{/ Use this to initialize your explosion definition }
{/ @ingroup world }

function b2DefaultExplosionDef:Tb2ExplosionDef;cdecl;external libbox2d;
{*
 * @defgroup events Events
 * World event types.
 *
 * Events are used to collect events that occur during the world time step. These events
 * are then available to query after the time step is complete. This is preferable to callbacks
 * because Box2D uses multithreaded simulation.
 *
 * Also when events occur in the simulation step it may be problematic to modify the world, which is
 * often what applications want to do when events occur.
 *
 * With event arrays, you can scan the events in a loop and modify the world. However, you need to be careful
 * that some event data may become invalid. There are several samples that show how to do this safely.
 *
 * @
  }
{/ A begin touch event is generated when a shape starts to overlap a sensor shape. }
{/ The id of the sensor shape }
{/ The id of the shape that began touching the sensor shape }
type
  Pb2SensorBeginTouchEvent = ^Tb2SensorBeginTouchEvent;
  Tb2SensorBeginTouchEvent = record
      sensorShapeId : Tb2ShapeId;
      visitorShapeId : Tb2ShapeId;
    end;
{/ An end touch event is generated when a shape stops overlapping a sensor shape. }
{/	These include things like setting the transform, destroying a body or shape, or changing }
{/	a filter. You will also get an end event if the sensor or visitor are destroyed. }
{/	Therefore you should always confirm the shape id is valid using b2Shape_IsValid. }
{/ The id of the sensor shape }
{/	@warning this shape may have been destroyed }
{/	@see b2Shape_IsValid }
{/ The id of the shape that stopped touching the sensor shape }
{/	@warning this shape may have been destroyed }
{/	@see b2Shape_IsValid }

  Pb2SensorEndTouchEvent = ^Tb2SensorEndTouchEvent;
  Tb2SensorEndTouchEvent = record
      sensorShapeId : Tb2ShapeId;
      visitorShapeId : Tb2ShapeId;
    end;
{/ Sensor events are buffered in the world and are available }
{/ as begin/end overlap event arrays after the time step is complete. }
{/ Note: these may become invalid if bodies and/or shapes are destroyed }
{/ Array of sensor begin touch events }
{/ Array of sensor end touch events }
{/ The number of begin touch events }
{/ The number of end touch events }

  Pb2SensorEvents = ^Tb2SensorEvents;
  Tb2SensorEvents = record
      beginEvents : Pb2SensorBeginTouchEvent;
      endEvents : Pb2SensorEndTouchEvent;
      beginCount : longint;
      endCount : longint;
    end;
{/ A begin touch event is generated when two shapes begin touching. }
{/ Id of the first shape }
{/ Id of the second shape }
{/ The transient contact id. This contact maybe destroyed automatically when the world is modified or simulated. }
{/ Used b2Contact_IsValid before using this id. }

  Pb2ContactBeginTouchEvent = ^Tb2ContactBeginTouchEvent;
  Tb2ContactBeginTouchEvent = record
      shapeIdA : Tb2ShapeId;
      shapeIdB : Tb2ShapeId;
      contactId : Tb2ContactId;
    end;
{/ An end touch event is generated when two shapes stop touching. }
{/	You will get an end event if you do anything that destroys contacts previous to the last }
{/	world step. These include things like setting the transform, destroying a body }
{/	or shape, or changing a filter or body type. }
{/ Id of the first shape }
{/	@warning this shape may have been destroyed }
{/	@see b2Shape_IsValid }
{/ Id of the second shape }
{/	@warning this shape may have been destroyed }
{/	@see b2Shape_IsValid }
{/ Id of the contact. }
{/	@warning this contact may have been destroyed }
{/	@see b2Contact_IsValid }

  Pb2ContactEndTouchEvent = ^Tb2ContactEndTouchEvent;
  Tb2ContactEndTouchEvent = record
      shapeIdA : Tb2ShapeId;
      shapeIdB : Tb2ShapeId;
      contactId : Tb2ContactId;
    end;
{/ A hit touch event is generated when two shapes collide with a speed faster than the hit speed threshold. }
{/ This may be reported for speculative contacts that have a confirmed impulse. }
{/ Id of the first shape }
{/ Id of the second shape }
{/ Id of the contact. }
{/	@warning this contact may have been destroyed }
{/	@see b2Contact_IsValid }
{/ Point where the shapes hit at the beginning of the time step. }
{/ This is a mid-point between the two surfaces. It could be at speculative }
{/ point where the two shapes were not touching at the beginning of the time step. }
{/ Normal vector pointing from shape A to shape B }
{/ The speed the shapes are approaching. Always positive. Typically in meters per second. }

  Pb2ContactHitEvent = ^Tb2ContactHitEvent;
  Tb2ContactHitEvent = record
      shapeIdA : Tb2ShapeId;
      shapeIdB : Tb2ShapeId;
      contactId : Tb2ContactId;
      point : Tb2Vec2;
      normal : Tb2Vec2;
      approachSpeed : single;
    end;
{/ Contact events are buffered in the Box2D world and are available }
{/ as event arrays after the time step is complete. }
{/ Note: these may become invalid if bodies and/or shapes are destroyed }
{/ Array of begin touch events }
{/ Array of end touch events }
{/ Array of hit events }
{/ Number of begin touch events }
{/ Number of end touch events }
{/ Number of hit events }

  Pb2ContactEvents = ^Tb2ContactEvents;
  Tb2ContactEvents = record
      beginEvents : Pb2ContactBeginTouchEvent;
      endEvents : Pb2ContactEndTouchEvent;
      hitEvents : Pb2ContactHitEvent;
      beginCount : longint;
      endCount : longint;
      hitCount : longint;
    end;
{/ Body move events triggered when a body moves. }
{/ Triggered when a body moves due to simulation. Not reported for bodies moved by the user. }
{/ This also has a flag to indicate that the body went to sleep so the application can also }
{/ sleep that actor/entity/object associated with the body. }
{/ On the other hand if the flag does not indicate the body went to sleep then the application }
{/ can treat the actor/entity/object associated with the body as awake. }
{/ This is an efficient way for an application to update game object transforms rather than }
{/ calling functions such as b2Body_GetTransform() because this data is delivered as a contiguous array }
{/ and it is only populated with bodies that have moved. }
{/ @note If sleeping is disabled all dynamic and kinematic bodies will trigger move events. }

  Pb2BodyMoveEvent = ^Tb2BodyMoveEvent;
  Tb2BodyMoveEvent = record
      userData : pointer;
      transform : Tb2Transform;
      bodyId : Tb2BodyId;
      fellAsleep : Tbool;
    end;
{/ Body events are buffered in the Box2D world and are available }
{/ as event arrays after the time step is complete. }
{/ Note: this data becomes invalid if bodies are destroyed }
{/ Array of move events }
{/ Number of move events }

  Pb2BodyEvents = ^Tb2BodyEvents;
  Tb2BodyEvents = record
      moveEvents : Pb2BodyMoveEvent;
      moveCount : longint;
    end;
{/ Joint events report joints that are awake and have a force and/or torque exceeding the threshold }
{/ The observed forces and torques are not returned for efficiency reasons. }
{/ The joint id }
{/ The user data from the joint for convenience }

  Pb2JointEvent = ^Tb2JointEvent;
  Tb2JointEvent = record
      jointId : Tb2JointId;
      userData : pointer;
    end;
{/ Joint events are buffered in the world and are available }
{/ as event arrays after the time step is complete. }
{/ Note: this data becomes invalid if joints are destroyed }
{/ Array of events }
{/ Number of events }

  Pb2JointEvents = ^Tb2JointEvents;
  Tb2JointEvents = record
      jointEvents : Pb2JointEvent;
      count : longint;
    end;
{/ The contact data for two shapes. By convention the manifold normal points }
{/ from shape A to shape B. }
{/ @see b2Shape_GetContactData() and b2Body_GetContactData() }

  Pb2ContactData = ^Tb2ContactData;
  Tb2ContactData = record
      contactId : Tb2ContactId;
      shapeIdA : Tb2ShapeId;
      shapeIdB : Tb2ShapeId;
      manifold : Tb2Manifold;
    end;
{*@ }
{/ Prototype for a contact filter callback. }
{/ This is called when a contact pair is considered for collision. This allows you to }
{/ perform custom logic to prevent collision between shapes. This is only called if }
{/ one of the two shapes has custom filtering enabled. }
{/ Notes: }
{/ - this function must be thread-safe }
{/ - this is only called if one of the two shapes has enabled custom filtering }
{/ - this may be called for awake dynamic bodies and sensors }
{/ Return false if you want to disable the collision }
{/ @see b2ShapeDef }
{/ @warning Do not attempt to modify the world inside this callback }
{/ @ingroup world }

  Tb2CustomFilterFcn = function (shapeIdA:Tb2ShapeId; shapeIdB:Tb2ShapeId; context:pointer):Tbool;cdecl;
{/ Prototype for a pre-solve callback. }
{/ This is called after a contact is updated. This allows you to inspect a }
{/ contact before it goes to the solver. If you are careful, you can modify the }
{/ contact manifold (e.g. modify the normal). }
{/ Notes: }
{/ - this function must be thread-safe }
{/ - this is only called if the shape has enabled pre-solve events }
{/ - this is called only for awake dynamic bodies }
{/ - this is not called for sensors }
{/ - the supplied manifold has impulse values from the previous step }
{/ Return false if you want to disable the contact this step }
{/ @warning Do not attempt to modify the world inside this callback }
{/ @ingroup world }

  Tb2PreSolveFcn = function (shapeIdA:Tb2ShapeId; shapeIdB:Tb2ShapeId; point:Tb2Vec2; normal:Tb2Vec2; context:pointer):Tbool;cdecl;
{/ Prototype callback for overlap queries. }
{/ Called for each shape found in the query. }
{/ @see b2World_OverlapABB }
{/ @return false to terminate the query. }
{/ @ingroup world }

  Tb2OverlapResultFcn = function (shapeId:Tb2ShapeId; context:pointer):Tbool;cdecl;
{/ Prototype callback for ray and shape casts. }
{/ Called for each shape found in the query. You control how the ray cast }
{/ proceeds by returning a float: }
{/ return -1: ignore this shape and continue }
{/ return 0: terminate the ray cast }
{/ return fraction: clip the ray to this point }
{/ return 1: don't clip the ray and continue }
{/ A cast with initial overlap will return a zero fraction and a zero normal. }
{/ @param shapeId the shape hit by the ray }
{/ @param point the point of initial intersection }
{/ @param normal the normal vector at the point of intersection, zero for a shape cast with initial overlap }
{/ @param fraction the fraction along the ray at the point of intersection, zero for a shape cast with initial overlap }
{/ @param context the user context }
{/ @return -1 to filter, 0 to terminate, fraction to clip the ray for closest hit, 1 to continue }
{/ @see b2World_CastRay }
{/ @ingroup world }

  Tb2CastResultFcn = function (shapeId:Tb2ShapeId; point:Tb2Vec2; normal:Tb2Vec2; fraction:single; context:pointer):single;cdecl;
{ Used to collect collision planes for character movers. }
{ Return true to continue gathering planes. }

  Tb2PlaneResultFcn = function (shapeId:Tb2ShapeId; plane:Pb2PlaneResult; context:pointer):Tbool;cdecl;
{/ These colors are used for debug draw and mostly match the named SVG colors. }
{/ See https://www.rapidtables.com/web/color/index.html }
{/ https://johndecember.com/html/spec/colorsvg.html }
{/ https://upload.wikimedia.org/wikipedia/commons/2/2b/SVG_Recognized_color_keyword_names.svg }

  Pb2HexColor = ^Tb2HexColor;
  Tb2HexColor =  Longint;
  Const
    b2_colorAliceBlue = $F0F8FF;
    b2_colorAntiqueWhite = $FAEBD7;
    b2_colorAqua = $00FFFF;
    b2_colorAquamarine = $7FFFD4;
    b2_colorAzure = $F0FFFF;
    b2_colorBeige = $F5F5DC;
    b2_colorBisque = $FFE4C4;
    b2_colorBlack = $000000;
    b2_colorBlanchedAlmond = $FFEBCD;
    b2_colorBlue = $0000FF;
    b2_colorBlueViolet = $8A2BE2;
    b2_colorBrown = $A52A2A;
    b2_colorBurlywood = $DEB887;
    b2_colorCadetBlue = $5F9EA0;
    b2_colorChartreuse = $7FFF00;
    b2_colorChocolate = $D2691E;
    b2_colorCoral = $FF7F50;
    b2_colorCornflowerBlue = $6495ED;
    b2_colorCornsilk = $FFF8DC;
    b2_colorCrimson = $DC143C;
    b2_colorCyan = $00FFFF;
    b2_colorDarkBlue = $00008B;
    b2_colorDarkCyan = $008B8B;
    b2_colorDarkGoldenRod = $B8860B;
    b2_colorDarkGray = $A9A9A9;
    b2_colorDarkGreen = $006400;
    b2_colorDarkKhaki = $BDB76B;
    b2_colorDarkMagenta = $8B008B;
    b2_colorDarkOliveGreen = $556B2F;
    b2_colorDarkOrange = $FF8C00;
    b2_colorDarkOrchid = $9932CC;
    b2_colorDarkRed = $8B0000;
    b2_colorDarkSalmon = $E9967A;
    b2_colorDarkSeaGreen = $8FBC8F;
    b2_colorDarkSlateBlue = $483D8B;
    b2_colorDarkSlateGray = $2F4F4F;
    b2_colorDarkTurquoise = $00CED1;
    b2_colorDarkViolet = $9400D3;
    b2_colorDeepPink = $FF1493;
    b2_colorDeepSkyBlue = $00BFFF;
    b2_colorDimGray = $696969;
    b2_colorDodgerBlue = $1E90FF;
    b2_colorFireBrick = $B22222;
    b2_colorFloralWhite = $FFFAF0;
    b2_colorForestGreen = $228B22;
    b2_colorFuchsia = $FF00FF;
    b2_colorGainsboro = $DCDCDC;
    b2_colorGhostWhite = $F8F8FF;
    b2_colorGold = $FFD700;
    b2_colorGoldenRod = $DAA520;
    b2_colorGray = $808080;
    b2_colorGreen = $008000;
    b2_colorGreenYellow = $ADFF2F;
    b2_colorHoneyDew = $F0FFF0;
    b2_colorHotPink = $FF69B4;
    b2_colorIndianRed = $CD5C5C;
    b2_colorIndigo = $4B0082;
    b2_colorIvory = $FFFFF0;
    b2_colorKhaki = $F0E68C;
    b2_colorLavender = $E6E6FA;
    b2_colorLavenderBlush = $FFF0F5;
    b2_colorLawnGreen = $7CFC00;
    b2_colorLemonChiffon = $FFFACD;
    b2_colorLightBlue = $ADD8E6;
    b2_colorLightCoral = $F08080;
    b2_colorLightCyan = $E0FFFF;
    b2_colorLightGoldenRodYellow = $FAFAD2;
    b2_colorLightGray = $D3D3D3;
    b2_colorLightGreen = $90EE90;
    b2_colorLightPink = $FFB6C1;
    b2_colorLightSalmon = $FFA07A;
    b2_colorLightSeaGreen = $20B2AA;
    b2_colorLightSkyBlue = $87CEFA;
    b2_colorLightSlateGray = $778899;
    b2_colorLightSteelBlue = $B0C4DE;
    b2_colorLightYellow = $FFFFE0;
    b2_colorLime = $00FF00;
    b2_colorLimeGreen = $32CD32;
    b2_colorLinen = $FAF0E6;
    b2_colorMagenta = $FF00FF;
    b2_colorMaroon = $800000;
    b2_colorMediumAquaMarine = $66CDAA;
    b2_colorMediumBlue = $0000CD;
    b2_colorMediumOrchid = $BA55D3;
    b2_colorMediumPurple = $9370DB;
    b2_colorMediumSeaGreen = $3CB371;
    b2_colorMediumSlateBlue = $7B68EE;
    b2_colorMediumSpringGreen = $00FA9A;
    b2_colorMediumTurquoise = $48D1CC;
    b2_colorMediumVioletRed = $C71585;
    b2_colorMidnightBlue = $191970;
    b2_colorMintCream = $F5FFFA;
    b2_colorMistyRose = $FFE4E1;
    b2_colorMoccasin = $FFE4B5;
    b2_colorNavajoWhite = $FFDEAD;
    b2_colorNavy = $000080;
    b2_colorOldLace = $FDF5E6;
    b2_colorOlive = $808000;
    b2_colorOliveDrab = $6B8E23;
    b2_colorOrange = $FFA500;
    b2_colorOrangeRed = $FF4500;
    b2_colorOrchid = $DA70D6;
    b2_colorPaleGoldenRod = $EEE8AA;
    b2_colorPaleGreen = $98FB98;
    b2_colorPaleTurquoise = $AFEEEE;
    b2_colorPaleVioletRed = $DB7093;
    b2_colorPapayaWhip = $FFEFD5;
    b2_colorPeachPuff = $FFDAB9;
    b2_colorPeru = $CD853F;
    b2_colorPink = $FFC0CB;
    b2_colorPlum = $DDA0DD;
    b2_colorPowderBlue = $B0E0E6;
    b2_colorPurple = $800080;
    b2_colorRebeccaPurple = $663399;
    b2_colorRed = $FF0000;
    b2_colorRosyBrown = $BC8F8F;
    b2_colorRoyalBlue = $4169E1;
    b2_colorSaddleBrown = $8B4513;
    b2_colorSalmon = $FA8072;
    b2_colorSandyBrown = $F4A460;
    b2_colorSeaGreen = $2E8B57;
    b2_colorSeaShell = $FFF5EE;
    b2_colorSienna = $A0522D;
    b2_colorSilver = $C0C0C0;
    b2_colorSkyBlue = $87CEEB;
    b2_colorSlateBlue = $6A5ACD;
    b2_colorSlateGray = $708090;
    b2_colorSnow = $FFFAFA;
    b2_colorSpringGreen = $00FF7F;
    b2_colorSteelBlue = $4682B4;
    b2_colorTan = $D2B48C;
    b2_colorTeal = $008080;
    b2_colorThistle = $D8BFD8;
    b2_colorTomato = $FF6347;
    b2_colorTurquoise = $40E0D0;
    b2_colorViolet = $EE82EE;
    b2_colorWheat = $F5DEB3;
    b2_colorWhite = $FFFFFF;
    b2_colorWhiteSmoke = $F5F5F5;
    b2_colorYellow = $FFFF00;
    b2_colorYellowGreen = $9ACD32;
    b2_colorBox2DRed = $DC3132;
    b2_colorBox2DBlue = $30AEBF;
    b2_colorBox2DGreen = $8CC924;
    b2_colorBox2DYellow = $FFEE8C;
;
{/ This struct holds callbacks you can implement to draw a Box2D world. }
{/ This structure should be zero initialized. }
{/ @ingroup world }
{/ Draw a closed polygon provided in CCW order. }
{/ Draw a solid closed polygon provided in CCW order. }
{/ Draw a circle. }
{/ Draw a solid circle. }
{/ Draw a solid capsule. }
{/ Draw a line segment. }
{/ Draw a transform. Choose your own length scale. }
{/ Draw a point. }
{/ Draw a string in world space }
{/ World bounds to use for debug draw }
{/ Scale to use when drawing forces }
{/ Global scaling for joint drawing }
{/ Option to draw shapes }
{/ Option to draw joints }
{/ Option to draw additional information for joints }
{/ Option to draw the bounding boxes for shapes }
{/ Option to draw the mass and center of mass of dynamic bodies }
{/ Option to draw body names }
{/ Option to draw contact points }
{/ Option to visualize the graph coloring used for contacts and joints }
{/ Option to draw contact feature ids }
{/ Option to draw contact normals }
{/ Option to draw contact normal forces }
{/ Option to draw contact friction forces }
{/ Option to draw islands as bounding boxes }
{/ User context that is passed as an argument to drawing callback functions }
type
  Pb2DebugDraw = ^Tb2DebugDraw;
  Tb2DebugDraw = record
      DrawPolygonFcn : procedure (vertices:Pb2Vec2; vertexCount:longint; color:Tb2HexColor; context:pointer);cdecl;
      DrawSolidPolygonFcn : procedure (transform:Tb2Transform; vertices:Pb2Vec2; vertexCount:longint; radius:single; color:Tb2HexColor; 
                    context:pointer);cdecl;
      DrawCircleFcn : procedure (center:Tb2Vec2; radius:single; color:Tb2HexColor; context:pointer);cdecl;
      DrawSolidCircleFcn : procedure (transform:Tb2Transform; radius:single; color:Tb2HexColor; context:pointer);cdecl;
      DrawSolidCapsuleFcn : procedure (p1:Tb2Vec2; p2:Tb2Vec2; radius:single; color:Tb2HexColor; context:pointer);cdecl;
      DrawLineFcn : procedure (p1:Tb2Vec2; p2:Tb2Vec2; color:Tb2HexColor; context:pointer);cdecl;
      DrawTransformFcn : procedure (transform:Tb2Transform; context:pointer);cdecl;
      DrawPointFcn : procedure (p:Tb2Vec2; size:single; color:Tb2HexColor; context:pointer);cdecl;
      DrawStringFcn : procedure (p:Tb2Vec2; s:Pchar; color:Tb2HexColor; context:pointer);cdecl;
      drawingBounds : Tb2AABB;
      forceScale : single;
      jointScale : single;
      drawShapes : Tbool;
      drawJoints : Tbool;
      drawJointExtras : Tbool;
      drawBounds : Tbool;
      drawMass : Tbool;
      drawBodyNames : Tbool;
      drawContactPoints : Tbool;
      drawGraphColors : Tbool;
      drawContactFeatures : Tbool;
      drawContactNormals : Tbool;
      drawContactForces : Tbool;
      drawFrictionForces : Tbool;
      drawIslands : Tbool;
      context : pointer;
    end;
{/ Use this to initialize your drawing interface. This allows you to implement a sub-set }
{/ of the drawing functions. }

function b2DefaultDebugDraw:Tb2DebugDraw;cdecl;external libbox2d;

// === Konventiert am: 7-3-26 16:28:40 ===


implementation



end.
