#pragma once

#include <stdalign.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// xxxxxxxxxx static float JPC_PI = 3.14159265358979323846f;

// C-compatible typedefs that match Jolt's internal primitive typedefs.
#define uint unsigned int

#ifdef __cplusplus
extern "C" {
#endif

extern void JPC_RegisterDefaultAllocator();
extern void JPC_FactoryInit();
extern void JPC_FactoryDelete();
extern void JPC_RegisterTypes();
extern void JPC_UnregisterTypes();

////////////////////////////////////////////////////////////////////////////////
// Primitive types

typedef struct JPC_Float3 {
	float x;
	float y;
	float z;
} JPC_Float3;


// Jolt has no type named Vec2 but uses Vector<2> in its API sometimes
typedef struct JPC_Vec2 {
	float x;
	float y;
} JPC_Vec2;


typedef struct JPC_Vec3 {
	 float x;
	float y;
	float z;
	float _w;
} JPC_Vec3;


typedef struct JPC_Vec4 {
	 float x;
	float y;
	float z;
	float w;
} JPC_Vec4;


typedef struct JPC_DVec3 {
 double x;
	double y;
	double z;
	double _w;
} JPC_DVec3;


typedef struct JPC_Quat {
	 float x;
	float y;
	float z;
	float w;
} JPC_Quat;


typedef struct JPC_Mat44 {
	 JPC_Vec4 col[3];
	JPC_Vec3 col3;
} JPC_Mat44;


typedef struct JPC_DMat44 {
	 JPC_Vec4 col[3];
	JPC_DVec3 col3;
} JPC_DMat44;


typedef struct JPC_Color {
 uint8_t r;
	uint8_t g;
	uint8_t b;
	uint8_t a;
} JPC_Color;


	typedef JPC_Vec3 JPC_RVec3;
	typedef JPC_Mat44 JPC_RMat44;
	typedef float Real;


typedef uint32_t JPC_BodyID;

typedef uint32_t JPC_SubShapeID;

typedef uint8_t JPC_BroadPhaseLayer;

#ifndef JPC_OBJECT_LAYER_BITS
	#define JPC_OBJECT_LAYER_BITS 16
#endif

	typedef uint16_t JPC_ObjectLayer;


typedef struct JPC_IndexedTriangleNoMaterial {
	uint32_t idx[3];
} JPC_IndexedTriangleNoMaterial;


typedef struct JPC_IndexedTriangle {
	uint32_t idx[3];
	uint32_t materialIndex;
	uint32_t userData;
} JPC_IndexedTriangle;


typedef struct JPC_RayCast {
	JPC_Vec3 Origin;
	JPC_Vec3 Direction;
} JPC_RayCast;

typedef struct JPC_RRayCast {
	JPC_RVec3 Origin;
	JPC_Vec3 Direction;
} JPC_RRayCast;

typedef struct JPC_RayCastResult {
	JPC_BodyID BodyID;
	float Fraction;
	JPC_SubShapeID SubShapeID2;
} JPC_RayCastResult;

typedef struct JPC_ShapeCastResult {
	// From CollideShapeResult
	JPC_Vec3 ContactPointOn1;
	JPC_Vec3 ContactPointOn2;
	JPC_Vec3 PenetrationAxis;
	float PenetrationDepth;
	JPC_SubShapeID SubShapeID1;
	JPC_SubShapeID SubShapeID2;
	JPC_BodyID BodyID2;
	// Face Shape1Face;
	// Face Shape2Face;

	// From ShapeCastResult
	float Fraction;
	bool IsBackFaceHit;
} JPC_ShapeCastResult;

typedef struct JPC_CollideShapeResult {
	JPC_Vec3 ContactPointOn1;
	JPC_Vec3 ContactPointOn2;
	JPC_Vec3 PenetrationAxis;
	float PenetrationDepth;
	JPC_SubShapeID SubShapeID1;
	JPC_SubShapeID SubShapeID2;
	JPC_BodyID BodyID2;
	// Face Shape1Face;
	// Face Shape2Face;
} JPC_CollideShapeResult;

typedef struct JPC_Body JPC_Body;

////////////////////////////////////////////////////////////////////////////////
// VertexList == Array<Float3> == std::vector<Float3>

typedef struct JPC_VertexList JPC_VertexList;

extern JPC_VertexList* JPC_VertexList_new(const JPC_Float3* storage, size_t len);
extern void JPC_VertexList_delete(JPC_VertexList* object);

////////////////////////////////////////////////////////////////////////////////
// IndexedTriangleList == Array<IndexedTriangle> == std::vector<IndexedTriangle>

typedef struct JPC_IndexedTriangleList JPC_IndexedTriangleList;

extern JPC_IndexedTriangleList* JPC_IndexedTriangleList_new(const JPC_IndexedTriangle* storage, size_t len);
extern void JPC_IndexedTriangleList_delete(JPC_IndexedTriangleList* object);

////////////////////////////////////////////////////////////////////////////////
// Shape -> RefTarget<Shape>

typedef struct JPC_Shape JPC_Shape;

extern uint32_t JPC_Shape_GetRefCount(const JPC_Shape* self);
extern void JPC_Shape_AddRef(const JPC_Shape* self);
extern void JPC_Shape_Release(const JPC_Shape* self);

extern uint64_t JPC_Shape_GetUserData(const JPC_Shape* self);
extern void JPC_Shape_SetUserData(JPC_Shape* self, uint64_t userData);

extern JPC_ShapeType JPC_Shape_GetType(const JPC_Shape* self);
extern JPC_ShapeSubType JPC_Shape_GetSubType(const JPC_Shape* self);

extern uint64_t JPC_Shape_GetSubShapeUserData(const JPC_Shape* self, JPC_SubShapeID inSubShapeID);

extern JPC_Vec3 JPC_Shape_GetCenterOfMass(const JPC_Shape* self);
extern float JPC_Shape_GetVolume(const JPC_Shape* self);

////////////////////////////////////////////////////////////////////////////////
// CompoundShape -> Shape -> RefTarget<Shape>

typedef struct JPC_CompoundShape JPC_CompoundShape;

// FIXME: The real API should return a new type, JPC_CompoundShape_SubShape*
extern const JPC_Shape* JPC_CompoundShape_GetSubShape_Shape(
	const JPC_CompoundShape* self,
	uint inIdx);

extern uint32_t JPC_CompoundShape_GetSubShapeIndexFromID(
	const JPC_CompoundShape* self,
	JPC_SubShapeID inSubShapeID,
	JPC_SubShapeID* outRemainder);

////////////////////////////////////////////////////////////////////////////////
// TempAllocatorImpl

typedef struct JPC_TempAllocatorImpl JPC_TempAllocatorImpl;

extern JPC_TempAllocatorImpl* JPC_TempAllocatorImpl_new(uint size);
extern void JPC_TempAllocatorImpl_delete(JPC_TempAllocatorImpl* object);

////////////////////////////////////////////////////////////////////////////////
// JobSystem

typedef struct JPC_JobSystem JPC_JobSystem;
typedef struct JPC_JobSystemThreadPool JPC_JobSystemThreadPool;
typedef struct JPC_JobSystemSingleThreaded JPC_JobSystemSingleThreaded;

extern JPC_JobSystemThreadPool* JPC_JobSystemThreadPool_new2(
	uint inMaxJobs,
	uint inMaxBarriers);
extern JPC_JobSystemThreadPool* JPC_JobSystemThreadPool_new3(
	uint inMaxJobs,
	uint inMaxBarriers,
	int inNumThreads);

extern void JPC_JobSystemThreadPool_delete(JPC_JobSystemThreadPool* object);

extern JPC_JobSystemSingleThreaded* JPC_JobSystemSingleThreaded_new(uint inMaxJobs);
extern void JPC_JobSystemSingleThreaded_delete(JPC_JobSystemSingleThreaded* object);

////////////////////////////////////////////////////////////////////////////////
// CollisionGroup and GroupFilter

typedef uint32_t JPC_GroupID;
typedef uint32_t JPC_SubGroupID;
typedef struct JPC_GroupFilter JPC_GroupFilter;

typedef struct JPC_CollisionGroup {
	const JPC_GroupFilter* GroupFilter;
	JPC_GroupID GroupID;
	JPC_SubGroupID SubGroupID;
} JPC_CollisionGroup;

typedef struct JPC_GroupFilterFns {
	bool (*CanCollide)(const void *self, const JPC_CollisionGroup* inGroup1, const JPC_CollisionGroup* inGroup2);
} JPC_GroupFilterFns;

extern JPC_GroupFilter* JPC_GroupFilter_new(
	const void *self,
	JPC_GroupFilterFns fns);

extern void JPC_GroupFilter_delete(JPC_GroupFilter* object);

////////////////////////////////////////////////////////////////////////////////
// BroadPhaseLayerInterface

typedef struct JPC_BroadPhaseLayerInterfaceFns {
	uint (*GetNumBroadPhaseLayers)(const void *self);
	JPC_BroadPhaseLayer (*GetBroadPhaseLayer)(const void *self, JPC_ObjectLayer inLayer);
} JPC_BroadPhaseLayerInterfaceFns;

typedef struct JPC_BroadPhaseLayerInterface JPC_BroadPhaseLayerInterface;

extern JPC_BroadPhaseLayerInterface* JPC_BroadPhaseLayerInterface_new(
	const void *self,
	JPC_BroadPhaseLayerInterfaceFns fns);

extern void JPC_BroadPhaseLayerInterface_delete(JPC_BroadPhaseLayerInterface* object);

////////////////////////////////////////////////////////////////////////////////
// BroadPhaseLayerFilter

typedef struct JPC_BroadPhaseLayerFilterFns {
	bool (*ShouldCollide)(const void *self, JPC_BroadPhaseLayer inLayer);
} JPC_BroadPhaseLayerFilterFns;

typedef struct JPC_BroadPhaseLayerFilter JPC_BroadPhaseLayerFilter;

extern JPC_BroadPhaseLayerFilter* JPC_BroadPhaseLayerFilter_new(
	const void *self,
	JPC_BroadPhaseLayerFilterFns fns);

extern void JPC_BroadPhaseLayerFilter_delete(JPC_BroadPhaseLayerFilter* object);

////////////////////////////////////////////////////////////////////////////////
// ObjectLayerFilter

typedef struct JPC_ObjectLayerFilterFns {
	bool (*ShouldCollide)(const void *self, JPC_ObjectLayer inLayer);
} JPC_ObjectLayerFilterFns;

typedef struct JPC_ObjectLayerFilter JPC_ObjectLayerFilter;

extern JPC_ObjectLayerFilter* JPC_ObjectLayerFilter_new(
	const void *self,
	JPC_ObjectLayerFilterFns fns);

extern void JPC_ObjectLayerFilter_delete(JPC_ObjectLayerFilter* object);

////////////////////////////////////////////////////////////////////////////////
// BodyFilter

typedef struct JPC_BodyFilterFns {
	bool (*ShouldCollide)(const void *self, JPC_BodyID inBodyID);
	bool (*ShouldCollideLocked)(const void *self, const JPC_Body *inBodyID);
} JPC_BodyFilterFns;

typedef struct JPC_BodyFilter JPC_BodyFilter;

extern JPC_BodyFilter* JPC_BodyFilter_new(
	const void *self,
	JPC_BodyFilterFns fns);

extern void JPC_BodyFilter_delete(JPC_BodyFilter* object);

////////////////////////////////////////////////////////////////////////////////
// ShapeFilter

typedef struct JPC_ShapeFilterFns {
	bool (*ShouldCollide)(const void *self, const JPC_Shape *inShape2, JPC_SubShapeID inSubShapeIDOfShape2);

	bool (*ShouldCollideTwoShapes)(const void *self,
		const JPC_Shape *inShape1, JPC_SubShapeID inSubShapeIDOfShape1,
		const JPC_Shape *inShape2, JPC_SubShapeID inSubShapeIDOfShape2);
} JPC_ShapeFilterFns;

typedef struct JPC_ShapeFilter JPC_ShapeFilter;

extern JPC_ShapeFilter* JPC_ShapeFilter_new(
	const void *self,
	JPC_ShapeFilterFns fns);

extern void JPC_ShapeFilter_delete(JPC_ShapeFilter* object);

////////////////////////////////////////////////////////////////////////////////
// SimShapeFilter

typedef struct JPC_SimShapeFilterFns {
	bool (*ShouldCollide)(
		const void *self,
		const JPC_Body *inBody1, const JPC_Shape *inShape1, JPC_SubShapeID inSubShapeIDOfShape1,
		const JPC_Body *inBody2, const JPC_Shape *inShape2, JPC_SubShapeID inSubShapeIDOfShape2);
} JPC_SimShapeFilterFns;

typedef struct JPC_SimShapeFilter JPC_SimShapeFilter;

extern JPC_SimShapeFilter* JPC_SimShapeFilter_new(
	const void *self,
	JPC_SimShapeFilterFns fns);

extern void JPC_SimShapeFilter_delete(JPC_SimShapeFilter* object);

////////////////////////////////////////////////////////////////////////////////
// ObjectVsBroadPhaseLayerFilter

typedef struct JPC_ObjectVsBroadPhaseLayerFilterFns {
	bool (*ShouldCollide)(const void *self, JPC_ObjectLayer inLayer1, JPC_BroadPhaseLayer inLayer2);
} JPC_ObjectVsBroadPhaseLayerFilterFns;

typedef struct JPC_ObjectVsBroadPhaseLayerFilter JPC_ObjectVsBroadPhaseLayerFilter;

extern JPC_ObjectVsBroadPhaseLayerFilter* JPC_ObjectVsBroadPhaseLayerFilter_new(
	const void *self,
	JPC_ObjectVsBroadPhaseLayerFilterFns fns);

extern void JPC_ObjectVsBroadPhaseLayerFilter_delete(JPC_ObjectVsBroadPhaseLayerFilter* object);

////////////////////////////////////////////////////////////////////////////////
// ObjectLayerPairFilter

typedef struct JPC_ObjectLayerPairFilterFns {
	bool (*ShouldCollide)(const void *self, JPC_ObjectLayer inLayer1, JPC_ObjectLayer inLayer2);
} JPC_ObjectLayerPairFilterFns;

typedef struct JPC_ObjectLayerPairFilter JPC_ObjectLayerPairFilter;

extern JPC_ObjectLayerPairFilter* JPC_ObjectLayerPairFilter_new(
	const void *self,
	JPC_ObjectLayerPairFilterFns fns);

extern void JPC_ObjectLayerPairFilter_delete(JPC_ObjectLayerPairFilter* object);

////////////////////////////////////////////////////////////////////////////////
// ContactListener

typedef struct JPC_ContactPoints {
	uint length;
	JPC_Vec3 points[64];
} JPC_ContactPoints;


typedef struct JPC_ContactManifold {
	JPC_RVec3 BaseOffset;
	JPC_Vec3 WorldSpaceNormal;
	float PenetrationDepth;
	JPC_SubShapeID SubShapeID1;
	JPC_SubShapeID SubShapeID2;
	JPC_ContactPoints RelativeContactPointsOn1;
	JPC_ContactPoints RelativeContactPointsOn2;
} JPC_ContactManifold;

typedef struct JPC_ContactSettings {
	float CombinedFriction;
	float CombinedRestitution;
	float InvMassScale1;
	float InvInertiaScale1;
	float InvMassScale2;
	float InvInertiaScale2;
	bool IsSensor;
	JPC_Vec3 RelativeLinearSurfaceVelocity;
	JPC_Vec3 RelativeAngularSurfaceVelocity;
} JPC_ContactSettings;

typedef struct JPC_SubShapeIDPair {
	JPC_BodyID Body1ID;
	JPC_SubShapeID SubShapeID1;
	JPC_BodyID Body2ID;
	JPC_SubShapeID SubShapeID2;
} JPC_SubShapeIDPair;


typedef struct JPC_ShapeCastSettings {
	// JPH::CollideSettingsBase
	JPC_ActiveEdgeMode ActiveEdgeMode;
	JPC_CollectFacesMode CollectFacesMode;
	float CollisionTolerance;
	float PenetrationTolerance;
	JPC_Vec3 ActiveEdgeMovementDirection;

	// JPH::ShapeCastSettings
	JPC_BackFaceMode BackFaceModeTriangles;
	JPC_BackFaceMode BackFaceModeConvex;
	bool UseShrunkenShapeAndConvexRadius;
	bool ReturnDeepestPoint;
} JPC_ShapeCastSettings;

typedef struct JPC_CollideShapeSettings {
	// CollideSettingsBase
	JPC_ActiveEdgeMode ActiveEdgeMode;
	JPC_CollectFacesMode CollectFacesMode;
	float CollisionTolerance;
	float PenetrationTolerance;
	JPC_Vec3 ActiveEdgeMovementDirection;

	// CollideShapeSettings
	float MaxSeparationDistance;
	JPC_BackFaceMode BackFaceMode;
} JPC_CollideShapeSettings;

typedef struct JPC_ContactListenerFns {
	JPC_ValidateResult (*OnContactValidate)(
		void *self,
		const JPC_Body *inBody1,
		const JPC_Body *inBody2,
		JPC_RVec3 inBaseOffset,
		const JPC_CollideShapeResult *inCollisionResult);

	void (*OnContactAdded)(
		void *self,
		const JPC_Body *inBody1,
		const JPC_Body *inBody2,
		const JPC_ContactManifold *inManifold,
		JPC_ContactSettings *ioSettings);

	void (*OnContactPersisted)(
		void *self,
		const JPC_Body *inBody1,
		const JPC_Body *inBody2,
		const JPC_ContactManifold *inManifold,
		JPC_ContactSettings *ioSettings);

	void (*OnContactRemoved)(
		void *self,
		const JPC_SubShapeIDPair *inSubShapePair);
} JPC_ContactListenerFns;

typedef struct JPC_ContactListener JPC_ContactListener;

extern JPC_ContactListener* JPC_ContactListener_new(
	void *self,
	JPC_ContactListenerFns fns);

extern void JPC_ContactListener_delete(JPC_ContactListener* object);

// xxxxxxxxxxxstatic const uint JPC_ContactPointsCapacity = 64;

typedef struct JPC_Impulse {
	float ContactImpulse;				///< Estimated contact impulses (kg m / s)
	float FrictionImpulse1;				///< Estimated friction impulses in the direction of tangent 1 (kg m / s)
	float FrictionImpulse2;				///< Estimated friction impulses in the direction of tangent 2 (kg m / s)
} JPC_Impulse;

typedef struct JPC_CollisionEstimationResult {
	JPC_Vec3 LinearVelocity1;				///< The estimated linear velocity of body 1 after collision
	JPC_Vec3 AngularVelocity1;				///< The estimated angular velocity of body 1 after collision
	JPC_Vec3 LinearVelocity2;				///< The estimated linear velocity of body 2 after collision
	JPC_Vec3 AngularVelocity2;				///< The estimated angular velocity of body 2 after collision

	JPC_Vec3 Tangent1;						///< Normalized tangent of contact normal
	JPC_Vec3 Tangent2;						///< Second normalized tangent of contact normal (forms a basis with mTangent1 and mWorldSpaceNormal)

	uint NumImpulses;
	JPC_Impulse Impulses[64];
} JPC_CollisionEstimationResult;

extern void JPC_EstimateCollisionResponse(
	const JPC_Body* inBody1,
	const JPC_Body* inBody2,
	const JPC_ContactManifold* inManifold,
	JPC_CollisionEstimationResult* outResult,
	float inCombinedFriction,
	float inCombinedRestitution,
	float inMinVelocityForRestitution,	///< = 1.0f
	uint inNumIterations				///< = 10
);

////////////////////////////////////////////////////////////////////////////////
// CastShapeCollector

typedef struct JPC_CastShapeCollector JPC_CastShapeCollector;

typedef struct JPC_CastShapeCollectorFns {
	void (*Reset)(void *self);
	void (*AddHit)(void *self, JPC_CastShapeCollector *base, const JPC_ShapeCastResult *Result);
} JPC_CastShapeCollectorFns;

extern JPC_CastShapeCollector* JPC_CastShapeCollector_new(
	void *self,
	JPC_CastShapeCollectorFns fns);

extern void JPC_CastShapeCollector_delete(JPC_CastShapeCollector* object);

extern void JPC_CastShapeCollector_UpdateEarlyOutFraction(JPC_CastShapeCollector *self, float inFraction);

////////////////////////////////////////////////////////////////////////////////
// CollideShapeCollector

typedef struct JPC_CollideShapeCollector JPC_CollideShapeCollector;

typedef struct JPC_CollideShapeCollectorFns {
	void (*Reset)(void *self);
	void (*AddHit)(void *self, JPC_CollideShapeCollector *base, const JPC_CollideShapeResult *Result);
} JPC_CollideShapeCollectorFns;

extern JPC_CollideShapeCollector* JPC_CollideShapeCollector_new(
	void *self,
	JPC_CollideShapeCollectorFns fns);

extern void JPC_CollideShapeCollector_delete(JPC_CollideShapeCollector* object);

extern void JPC_CollideShapeCollector_UpdateEarlyOutFraction(JPC_CollideShapeCollector *self, float inFraction);

////////////////////////////////////////////////////////////////////////////////
// DrawSettings

typedef struct JPC_BodyManager_DrawSettings {
	bool mDrawGetSupportFunction;
	bool mDrawSupportDirection;
	bool mDrawGetSupportingFace;
	bool mDrawShape;
	bool mDrawShapeWireframe;
	JPC_ShapeColor mDrawShapeColor;
	bool mDrawBoundingBox;
	bool mDrawCenterOfMassTransform;
	bool mDrawWorldTransform;
	bool mDrawVelocity;
	bool mDrawMassAndInertia;
	bool mDrawSleepStats;
	bool mDrawSoftBodyVertices;
	bool mDrawSoftBodyVertexVelocities;
	bool mDrawSoftBodyEdgeConstraints;
	bool mDrawSoftBodyBendConstraints;
	bool mDrawSoftBodyVolumeConstraints;
	bool mDrawSoftBodySkinConstraints;
	bool mDrawSoftBodyLRAConstraints;
	bool mDrawSoftBodyPredictedBounds;
	JPC_SoftBodyConstraintColor DrawSoftBodyConstraintColor;
} JPC_BodyManager_DrawSettings;


extern void JPC_BodyManager_DrawSettings_default(JPC_BodyManager_DrawSettings* object);

////////////////////////////////////////////////////////////////////////////////
// DebugRendererSimple

typedef struct JPC_DebugRendererSimpleFns {
	void (*DrawLine)(const void *self, JPC_RVec3 inFrom, JPC_RVec3 inTo, JPC_Color inColor);
} JPC_DebugRendererSimpleFns;

typedef struct JPC_DebugRendererSimple JPC_DebugRendererSimple;

extern JPC_DebugRendererSimple* JPC_DebugRendererSimple_new(
	const void *self,
	JPC_DebugRendererSimpleFns fns);

extern void JPC_DebugRendererSimple_delete(JPC_DebugRendererSimple* object);

////////////////////////////////////////////////////////////////////////////////
// String

typedef struct JPC_String JPC_String;

extern void JPC_String_delete(JPC_String* self);
extern const char* JPC_String_c_str(JPC_String* self);

////////////////////////////////////////////////////////////////////////////////
// Constraint -> RefTarget<Constraint>

typedef struct JPC_Constraint JPC_Constraint;

extern uint32_t JPC_Constraint_GetRefCount(const JPC_Constraint* self);
extern void JPC_Constraint_AddRef(const JPC_Constraint* self);
extern void JPC_Constraint_Release(const JPC_Constraint* self);

extern void JPC_Constraint_delete(JPC_Constraint* self);

// extern JPC_ConstraintType JPC_Constraint_GetType(const JPC_Constraint* self);
// extern JPC_ConstraintSubType JPC_Constraint_GetSubType(const JPC_Constraint* self);

extern uint32_t JPC_Constraint_GetConstraintPriority(const JPC_Constraint* self);
extern void JPC_Constraint_SetConstraintPriority(JPC_Constraint* self, uint32_t inPriority);

extern uint JPC_Constraint_GetNumVelocityStepsOverride(const JPC_Constraint* self);
extern void JPC_Constraint_SetNumVelocityStepsOverride(JPC_Constraint* self, uint inN);

extern uint JPC_Constraint_GetNumPositionStepsOverride(const JPC_Constraint* self);
extern void JPC_Constraint_SetNumPositionStepsOverride(JPC_Constraint* self, uint inN);

extern bool JPC_Constraint_GetEnabled(const JPC_Constraint* self);
extern void JPC_Constraint_SetEnabled(JPC_Constraint* self, bool inEnabled);

extern uint64_t JPC_Constraint_GetUserData(const JPC_Constraint* self);
extern void JPC_Constraint_SetUserData(JPC_Constraint* self, uint64_t inUserData);

extern void JPC_Constraint_NotifyShapeChanged(JPC_Constraint* self, JPC_BodyID inBodyID, JPC_Vec3 inDeltaCOM);

////////////////////////////////////////////////////////////////////////////////
// TwoBodyConstraint -> Constraint -> RefTarget<Constraint>

typedef struct JPC_TwoBodyConstraint JPC_TwoBodyConstraint;

extern JPC_Body* JPC_TwoBodyConstraint_GetBody1(const JPC_TwoBodyConstraint* self);
extern JPC_Body* JPC_TwoBodyConstraint_GetBody2(const JPC_TwoBodyConstraint* self);

extern JPC_Mat44 JPC_TwoBodyConstraint_GetConstraintToBody1Matrix(const JPC_TwoBodyConstraint* self);
extern JPC_Mat44 JPC_TwoBodyConstraint_GetConstraintToBody2Matrix(const JPC_TwoBodyConstraint* self);

////////////////////////////////////////////////////////////////////////////////
// FixedConstraint -> TwoBodyConstraint -> Constraint -> RefTarget<Constraint>

typedef struct JPC_FixedConstraint JPC_FixedConstraint;

extern JPC_Vec3 JPC_FixedConstraint_GetTotalLambdaPosition(const JPC_FixedConstraint* self);
extern JPC_Vec3 JPC_FixedConstraint_GetTotalLambdaRotation(const JPC_FixedConstraint* self);

////////////////////////////////////////////////////////////////////////////////
// DistanceConstraint -> TwoBodyConstraint -> Constraint -> RefTarget<Constraint>

typedef struct JPC_DistanceConstraint JPC_DistanceConstraint;

extern float JPC_DistanceConstraint_GetTotalLambdaPosition(const JPC_DistanceConstraint* self);

////////////////////////////////////////////////////////////////////////////////
// SixDOFConstraint -> TwoBodyConstraint -> Constraint -> RefTarget<Constraint>

typedef struct JPC_SixDOFConstraint JPC_SixDOFConstraint;

extern JPC_Vec3 JPC_SixDOFConstraint_GetTranslationLimitsMin(const JPC_SixDOFConstraint* self);
extern JPC_Vec3 JPC_SixDOFConstraint_GetTranslationLimitsMax(const JPC_SixDOFConstraint* self);
extern void JPC_SixDOFConstraint_SetTranslationLimits(JPC_SixDOFConstraint* self, JPC_Vec3 inLimitMin, JPC_Vec3 inLimitMax);

extern JPC_Vec3 JPC_SixDOFConstraint_GetRotationLimitsMin(const JPC_SixDOFConstraint* self);
extern JPC_Vec3 JPC_SixDOFConstraint_GetRotationLimitsMax(const JPC_SixDOFConstraint* self);
extern void JPC_SixDOFConstraint_SetRotationLimits(JPC_SixDOFConstraint* self, JPC_Vec3 inLimitMin, JPC_Vec3 inLimitMax);

extern float JPC_SixDOFConstraint_GetLimitsMin(const JPC_SixDOFConstraint* self, JPC_SixDOFConstraint_Axis inAxis);
extern float JPC_SixDOFConstraint_GetLimitsMax(const JPC_SixDOFConstraint* self, JPC_SixDOFConstraint_Axis inAxis);

extern bool JPC_SixDOFConstraint_IsFreeAxis(const JPC_SixDOFConstraint* self, JPC_SixDOFConstraint_Axis inAxis);

// const SpringSettings & GetLimitsSpringSettings(JPC_SixDOFConstraint_Axis inAxis) const { JPH_ASSERT(inAxis < JPC_SixDOFConstraint_Axis::NumTranslation); return mLimitsSpringSettings[inAxis]; }
// void SetLimitsSpringSettings(JPC_SixDOFConstraint_Axis inAxis, const SpringSettings& inLimitsSpringSettings) { JPH_ASSERT(inAxis < JPC_SixDOFConstraint_Axis::NumTranslation); mLimitsSpringSettings[inAxis] = inLimitsSpringSettings; CacheHasSpringLimits(); }

extern void JPC_SixDOFConstraint_SetMaxFriction(JPC_SixDOFConstraint* self, JPC_SixDOFConstraint_Axis inAxis, float inFriction);
extern float JPC_SixDOFConstraint_GetMaxFriction(const JPC_SixDOFConstraint* self, JPC_SixDOFConstraint_Axis inAxis);

extern JPC_Quat JPC_SixDOFConstraint_GetRotationInConstraintSpace(const JPC_SixDOFConstraint* self);

/// Motor settings
// MotorSettings & GetMotorSettings(EAxis inAxis)
// const MotorSettings & GetMotorSettings(EAxis inAxis) const

// void SetMotorState(EAxis inAxis, EMotorState inState);
// EMotorState GetMotorState(EAxis inAxis) const

extern JPC_Vec3 JPC_SixDOFConstraint_GetTargetVelocityCS(const JPC_SixDOFConstraint* self);
extern void JPC_SixDOFConstraint_SetTargetVelocityCS(JPC_SixDOFConstraint* self, JPC_Vec3 inVelocity);

extern JPC_Vec3 JPC_SixDOFConstraint_GetTargetAngularVelocityCS(const JPC_SixDOFConstraint* self);
extern void JPC_SixDOFConstraint_SetTargetAngularVelocityCS(JPC_SixDOFConstraint* self, JPC_Vec3 inAngularVelocity);

extern JPC_Vec3 JPC_SixDOFConstraint_GetTargetPositionCS(const JPC_SixDOFConstraint* self);
extern void JPC_SixDOFConstraint_SetTargetPositionCS(JPC_SixDOFConstraint* self, JPC_Vec3 inPosition);

extern JPC_Quat JPC_SixDOFConstraint_GetTargetOrientationCS(const JPC_SixDOFConstraint* self);
extern void JPC_SixDOFConstraint_SetTargetOrientationCS(JPC_SixDOFConstraint* self, JPC_Quat inOrientation);

extern void JPC_SixDOFConstraint_SetTargetOrientationBS(JPC_SixDOFConstraint* self, JPC_Quat inOrientation);

extern JPC_Vec3 JPC_SixDOFConstraint_GetTotalLambdaPosition(JPC_SixDOFConstraint* self);
extern JPC_Vec3 JPC_SixDOFConstraint_GetTotalLambdaRotation(JPC_SixDOFConstraint* self);
extern JPC_Vec3 JPC_SixDOFConstraint_GetTotalLambdaMotorTranslation(JPC_SixDOFConstraint* self);
extern JPC_Vec3 JPC_SixDOFConstraint_GetTotalLambdaMotorRotation(JPC_SixDOFConstraint* self);

////////////////////////////////////////////////////////////////////////////////
// HingeConstraint

typedef struct JPC_HingeConstraint JPC_HingeConstraint;

extern void JPC_HingeConstraint_SetMotorState(JPC_HingeConstraint* self, JPC_MotorState inState);
extern JPC_MotorState JPC_HingeConstraint_GetMotorState(const JPC_HingeConstraint* self);
extern void JPC_HingeConstraint_SetTargetAngularVelocity(JPC_HingeConstraint* self, float inAngularVelocity);
extern float JPC_HingeConstraint_GetTargetAngularVelocity(const JPC_HingeConstraint* self);
extern void JPC_HingeConstraint_SetTargetAngle(JPC_HingeConstraint* self, float inAngle);
extern float JPC_HingeConstraint_GetTargetAngle(const JPC_HingeConstraint* self);

extern JPC_Vec3 JPC_HingeConstraint_GetTotalLambdaPosition(const JPC_HingeConstraint* self);
extern JPC_Vec2 JPC_HingeConstraint_GetTotalLambdaRotation(const JPC_HingeConstraint* self);
extern float JPC_HingeConstraint_GetTotalLambdaRotationLimits(const JPC_HingeConstraint* self);
extern float JPC_HingeConstraint_GetTotalLambdaMotor(const JPC_HingeConstraint* self);

////////////////////////////////////////////////////////////////////////////////
// SliderConstraint

typedef struct JPC_SliderConstraint JPC_SliderConstraint;

extern void JPC_SliderConstraint_SetMotorState(JPC_SliderConstraint* self, JPC_MotorState inState);
extern JPC_MotorState JPC_SliderConstraint_GetMotorState(const JPC_SliderConstraint* self);
extern void JPC_SliderConstraint_SetTargetVelocity(JPC_SliderConstraint* self, float inVelocity);
extern float JPC_SliderConstraint_GetTargetVelocity(const JPC_SliderConstraint* self);
extern void JPC_SliderConstraint_SetTargetPosition(JPC_SliderConstraint* self, float inPosition);
extern float JPC_SliderConstraint_GetTargetPosition(const JPC_SliderConstraint* self);
extern JPC_Vec2 JPC_SliderConstraint_GetTotalLambdaPosition(const JPC_SliderConstraint* self);
extern float JPC_SliderConstraint_GetTotalLambdaPositionLimits(const JPC_SliderConstraint* self);
extern JPC_Vec3 JPC_SliderConstraint_GetTotalLambdaRotation(const JPC_SliderConstraint* self);
extern float JPC_SliderConstraint_GetTotalLambdaMotor(const JPC_SliderConstraint* self);

////////////////////////////////////////////////////////////////////////////////
// ConstraintSettings

typedef struct JPC_ConstraintSettings {
	bool Enabled;
	uint32_t ConstraintPriority;
	uint NumVelocityStepsOverride;
	uint NumPositionStepsOverride;
	float DrawConstraintSize;
	uint64_t UserData;
} JPC_ConstraintSettings;

extern void JPC_ConstraintSettings_default(JPC_ConstraintSettings* settings);

////////////////////////////////////////////////////////////////////////////////
// SpringSettings

typedef struct JPC_SpringSettings {
	JPC_SpringMode Mode;
	float FrequencyOrStiffness;
	float Damping;
} JPC_SpringSettings;

extern void JPC_SpringSettings_default(JPC_SpringSettings* settings);

////////////////////////////////////////////////////////////////////////////////
// MotorSettings

typedef struct JPC_MotorSettings {
	JPC_SpringSettings SpringSettings;
	float MinForceLimit;
	float MaxForceLimit;
	float MinTorqueLimit;
	float MaxTorqueLimit;
} JPC_MotorSettings;

extern void JPC_MotorSettings_default(JPC_MotorSettings* settings);

////////////////////////////////////////////////////////////////////////////////
// FixedConstraintSettings -> TwoBodyConstraintSettings -> ConstraintSettings

typedef struct JPC_FixedConstraintSettings {
	JPC_ConstraintSettings ConstraintSettings;

	// TwoBodyConstraintSettings: no extra members

	// FixedConstraintSettings
	JPC_ConstraintSpace Space;
	bool AutoDetectPoint;

	JPC_RVec3 Point1;
	JPC_Vec3 AxisX1;
	JPC_Vec3 AxisY1;

	JPC_RVec3 Point2;
	JPC_Vec3 AxisX2;
	JPC_Vec3 AxisY2;
} JPC_FixedConstraintSettings;

extern void JPC_FixedConstraintSettings_default(JPC_FixedConstraintSettings* settings);
extern JPC_Constraint* JPC_FixedConstraintSettings_Create(
	const JPC_FixedConstraintSettings* self,
	JPC_Body* inBody1,
	JPC_Body* inBody2);

////////////////////////////////////////////////////////////////////////////////
// SixDOFConstraintSettings -> TwoBodyConstraintSettings -> ConstraintSettings

typedef struct JPC_SixDOFConstraintSettings {
	JPC_ConstraintSettings ConstraintSettings;

	// TwoBodyConstraintSettings: no extra members

	// SixDOFConstraintSettings
	JPC_ConstraintSpace Space;

	JPC_RVec3 Position1;
	JPC_Vec3 AxisX1;
	JPC_Vec3 AxisY1;

	JPC_RVec3 Position2;
	JPC_Vec3 AxisX2;
	JPC_Vec3 AxisY2;

	float MaxFriction[6];

	float LimitMin[6];
	float LimitMax[6];

	// TODO: LimitsSpringSettings
} JPC_SixDOFConstraintSettings;

extern void JPC_SixDOFConstraintSettings_default(JPC_SixDOFConstraintSettings* settings);
extern JPC_Constraint* JPC_SixDOFConstraintSettings_Create(
	const JPC_SixDOFConstraintSettings* self,
	JPC_Body* inBody1,
	JPC_Body* inBody2);

////////////////////////////////////////////////////////////////////////////////
// HingeConstraintSettings -> TwoBodyConstraintSettings -> ConstraintSettings

typedef struct JPC_HingeConstraintSettings {
	JPC_ConstraintSettings ConstraintSettings;

	// TwoBodyConstraintSettings: no extra members

	// HingeConstraintSettings
	JPC_ConstraintSpace Space;

	JPC_RVec3 Point1;
	JPC_Vec3 HingeAxis1;
	JPC_Vec3 NormalAxis1;

	JPC_RVec3 Point2;
	JPC_Vec3 HingeAxis2;
	JPC_Vec3 NormalAxis2;

	float LimitsMin;
	float LimitsMax;

	JPC_SpringSettings LimitsSpringSettings;

	float MaxFrictionTorque;

	JPC_MotorSettings MotorSettings;
} JPC_HingeConstraintSettings;

extern void JPC_HingeConstraintSettings_default(JPC_HingeConstraintSettings* settings);
extern JPC_HingeConstraint* JPC_HingeConstraintSettings_Create(
	const JPC_HingeConstraintSettings* self,
	JPC_Body* inBody1,
	JPC_Body* inBody2);

////////////////////////////////////////////////////////////////////////////////
// DistanceConstraintSettings -> TwoBodyConstraintSettings -> ConstraintSettings

typedef struct JPC_DistanceConstraintSettings {
	JPC_ConstraintSettings ConstraintSettings;

	// TwoBodyConstraintSettings: no extra members

	// DistanceConstraintSettings
	JPC_ConstraintSpace Space;

	JPC_RVec3 Point1;
	JPC_RVec3 Point2;

	float MinDistance;
	float MaxDistance;

	JPC_SpringSettings LimitsSpringSettings;
} JPC_DistanceConstraintSettings;

extern void JPC_DistanceConstraintSettings_default(JPC_DistanceConstraintSettings* settings);
extern JPC_DistanceConstraint* JPC_DistanceConstraintSettings_Create(
	const JPC_DistanceConstraintSettings* self,
	JPC_Body* inBody1,
	JPC_Body* inBody2);

////////////////////////////////////////////////////////////////////////////////
// SliderConstraintSettings -> TwoBodyConstraintSettings -> ConstraintSettings

typedef struct JPC_SliderConstraintSettings {
	JPC_ConstraintSettings ConstraintSettings;

	// TwoBodyConstraintSettings: no extra members

	// SliderConstraintSettings
	JPC_ConstraintSpace Space;
	bool AutoDetectPoint;

	JPC_RVec3 Point1;
	JPC_Vec3 SliderAxis1;
	JPC_Vec3 NormalAxis1;

	JPC_RVec3 Point2;
	JPC_Vec3 SliderAxis2;
	JPC_Vec3 NormalAxis2;

	float LimitsMin;
	float LimitsMax;

	JPC_SpringSettings LimitsSpringSettings;

	float MaxFrictionForce;

	JPC_MotorSettings MotorSettings;
} JPC_SliderConstraintSettings;

extern void JPC_SliderConstraintSettings_default(JPC_SliderConstraintSettings* settings);
extern JPC_SliderConstraint* JPC_SliderConstraintSettings_Create(
	const JPC_SliderConstraintSettings* self,
	JPC_Body* inBody1,
	JPC_Body* inBody2);

////////////////////////////////////////////////////////////////////////////////
// TriangleShapeSettings

typedef struct JPC_TriangleShapeSettings {
	// ShapeSettings
	uint64_t UserData;

	// ConvexShapeSettings
	// TODO: Material
	float Density;

	// TriangleShapeSettings
	JPC_Vec3 V1;
	JPC_Vec3 V2;
	JPC_Vec3 V3;
	float ConvexRadius;
} JPC_TriangleShapeSettings;

extern void JPC_TriangleShapeSettings_default(JPC_TriangleShapeSettings* object);
extern bool JPC_TriangleShapeSettings_Create(const JPC_TriangleShapeSettings* self, JPC_Shape** outShape, JPC_String** outError);

////////////////////////////////////////////////////////////////////////////////
// MeshShapeSettings -> ShapeSettings

typedef struct JPC_MeshShapeSettings {
	// ShapeSettings
	uint64_t UserData;

	// MeshShapeSettings
	JPC_Float3* TriangleVertices;
	size_t TriangleVerticesLen;
	JPC_IndexedTriangle* IndexedTriangles;
	size_t IndexedTrianglesLen;
	// PhysicsMaterialList				mMaterials;
	// uint							mMaxTrianglesPerLeaf = 8;
	// float							mActiveEdgeCosThresholdAngle = 0.996195f;
	// bool							mPerTriangleUserData = false;
} JPC_MeshShapeSettings;

extern void JPC_MeshShapeSettings_default(JPC_MeshShapeSettings* object);
extern bool JPC_MeshShapeSettings_Create(const JPC_MeshShapeSettings* self, JPC_Shape** outShape, JPC_String** outError);

////////////////////////////////////////////////////////////////////////////////
// BoxShapeSettings -> ConvexShapeSettings -> ShapeSettings

typedef struct JPC_BoxShapeSettings {
	// ShapeSettings
	uint64_t UserData;

	// ConvexShapeSettings
	// TODO: Material
	float Density;

	// BoxShapeSettings
	JPC_Vec3 HalfExtent;
	float ConvexRadius;
} JPC_BoxShapeSettings;

extern void JPC_BoxShapeSettings_default(JPC_BoxShapeSettings* object);
extern bool JPC_BoxShapeSettings_Create(const JPC_BoxShapeSettings* self, JPC_Shape** outShape, JPC_String** outError);

////////////////////////////////////////////////////////////////////////////////
// SphereShapeSettings -> ConvexShapeSettings -> ShapeSettings

typedef struct JPC_SphereShapeSettings {
	// ShapeSettings
	uint64_t UserData;

	// ConvexShapeSettings
	// TODO: Material
	float Density;

	// SphereShapeSettings
	float Radius;
} JPC_SphereShapeSettings;

extern void JPC_SphereShapeSettings_default(JPC_SphereShapeSettings* object);
extern bool JPC_SphereShapeSettings_Create(const JPC_SphereShapeSettings* self, JPC_Shape** outShape, JPC_String** outError);

////////////////////////////////////////////////////////////////////////////////
// CapsuleShapeSettings -> ConvexShapeSettings -> ShapeSettings

typedef struct JPC_CapsuleShapeSettings {
	// ShapeSettings
	uint64_t UserData;

	// ConvexShapeSettings
	// TODO: Material
	float Density;

	// CapsuleShapeSettings
	float Radius;
	float HalfHeightOfCylinder;
} JPC_CapsuleShapeSettings;

extern void JPC_CapsuleShapeSettings_default(JPC_CapsuleShapeSettings* object);
extern bool JPC_CapsuleShapeSettings_Create(const JPC_CapsuleShapeSettings* self, JPC_Shape** outShape, JPC_String** outError);

////////////////////////////////////////////////////////////////////////////////
// CylinderShapeSettings -> ConvexShapeSettings -> ShapeSettings

typedef struct JPC_CylinderShapeSettings {
	// ShapeSettings
	uint64_t UserData;

	// ConvexShapeSettings
	// TODO: Material
	float Density;

	// CylinderShapeSettings
	float HalfHeight;
	float Radius;
	float ConvexRadius;
} JPC_CylinderShapeSettings;

extern void JPC_CylinderShapeSettings_default(JPC_CylinderShapeSettings* object);
extern bool JPC_CylinderShapeSettings_Create(const JPC_CylinderShapeSettings* self, JPC_Shape** outShape, JPC_String** outError);

////////////////////////////////////////////////////////////////////////////////
// ConvexHullShapeSettings -> ConvexShapeSettings -> ShapeSettings

typedef struct JPC_ConvexHullShapeSettings {
	// ShapeSettings
	uint64_t UserData;

	// ConvexShapeSettings
	// TODO: Material
	float Density;

	// ConvexHullShapeSettings
	const JPC_Vec3* Points;
	size_t PointsLen;
	float MaxConvexRadius;
	float MaxErrorConvexRadius;
	float HullTolerance;
} JPC_ConvexHullShapeSettings;

extern void JPC_ConvexHullShapeSettings_default(JPC_ConvexHullShapeSettings* object);
extern bool JPC_ConvexHullShapeSettings_Create(const JPC_ConvexHullShapeSettings* self, JPC_Shape** outShape, JPC_String** outError);

////////////////////////////////////////////////////////////////////////////////
// CompoundShape::SubShapeSettings

typedef struct JPC_SubShapeSettings {
	const JPC_Shape* Shape;
	JPC_Vec3 Position;
	JPC_Quat Rotation;
	uint32_t UserData;
} JPC_SubShapeSettings;

extern void JPC_SubShapeSettings_default(JPC_SubShapeSettings* object);

////////////////////////////////////////////////////////////////////////////////
// StaticCompoundShapeSettings -> CompoundShapeSettings -> ShapeSettings

typedef struct JPC_StaticCompoundShapeSettings {
	// ShapeSettings
	uint64_t UserData;

	// CompoundShapeSettings
	const JPC_SubShapeSettings* SubShapes;
	size_t SubShapesLen;

	// StaticCompoundShapeSettings
	// (no fields)
} JPC_StaticCompoundShapeSettings;

extern void JPC_StaticCompoundShapeSettings_default(JPC_StaticCompoundShapeSettings* object);
extern bool JPC_StaticCompoundShapeSettings_Create(const JPC_StaticCompoundShapeSettings* self, JPC_Shape** outShape, JPC_String** outError);

////////////////////////////////////////////////////////////////////////////////
// MutableCompoundShape -> CompoundShape -> Shape

typedef struct JPC_MutableCompoundShape JPC_MutableCompoundShape;

extern uint JPC_MutableCompoundShape_AddShape(
	JPC_MutableCompoundShape* self,
	JPC_Vec3 inPosition,
	JPC_Quat inRotation,
	const JPC_Shape* inShape,
	uint32_t inUserData);

extern void JPC_MutableCompoundShape_RemoveShape(JPC_MutableCompoundShape* self, uint inIndex);
extern void JPC_MutableCompoundShape_ModifyShape(JPC_MutableCompoundShape* self, uint inIndex, JPC_Vec3 inPosition, JPC_Quat inRotation);
extern void JPC_MutableCompoundShape_ModifyShape2(JPC_MutableCompoundShape* self, uint inIndex, JPC_Vec3 inPosition, JPC_Quat inRotation, const JPC_Shape* inShape);
extern void JPC_MutableCompoundShape_AdjustCenterOfMass(JPC_MutableCompoundShape* self);

// TODO:
// extern void JPC_MutableCompoundShape_ModifyShapes(JPC_MutableCompoundShape* self, ...);
// extern JPC_MutableCompoundShape* JPC_MutableCompoundShape_Clone(JPC_MutableCompoundShape* self);

////////////////////////////////////////////////////////////////////////////////
// MutableCompoundShapeSettings -> CompoundShapeSettings -> ShapeSettings

typedef struct JPC_MutableCompoundShapeSettings {
	// ShapeSettings
	uint64_t UserData;

	// CompoundShapeSettings
	const JPC_SubShapeSettings* SubShapes;
	size_t SubShapesLen;

	// MutableCompoundShapeSettings
	// (no fields)
} JPC_MutableCompoundShapeSettings;

extern void JPC_MutableCompoundShapeSettings_default(JPC_MutableCompoundShapeSettings* object);
extern bool JPC_MutableCompoundShapeSettings_Create(const JPC_MutableCompoundShapeSettings* self, JPC_MutableCompoundShape** outShape, JPC_String** outError);

////////////////////////////////////////////////////////////////////////////////
// BodyCreationSettings

typedef struct JPC_BodyCreationSettings {
	JPC_RVec3 Position;
	JPC_Quat Rotation;
	JPC_Vec3 LinearVelocity;
	JPC_Vec3 AngularVelocity;
	uint64_t UserData;
	JPC_ObjectLayer ObjectLayer;
	// CollisionGroup CollisionGroup;
	JPC_MotionType MotionType;
	JPC_AllowedDOFs AllowedDOFs;
	bool AllowDynamicOrKinematic;
	bool IsSensor;
	bool CollideKinematicVsNonDynamic;
	bool UseManifoldReduction;
	bool ApplyGyroscopicForce;
	JPC_MotionQuality MotionQuality;
	bool EnhancedInternalEdgeRemoval;
	bool AllowSleeping;
	float Friction;
	float Restitution;
	float LinearDamping;
	float AngularDamping;
	float MaxLinearVelocity;
	float MaxAngularVelocity;
	float GravityFactor;
	uint NumVelocityStepsOverride;
	uint NumPositionStepsOverride;
	JPC_OverrideMassProperties OverrideMassProperties;
	float InertiaMultiplier;

	// MassProperties MassPropertiesOverride;

	const JPC_Shape* Shape;
} JPC_BodyCreationSettings;

extern void JPC_BodyCreationSettings_default(JPC_BodyCreationSettings* settings);

typedef struct JPC_BodyCreationSettings JPC_BodyCreationSettings;

extern JPC_BodyCreationSettings* JPC_BodyCreationSettings_new();

////////////////////////////////////////////////////////////////////////////////
// Body

extern JPC_BodyID JPC_Body_GetID(const JPC_Body* self);
extern JPC_BodyType JPC_Body_GetBodyType(const JPC_Body* self);
extern bool JPC_Body_IsRigidBody(const JPC_Body* self);
extern bool JPC_Body_IsSoftBody(const JPC_Body* self);
extern bool JPC_Body_IsActive(const JPC_Body* self);
extern bool JPC_Body_IsStatic(const JPC_Body* self);
extern bool JPC_Body_IsKinematic(const JPC_Body* self);
extern bool JPC_Body_IsDynamic(const JPC_Body* self);
extern bool JPC_Body_CanBeKinematicOrDynamic(const JPC_Body* self);
extern void JPC_Body_SetIsSensor(JPC_Body* self, bool inIsSensor);
extern bool JPC_Body_IsSensor(const JPC_Body* self);
extern void JPC_Body_SetCollideKinematicVsNonDynamic(JPC_Body* self, bool inCollide);
extern bool JPC_Body_GetCollideKinematicVsNonDynamic(const JPC_Body* self);
extern void JPC_Body_SetUseManifoldReduction(JPC_Body* self, bool inUseReduction);
extern bool JPC_Body_GetUseManifoldReduction(const JPC_Body* self);
extern bool JPC_Body_GetUseManifoldReductionWithBody(const JPC_Body* self, const JPC_Body* inBody2);
extern void JPC_Body_SetApplyGyroscopicForce(JPC_Body* self, bool inApply);
extern bool JPC_Body_GetApplyGyroscopicForce(const JPC_Body* self);
extern void JPC_Body_SetEnhancedInternalEdgeRemoval(JPC_Body* self, bool inApply);
extern bool JPC_Body_GetEnhancedInternalEdgeRemoval(const JPC_Body* self);
extern bool JPC_Body_GetEnhancedInternalEdgeRemovalWithBody(const JPC_Body* self, const JPC_Body* inBody2);
extern JPC_MotionType JPC_Body_GetMotionType(const JPC_Body* self);
extern void JPC_Body_SetMotionType(JPC_Body* self, JPC_MotionType inMotionType);
extern JPC_BroadPhaseLayer JPC_Body_GetBroadPhaseLayer(const JPC_Body* self);
extern JPC_ObjectLayer JPC_Body_GetObjectLayer(const JPC_Body* self);

// extern const CollisionGroup & JPC_Body_GetCollisionGroup(const JPC_Body* self);
// extern CollisionGroup & JPC_Body_GetCollisionGroup(JPC_Body* self);
// extern void JPC_Body_SetCollisionGroup(JPC_Body* self, const CollisionGroup &inGroup);

extern bool JPC_Body_GetAllowSleeping(const JPC_Body* self);
extern void JPC_Body_SetAllowSleeping(JPC_Body* self, bool inAllow);
extern void JPC_Body_ResetSleepTimer(JPC_Body* self);
extern float JPC_Body_GetFriction(const JPC_Body* self);
extern void JPC_Body_SetFriction(JPC_Body* self, float inFriction);
extern float JPC_Body_GetRestitution(const JPC_Body* self);
extern void JPC_Body_SetRestitution(JPC_Body* self, float inRestitution);
extern JPC_Vec3 JPC_Body_GetLinearVelocity(const JPC_Body* self);
extern void JPC_Body_SetLinearVelocity(JPC_Body* self, JPC_Vec3 inLinearVelocity);
extern void JPC_Body_SetLinearVelocityClamped(JPC_Body* self, JPC_Vec3 inLinearVelocity);
extern JPC_Vec3 JPC_Body_GetAngularVelocity(const JPC_Body* self);
extern void JPC_Body_SetAngularVelocity(JPC_Body* self, JPC_Vec3 inAngularVelocity);
extern void JPC_Body_SetAngularVelocityClamped(JPC_Body* self, JPC_Vec3 inAngularVelocity);
extern JPC_Vec3 JPC_Body_GetPointVelocityCOM(const JPC_Body* self, JPC_Vec3 inPointRelativeToCOM);
extern JPC_Vec3 JPC_Body_GetPointVelocity(const JPC_Body* self, JPC_RVec3 inPoint);
extern void JPC_Body_AddForce(JPC_Body* self, JPC_Vec3 inForce);
// overload of Body::AddForce
extern void JPC_Body_AddForceAtPoint(JPC_Body* self, JPC_Vec3 inForce, JPC_RVec3 inPosition);
extern void JPC_Body_AddTorque(JPC_Body* self, JPC_Vec3 inTorque);
extern JPC_Vec3 JPC_Body_GetAccumulatedForce(const JPC_Body* self);
extern JPC_Vec3 JPC_Body_GetAccumulatedTorque(const JPC_Body* self);
extern void JPC_Body_ResetForce(JPC_Body* self);
extern void JPC_Body_ResetTorque(JPC_Body* self);
extern void JPC_Body_ResetMotion(JPC_Body* self);
extern void JPC_Body_GetInverseInertia(const JPC_Body* self, JPC_Mat44* outMatrix);
extern void JPC_Body_AddImpulse(JPC_Body* self, JPC_Vec3 inImpulse);
extern void JPC_Body_AddImpulse2(JPC_Body* self, JPC_Vec3 inImpulse, JPC_RVec3 inPosition);
extern void JPC_Body_AddAngularImpulse(JPC_Body* self, JPC_Vec3 inAngularImpulse);
extern void JPC_Body_MoveKinematic(JPC_Body* self, JPC_RVec3 inTargetPosition, JPC_Quat inTargetRotation, float inDeltaTime);
extern bool JPC_Body_ApplyBuoyancyImpulse(JPC_Body* self, JPC_RVec3 inSurfacePosition, JPC_Vec3 inSurfaceNormal, float inBuoyancy, float inLinearDrag, float inAngularDrag, JPC_Vec3 inFluidVelocity, JPC_Vec3 inGravity, float inDeltaTime);
extern bool JPC_Body_IsInBroadPhase(const JPC_Body* self);
extern bool JPC_Body_IsCollisionCacheInvalid(const JPC_Body* self);
extern const JPC_Shape* JPC_Body_GetShape(const JPC_Body* self);
extern JPC_RVec3 JPC_Body_GetPosition(const JPC_Body* self);
extern JPC_Quat JPC_Body_GetRotation(const JPC_Body* self);
extern JPC_RMat44 JPC_Body_GetWorldTransform(const JPC_Body* self);
extern JPC_RVec3 JPC_Body_GetCenterOfMassPosition(const JPC_Body* self);

extern JPC_RMat44 JPC_Body_GetCenterOfMassTransform(const JPC_Body* self);
extern JPC_RMat44 JPC_Body_GetInverseCenterOfMassTransform(const JPC_Body* self);

// extern const AABox & JPC_Body_GetWorldSpaceBounds(const JPC_Body* self);
// extern const MotionProperties *JPC_Body_GetMotionProperties(const JPC_Body* self)
// extern MotionProperties * JPC_Body_GetMotionProperties(JPC_Body* self);
// extern const MotionProperties *JPC_Body_GetMotionPropertiesUnchecked(const JPC_Body* self)
// extern MotionProperties * JPC_Body_GetMotionPropertiesUnchecked(JPC_Body* self);

extern uint64_t JPC_Body_GetUserData(const JPC_Body* self);
extern void JPC_Body_SetUserData(JPC_Body* self, uint64_t inUserData);

extern JPC_Vec3 JPC_Body_GetWorldSpaceSurfaceNormal(const JPC_Body* self, JPC_SubShapeID inSubShapeID, JPC_RVec3 inPosition);

// extern TransformedShape JPC_Body_GetTransformedShape(const JPC_Body* self);
// extern BodyCreationSettings JPC_Body_GetBodyCreationSettings(const JPC_Body* self);
// extern SoftBodyCreationSettings JPC_Body_GetSoftBodyCreationSettings(const JPC_Body* self);

////////////////////////////////////////////////////////////////////////////////
// BodyLockInterface

typedef struct JPC_BodyLockInterface JPC_BodyLockInterface;

////////////////////////////////////////////////////////////////////////////////
// BodyLockRead

typedef struct JPC_BodyLockRead JPC_BodyLockRead;

extern JPC_BodyLockRead* JPC_BodyLockRead_new(const JPC_BodyLockInterface* interface, JPC_BodyID bodyID);
extern void JPC_BodyLockRead_delete(JPC_BodyLockRead* self);

extern bool JPC_BodyLockRead_Succeeded(JPC_BodyLockRead* self);
extern const JPC_Body* JPC_BodyLockRead_GetBody(JPC_BodyLockRead* self);

////////////////////////////////////////////////////////////////////////////////
// BodyLockWrite

typedef struct JPC_BodyLockWrite JPC_BodyLockWrite;

extern JPC_BodyLockWrite* JPC_BodyLockWrite_new(const JPC_BodyLockInterface* interface, JPC_BodyID bodyID);
extern void JPC_BodyLockWrite_delete(JPC_BodyLockWrite* self);

extern bool JPC_BodyLockWrite_Succeeded(JPC_BodyLockWrite* self);
extern JPC_Body* JPC_BodyLockWrite_GetBody(JPC_BodyLockWrite* self);

////////////////////////////////////////////////////////////////////////////////
// BodyLockMultiRead

typedef struct JPC_BodyLockMultiRead JPC_BodyLockMultiRead;

extern JPC_BodyLockMultiRead* JPC_BodyLockMultiRead_new(
	const JPC_BodyLockInterface* interface,
	const JPC_BodyID *inBodyIDs,
	int inNumber);
extern void JPC_BodyLockMultiRead_delete(JPC_BodyLockMultiRead* self);

extern const JPC_Body* JPC_BodyLockMultiRead_GetBody(JPC_BodyLockMultiRead* self, int inBodyIndex);

////////////////////////////////////////////////////////////////////////////////
// BodyLockMultiWrite

typedef struct JPC_BodyLockMultiWrite JPC_BodyLockMultiWrite;

extern JPC_BodyLockMultiWrite* JPC_BodyLockMultiWrite_new(
	const JPC_BodyLockInterface* interface,
	const JPC_BodyID *inBodyIDs,
	int inNumber);
extern void JPC_BodyLockMultiWrite_delete(JPC_BodyLockMultiWrite* self);

extern JPC_Body* JPC_BodyLockMultiWrite_GetBody(JPC_BodyLockMultiWrite* self, int inBodyIndex);

////////////////////////////////////////////////////////////////////////////////
// BodyInterface

typedef struct JPC_BodyInterface JPC_BodyInterface;

extern JPC_Body* JPC_BodyInterface_CreateBody(JPC_BodyInterface* self, const JPC_BodyCreationSettings* inSettings);
extern JPC_Body* JPC_BodyInterface_CreateBodyWithID(JPC_BodyInterface *self, JPC_BodyID inBodyID, const JPC_BodyCreationSettings* inSettings);
extern JPC_Body* JPC_BodyInterface_CreateBodyWithoutID(const JPC_BodyInterface *self, const JPC_BodyCreationSettings* inSettings);

// extern JPC_Body* JPC_BodyInterface_CreateSoftBody(JPC_BodyInterface *self, const SoftBodyCreationSettings &inSettings);
// extern JPC_Body* JPC_BodyInterface_CreateSoftBodyWithID(JPC_BodyInterface *self, JPC_BodyID inBodyID, const SoftBodyCreationSettings* inSettings);
// extern JPC_Body* JPC_BodyInterface_CreateSoftBodyWithoutID(const JPC_BodyInterface *self, const SoftBodyCreationSettings* inSettings);

extern void JPC_BodyInterface_DestroyBodyWithoutID(const JPC_BodyInterface *self, JPC_Body *inBody);
extern bool JPC_BodyInterface_AssignBodyID(JPC_BodyInterface *self, JPC_Body *ioBody);

// extern bool JPC_BodyInterface_AssignBodyID(JPC_BodyInterface *self, JPC_Body *ioBody, JPC_BodyID inBodyID);

extern JPC_Body* JPC_BodyInterface_UnassignBodyID(JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_UnassignBodyIDs(JPC_BodyInterface *self, const JPC_BodyID *inBodyIDs, int inNumber, JPC_Body **outBodies);
extern void JPC_BodyInterface_DestroyBody(JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_DestroyBodies(JPC_BodyInterface *self, const JPC_BodyID *inBodyIDs, int inNumber);
extern void JPC_BodyInterface_AddBody(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Activation inActivationMode);
extern void JPC_BodyInterface_RemoveBody(JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern bool JPC_BodyInterface_IsAdded(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern JPC_BodyID JPC_BodyInterface_CreateAndAddBody(JPC_BodyInterface *self, const JPC_BodyCreationSettings* inSettings, JPC_Activation inActivationMode);

// extern JPC_BodyID JPC_BodyInterface_CreateAndAddSoftBody(JPC_BodyInterface *self, const SoftBodyCreationSettings &inSettings, JPC_Activation inActivationMode);

extern void* JPC_BodyInterface_AddBodiesPrepare(JPC_BodyInterface *self, JPC_BodyID *ioBodies, int inNumber);
extern void JPC_BodyInterface_AddBodiesFinalize(JPC_BodyInterface *self, JPC_BodyID *ioBodies, int inNumber, void* inAddState, JPC_Activation inActivationMode);
extern void JPC_BodyInterface_AddBodiesAbort(JPC_BodyInterface *self, JPC_BodyID *ioBodies, int inNumber, void* inAddState);
extern void JPC_BodyInterface_RemoveBodies(JPC_BodyInterface *self, JPC_BodyID *ioBodies, int inNumber);
extern void JPC_BodyInterface_ActivateBody(JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_ActivateBodies(JPC_BodyInterface *self, JPC_BodyID *inBodyIDs, int inNumber);

// extern void JPC_BodyInterface_ActivateBodiesInAABox(JPC_BodyInterface *self, const AABox &inBox, const BroadPhaseLayerFilter &inBroadPhaseLayerFilter, const ObjectLayerFilter &inObjectLayerFilter);

extern void JPC_BodyInterface_DeactivateBody(JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_DeactivateBodies(JPC_BodyInterface *self, JPC_BodyID *inBodyIDs, int inNumber);
extern bool JPC_BodyInterface_IsActive(const JPC_BodyInterface *self, JPC_BodyID inBodyID);

// TwoBodyConstraint * JPC_BodyInterface_CreateConstraint(JPC_BodyInterface *self, const TwoBodyConstraintSettings *inSettings, JPC_BodyID inBodyID1, JPC_BodyID inBodyID2);
// extern void JPC_BodyInterface_ActivateConstraint(JPC_BodyInterface *self, const TwoBodyConstraint *inConstraint);
extern const JPC_Shape* JPC_BodyInterface_GetShape(const JPC_BodyInterface *self, JPC_BodyID inBodyID);

extern void JPC_BodyInterface_SetShape(const JPC_BodyInterface *self, JPC_BodyID inBodyID, const JPC_Shape *inShape, bool inUpdateMassProperties, JPC_Activation inActivationMode);
extern void JPC_BodyInterface_NotifyShapeChanged(const JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inPreviousCenterOfMass, bool inUpdateMassProperties, JPC_Activation inActivationMode);
extern void JPC_BodyInterface_SetObjectLayer(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_ObjectLayer inLayer);
extern JPC_ObjectLayer JPC_BodyInterface_GetObjectLayer(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_SetPositionAndRotation(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_RVec3 inPosition, JPC_Quat inRotation, JPC_Activation inActivationMode);
extern void JPC_BodyInterface_SetPositionAndRotationWhenChanged(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_RVec3 inPosition, JPC_Quat inRotation, JPC_Activation inActivationMode);
extern void JPC_BodyInterface_GetPositionAndRotation(const JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_RVec3 *outPosition, JPC_Quat *outRotation);
extern void JPC_BodyInterface_SetPosition(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_RVec3 inPosition, JPC_Activation inActivationMode);
extern JPC_RVec3 JPC_BodyInterface_GetPosition(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern JPC_RVec3 JPC_BodyInterface_GetCenterOfMassPosition(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_SetRotation(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Quat inRotation, JPC_Activation inActivationMode);
extern JPC_Quat JPC_BodyInterface_GetRotation(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern JPC_RMat44 JPC_BodyInterface_GetWorldTransform(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern JPC_RMat44 JPC_BodyInterface_GetCenterOfMassTransform(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_MoveKinematic(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_RVec3 inTargetPosition, JPC_Quat inTargetRotation, float inDeltaTime);
extern void JPC_BodyInterface_SetLinearAndAngularVelocity(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inLinearVelocity, JPC_Vec3 inAngularVelocity);
extern void JPC_BodyInterface_GetLinearAndAngularVelocity(const JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 *outLinearVelocity, JPC_Vec3 *outAngularVelocity);
extern void JPC_BodyInterface_SetLinearVelocity(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inLinearVelocity);
extern JPC_Vec3 JPC_BodyInterface_GetLinearVelocity(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_AddLinearVelocity(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inLinearVelocity);
extern void JPC_BodyInterface_AddLinearAndAngularVelocity(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inLinearVelocity, JPC_Vec3 inAngularVelocity);
extern void JPC_BodyInterface_SetAngularVelocity(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inAngularVelocity);
extern JPC_Vec3 JPC_BodyInterface_GetAngularVelocity(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern JPC_Vec3 JPC_BodyInterface_GetPointVelocity(const JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_RVec3 inPoint);
extern void JPC_BodyInterface_SetPositionRotationAndVelocity(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_RVec3 inPosition, JPC_Quat inRotation, JPC_Vec3 inLinearVelocity, JPC_Vec3 inAngularVelocity);
extern void JPC_BodyInterface_AddForce(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inForce);
// overload of BodyInterface::AddForce
extern void JPC_BodyInterface_AddForceAtPoint(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inForce, JPC_RVec3 inPoint);
extern void JPC_BodyInterface_AddTorque(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inTorque);
extern void JPC_BodyInterface_AddForceAndTorque(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inForce, JPC_Vec3 inTorque);
extern void JPC_BodyInterface_AddImpulse(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inImpulse);
extern void JPC_BodyInterface_AddImpulse3(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inImpulse, JPC_RVec3 inPoint);
extern void JPC_BodyInterface_AddAngularImpulse(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Vec3 inAngularImpulse);
extern JPC_BodyType JPC_BodyInterface_GetBodyType(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_SetMotionType(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_MotionType inMotionType, JPC_Activation inActivationMode);
extern JPC_MotionType JPC_BodyInterface_GetMotionType(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_SetMotionQuality(JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_MotionQuality inMotionQuality);
extern JPC_MotionQuality JPC_BodyInterface_GetMotionQuality(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_GetInverseInertia(const JPC_BodyInterface *self, JPC_BodyID inBodyID, JPC_Mat44 *outMatrix);
extern void JPC_BodyInterface_SetRestitution(JPC_BodyInterface *self, JPC_BodyID inBodyID, float inRestitution);
extern float JPC_BodyInterface_GetRestitution(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_SetFriction(JPC_BodyInterface *self, JPC_BodyID inBodyID, float inFriction);
extern float JPC_BodyInterface_GetFriction(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_SetGravityFactor(JPC_BodyInterface *self, JPC_BodyID inBodyID, float inGravityFactor);
extern float JPC_BodyInterface_GetGravityFactor(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_SetUseManifoldReduction(JPC_BodyInterface *self, JPC_BodyID inBodyID, bool inUseReduction);
extern bool JPC_BodyInterface_GetUseManifoldReduction(const JPC_BodyInterface *self, JPC_BodyID inBodyID);

// TransformedShape JPC_BodyInterface_GetTransformedShape(const JPC_BodyInterface *self, JPC_BodyID inBodyID);

extern uint64_t JPC_BodyInterface_GetUserData(const JPC_BodyInterface *self, JPC_BodyID inBodyID);
extern void JPC_BodyInterface_SetUserData(const JPC_BodyInterface *self, JPC_BodyID inBodyID, uint64_t inUserData);

// const PhysicsMaterial* JPC_BodyInterface_GetMaterial(const JPC_BodyInterface *self, JPC_BodyID inBodyID, const SubShapeID &inSubShapeID);

extern void JPC_BodyInterface_InvalidateContactCache(JPC_BodyInterface *self, JPC_BodyID inBodyID);

////////////////////////////////////////////////////////////////////////////////
// NarrowPhaseQuery

typedef struct JPC_NarrowPhaseQuery JPC_NarrowPhaseQuery;

typedef struct JPC_NarrowPhaseQuery_CastRayArgs {
	JPC_RRayCast Ray;
	JPC_RayCastResult Result;
	const JPC_BroadPhaseLayerFilter *BroadPhaseLayerFilter;
	const JPC_ObjectLayerFilter *ObjectLayerFilter;
	const JPC_BodyFilter *BodyFilter;
	const JPC_ShapeFilter *ShapeFilter;
} JPC_NarrowPhaseQuery_CastRayArgs;

extern bool JPC_NarrowPhaseQuery_CastRay(const JPC_NarrowPhaseQuery* self, JPC_NarrowPhaseQuery_CastRayArgs* args);

typedef struct JPC_RShapeCast {
	const JPC_Shape *Shape;
	JPC_Vec3 Scale;
	JPC_RMat44 CenterOfMassStart;
	JPC_Vec3 Direction;
	// const JPC_AABox ShapeWorldBounds;
} JPC_RShapeCast;

extern void JPC_ShapeCastSettings_default(JPC_ShapeCastSettings* object);

typedef struct JPC_NarrowPhaseQuery_CastShapeArgs {
	JPC_RShapeCast ShapeCast;
	JPC_ShapeCastSettings Settings;
	JPC_RVec3 BaseOffset;
	JPC_CastShapeCollector *Collector;
	const JPC_BroadPhaseLayerFilter *BroadPhaseLayerFilter;
	const JPC_ObjectLayerFilter *ObjectLayerFilter;
	const JPC_BodyFilter *BodyFilter;
	const JPC_ShapeFilter *ShapeFilter;
} JPC_NarrowPhaseQuery_CastShapeArgs;

extern void JPC_NarrowPhaseQuery_CastShape(const JPC_NarrowPhaseQuery* self, JPC_NarrowPhaseQuery_CastShapeArgs* args);

extern void JPC_CollideShapeSettings_default(JPC_CollideShapeSettings* object);

typedef struct JPC_NarrowPhaseQuery_CollideShapeArgs {
	const JPC_Shape *Shape;
	JPC_Vec3 ShapeScale;
	JPC_RMat44 CenterOfMassTransform;
	JPC_CollideShapeSettings Settings;
	JPC_RVec3 BaseOffset;
	JPC_CollideShapeCollector *Collector;
	const JPC_BroadPhaseLayerFilter *BroadPhaseLayerFilter;
	const JPC_ObjectLayerFilter *ObjectLayerFilter;
	const JPC_BodyFilter *BodyFilter;
	const JPC_ShapeFilter *ShapeFilter;
} JPC_NarrowPhaseQuery_CollideShapeArgs;

extern void JPC_NarrowPhaseQuery_CollideShape(const JPC_NarrowPhaseQuery* self, JPC_NarrowPhaseQuery_CollideShapeArgs* args);

////////////////////////////////////////////////////////////////////////////////
// PhysicsSystem

typedef struct JPC_PhysicsSystem JPC_PhysicsSystem;

extern JPC_PhysicsSystem* JPC_PhysicsSystem_new();
extern void JPC_PhysicsSystem_delete(JPC_PhysicsSystem* object);
extern void JPC_PhysicsSystem_Init(
	JPC_PhysicsSystem* self,
	uint inMaxBodies,
	uint inNumBodyMutexes,
	uint inMaxBodyPairs,
	uint inMaxContactConstraints,
	JPC_BroadPhaseLayerInterface* inBroadPhaseLayerInterface,
	JPC_ObjectVsBroadPhaseLayerFilter* inObjectVsBroadPhaseLayerFilter,
	JPC_ObjectLayerPairFilter* inObjectLayerPairFilter);

extern void JPC_PhysicsSystem_OptimizeBroadPhase(JPC_PhysicsSystem* self);

extern JPC_PhysicsUpdateError JPC_PhysicsSystem_Update(
	JPC_PhysicsSystem* self,
	float inDeltaTime,
	int inCollisionSteps,
	JPC_TempAllocatorImpl *inTempAllocator, // FIXME: un-specialize
	JPC_JobSystem* inJobSystem);

extern void JPC_PhysicsSystem_AddConstraint(JPC_PhysicsSystem* self, JPC_Constraint* constraint);
extern void JPC_PhysicsSystem_RemoveConstraint(JPC_PhysicsSystem* self, JPC_Constraint* constraint);

extern JPC_BodyInterface* JPC_PhysicsSystem_GetBodyInterface(JPC_PhysicsSystem* self);
extern const JPC_BodyLockInterface* JPC_PhysicsSystem_GetBodyLockInterface(JPC_PhysicsSystem* self);

extern const JPC_NarrowPhaseQuery* JPC_PhysicsSystem_GetNarrowPhaseQuery(const JPC_PhysicsSystem* self);

extern void JPC_PhysicsSystem_DrawBodies(
	JPC_PhysicsSystem* self,
	JPC_BodyManager_DrawSettings* inSettings,
	JPC_DebugRendererSimple* inRenderer, // FIXME: un-specialize
	const void* inBodyFilter); // FIXME: BodyDrawFilter

extern void JPC_PhysicsSystem_DrawConstraints(
	JPC_PhysicsSystem* self,
	JPC_DebugRendererSimple* inRenderer); // FIXME: un-specialize

extern void JPC_PhysicsSystem_SetSimShapeFilter(JPC_PhysicsSystem* self, const JPC_SimShapeFilter* inShapeFilter);

extern void JPC_PhysicsSystem_SetContactListener(JPC_PhysicsSystem* self, JPC_ContactListener* inContactListener);

#ifdef __cplusplus
}
#endif
