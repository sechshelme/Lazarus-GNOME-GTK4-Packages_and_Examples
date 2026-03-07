// SPDX-FileCopyrightText: 2023 Erin Catto
// SPDX-License-Identifier: MIT

#pragma once

#include <stdint.h>

// Note: this file should be stand-alone

/**
 * @defgroup id Ids
 * These ids serve as handles to internal Box2D objects.
 * These should be considered opaque data and passed by value.
 * Include this header if you need the id types and not the whole Box2D API.
 * All ids are considered null if initialized to zero.
 *
 * For example in C++:
 *
 * @code{.cxx}
 * b2WorldId worldId = {};
 * @endcode
 *
 * Or in C:
 *
 * @code{.c}
 * b2WorldId worldId = {0};
 * @endcode
 *
 * These are both considered null.
 *
 * @warning Do not use the internals of these ids. They are subject to change. Ids should be treated as opaque objects.
 * @warning You should use ids to access objects in Box2D. Do not access files within the src folder. Such usage is unsupported.
 * @{
 */

/// World id references a world instance. This should be treated as an opaque handle.
typedef struct b2WorldId
{
	uint16_t index1;
	uint16_t generation;
} b2WorldId;

/// Body id references a body instance. This should be treated as an opaque handle.
typedef struct b2BodyId
{
	int32_t index1;
	uint16_t world0;
	uint16_t generation;
} b2BodyId;

/// Shape id references a shape instance. This should be treated as an opaque handle.
typedef struct b2ShapeId
{
	int32_t index1;
	uint16_t world0;
	uint16_t generation;
} b2ShapeId;

/// Chain id references a chain instances. This should be treated as an opaque handle.
typedef struct b2ChainId
{
	int32_t index1;
	uint16_t world0;
	uint16_t generation;
} b2ChainId;

/// Joint id references a joint instance. This should be treated as an opaque handle.
typedef struct b2JointId
{
	int32_t index1;
	uint16_t world0;
	uint16_t generation;
} b2JointId;

/// Contact id references a contact instance. This should be treated as an opaque handled.
typedef struct b2ContactId
{
	int32_t index1;
	uint16_t world0;
	int16_t padding;
	uint32_t generation;
} b2ContactId;


/// Use these to make your identifiers null.
/// You may also use zero initialization to get null.

/* xxxxxxxxxxx 
static const b2WorldId b2_nullWorldId = B2_NULL_ID;
static const b2BodyId b2_nullBodyId = B2_NULL_ID;
static const b2ShapeId b2_nullShapeId = B2_NULL_ID;
static const b2ChainId b2_nullChainId = B2_NULL_ID;
static const b2JointId b2_nullJointId = B2_NULL_ID;
static const b2ContactId b2_nullContactId = B2_NULL_ID;
*/

/// Macro to determine if any id is null.
#define B2_IS_NULL( id ) ( (id).index1 == 0 )

/// Macro to determine if any id is non-null.
#define B2_IS_NON_NULL( id ) ( (id).index1 != 0 )

/// Compare two ids for equality. Doesn't work for b2WorldId. Don't mix types.
#define B2_ID_EQUALS( id1, id2 ) ( (id1).index1 == (id2).index1 && (id1).world0 == (id2).world0 && (id1).generation == (id2).generation )

/// Store a world id into a uint32_t.
extern uint32_t b2StoreWorldId( b2WorldId id );
extern b2WorldId b2LoadWorldId( uint32_t x );
extern uint64_t b2StoreBodyId( b2BodyId id );
extern b2BodyId b2LoadBodyId( uint64_t x );
extern uint64_t b2StoreShapeId( b2ShapeId id );
extern b2ShapeId b2LoadShapeId( uint64_t x );
extern uint64_t b2StoreChainId( b2ChainId id );
extern b2ChainId b2LoadChainId( uint64_t x );
extern uint64_t b2StoreJointId( b2JointId id );
extern b2JointId b2LoadJointId( uint64_t x );
extern void b2StoreContactId( b2ContactId id, uint32_t values[3] );
extern b2ContactId b2LoadContactId( uint32_t values[3] );

