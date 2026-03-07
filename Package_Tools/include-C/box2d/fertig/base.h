// SPDX-FileCopyrightText: 2023 Erin Catto
// SPDX-License-Identifier: MIT

#pragma once

#include <stdint.h>

// clang-format off
// 
// Shared library macros

/// Prototype for user allocation function
/// @param size the allocation size in bytes
/// @param alignment the required alignment, guaranteed to be a power of 2
typedef void* (*b2AllocFcn)( unsigned int size, int alignment );

/// Prototype for user free function
/// @param mem the memory previously allocated through `b2AllocFcn`
/// @param size the allocation size in bytes
typedef void (*b2FreeFcn)( void* mem, unsigned int size );

/// Prototype for the user assert callback. Return 0 to skip the debugger break.
typedef int (*b2AssertFcn)( const char* condition, const char* fileName, int lineNumber );

/// Prototype for user log callback. Used to log warnings.
typedef void (*b2LogFcn)( const char* message );

/// This allows the user to override the allocation functions. These should be
/// set during application startup.
extern void b2SetAllocator( b2AllocFcn* allocFcn, b2FreeFcn* freeFcn );

/// @return the total bytes allocated by Box2D
extern int b2GetByteCount( void );

/// Override the default assert function
/// @param assertFcn a non-null assert callback
extern void b2SetAssertFcn( b2AssertFcn* assertFcn );

/// Override the default log function
/// @param logFcn a non-null log callback
extern void b2SetLogFcn( b2LogFcn* logFcn );

/// Version numbering scheme.
/// See https://semver.org/
typedef struct b2Version
{
	/// Significant changes
	int major;

	/// Incremental changes
	int minor;

	/// Bug fixes
	int revision;
} b2Version;

/// Get the current version of Box2D
extern b2Version b2GetVersion( void );

/**@}*/

//! @cond

// see https://github.com/scottt/debugbreak
#if defined( _MSC_VER )
#define B2_BREAKPOINT __debugbreak()
#elif defined( __GNUC__ ) || defined( __clang__ )
#define B2_BREAKPOINT __builtin_trap()
#else
// Unknown compiler
#include <assert.h>
#define B2_BREAKPOINT assert( 0 )
#endif

#if !defined( NDEBUG ) || defined( B2_ENABLE_ASSERT )
extern int b2InternalAssertFcn( const char* condition, const char* fileName, int lineNumber );

/// Get the absolute number of system ticks. The value is platform specific.
extern uint64_t b2GetTicks( void );

/// Get the milliseconds passed from an initial tick value.
extern float b2GetMilliseconds( uint64_t ticks );

/// Get the milliseconds passed from an initial tick value. Resets the passed in
/// value to the current tick value.
extern float b2GetMillisecondsAndReset( uint64_t* ticks );

/// Yield to be used in a busy loop.
extern void b2Yield( void );

/// Simple djb2 hash function for determinism testing
#define B2_HASH_INIT 5381
extern uint32_t b2Hash( uint32_t hash, const uint8_t* data, int count );

//! @endcond
