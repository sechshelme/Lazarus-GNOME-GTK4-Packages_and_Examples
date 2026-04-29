
unit objects;
interface

{
  Automatically converted by H2Pas 1.0.0 from objects.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    objects.h
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
PdContact  = ^dContact;
PdJointFeedback  = ^dJointFeedback;
PdJointID  = ^dJointID;
PdMass  = ^dMass;
PdReal  = ^dReal;
PdThreadingFunctionsInfo  = ^dThreadingFunctionsInfo;
PdWorldStepMemoryFunctionsInfo  = ^dWorldStepMemoryFunctionsInfo;
PdWorldStepReserveInfo  = ^dWorldStepReserveInfo;
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
{$ifndef _ODE_OBJECTS_H_}
{$define _ODE_OBJECTS_H_}
{$include <ode/common.h>}
{$include <ode/mass.h>}
{$include <ode/contact.h>}
{$include <ode/threading.h>}
{ C++ extern C conditionnal removed }
{*
 * @defgroup world World
 *
 * The world object is a container for rigid bodies and joints. Objects in
 * different worlds can not interact, for example rigid bodies from two
 * different worlds can not collide.
 *
 * All the objects in a world exist at the same point in time, thus one
 * reason to use separate worlds is to simulate systems at different rates.
 * Most applications will only need one world.
  }
{*
 * @brief Create a new, empty world and return its ID number.
 * @return an identifier
 * @ingroup world
  }

function dWorldCreate:TdWorldID;cdecl;external;
{*
 * @brief Destroy a world and everything in it.
 *
 * This includes all bodies, and all joints that are not part of a joint
 * group. Joints that are part of a joint group will be deactivated, and
 * can be destroyed by calling, for example, dJointGroupEmpty().
 * @ingroup world
 * @param world the identifier for the world the be destroyed.
  }
procedure dWorldDestroy(world:TdWorldID);cdecl;external;
{*
 * @brief Set the user-data pointer
 * @param world the world to set the data on
 * @param data
 * @ingroup world
  }
procedure dWorldSetData(world:TdWorldID; data:pointer);cdecl;external;
{*
 * @brief Get the user-data pointer
 * @param world the world to set the data on
 * @param data
 * @ingroup world
  }
function dWorldGetData(world:TdWorldID):pointer;cdecl;external;
{*
 * @brief Set the world's global gravity vector.
 *
 * The units are m/s^2, so Earth's gravity vector would be (0,0,-9.81),
 * assuming that +z is up. The default is no gravity, i.e. (0,0,0).
 *
 * @ingroup world
  }
procedure dWorldSetGravity(para1:TdWorldID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Get the gravity vector for a given world.
 * @ingroup world
  }
procedure dWorldGetGravity(para1:TdWorldID; gravity:TdVector3);cdecl;external;
{*
 * @brief Set the global ERP value, that controls how much error
 * correction is performed in each time step.
 * @ingroup world
 * @param dWorldID the identifier of the world.
 * @param erp Typical values are in the range 0.1--0.8. The default is 0.2.
  }
procedure dWorldSetERP(para1:TdWorldID; erp:TdReal);cdecl;external;
{*
 * @brief Get the error reduction parameter.
 * @ingroup world
 * @return ERP value
  }
function dWorldGetERP(para1:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set the global CFM (constraint force mixing) value.
 * @ingroup world
 * @param cfm Typical values are in the range @m10^-9 -- 1.
 * The default is 10^-5 if single precision is being used, or 10^-10
 * if double precision is being used.
  }
procedure dWorldSetCFM(para1:TdWorldID; cfm:TdReal);cdecl;external;
{*
 * @brief Get the constraint force mixing value.
 * @ingroup world
 * @return CFM value
  }
function dWorldGetCFM(para1:TdWorldID):TdReal;cdecl;external;
const
  dWORLDSTEP_THREADCOUNT_UNLIMITED = dTHREADING_THREAD_COUNT_UNLIMITED;  
{*
 * @brief Set maximum threads to be used for island stepping
 *
 * The actual number of threads that is going to be used will be the minimum
 * of this limit and number of threads in the threading pool. By default 
 * there is no limit (@c dWORLDSTEP_THREADCOUNT_UNLIMITED).
 *
 * @warning
 * WARNING! Running island stepping in multiple threads requires allocating 
 * individual stepping memory buffer for each of those threads. The size of buffers
 * allocated is the size needed to handle the largest island in the world.
 *
 * Note: Setting a limit for island stepping does not affect threading at lower
 * levels in stepper functions. The sub-calls scheduled from them can be executed
 * in as many threads as there are available in the pool.
 *
 * @param w The world affected
 * @param count Thread count limit value for island stepping
 * @ingroup world
 * @see dWorldGetStepIslandsProcessingMaxThreadCount
  }

procedure dWorldSetStepIslandsProcessingMaxThreadCount(w:TdWorldID; count:dword);cdecl;external;
{*
 * @brief Get maximum threads that are allowed to be used for island stepping.
 *
 * Please read commentaries to @c dWorldSetStepIslandsProcessingMaxThreadCount for 
 * important information regarding the value returned.
 *
 * @param w The world queried
 * @returns Current thread count limit value for island stepping
 * @ingroup world
 * @see dWorldSetStepIslandsProcessingMaxThreadCount
  }
function dWorldGetStepIslandsProcessingMaxThreadCount(w:TdWorldID):dword;cdecl;external;
{*
 * @brief Set the world to use shared working memory along with another world.
 *
 * The worlds allocate working memory internally for simulation stepping. This
 * memory is cached among the calls to @c dWordStep and @c dWorldQuickStep. 
 * Similarly, several worlds can be set up to share this memory caches thus 
 * reducing overall memory usage by cost of making worlds inappropriate for 
 * simultaneous simulation in multiple threads.
 *
 * If null value is passed for @a from_world parameter the world is detached from 
 * sharing and returns to defaults for working memory, reservation policy and 
 * memory manager as if just created. This can also be used to enable use of shared 
 * memory for a world that has already had working memory allocated privately.
 * Normally using shared memory after a world has its private working memory allocated
 * is prohibited.
 *
 * Allocation policy used can only increase world's internal reserved memory size
 * and never decreases it. @c dWorldCleanupWorkingMemory can be used to release 
 * working memory for a world in case if number of objects/joint decreases 
 * significantly in it.
 *
 * With sharing working memory worlds also automatically share memory reservation 
 * policy and memory manager. Thus, these parameters need to be customized for
 * initial world to be used as sharing source only.
 *
 * If worlds share working memory they must also use compatible threading implementations
 * (i.e. it is illegal for one world to perform stepping with self-threaded implementation
 * when the other world is assigned a multi-threaded implementation). 
 * For more information read section about threading approaches in ODE.
 *
 * Failure result status means a memory allocation failure.
 *
 * @param w The world to use the shared memory with.
 * @param from_world Null or the world the shared memory is to be used from.
 * @returns 1 for success and 0 for failure.
 *
 * @ingroup world
 * @see dWorldCleanupWorkingMemory
 * @see dWorldSetStepMemoryReservationPolicy
 * @see dWorldSetStepMemoryManager
  }
{=NULL }function dWorldUseSharedWorkingMemory(w:TdWorldID; from_world:TdWorldID):longint;cdecl;external;
{*
 * @brief Release internal working memory allocated for world
 *
 * The worlds allocate working memory internally for simulation stepping. This 
 * function can be used to free world's internal memory cache in case if number of
 * objects/joints in the world decreases significantly. By default, internal 
 * allocation policy is used to only increase cache size as necessary and never 
 * decrease it.
 *
 * If a world shares its working memory with other worlds the cache deletion 
 * affects all the linked worlds. However the shared status itself remains intact.
 *
 * The function call does affect neither memory reservation policy nor memory manager.
 *
 * @param w The world to release working memory for.
 *
 * @ingroup world
 * @see dWorldUseSharedWorkingMemory
 * @see dWorldSetStepMemoryReservationPolicy
 * @see dWorldSetStepMemoryManager
  }
procedure dWorldCleanupWorkingMemory(w:TdWorldID);cdecl;external;
const
  dWORLDSTEP_RESERVEFACTOR_DEFAULT = 1.2;  
  dWORLDSTEP_RESERVESIZE_DEFAULT = 65536;  
{*
 * @struct dWorldStepReserveInfo
 * @brief Memory reservation policy descriptor structure for world stepping functions.
 *
 * @c struct_size should be assigned the size of the structure.
 *
 * @c reserve_factor is a quotient that is multiplied by required memory size
 *  to allocate extra reserve whenever reallocation is needed.
 *
 * @c reserve_minimum is a minimum size that is checked against whenever reallocation 
 * is needed to allocate expected working memory minimum at once without extra 
 * reallocations as number of bodies/joints grows.
 *
 * @ingroup world
 * @see dWorldSetStepMemoryReservationPolicy
  }
{ Use float as precision does not matter here }
type
  PdWorldStepReserveInfo = ^TdWorldStepReserveInfo;
  TdWorldStepReserveInfo = record
      struct_size : dword;
      reserve_factor : single;
      reserve_minimum : dword;
    end;
{*
 * @brief Set memory reservation policy for world to be used with simulation stepping functions
 *
 * The function allows to customize reservation policy to be used for internal
 * memory which is allocated to aid simulation for a world. By default, values
 * of @c dWORLDSTEP_RESERVEFACTOR_DEFAULT and @c dWORLDSTEP_RESERVESIZE_DEFAULT
 * are used.
 *
 * Passing @a policyinfo argument as NULL results in reservation policy being
 * reset to defaults as if the world has been just created. The content of 
 * @a policyinfo structure is copied internally and does not need to remain valid
 * after the call returns.
 *
 * If the world uses working memory sharing, changing memory reservation policy
 * affects all the worlds linked together.
 *
 * Failure result status means a memory allocation failure.
 *
 * @param w The world to change memory reservation policy for.
 * @param policyinfo Null or a pointer to policy descriptor structure.
 * @returns 1 for success and 0 for failure.
 *
 * @ingroup world
 * @see dWorldUseSharedWorkingMemory
  }
(* Const before type ignored *)
{=NULL }
function dWorldSetStepMemoryReservationPolicy(w:TdWorldID; policyinfo:PdWorldStepReserveInfo):longint;cdecl;external;
{*
* @struct dWorldStepMemoryFunctionsInfo
* @brief World stepping memory manager descriptor structure
*
* This structure is intended to define the functions of memory manager to be used
* with world stepping functions.
*
* @c struct_size should be assigned the size of the structure
*
* @c alloc_block is a function to allocate memory block of given size.
*
* @c shrink_block is a function to shrink existing memory block to a smaller size.
* It must preserve the contents of block head while shrinking. The new block size
* is guaranteed to be always less than the existing one.
*
* @c free_block is a function to delete existing memory block.
*
* @ingroup init
* @see dWorldSetStepMemoryManager
 }
type
  PdWorldStepMemoryFunctionsInfo = ^TdWorldStepMemoryFunctionsInfo;
  TdWorldStepMemoryFunctionsInfo = record
      struct_size : dword;
      alloc_block : function (block_size:Tdsizeint):pointer;cdecl;
      shrink_block : function (block_pointer:pointer; block_current_size:Tdsizeint; block_smaller_size:Tdsizeint):pointer;cdecl;
      free_block : procedure (block_pointer:pointer; block_current_size:Tdsizeint);cdecl;
    end;
{*
* @brief Set memory manager for world to be used with simulation stepping functions
*
* The function allows to customize memory manager to be used for internal
* memory allocation during simulation for a world. By default, @c dAlloc/@c dRealloc/@c dFree
* based memory manager is used.
*
* Passing @a memfuncs argument as NULL results in memory manager being
* reset to default one as if the world has been just created. The content of 
* @a memfuncs structure is copied internally and does not need to remain valid
* after the call returns.
*
* If the world uses working memory sharing, changing memory manager
* affects all the worlds linked together. 
*
* Failure result status means a memory allocation failure.
*
* @param w The world to change memory reservation policy for.
* @param memfuncs Null or a pointer to memory manager descriptor structure.
* @returns 1 for success and 0 for failure.
*
* @ingroup world
* @see dWorldUseSharedWorkingMemory
 }
(* Const before type ignored *)

function dWorldSetStepMemoryManager(w:TdWorldID; memfuncs:PdWorldStepMemoryFunctionsInfo):longint;cdecl;external;
{*
 * @brief Assign threading implementation to be used for [quick]stepping the world.
 *
 * @warning It is not recommended to assign the same threading implementation to
 * different worlds if they are going to be called in parallel. In particular this
 * makes resources preallocation for threaded calls to lose its sense. 
 * Built-in threading implementation is likely to crash if misused this way.
 * 
 * @param w The world to change threading implementation for.
 * @param functions_info Pointer to threading functions structure
 * @param threading_impl ID of threading implementation object
 * 
 * @ingroup world
  }
(* Const before type ignored *)
procedure dWorldSetStepThreadingImplementation(w:TdWorldID; functions_info:PdThreadingFunctionsInfo; threading_impl:TdThreadingImplementationID);cdecl;external;
{*
 * @brief Step the world.
 *
 * This uses a "big matrix" method that takes time on the order of m^3
 * and memory on the order of m^2, where m is the total number of constraint
 * rows. For large systems this will use a lot of memory and can be very slow,
 * but this is currently the most accurate method.
 *
 * Failure result status means that the memory allocation has failed for operation.
 * In such a case all the objects remain in unchanged state and simulation can be
 * retried as soon as more memory is available.
 *
 * @param w The world to be stepped
 * @param stepsize The number of seconds that the simulation has to advance.
 * @returns 1 for success and 0 for failure
 *
 * @ingroup world
  }
function dWorldStep(w:TdWorldID; stepsize:TdReal):longint;cdecl;external;
{*
 * @brief Quick-step the world.
 *
 * This uses an iterative method that takes time on the order of m*N
 * and memory on the order of m, where m is the total number of constraint
 * rows N is the number of iterations.
 * For large systems this is a lot faster than dWorldStep(),
 * but it is less accurate.
 *
 * QuickStep is great for stacks of objects especially when the
 * auto-disable feature is used as well.
 * However, it has poor accuracy for near-singular systems.
 * Near-singular systems can occur when using high-friction contacts, motors,
 * or certain articulated structures. For example, a robot with multiple legs
 * sitting on the ground may be near-singular.
 *
 * There are ways to help overcome QuickStep's inaccuracy problems:
 *
 * \li Increase CFM.
 * \li Reduce the number of contacts in your system (e.g. use the minimum
 *     number of contacts for the feet of a robot or creature).
 * \li Don't use excessive friction in the contacts.
 * \li Use contact slip if appropriate
 * \li Avoid kinematic loops (however, kinematic loops are inevitable in
 *     legged creatures).
 * \li Don't use excessive motor strength.
 * \liUse force-based motors instead of velocity-based motors.
 *
 * Increasing the number of QuickStep iterations may help a little bit, but
 * it is not going to help much if your system is really near singular.
 *
 * Failure result status means that the memory allocation has failed for operation.
 * In such a case all the objects remain in unchanged state and simulation can be
 * retried as soon as more memory is available.
 *
 * @param w The world to be stepped
 * @param stepsize The number of seconds that the simulation has to advance.
 * @returns 1 for success and 0 for failure
 *
 * @ingroup world
  }
function dWorldQuickStep(w:TdWorldID; stepsize:TdReal):longint;cdecl;external;
{*
* @brief Converts an impulse to a force.
* @ingroup world
* @remarks
* If you want to apply a linear or angular impulse to a rigid body,
* instead of a force or a torque, then you can use this function to convert
* the desired impulse into a force/torque vector before calling the
* BodyAdd... function.
* The current algorithm simply scales the impulse by 1/stepsize,
* where stepsize is the step size for the next step that will be taken.
* This function is given a dWorldID because, in the future, the force
* computation may depend on integrator parameters that are set as
* properties of the world.
 }
procedure dWorldImpulseToForce(para1:TdWorldID; stepsize:TdReal; ix:TdReal; iy:TdReal; iz:TdReal; 
            force:TdVector3);cdecl;external;
{*
 * @brief Set the number of iterations that the QuickStep method performs per
 *        step.
 * @ingroup world
 * @remarks
 * More iterations will give a more accurate solution, but will take
 * longer to compute.
 * @param num The default is 20 iterations.
  }
procedure dWorldSetQuickStepNumIterations(para1:TdWorldID; num:longint);cdecl;external;
{*
 * @brief Get the number of iterations that the QuickStep method performs per
 *        step.
 * @ingroup world
 * @return nr of iterations
  }
function dWorldGetQuickStepNumIterations(para1:TdWorldID):longint;cdecl;external;
{*
 * @brief Set the SOR over-relaxation parameter
 * @ingroup world
 * @param over_relaxation value to use by SOR
  }
procedure dWorldSetQuickStepW(para1:TdWorldID; over_relaxation:TdReal);cdecl;external;
{*
 * @brief Get the SOR over-relaxation parameter
 * @ingroup world
 * @returns the over-relaxation setting
  }
function dWorldGetQuickStepW(para1:TdWorldID):TdReal;cdecl;external;
{ World contact parameter functions  }
{*
 * @brief Set the maximum correcting velocity that contacts are allowed
 * to generate.
 * @ingroup world
 * @param vel The default value is infinity (i.e. no limit).
 * @remarks
 * Reducing this value can help prevent "popping" of deeply embedded objects.
  }
procedure dWorldSetContactMaxCorrectingVel(para1:TdWorldID; vel:TdReal);cdecl;external;
{*
 * @brief Get the maximum correcting velocity that contacts are allowed
 * to generated.
 * @ingroup world
  }
function dWorldGetContactMaxCorrectingVel(para1:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set the depth of the surface layer around all geometry objects.
 * @ingroup world
 * @remarks
 * Contacts are allowed to sink into the surface layer up to the given
 * depth before coming to rest.
 * @param depth The default value is zero.
 * @remarks
 * Increasing this to some small value (e.g. 0.001) can help prevent
 * jittering problems due to contacts being repeatedly made and broken.
  }
procedure dWorldSetContactSurfaceLayer(para1:TdWorldID; depth:TdReal);cdecl;external;
{*
 * @brief Get the depth of the surface layer around all geometry objects.
 * @ingroup world
 * @returns the depth
  }
function dWorldGetContactSurfaceLayer(para1:TdWorldID):TdReal;cdecl;external;
{*
 * @defgroup disable Automatic Enabling and Disabling
 * @ingroup world bodies
 *
 * Every body can be enabled or disabled. Enabled bodies participate in the
 * simulation, while disabled bodies are turned off and do not get updated
 * during a simulation step. New bodies are always created in the enabled state.
 *
 * A disabled body that is connected through a joint to an enabled body will be
 * automatically re-enabled at the next simulation step.
 *
 * Disabled bodies do not consume CPU time, therefore to speed up the simulation
 * bodies should be disabled when they come to rest. This can be done automatically
 * with the auto-disable feature.
 *
 * If a body has its auto-disable flag turned on, it will automatically disable
 * itself when
 *   @li It has been idle for a given number of simulation steps.
 *   @li It has also been idle for a given amount of simulation time.
 *
 * A body is considered to be idle when the magnitudes of both its
 * linear average velocity and angular average velocity are below given thresholds.
 * The sample size for the average defaults to one and can be disabled by setting
 * to zero with 
 *
 * Thus, every body has six auto-disable parameters: an enabled flag, a idle step
 * count, an idle time, linear/angular average velocity thresholds, and the
 * average samples count.
 *
 * Newly created bodies get these parameters from world.
  }
{*
 * @brief Get auto disable linear average threshold for newly created bodies.
 * @ingroup disable
 * @return the threshold
  }
function dWorldGetAutoDisableLinearThreshold(para1:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set auto disable linear average threshold for newly created bodies.
 * @param linear_average_threshold default is 0.01
 * @ingroup disable
  }
procedure dWorldSetAutoDisableLinearThreshold(para1:TdWorldID; linear_average_threshold:TdReal);cdecl;external;
{*
 * @brief Get auto disable angular average threshold for newly created bodies.
 * @ingroup disable
 * @return the threshold
  }
function dWorldGetAutoDisableAngularThreshold(para1:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set auto disable angular average threshold for newly created bodies.
 * @param linear_average_threshold default is 0.01
 * @ingroup disable
  }
procedure dWorldSetAutoDisableAngularThreshold(para1:TdWorldID; angular_average_threshold:TdReal);cdecl;external;
{*
 * @brief Get auto disable sample count for newly created bodies.
 * @ingroup disable
 * @return number of samples used
  }
function dWorldGetAutoDisableAverageSamplesCount(para1:TdWorldID):longint;cdecl;external;
{*
 * @brief Set auto disable average sample count for newly created bodies.
 * @ingroup disable
 * @param average_samples_count Default is 1, meaning only instantaneous velocity is used.
 * Set to zero to disable sampling and thus prevent any body from auto-disabling.
  }
procedure dWorldSetAutoDisableAverageSamplesCount(para1:TdWorldID; average_samples_count:dword);cdecl;external;
{*
 * @brief Get auto disable steps for newly created bodies.
 * @ingroup disable
 * @return nr of steps
  }
function dWorldGetAutoDisableSteps(para1:TdWorldID):longint;cdecl;external;
{*
 * @brief Set auto disable steps for newly created bodies.
 * @ingroup disable
 * @param steps default is 10
  }
procedure dWorldSetAutoDisableSteps(para1:TdWorldID; steps:longint);cdecl;external;
{*
 * @brief Get auto disable time for newly created bodies.
 * @ingroup disable
 * @return nr of seconds
  }
function dWorldGetAutoDisableTime(para1:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set auto disable time for newly created bodies.
 * @ingroup disable
 * @param time default is 0 seconds
  }
procedure dWorldSetAutoDisableTime(para1:TdWorldID; time:TdReal);cdecl;external;
{*
 * @brief Get auto disable flag for newly created bodies.
 * @ingroup disable
 * @return 0 or 1
  }
function dWorldGetAutoDisableFlag(para1:TdWorldID):longint;cdecl;external;
{*
 * @brief Set auto disable flag for newly created bodies.
 * @ingroup disable
 * @param do_auto_disable default is false.
  }
procedure dWorldSetAutoDisableFlag(para1:TdWorldID; do_auto_disable:longint);cdecl;external;
{*
 * @defgroup damping Damping
 * @ingroup bodies world
 *
 * Damping serves two purposes: reduce simulation instability, and to allow
 * the bodies to come to rest (and possibly auto-disabling them).
 *
 * Bodies are constructed using the world's current damping parameters. Setting
 * the scales to 0 disables the damping.
 *
 * Here is how it is done: after every time step linear and angular
 * velocities are tested against the corresponding thresholds. If they
 * are above, they are multiplied by (1 - scale). So a negative scale value
 * will actually increase the speed, and values greater than one will
 * make the object oscillate every step; both can make the simulation unstable.
 *
 * To disable damping just set the damping scale to zero.
 *
 * You can also limit the maximum angular velocity. In contrast to the damping
 * functions, the angular velocity is affected before the body is moved.
 * This means that it will introduce errors in joints that are forcing the body
 * to rotate too fast. Some bodies have naturally high angular velocities
 * (like cars' wheels), so you may want to give them a very high (like the default,
 * dInfinity) limit.
 *
 * @note The velocities are damped after the stepper function has moved the
 * object. Otherwise the damping could introduce errors in joints. First the
 * joint constraints are processed by the stepper (moving the body), then
 * the damping is applied.
 *
 * @note The damping happens right after the moved callback is called; this way 
 * it still possible use the exact velocities the body has acquired during the
 * step. You can even use the callback to create your own customized damping.
  }
{*
 * @brief Get the world's linear damping threshold.
 * @ingroup damping
  }
function dWorldGetLinearDampingThreshold(w:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set the world's linear damping threshold.
 * @param threshold The damping won't be applied if the linear speed is
 *        below this threshold. Default is 0.01.
 * @ingroup damping
  }
procedure dWorldSetLinearDampingThreshold(w:TdWorldID; threshold:TdReal);cdecl;external;
{*
 * @brief Get the world's angular damping threshold.
 * @ingroup damping
  }
function dWorldGetAngularDampingThreshold(w:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set the world's angular damping threshold.
 * @param threshold The damping won't be applied if the angular speed is
 *        below this threshold. Default is 0.01.
 * @ingroup damping
  }
procedure dWorldSetAngularDampingThreshold(w:TdWorldID; threshold:TdReal);cdecl;external;
{*
 * @brief Get the world's linear damping scale.
 * @ingroup damping
  }
function dWorldGetLinearDamping(w:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set the world's linear damping scale.
 * @param scale The linear damping scale that is to be applied to bodies.
 * Default is 0 (no damping). Should be in the interval [0, 1].
 * @ingroup damping
  }
procedure dWorldSetLinearDamping(w:TdWorldID; scale:TdReal);cdecl;external;
{*
 * @brief Get the world's angular damping scale.
 * @ingroup damping
  }
function dWorldGetAngularDamping(w:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set the world's angular damping scale.
 * @param scale The angular damping scale that is to be applied to bodies.
 * Default is 0 (no damping). Should be in the interval [0, 1].
 * @ingroup damping
  }
procedure dWorldSetAngularDamping(w:TdWorldID; scale:TdReal);cdecl;external;
{*
 * @brief Convenience function to set body linear and angular scales.
 * @param linear_scale The linear damping scale that is to be applied to bodies.
 * @param angular_scale The angular damping scale that is to be applied to bodies.
 * @ingroup damping
  }
procedure dWorldSetDamping(w:TdWorldID; linear_scale:TdReal; angular_scale:TdReal);cdecl;external;
{*
 * @brief Get the default maximum angular speed.
 * @ingroup damping
 * @sa dBodyGetMaxAngularSpeed()
  }
function dWorldGetMaxAngularSpeed(w:TdWorldID):TdReal;cdecl;external;
{*
 * @brief Set the default maximum angular speed for new bodies.
 * @ingroup damping
 * @sa dBodySetMaxAngularSpeed()
  }
procedure dWorldSetMaxAngularSpeed(w:TdWorldID; max_speed:TdReal);cdecl;external;
{*
 * @defgroup bodies Rigid Bodies
 *
 * A rigid body has various properties from the point of view of the
 * simulation. Some properties change over time:
 *
 *  @li Position vector (x,y,z) of the body's point of reference.
 *      Currently the point of reference must correspond to the body's center of mass.
 *  @li Linear velocity of the point of reference, a vector (vx,vy,vz).
 *  @li Orientation of a body, represented by a quaternion (qs,qx,qy,qz) or
 *      a 3x3 rotation matrix.
 *  @li Angular velocity vector (wx,wy,wz) which describes how the orientation
 *      changes over time.
 *
 * Other body properties are usually constant over time:
 *
 *  @li Mass of the body.
 *  @li Position of the center of mass with respect to the point of reference.
 *      In the current implementation the center of mass and the point of
 *      reference must coincide.
 *  @li Inertia matrix. This is a 3x3 matrix that describes how the body's mass
 *      is distributed around the center of mass. Conceptually each body has an
 *      x-y-z coordinate frame embedded in it that moves and rotates with the body.
 *
 * The origin of this coordinate frame is the body's point of reference. Some values
 * in ODE (vectors, matrices etc) are relative to the body coordinate frame, and others
 * are relative to the global coordinate frame.
 *
 * Note that the shape of a rigid body is not a dynamical property (except insofar as
 * it influences the various mass properties). It is only collision detection that cares
 * about the detailed shape of the body.
  }
{*
 * @brief Get auto disable linear average threshold.
 * @ingroup bodies disable
 * @return the threshold
  }
function dBodyGetAutoDisableLinearThreshold(para1:TdBodyID):TdReal;cdecl;external;
{*
 * @brief Set auto disable linear average threshold.
 * @ingroup bodies disable
 * @return the threshold
  }
procedure dBodySetAutoDisableLinearThreshold(para1:TdBodyID; linear_average_threshold:TdReal);cdecl;external;
{*
 * @brief Get auto disable angular average threshold.
 * @ingroup bodies disable
 * @return the threshold
  }
function dBodyGetAutoDisableAngularThreshold(para1:TdBodyID):TdReal;cdecl;external;
{*
 * @brief Set auto disable angular average threshold.
 * @ingroup bodies disable
 * @return the threshold
  }
procedure dBodySetAutoDisableAngularThreshold(para1:TdBodyID; angular_average_threshold:TdReal);cdecl;external;
{*
 * @brief Get auto disable average size (samples count).
 * @ingroup bodies disable
 * @return the nr of steps/size.
  }
function dBodyGetAutoDisableAverageSamplesCount(para1:TdBodyID):longint;cdecl;external;
{*
 * @brief Set auto disable average buffer size (average steps).
 * @ingroup bodies disable
 * @param average_samples_count the nr of samples to review.
  }
procedure dBodySetAutoDisableAverageSamplesCount(para1:TdBodyID; average_samples_count:dword);cdecl;external;
{*
 * @brief Get auto steps a body must be thought of as idle to disable
 * @ingroup bodies disable
 * @return the nr of steps
  }
function dBodyGetAutoDisableSteps(para1:TdBodyID):longint;cdecl;external;
{*
 * @brief Set auto disable steps.
 * @ingroup bodies disable
 * @param steps the nr of steps.
  }
procedure dBodySetAutoDisableSteps(para1:TdBodyID; steps:longint);cdecl;external;
{*
 * @brief Get auto disable time.
 * @ingroup bodies disable
 * @return nr of seconds
  }
function dBodyGetAutoDisableTime(para1:TdBodyID):TdReal;cdecl;external;
{*
 * @brief Set auto disable time.
 * @ingroup bodies disable
 * @param time nr of seconds.
  }
procedure dBodySetAutoDisableTime(para1:TdBodyID; time:TdReal);cdecl;external;
{*
 * @brief Get auto disable flag.
 * @ingroup bodies disable
 * @return 0 or 1
  }
function dBodyGetAutoDisableFlag(para1:TdBodyID):longint;cdecl;external;
{*
 * @brief Set auto disable flag.
 * @ingroup bodies disable
 * @param do_auto_disable 0 or 1
  }
procedure dBodySetAutoDisableFlag(para1:TdBodyID; do_auto_disable:longint);cdecl;external;
{*
 * @brief Set auto disable defaults.
 * @remarks
 * Set the values for the body to those set as default for the world.
 * @ingroup bodies disable
  }
procedure dBodySetAutoDisableDefaults(para1:TdBodyID);cdecl;external;
{*
 * @brief Retrieves the world attached to te given body.
 * @remarks
 * 
 * @ingroup bodies
  }
function dBodyGetWorld(para1:TdBodyID):TdWorldID;cdecl;external;
{*
 * @brief Create a body in given world.
 * @remarks
 * Default mass parameters are at position (0,0,0).
 * @ingroup bodies
  }
function dBodyCreate(para1:TdWorldID):TdBodyID;cdecl;external;
{*
 * @brief Destroy a body.
 * @remarks
 * All joints that are attached to this body will be put into limbo:
 * i.e. unattached and not affecting the simulation, but they will NOT be
 * deleted.
 * @ingroup bodies
  }
procedure dBodyDestroy(para1:TdBodyID);cdecl;external;
{*
 * @brief Set the body's user-data pointer.
 * @ingroup bodies
 * @param data arbitraty pointer
  }
procedure dBodySetData(para1:TdBodyID; data:pointer);cdecl;external;
{*
 * @brief Get the body's user-data pointer.
 * @ingroup bodies
 * @return a pointer to the user's data.
  }
function dBodyGetData(para1:TdBodyID):pointer;cdecl;external;
{*
 * @brief Set position of a body.
 * @remarks
 * After setting, the outcome of the simulation is undefined
 * if the new configuration is inconsistent with the joints/constraints
 * that are present.
 * @ingroup bodies
  }
procedure dBodySetPosition(para1:TdBodyID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the orientation of a body.
 * @ingroup bodies
 * @remarks
 * After setting, the outcome of the simulation is undefined
 * if the new configuration is inconsistent with the joints/constraints
 * that are present.
  }
(* Const before type ignored *)
procedure dBodySetRotation(para1:TdBodyID; R:TdMatrix3);cdecl;external;
{*
 * @brief Set the orientation of a body.
 * @ingroup bodies
 * @remarks
 * After setting, the outcome of the simulation is undefined
 * if the new configuration is inconsistent with the joints/constraints
 * that are present.
  }
(* Const before type ignored *)
procedure dBodySetQuaternion(para1:TdBodyID; q:TdQuaternion);cdecl;external;
{*
 * @brief Set the linear velocity of a body.
 * @ingroup bodies
  }
procedure dBodySetLinearVel(para1:TdBodyID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the angular velocity of a body.
 * @ingroup bodies
  }
procedure dBodySetAngularVel(para1:TdBodyID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Get the position of a body.
 * @ingroup bodies
 * @remarks
 * When getting, the returned values are pointers to internal data structures,
 * so the vectors are valid until any changes are made to the rigid body
 * system structure.
 * @sa dBodyCopyPosition
  }
(* Const before type ignored *)
function dBodyGetPosition(para1:TdBodyID):PdReal;cdecl;external;
{*
 * @brief Copy the position of a body into a vector.
 * @ingroup bodies
 * @param body  the body to query
 * @param pos   a copy of the body position
 * @sa dBodyGetPosition
  }
procedure dBodyCopyPosition(body:TdBodyID; pos:TdVector3);cdecl;external;
{*
 * @brief Get the rotation of a body.
 * @ingroup bodies
 * @return pointer to a 4x3 rotation matrix.
  }
(* Const before type ignored *)
function dBodyGetRotation(para1:TdBodyID):PdReal;cdecl;external;
{*
 * @brief Copy the rotation of a body.
 * @ingroup bodies
 * @param body   the body to query
 * @param R      a copy of the rotation matrix
 * @sa dBodyGetRotation
  }
procedure dBodyCopyRotation(para1:TdBodyID; R:TdMatrix3);cdecl;external;
{*
 * @brief Get the rotation of a body.
 * @ingroup bodies
 * @return pointer to 4 scalars that represent the quaternion.
  }
(* Const before type ignored *)
function dBodyGetQuaternion(para1:TdBodyID):PdReal;cdecl;external;
{*
 * @brief Copy the orientation of a body into a quaternion.
 * @ingroup bodies
 * @param body  the body to query
 * @param quat  a copy of the orientation quaternion
 * @sa dBodyGetQuaternion
  }
procedure dBodyCopyQuaternion(body:TdBodyID; quat:TdQuaternion);cdecl;external;
{*
 * @brief Get the linear velocity of a body.
 * @ingroup bodies
  }
(* Const before type ignored *)
function dBodyGetLinearVel(para1:TdBodyID):PdReal;cdecl;external;
{*
 * @brief Get the angular velocity of a body.
 * @ingroup bodies
  }
(* Const before type ignored *)
function dBodyGetAngularVel(para1:TdBodyID):PdReal;cdecl;external;
{*
 * @brief Set the mass of a body.
 * @ingroup bodies
  }
(* Const before type ignored *)
procedure dBodySetMass(para1:TdBodyID; mass:PdMass);cdecl;external;
{*
 * @brief Get the mass of a body.
 * @ingroup bodies
  }
procedure dBodyGetMass(para1:TdBodyID; mass:PdMass);cdecl;external;
{*
 * @brief Add force at centre of mass of body in absolute coordinates.
 * @ingroup bodies
  }
procedure dBodyAddForce(para1:TdBodyID; fx:TdReal; fy:TdReal; fz:TdReal);cdecl;external;
{*
 * @brief Add torque at centre of mass of body in absolute coordinates.
 * @ingroup bodies
  }
procedure dBodyAddTorque(para1:TdBodyID; fx:TdReal; fy:TdReal; fz:TdReal);cdecl;external;
{*
 * @brief Add force at centre of mass of body in coordinates relative to body.
 * @ingroup bodies
  }
procedure dBodyAddRelForce(para1:TdBodyID; fx:TdReal; fy:TdReal; fz:TdReal);cdecl;external;
{*
 * @brief Add torque at centre of mass of body in coordinates relative to body.
 * @ingroup bodies
  }
procedure dBodyAddRelTorque(para1:TdBodyID; fx:TdReal; fy:TdReal; fz:TdReal);cdecl;external;
{*
 * @brief Add force at specified point in body in global coordinates.
 * @ingroup bodies
  }
procedure dBodyAddForceAtPos(para1:TdBodyID; fx:TdReal; fy:TdReal; fz:TdReal; px:TdReal; 
            py:TdReal; pz:TdReal);cdecl;external;
{*
 * @brief Add force at specified point in body in local coordinates.
 * @ingroup bodies
  }
procedure dBodyAddForceAtRelPos(para1:TdBodyID; fx:TdReal; fy:TdReal; fz:TdReal; px:TdReal; 
            py:TdReal; pz:TdReal);cdecl;external;
{*
 * @brief Add force at specified point in body in global coordinates.
 * @ingroup bodies
  }
procedure dBodyAddRelForceAtPos(para1:TdBodyID; fx:TdReal; fy:TdReal; fz:TdReal; px:TdReal; 
            py:TdReal; pz:TdReal);cdecl;external;
{*
 * @brief Add force at specified point in body in local coordinates.
 * @ingroup bodies
  }
procedure dBodyAddRelForceAtRelPos(para1:TdBodyID; fx:TdReal; fy:TdReal; fz:TdReal; px:TdReal; 
            py:TdReal; pz:TdReal);cdecl;external;
{*
 * @brief Return the current accumulated force vector.
 * @return points to an array of 3 reals.
 * @remarks
 * The returned values are pointers to internal data structures, so
 * the vectors are only valid until any changes are made to the rigid
 * body system.
 * @ingroup bodies
  }
(* Const before type ignored *)
function dBodyGetForce(para1:TdBodyID):PdReal;cdecl;external;
{*
 * @brief Return the current accumulated torque vector.
 * @return points to an array of 3 reals.
 * @remarks
 * The returned values are pointers to internal data structures, so
 * the vectors are only valid until any changes are made to the rigid
 * body system.
 * @ingroup bodies
  }
(* Const before type ignored *)
function dBodyGetTorque(para1:TdBodyID):PdReal;cdecl;external;
{*
 * @brief Set the body force accumulation vector.
 * @remarks
 * This is mostly useful to zero the force and torque for deactivated bodies
 * before they are reactivated, in the case where the force-adding functions
 * were called on them while they were deactivated.
 * @ingroup bodies
  }
procedure dBodySetForce(b:TdBodyID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the body torque accumulation vector.
 * @remarks
 * This is mostly useful to zero the force and torque for deactivated bodies
 * before they are reactivated, in the case where the force-adding functions
 * were called on them while they were deactivated.
 * @ingroup bodies
  }
procedure dBodySetTorque(b:TdBodyID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Get world position of a relative point on body.
 * @ingroup bodies
 * @param result will contain the result.
  }
procedure dBodyGetRelPointPos(para1:TdBodyID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{*
 * @brief Get velocity vector in global coords of a relative point on body.
 * @ingroup bodies
 * @param result will contain the result.
  }
procedure dBodyGetRelPointVel(para1:TdBodyID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{*
 * @brief Get velocity vector in global coords of a globally
 * specified point on a body.
 * @ingroup bodies
 * @param result will contain the result.
  }
procedure dBodyGetPointVel(para1:TdBodyID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{*
 * @brief takes a point in global coordinates and returns
 * the point's position in body-relative coordinates.
 * @remarks
 * This is the inverse of dBodyGetRelPointPos()
 * @ingroup bodies
 * @param result will contain the result.
  }
procedure dBodyGetPosRelPoint(para1:TdBodyID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{*
 * @brief Convert from local to world coordinates.
 * @ingroup bodies
 * @param result will contain the result.
  }
procedure dBodyVectorToWorld(para1:TdBodyID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{*
 * @brief Convert from world to local coordinates.
 * @ingroup bodies
 * @param result will contain the result.
  }
procedure dBodyVectorFromWorld(para1:TdBodyID; px:TdReal; py:TdReal; pz:TdReal; result:TdVector3);cdecl;external;
{*
 * @brief controls the way a body's orientation is updated at each timestep.
 * @ingroup bodies
 * @param mode can be 0 or 1:
 * \li 0: An ``infinitesimal'' orientation update is used.
 * This is fast to compute, but it can occasionally cause inaccuracies
 * for bodies that are rotating at high speed, especially when those
 * bodies are joined to other bodies.
 * This is the default for every new body that is created.
 * \li 1: A ``finite'' orientation update is used.
 * This is more costly to compute, but will be more accurate for high
 * speed rotations.
 * @remarks
 * Note however that high speed rotations can result in many types of
 * error in a simulation, and the finite mode will only fix one of those
 * sources of error.
  }
procedure dBodySetFiniteRotationMode(para1:TdBodyID; mode:longint);cdecl;external;
{*
 * @brief sets the finite rotation axis for a body.
 * @ingroup bodies
 * @remarks
 * This is axis only has meaning when the finite rotation mode is set
 * If this axis is zero (0,0,0), full finite rotations are performed on
 * the body.
 * If this axis is nonzero, the body is rotated by performing a partial finite
 * rotation along the axis direction followed by an infinitesimal rotation
 * along an orthogonal direction.
 * @remarks
 * This can be useful to alleviate certain sources of error caused by quickly
 * spinning bodies. For example, if a car wheel is rotating at high speed
 * you can call this function with the wheel's hinge axis as the argument to
 * try and improve its behavior.
  }
procedure dBodySetFiniteRotationAxis(para1:TdBodyID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Get the way a body's orientation is updated each timestep.
 * @ingroup bodies
 * @return the mode 0 (infitesimal) or 1 (finite).
  }
function dBodyGetFiniteRotationMode(para1:TdBodyID):longint;cdecl;external;
{*
 * @brief Get the finite rotation axis.
 * @param result will contain the axis.
 * @ingroup bodies
  }
procedure dBodyGetFiniteRotationAxis(para1:TdBodyID; result:TdVector3);cdecl;external;
{*
 * @brief Get the number of joints that are attached to this body.
 * @ingroup bodies
 * @return nr of joints
  }
function dBodyGetNumJoints(b:TdBodyID):longint;cdecl;external;
{*
 * @brief Return a joint attached to this body, given by index.
 * @ingroup bodies
 * @param index valid range is  0 to n-1 where n is the value returned by
 * dBodyGetNumJoints().
  }
function dBodyGetJoint(para1:TdBodyID; index:longint):TdJointID;cdecl;external;
{*
 * @brief Set rigid body to dynamic state (default).
 * @param dBodyID identification of body.
 * @ingroup bodies
  }
procedure dBodySetDynamic(para1:TdBodyID);cdecl;external;
{*
 * @brief Set rigid body to kinematic state.
 * When in kinematic state the body isn't simulated as a dynamic
 * body (it's "unstoppable", doesn't respond to forces),
 * but can still affect dynamic bodies (e.g. in joints).
 * Kinematic bodies can be controlled by position and velocity.
 * @note A kinematic body has infinite mass. If you set its mass
 * to something else, it loses the kinematic state and behaves
 * as a normal dynamic body.
 * @param dBodyID identification of body.
 * @ingroup bodies
  }
procedure dBodySetKinematic(para1:TdBodyID);cdecl;external;
{*
 * @brief Check wether a body is in kinematic state.
 * @ingroup bodies
 * @return 1 if a body is kinematic or 0 if it is dynamic.
  }
function dBodyIsKinematic(para1:TdBodyID):longint;cdecl;external;
{*
 * @brief Manually enable a body.
 * @param dBodyID identification of body.
 * @ingroup bodies
  }
procedure dBodyEnable(para1:TdBodyID);cdecl;external;
{*
 * @brief Manually disable a body.
 * @ingroup bodies
 * @remarks
 * A disabled body that is connected through a joint to an enabled body will
 * be automatically re-enabled at the next simulation step.
  }
procedure dBodyDisable(para1:TdBodyID);cdecl;external;
{*
 * @brief Check wether a body is enabled.
 * @ingroup bodies
 * @return 1 if a body is currently enabled or 0 if it is disabled.
  }
function dBodyIsEnabled(para1:TdBodyID):longint;cdecl;external;
{*
 * @brief Set whether the body is influenced by the world's gravity or not.
 * @ingroup bodies
 * @param mode when nonzero gravity affects this body.
 * @remarks
 * Newly created bodies are always influenced by the world's gravity.
  }
procedure dBodySetGravityMode(b:TdBodyID; mode:longint);cdecl;external;
{*
 * @brief Get whether the body is influenced by the world's gravity or not.
 * @ingroup bodies
 * @return nonzero means gravity affects this body.
  }
function dBodyGetGravityMode(b:TdBodyID):longint;cdecl;external;
{*
 * @brief Set the 'moved' callback of a body.
 *
 * Whenever a body has its position or rotation changed during the
 * timestep, the callback will be called (with body as the argument).
 * Use it to know which body may need an update in an external
 * structure (like a 3D engine).
 *
 * @param b the body that needs to be watched.
 * @param callback the callback to be invoked when the body moves. Set to zero
 * to disable.
 * @ingroup bodies
  }
procedure dBodySetMovedCallback(b:TdBodyID; callback:procedure (para1:TdBodyID));cdecl;external;
{*
 * @brief Return the first geom associated with the body.
 * 
 * You can traverse through the geoms by repeatedly calling
 * dBodyGetNextGeom().
 *
 * @return the first geom attached to this body, or 0.
 * @ingroup bodies
  }
function dBodyGetFirstGeom(b:TdBodyID):TdGeomID;cdecl;external;
{*
 * @brief returns the next geom associated with the same body.
 * @param g a geom attached to some body.
 * @return the next geom attached to the same body, or 0.
 * @sa dBodyGetFirstGeom
 * @ingroup bodies
  }
function dBodyGetNextGeom(g:TdGeomID):TdGeomID;cdecl;external;
{*
 * @brief Resets the damping settings to the current world's settings.
 * @ingroup bodies damping
  }
procedure dBodySetDampingDefaults(b:TdBodyID);cdecl;external;
{*
 * @brief Get the body's linear damping scale.
 * @ingroup bodies damping
  }
function dBodyGetLinearDamping(b:TdBodyID):TdReal;cdecl;external;
{*
 * @brief Set the body's linear damping scale.
 * @param scale The linear damping scale. Should be in the interval [0, 1].
 * @ingroup bodies damping
 * @remarks From now on the body will not use the world's linear damping
 * scale until dBodySetDampingDefaults() is called.
 * @sa dBodySetDampingDefaults()
  }
procedure dBodySetLinearDamping(b:TdBodyID; scale:TdReal);cdecl;external;
{*
 * @brief Get the body's angular damping scale.
 * @ingroup bodies damping
 * @remarks If the body's angular damping scale was not set, this function
 * returns the world's angular damping scale.
  }
function dBodyGetAngularDamping(b:TdBodyID):TdReal;cdecl;external;
{*
 * @brief Set the body's angular damping scale.
 * @param scale The angular damping scale. Should be in the interval [0, 1].
 * @ingroup bodies damping
 * @remarks From now on the body will not use the world's angular damping
 * scale until dBodyResetAngularDamping() is called.
 * @sa dBodyResetAngularDamping()
  }
procedure dBodySetAngularDamping(b:TdBodyID; scale:TdReal);cdecl;external;
{*
 * @brief Convenience function to set linear and angular scales at once.
 * @param linear_scale The linear damping scale. Should be in the interval [0, 1].
 * @param angular_scale The angular damping scale. Should be in the interval [0, 1].
 * @ingroup bodies damping
 * @sa dBodySetLinearDamping() dBodySetAngularDamping()
  }
procedure dBodySetDamping(b:TdBodyID; linear_scale:TdReal; angular_scale:TdReal);cdecl;external;
{*
 * @brief Get the body's linear damping threshold.
 * @ingroup bodies damping
  }
function dBodyGetLinearDampingThreshold(b:TdBodyID):TdReal;cdecl;external;
{*
 * @brief Set the body's linear damping threshold.
 * @param threshold The linear threshold to be used. Damping
 *      is only applied if the linear speed is above this limit.
 * @ingroup bodies damping
  }
procedure dBodySetLinearDampingThreshold(b:TdBodyID; threshold:TdReal);cdecl;external;
{*
 * @brief Get the body's angular damping threshold.
 * @ingroup bodies damping
  }
function dBodyGetAngularDampingThreshold(b:TdBodyID):TdReal;cdecl;external;
{*
 * @brief Set the body's angular damping threshold.
 * @param threshold The angular threshold to be used. Damping is
 *      only used if the angular speed is above this limit.
 * @ingroup bodies damping
  }
procedure dBodySetAngularDampingThreshold(b:TdBodyID; threshold:TdReal);cdecl;external;
{*
 * @brief Get the body's maximum angular speed.
 * @ingroup damping bodies
 * @sa dWorldGetMaxAngularSpeed()
  }
function dBodyGetMaxAngularSpeed(b:TdBodyID):TdReal;cdecl;external;
{*
 * @brief Set the body's maximum angular speed.
 * @ingroup damping bodies
 * @sa dWorldSetMaxAngularSpeed() dBodyResetMaxAngularSpeed()
 * The default value is dInfinity, but it's a good idea to limit
 * it at less than 500 if the body has the gyroscopic term
 * enabled.
  }
procedure dBodySetMaxAngularSpeed(b:TdBodyID; max_speed:TdReal);cdecl;external;
{*
 * @brief Get the body's gyroscopic state.
 *
 * @return nonzero if gyroscopic term computation is enabled (default),
 * zero otherwise.
 * @ingroup bodies
  }
function dBodyGetGyroscopicMode(b:TdBodyID):longint;cdecl;external;
{*
 * @brief Enable/disable the body's gyroscopic term.
 *
 * Disabling the gyroscopic term of a body usually improves
 * stability. It also helps turning spining objects, like cars'
 * wheels.
 *
 * @param enabled   nonzero (default) to enable gyroscopic term, 0
 * to disable.
 * @ingroup bodies
  }
procedure dBodySetGyroscopicMode(b:TdBodyID; enabled:longint);cdecl;external;
{*
 * @defgroup joints Joints
 *
 * In real life a joint is something like a hinge, that is used to connect two
 * objects.
 * In ODE a joint is very similar: It is a relationship that is enforced between
 * two bodies so that they can only have certain positions and orientations
 * relative to each other.
 * This relationship is called a constraint -- the words joint and
 * constraint are often used interchangeably.
 *
 * A joint has a set of parameters that can be set. These include:
 *
 *
 * \li  dParamLoStop Low stop angle or position. Setting this to
 *	-dInfinity (the default value) turns off the low stop.
 *	For rotational joints, this stop must be greater than -pi to be
 *	effective.
 * \li  dParamHiStop High stop angle or position. Setting this to
 *	dInfinity (the default value) turns off the high stop.
 *	For rotational joints, this stop must be less than pi to be
 *	effective.
 *	If the high stop is less than the low stop then both stops will
 *	be ineffective.
 * \li  dParamVel Desired motor velocity (this will be an angular or
 *	linear velocity).
 * \li  dParamFMax The maximum force or torque that the motor will use to
 *	achieve the desired velocity.
 *	This must always be greater than or equal to zero.
 *	Setting this to zero (the default value) turns off the motor.
 * \li  dParamFudgeFactor The current joint stop/motor implementation has
 *	a small problem:
 *	when the joint is at one stop and the motor is set to move it away
 *	from the stop, too much force may be applied for one time step,
 *	causing a ``jumping'' motion.
 *	This fudge factor is used to scale this excess force.
 *	It should have a value between zero and one (the default value).
 *	If the jumping motion is too visible in a joint, the value can be
 *	reduced.
 *	Making this value too small can prevent the motor from being able to
 *	move the joint away from a stop.
 * \li  dParamBounce The bouncyness of the stops.
 *	This is a restitution parameter in the range 0..1.
 *	0 means the stops are not bouncy at all, 1 means maximum bouncyness.
 * \li  dParamCFM The constraint force mixing (CFM) value used when not
 *	at a stop.
 * \li  dParamStopERP The error reduction parameter (ERP) used by the
 *	stops.
 * \li  dParamStopCFM The constraint force mixing (CFM) value used by the
 *	stops. Together with the ERP value this can be used to get spongy or
 *	soft stops.
 *	Note that this is intended for unpowered joints, it does not really
 *	work as expected when a powered joint reaches its limit.
 * \li  dParamSuspensionERP Suspension error reduction parameter (ERP).
 *	Currently this is only implemented on the hinge-2 joint.
 * \li  dParamSuspensionCFM Suspension constraint force mixing (CFM) value.
 *	Currently this is only implemented on the hinge-2 joint.
 *
 * If a particular parameter is not implemented by a given joint, setting it
 * will have no effect.
 * These parameter names can be optionally followed by a digit (2 or 3)
 * to indicate the second or third set of parameters, e.g. for the second axis
 * in a hinge-2 joint, or the third axis in an AMotor joint.
  }
{*
 * @brief Create a new joint of the ball type.
 * @ingroup joints
 * @remarks
 * The joint is initially in "limbo" (i.e. it has no effect on the simulation)
 * because it does not connect to any bodies.
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateBall(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the hinge type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateHinge(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the slider type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateSlider(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the contact type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
(* Const before type ignored *)
function dJointCreateContact(para1:TdWorldID; para2:TdJointGroupID; para3:PdContact):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the hinge2 type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateHinge2(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the universal type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateUniversal(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the PR (Prismatic and Rotoide) type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreatePR(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the PU (Prismatic and Universal) type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreatePU(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the Piston type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 *                      If it is nonzero the joint is allocated in the given
 *                      joint group.
  }
function dJointCreatePiston(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the fixed type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateFixed(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
function dJointCreateNull(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the A-motor type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateAMotor(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the L-motor type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateLMotor(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the plane-2d type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreatePlane2D(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the double ball type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateDBall(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the double hinge type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateDHinge(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Create a new joint of the Transmission type.
 * @ingroup joints
 * @param dJointGroupID set to 0 to allocate the joint normally.
 * If it is nonzero the joint is allocated in the given joint group.
  }
function dJointCreateTransmission(para1:TdWorldID; para2:TdJointGroupID):TdJointID;cdecl;external;
{*
 * @brief Destroy a joint.
 * @ingroup joints
 *
 * disconnects it from its attached bodies and removing it from the world.
 * However, if the joint is a member of a group then this function has no
 * effect - to destroy that joint the group must be emptied or destroyed.
  }
procedure dJointDestroy(para1:TdJointID);cdecl;external;
{*
 * @brief Create a joint group
 * @ingroup joints
 * @param max_size deprecated. Set to 0.
  }
function dJointGroupCreate(max_size:longint):TdJointGroupID;cdecl;external;
{*
 * @brief Destroy a joint group.
 * @ingroup joints
 *
 * All joints in the joint group will be destroyed.
  }
procedure dJointGroupDestroy(para1:TdJointGroupID);cdecl;external;
{*
 * @brief Empty a joint group.
 * @ingroup joints
 *
 * All joints in the joint group will be destroyed,
 * but the joint group itself will not be destroyed.
  }
procedure dJointGroupEmpty(para1:TdJointGroupID);cdecl;external;
{*
 * @brief Return the number of bodies attached to the joint
 * @ingroup joints
  }
function dJointGetNumBodies(para1:TdJointID):longint;cdecl;external;
{*
 * @brief Attach the joint to some new bodies.
 * @ingroup joints
 *
 * If the joint is already attached, it will be detached from the old bodies
 * first.
 * To attach this joint to only one body, set body1 or body2 to zero - a zero
 * body refers to the static environment.
 * Setting both bodies to zero puts the joint into "limbo", i.e. it will
 * have no effect on the simulation.
 * @remarks
 * Some joints, like hinge-2 need to be attached to two bodies to work.
  }
procedure dJointAttach(para1:TdJointID; body1:TdBodyID; body2:TdBodyID);cdecl;external;
{*
 * @brief Manually enable a joint.
 * @param dJointID identification of joint.
 * @ingroup joints
  }
procedure dJointEnable(para1:TdJointID);cdecl;external;
{*
 * @brief Manually disable a joint.
 * @ingroup joints
 * @remarks
 * A disabled joint will not affect the simulation, but will maintain the anchors and
 * axes so it can be enabled later.
  }
procedure dJointDisable(para1:TdJointID);cdecl;external;
{*
 * @brief Check wether a joint is enabled.
 * @ingroup joints
 * @return 1 if a joint is currently enabled or 0 if it is disabled.
  }
function dJointIsEnabled(para1:TdJointID):longint;cdecl;external;
{*
 * @brief Set the user-data pointer
 * @ingroup joints
  }
procedure dJointSetData(para1:TdJointID; data:pointer);cdecl;external;
{*
 * @brief Get the user-data pointer
 * @ingroup joints
  }
function dJointGetData(para1:TdJointID):pointer;cdecl;external;
{*
 * @brief Get the type of the joint
 * @ingroup joints
 * @return the type, being one of these:
 * \li dJointTypeBall
 * \li dJointTypeHinge
 * \li dJointTypeSlider
 * \li dJointTypeContact
 * \li dJointTypeUniversal
 * \li dJointTypeHinge2
 * \li dJointTypeFixed
 * \li dJointTypeNull
 * \li dJointTypeAMotor
 * \li dJointTypeLMotor
 * \li dJointTypePlane2D
 * \li dJointTypePR
 * \li dJointTypePU
 * \li dJointTypePiston
  }
function dJointGetType(para1:TdJointID):TdJointType;cdecl;external;
{*
 * @brief Return the bodies that this joint connects.
 * @ingroup joints
 * @param index return the first (0) or second (1) body.
 * @remarks
 * If one of these returned body IDs is zero, the joint connects the other body
 * to the static environment.
 * If both body IDs are zero, the joint is in ``limbo'' and has no effect on
 * the simulation.
  }
function dJointGetBody(para1:TdJointID; index:longint):TdBodyID;cdecl;external;
{*
 * @brief Sets the datastructure that is to receive the feedback.
 *
 * The feedback can be used by the user, so that it is known how
 * much force an individual joint exerts.
 * @ingroup joints
  }
procedure dJointSetFeedback(para1:TdJointID; para2:PdJointFeedback);cdecl;external;
{*
 * @brief Gets the datastructure that is to receive the feedback.
 * @ingroup joints
  }
function dJointGetFeedback(para1:TdJointID):PdJointFeedback;cdecl;external;
{*
 * @brief Set the joint anchor point.
 * @ingroup joints
 *
 * The joint will try to keep this point on each body
 * together. The input is specified in world coordinates.
  }
procedure dJointSetBallAnchor(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the joint anchor point.
 * @ingroup joints
  }
procedure dJointSetBallAnchor2(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Param setting for Ball joints
 * @ingroup joints
  }
procedure dJointSetBallParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief Set hinge anchor parameter.
 * @ingroup joints
  }
procedure dJointSetHingeAnchor(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
procedure dJointSetHingeAnchorDelta(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal; ax:TdReal; 
            ay:TdReal; az:TdReal);cdecl;external;
{*
 * @brief Set hinge axis.
 * @ingroup joints
  }
procedure dJointSetHingeAxis(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the Hinge axis as if the 2 bodies were already at angle appart.
 * @ingroup joints
 *
 * This function initialize the Axis and the relative orientation of each body
 * as if body1 was rotated around the axis by the angle value. \br
 * Ex:
 * <PRE>
 * dJointSetHingeAxis(jId, 1, 0, 0);
 * // If you request the position you will have: dJointGetHingeAngle(jId) == 0
 * dJointSetHingeAxisDelta(jId, 1, 0, 0, 0.23);
 * // If you request the position you will have: dJointGetHingeAngle(jId) == 0.23
 * </PRE>

 * @param j The Hinge joint ID for which the axis will be set
 * @param x The X component of the axis in world frame
 * @param y The Y component of the axis in world frame
 * @param z The Z component of the axis in world frame
 * @param angle The angle for the offset of the relative orientation.
 *              As if body1 was rotated by angle when the Axis was set (see below).
 *              The rotation is around the new Hinge axis.
 *
 * @note Usually the function dJointSetHingeAxis set the current position of body1
 *       and body2 as the zero angle position. This function set the current position
 *       as the if the 2 bodies where \b angle appart.
 * @warning Calling dJointSetHingeAnchor or dJointSetHingeAxis will reset the "zero"
 *          angle position.
  }
procedure dJointSetHingeAxisOffset(j:TdJointID; x:TdReal; y:TdReal; z:TdReal; angle:TdReal);cdecl;external;
{*
 * @brief set joint parameter
 * @ingroup joints
  }
procedure dJointSetHingeParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief Applies the torque about the hinge axis.
 *
 * That is, it applies a torque with specified magnitude in the direction
 * of the hinge axis, to body 1, and with the same magnitude but in opposite
 * direction to body 2. This function is just a wrapper for dBodyAddTorque()
 * @ingroup joints
  }
procedure dJointAddHingeTorque(joint:TdJointID; torque:TdReal);cdecl;external;
{*
 * @brief set the joint axis
 * @ingroup joints
  }
procedure dJointSetSliderAxis(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @ingroup joints
  }
procedure dJointSetSliderAxisDelta(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal; ax:TdReal; 
            ay:TdReal; az:TdReal);cdecl;external;
{*
 * @brief set joint parameter
 * @ingroup joints
  }
procedure dJointSetSliderParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief Applies the given force in the slider's direction.
 *
 * That is, it applies a force with specified magnitude, in the direction of
 * slider's axis, to body1, and with the same magnitude but opposite
 * direction to body2.  This function is just a wrapper for dBodyAddForce().
 * @ingroup joints
  }
procedure dJointAddSliderForce(joint:TdJointID; force:TdReal);cdecl;external;
{*
 * @brief set anchor
 * @ingroup joints
  }
procedure dJointSetHinge2Anchor(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set both axes (optionally)
 *
 * This can change both axes at once avoiding transitions via invalid states
 * while changing axes one by one and having the first changed axis coincide 
 * with the other axis existing direction.
 *
 * At least one of the axes must be not NULL. If NULL is passed, the corresponding 
 * axis retains its existing value.
 * 
 * @ingroup joints
  }
(* Const before type ignored *)
{=[dSA__MAX],=NULL }(* Const before type ignored *)
{=[dSA__MAX],=NULL }procedure dJointSetHinge2Axes(j:TdJointID; axis1:PdReal; axis2:PdReal);cdecl;external;
{*
 * @brief set axis
 *
 * Deprecated. Use @fn dJointSetHinge2Axes instead.
 * 
 * @ingroup joints
 * @see dJointSetHinge2Axes
  }
{extern_DEPRECATED }procedure dJointSetHinge2Axis1(j:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set axis
 *
 * Deprecated. Use @fn dJointSetHinge2Axes instead.
 * 
 * @ingroup joints
 * @see dJointSetHinge2Axes
  }
{extern_DEPRECATED }procedure dJointSetHinge2Axis2(j:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set joint parameter
 * @ingroup joints
  }
procedure dJointSetHinge2Param(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief Applies torque1 about the hinge2's axis 1, torque2 about the
 * hinge2's axis 2.
 * @remarks  This function is just a wrapper for dBodyAddTorque().
 * @ingroup joints
  }
procedure dJointAddHinge2Torques(joint:TdJointID; torque1:TdReal; torque2:TdReal);cdecl;external;
{*
 * @brief set anchor
 * @ingroup joints
  }
procedure dJointSetUniversalAnchor(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set axis
 * @ingroup joints
  }
procedure dJointSetUniversalAxis1(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the Universal axis1 as if the 2 bodies were already at 
 *        offset1 and offset2 appart with respect to axis1 and axis2.
 * @ingroup joints
 *
 * This function initialize the axis1 and the relative orientation of 
 * each body as if body1 was rotated around the new axis1 by the offset1 
 * value and as if body2 was rotated around the axis2 by offset2. \br
 * Ex:
* <PRE>
 * dJointSetHuniversalAxis1(jId, 1, 0, 0);
 * // If you request the position you will have: dJointGetUniversalAngle1(jId) == 0
 * // If you request the position you will have: dJointGetUniversalAngle2(jId) == 0
 * dJointSetHuniversalAxis1Offset(jId, 1, 0, 0, 0.2, 0.17);
 * // If you request the position you will have: dJointGetUniversalAngle1(jId) == 0.2
 * // If you request the position you will have: dJointGetUniversalAngle2(jId) == 0.17
 * </PRE>
 *
 * @param j The Hinge joint ID for which the axis will be set
 * @param x The X component of the axis in world frame
 * @param y The Y component of the axis in world frame
 * @param z The Z component of the axis in world frame
 * @param angle The angle for the offset of the relative orientation.
 *              As if body1 was rotated by angle when the Axis was set (see below).
 *              The rotation is around the new Hinge axis.
 *
 * @note Usually the function dJointSetHingeAxis set the current position of body1
 *       and body2 as the zero angle position. This function set the current position
 *       as the if the 2 bodies where \b offsets appart.
 *
 * @note Any previous offsets are erased.
 *
 * @warning Calling dJointSetUniversalAnchor, dJointSetUnivesalAxis1, 
 *          dJointSetUniversalAxis2, dJointSetUniversalAxis2Offset 
 *          will reset the "zero" angle position.
  }
procedure dJointSetUniversalAxis1Offset(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal; offset1:TdReal; 
            offset2:TdReal);cdecl;external;
{*
 * @brief set axis
 * @ingroup joints
  }
procedure dJointSetUniversalAxis2(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the Universal axis2 as if the 2 bodies were already at 
 *        offset1 and offset2 appart with respect to axis1 and axis2.
 * @ingroup joints
 *
 * This function initialize the axis2 and the relative orientation of 
 * each body as if body1 was rotated around the axis1 by the offset1 
 * value and as if body2 was rotated around the new axis2 by offset2. \br
 * Ex:
 * <PRE>
 * dJointSetHuniversalAxis2(jId, 0, 1, 0);
 * // If you request the position you will have: dJointGetUniversalAngle1(jId) == 0
 * // If you request the position you will have: dJointGetUniversalAngle2(jId) == 0
 * dJointSetHuniversalAxis2Offset(jId, 0, 1, 0, 0.2, 0.17);
 * // If you request the position you will have: dJointGetUniversalAngle1(jId) == 0.2
 * // If you request the position you will have: dJointGetUniversalAngle2(jId) == 0.17
 * </PRE>

 * @param j The Hinge joint ID for which the axis will be set
 * @param x The X component of the axis in world frame
 * @param y The Y component of the axis in world frame
 * @param z The Z component of the axis in world frame
 * @param angle The angle for the offset of the relative orientation.
 *              As if body1 was rotated by angle when the Axis was set (see below).
 *              The rotation is around the new Hinge axis.
 *
 * @note Usually the function dJointSetHingeAxis set the current position of body1
 *       and body2 as the zero angle position. This function set the current position
 *       as the if the 2 bodies where \b offsets appart.
 *
 * @note Any previous offsets are erased.
 *
 * @warning Calling dJointSetUniversalAnchor, dJointSetUnivesalAxis1, 
 *          dJointSetUniversalAxis2, dJointSetUniversalAxis2Offset 
 *          will reset the "zero" angle position.
  }
procedure dJointSetUniversalAxis2Offset(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal; offset1:TdReal; 
            offset2:TdReal);cdecl;external;
{*
 * @brief set joint parameter
 * @ingroup joints
  }
procedure dJointSetUniversalParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief Applies torque1 about the universal's axis 1, torque2 about the
 * universal's axis 2.
 * @remarks This function is just a wrapper for dBodyAddTorque().
 * @ingroup joints
  }
procedure dJointAddUniversalTorques(joint:TdJointID; torque1:TdReal; torque2:TdReal);cdecl;external;
{*
 * @brief set anchor
 * @ingroup joints
  }
procedure dJointSetPRAnchor(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set the axis for the prismatic articulation
 * @ingroup joints
  }
procedure dJointSetPRAxis1(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set the axis for the rotoide articulation
 * @ingroup joints
  }
procedure dJointSetPRAxis2(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set joint parameter
 * @ingroup joints
 *
 * @note parameterX where X equal 2 refer to parameter for the rotoide articulation
  }
procedure dJointSetPRParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief Applies the torque about the rotoide axis of the PR joint
 *
 * That is, it applies a torque with specified magnitude in the direction 
 * of the rotoide axis, to body 1, and with the same magnitude but in opposite
 * direction to body 2. This function is just a wrapper for dBodyAddTorque()
 * @ingroup joints
  }
procedure dJointAddPRTorque(j:TdJointID; torque:TdReal);cdecl;external;
{*
* @brief set anchor
* @ingroup joints
 }
procedure dJointSetPUAnchor(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set anchor
 * @ingroup joints
  }
{extern_DEPRECATED }procedure dJointSetPUAnchorDelta(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal; dx:TdReal; 
            dy:TdReal; dz:TdReal);cdecl;external;
{*
 * @brief Set the PU anchor as if the 2 bodies were already at [dx, dy, dz] appart.
 * @ingroup joints
 *
 * This function initialize the anchor and the relative position of each body
 * as if the position between body1 and body2 was already the projection of [dx, dy, dz]
 * along the Piston axis. (i.e as if the body1 was at its current position - [dx,dy,dy] when the
 * axis is set).
 * Ex:
 * <PRE>
 * dReal offset = 3;
 * dVector3 axis;
 * dJointGetPUAxis(jId, axis);
 * dJointSetPUAnchor(jId, 0, 0, 0);
 * // If you request the position you will have: dJointGetPUPosition(jId) == 0
 * dJointSetPUAnchorOffset(jId, 0, 0, 0, axis[X]*offset, axis[Y]*offset, axis[Z]*offset);
 * // If you request the position you will have: dJointGetPUPosition(jId) == offset
 * </PRE>
 * @param j The PU joint for which the anchor point will be set
 * @param x The X position of the anchor point in world frame
 * @param y The Y position of the anchor point in world frame
 * @param z The Z position of the anchor point in world frame
 * @param dx A delta to be substracted to the X position as if the anchor was set
 *           when body1 was at current_position[X] - dx
 * @param dx A delta to be substracted to the Y position as if the anchor was set
 *           when body1 was at current_position[Y] - dy
 * @param dx A delta to be substracted to the Z position as if the anchor was set
 *           when body1 was at current_position[Z] - dz
  }
procedure dJointSetPUAnchorOffset(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal; dx:TdReal; 
            dy:TdReal; dz:TdReal);cdecl;external;
{*
 * @brief set the axis for the first axis or the universal articulation
 * @ingroup joints
  }
procedure dJointSetPUAxis1(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set the axis for the second axis or the universal articulation
 * @ingroup joints
  }
procedure dJointSetPUAxis2(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set the axis for the prismatic articulation
 * @ingroup joints
  }
procedure dJointSetPUAxis3(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set the axis for the prismatic articulation
 * @ingroup joints
 * @note This function was added for convenience it is the same as
 *       dJointSetPUAxis3
  }
procedure dJointSetPUAxisP(id:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set joint parameter
 * @ingroup joints
 *
 * @note parameterX where X equal 2 refer to parameter for second axis of the
 *       universal articulation
 * @note parameterX where X equal 3 refer to parameter for prismatic
 *       articulation
  }
procedure dJointSetPUParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief Applies the torque about the rotoide axis of the PU joint
 *
 * That is, it applies a torque with specified magnitude in the direction
 * of the rotoide axis, to body 1, and with the same magnitude but in opposite
 * direction to body 2. This function is just a wrapper for dBodyAddTorque()
 * @ingroup joints
  }
procedure dJointAddPUTorque(j:TdJointID; torque:TdReal);cdecl;external;
{*
 * @brief set the joint anchor
 * @ingroup joints
  }
procedure dJointSetPistonAnchor(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief Set the Piston anchor as if the 2 bodies were already at [dx,dy, dz] appart.
 * @ingroup joints
 *
 * This function initialize the anchor and the relative position of each body
 * as if the position between body1 and body2 was already the projection of [dx, dy, dz]
 * along the Piston axis. (i.e as if the body1 was at its current position - [dx,dy,dy] when the
 * axis is set).
 * Ex:
 * <PRE>
 * dReal offset = 3;
 * dVector3 axis;
 * dJointGetPistonAxis(jId, axis);
 * dJointSetPistonAnchor(jId, 0, 0, 0);
 * // If you request the position you will have: dJointGetPistonPosition(jId) == 0
 * dJointSetPistonAnchorOffset(jId, 0, 0, 0, axis[X]*offset, axis[Y]*offset, axis[Z]*offset);
 * // If you request the position you will have: dJointGetPistonPosition(jId) == offset
 * </PRE>
 * @param j The Piston joint for which the anchor point will be set
 * @param x The X position of the anchor point in world frame
 * @param y The Y position of the anchor point in world frame
 * @param z The Z position of the anchor point in world frame
 * @param dx A delta to be substracted to the X position as if the anchor was set
 *           when body1 was at current_position[X] - dx
 * @param dx A delta to be substracted to the Y position as if the anchor was set
 *           when body1 was at current_position[Y] - dy
 * @param dx A delta to be substracted to the Z position as if the anchor was set
 *           when body1 was at current_position[Z] - dz
  }
procedure dJointSetPistonAnchorOffset(j:TdJointID; x:TdReal; y:TdReal; z:TdReal; dx:TdReal; 
            dy:TdReal; dz:TdReal);cdecl;external;
{*
   * @brief set the joint axis
 * @ingroup joints
  }
procedure dJointSetPistonAxis(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * This function set prismatic axis of the joint and also set the position
 * of the joint.
 *
 * @ingroup joints
 * @param j The joint affected by this function
 * @param x The x component of the axis
 * @param y The y component of the axis
 * @param z The z component of the axis
 * @param dx The Initial position of the prismatic join in the x direction
 * @param dy The Initial position of the prismatic join in the y direction
 * @param dz The Initial position of the prismatic join in the z direction
  }
{extern_DEPRECATED }procedure dJointSetPistonAxisDelta(j:TdJointID; x:TdReal; y:TdReal; z:TdReal; ax:TdReal; 
            ay:TdReal; az:TdReal);cdecl;external;
{*
 * @brief set joint parameter
 * @ingroup joints
  }
procedure dJointSetPistonParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief Applies the given force in the slider's direction.
 *
 * That is, it applies a force with specified magnitude, in the direction of
 * prismatic's axis, to body1, and with the same magnitude but opposite
 * direction to body2.  This function is just a wrapper for dBodyAddForce().
 * @ingroup joints
  }
procedure dJointAddPistonForce(joint:TdJointID; force:TdReal);cdecl;external;
{*
 * @brief Call this on the fixed joint after it has been attached to
 * remember the current desired relative offset and desired relative
 * rotation between the bodies.
 * @ingroup joints
  }
procedure dJointSetFixed(para1:TdJointID);cdecl;external;
{
 * @brief Sets joint parameter
 *
 * @ingroup joints
  }
procedure dJointSetFixedParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief set the nr of axes
 * @param num 0..3
 * @ingroup joints
  }
procedure dJointSetAMotorNumAxes(para1:TdJointID; num:longint);cdecl;external;
{*
 * @brief set axis
 * @ingroup joints
  }
procedure dJointSetAMotorAxis(para1:TdJointID; anum:longint; rel:longint; x:TdReal; y:TdReal; 
            z:TdReal);cdecl;external;
{*
 * @brief Tell the AMotor what the current angle is along axis anum.
 *
 * This function should only be called in dAMotorUser mode, because in this
 * mode the AMotor has no other way of knowing the joint angles.
 * The angle information is needed if stops have been set along the axis,
 * but it is not needed for axis motors.
 * @ingroup joints
  }
procedure dJointSetAMotorAngle(para1:TdJointID; anum:longint; angle:TdReal);cdecl;external;
{*
 * @brief set joint parameter
 * @ingroup joints
  }
procedure dJointSetAMotorParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief set mode
 * @ingroup joints
  }
procedure dJointSetAMotorMode(para1:TdJointID; mode:longint);cdecl;external;
{*
 * @brief Applies torque0 about the AMotor's axis 0, torque1 about the
 * AMotor's axis 1, and torque2 about the AMotor's axis 2.
 * @remarks
 * If the motor has fewer than three axes, the higher torques are ignored.
 * This function is just a wrapper for dBodyAddTorque().
 * @ingroup joints
  }
procedure dJointAddAMotorTorques(para1:TdJointID; torque1:TdReal; torque2:TdReal; torque3:TdReal);cdecl;external;
{*
 * @brief Set the number of axes that will be controlled by the LMotor.
 * @param num can range from 0 (which effectively deactivates the joint) to 3.
 * @ingroup joints
  }
procedure dJointSetLMotorNumAxes(para1:TdJointID; num:longint);cdecl;external;
{*
 * @brief Set the AMotor axes.
 * @param anum selects the axis to change (0,1 or 2).
 * @param rel Each axis can have one of three ``relative orientation'' modes
 * \li 0: The axis is anchored to the global frame.
 * \li 1: The axis is anchored to the first body.
 * \li 2: The axis is anchored to the second body.
 * @remarks The axis vector is always specified in global coordinates
 * regardless of the setting of rel.
 * @ingroup joints
  }
procedure dJointSetLMotorAxis(para1:TdJointID; anum:longint; rel:longint; x:TdReal; y:TdReal; 
            z:TdReal);cdecl;external;
{*
 * @brief set joint parameter
 * @ingroup joints
  }
procedure dJointSetLMotorParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @ingroup joints
  }
procedure dJointSetPlane2DXParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @ingroup joints
  }
procedure dJointSetPlane2DYParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @ingroup joints
  }
procedure dJointSetPlane2DAngleParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief Get the joint anchor point, in world coordinates.
 *
 * This returns the point on body 1. If the joint is perfectly satisfied,
 * this will be the same as the point on body 2.
  }
procedure dJointGetBallAnchor(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the joint anchor point, in world coordinates.
 *
 * This returns the point on body 2. You can think of a ball and socket
 * joint as trying to keep the result of dJointGetBallAnchor() and
 * dJointGetBallAnchor2() the same.  If the joint is perfectly satisfied,
 * this function will return the same value as dJointGetBallAnchor() to
 * within roundoff errors. dJointGetBallAnchor2() can be used, along with
 * dJointGetBallAnchor(), to see how far the joint has come apart.
  }
procedure dJointGetBallAnchor2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetBallParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief Get the hinge anchor point, in world coordinates.
 *
 * This returns the point on body 1. If the joint is perfectly satisfied,
 * this will be the same as the point on body 2.
 * @ingroup joints
  }
procedure dJointGetHingeAnchor(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the joint anchor point, in world coordinates.
 * @return The point on body 2. If the joint is perfectly satisfied,
 * this will return the same value as dJointGetHingeAnchor().
 * If not, this value will be slightly different.
 * This can be used, for example, to see how far the joint has come apart.
 * @ingroup joints
  }
procedure dJointGetHingeAnchor2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get axis
 * @ingroup joints
  }
procedure dJointGetHingeAxis(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetHingeParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief Get the hinge angle.
 *
 * The angle is measured between the two bodies, or between the body and
 * the static environment.
 * The angle will be between -pi..pi.
 * Give the relative rotation with respect to the Hinge axis of Body 1 with
 * respect to Body 2.
 * When the hinge anchor or axis is set, the current position of the attached
 * bodies is examined and that position will be the zero angle.
 * @ingroup joints
  }
function dJointGetHingeAngle(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the hinge angle time derivative.
 * @ingroup joints
  }
function dJointGetHingeAngleRate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the slider linear position (i.e. the slider's extension)
 *
 * When the axis is set, the current position of the attached bodies is
 * examined and that position will be the zero position.

 * The position is the distance, with respect to the zero position,
 * along the slider axis of body 1 with respect to
 * body 2. (A NULL body is replaced by the world).
 * @ingroup joints
  }
function dJointGetSliderPosition(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the slider linear position's time derivative.
 * @ingroup joints
  }
function dJointGetSliderPositionRate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the slider axis
 * @ingroup joints
  }
procedure dJointGetSliderAxis(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetSliderParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief Get the joint anchor point, in world coordinates.
 * @return the point on body 1.  If the joint is perfectly satisfied,
 * this will be the same as the point on body 2.
 * @ingroup joints
  }
procedure dJointGetHinge2Anchor(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the joint anchor point, in world coordinates.
 * This returns the point on body 2. If the joint is perfectly satisfied,
 * this will return the same value as dJointGetHinge2Anchor.
 * If not, this value will be slightly different.
 * This can be used, for example, to see how far the joint has come apart.
 * @ingroup joints
  }
procedure dJointGetHinge2Anchor2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get joint axis
 * @ingroup joints
  }
procedure dJointGetHinge2Axis1(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get joint axis
 * @ingroup joints
  }
procedure dJointGetHinge2Axis2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetHinge2Param(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief Get angle
 * @ingroup joints
  }
function dJointGetHinge2Angle1(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get angle
 * @ingroup joints
  }
function dJointGetHinge2Angle2(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get time derivative of angle
 * @ingroup joints
  }
function dJointGetHinge2Angle1Rate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get time derivative of angle
 * @ingroup joints
  }
function dJointGetHinge2Angle2Rate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the joint anchor point, in world coordinates.
 * @return the point on body 1. If the joint is perfectly satisfied,
 * this will be the same as the point on body 2.
 * @ingroup joints
  }
procedure dJointGetUniversalAnchor(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the joint anchor point, in world coordinates.
 * @return This returns the point on body 2.
 * @remarks
 * You can think of the ball and socket part of a universal joint as
 * trying to keep the result of dJointGetBallAnchor() and
 * dJointGetBallAnchor2() the same. If the joint is
 * perfectly satisfied, this function will return the same value
 * as dJointGetUniversalAnchor() to within roundoff errors.
 * dJointGetUniversalAnchor2() can be used, along with
 * dJointGetUniversalAnchor(), to see how far the joint has come apart.
 * @ingroup joints
  }
procedure dJointGetUniversalAnchor2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get axis
 * @ingroup joints
  }
procedure dJointGetUniversalAxis1(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get axis
 * @ingroup joints
  }
procedure dJointGetUniversalAxis2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetUniversalParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief Get both angles at the same time.
 * @ingroup joints
 *
 * @param joint   The universal joint for which we want to calculate the angles
 * @param angle1  The angle between the body1 and the axis 1
 * @param angle2  The angle between the body2 and the axis 2
 *
 * @note This function combine getUniversalAngle1 and getUniversalAngle2 together
 *       and try to avoid redundant calculation
  }
procedure dJointGetUniversalAngles(para1:TdJointID; angle1:PdReal; angle2:PdReal);cdecl;external;
{*
 * @brief Get angle
 * @ingroup joints
  }
function dJointGetUniversalAngle1(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get angle
 * @ingroup joints
  }
function dJointGetUniversalAngle2(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get time derivative of angle
 * @ingroup joints
  }
function dJointGetUniversalAngle1Rate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get time derivative of angle
 * @ingroup joints
  }
function dJointGetUniversalAngle2Rate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the joint anchor point, in world coordinates.
 * @return the point on body 1. If the joint is perfectly satisfied, 
 * this will be the same as the point on body 2.
 * @ingroup joints
  }
procedure dJointGetPRAnchor(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the PR linear position (i.e. the prismatic's extension)
 *
 * When the axis is set, the current position of the attached bodies is
 * examined and that position will be the zero position.
 *
 * The position is the "oriented" length between the
 * position = (Prismatic axis) dot_product [(body1 + offset) - (body2 + anchor2)]
 *
 * @ingroup joints
  }
function dJointGetPRPosition(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the PR linear position's time derivative
 *
 * @ingroup joints
  }
function dJointGetPRPositionRate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the PR angular position (i.e. the  twist between the 2 bodies)
 *
 * When the axis is set, the current position of the attached bodies is
 * examined and that position will be the zero position.
 * @ingroup joints
  }
function dJointGetPRAngle(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the PR angular position's time derivative
 *
 * @ingroup joints
  }
function dJointGetPRAngleRate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the prismatic axis
 * @ingroup joints
  }
procedure dJointGetPRAxis1(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the Rotoide axis
 * @ingroup joints
  }
procedure dJointGetPRAxis2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetPRParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief Get the joint anchor point, in world coordinates.
 * @return the point on body 1. If the joint is perfectly satisfied,
 * this will be the same as the point on body 2.
 * @ingroup joints
  }
procedure dJointGetPUAnchor(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the PU linear position (i.e. the prismatic's extension)
 *
 * When the axis is set, the current position of the attached bodies is
 * examined and that position will be the zero position.
 *
 * The position is the "oriented" length between the
 * position = (Prismatic axis) dot_product [(body1 + offset) - (body2 + anchor2)]
 *
 * @ingroup joints
  }
function dJointGetPUPosition(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the PR linear position's time derivative
 *
 * @ingroup joints
  }
function dJointGetPUPositionRate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the first axis of the universal component of the joint
 * @ingroup joints
  }
procedure dJointGetPUAxis1(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the second axis of the Universal component of the joint
 * @ingroup joints
  }
procedure dJointGetPUAxis2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the prismatic axis
 * @ingroup joints
  }
procedure dJointGetPUAxis3(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the prismatic axis
 * @ingroup joints
 *
 * @note This function was added for convenience it is the same as
 *       dJointGetPUAxis3
  }
procedure dJointGetPUAxisP(id:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get both angles at the same time.
 * @ingroup joints
 *
 * @param joint   The Prismatic universal joint for which we want to calculate the angles
 * @param angle1  The angle between the body1 and the axis 1
 * @param angle2  The angle between the body2 and the axis 2
 *
 * @note This function combine dJointGetPUAngle1 and dJointGetPUAngle2 together
 *       and try to avoid redundant calculation
  }
procedure dJointGetPUAngles(para1:TdJointID; angle1:PdReal; angle2:PdReal);cdecl;external;
{*
 * @brief Get angle
 * @ingroup joints
  }
function dJointGetPUAngle1(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief * @brief Get time derivative of angle1
 *
 * @ingroup joints
  }
function dJointGetPUAngle1Rate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get angle
 * @ingroup joints
  }
function dJointGetPUAngle2(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief * @brief Get time derivative of angle2
 *
 * @ingroup joints
  }
function dJointGetPUAngle2Rate(para1:TdJointID):TdReal;cdecl;external;
{*
   * @brief get joint parameter
   * @ingroup joints
    }
function dJointGetPUParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief Get the Piston linear position (i.e. the piston's extension)
 *
 * When the axis is set, the current position of the attached bodies is
 * examined and that position will be the zero position.
 * @ingroup joints
  }
function dJointGetPistonPosition(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the piston linear position's time derivative.
 * @ingroup joints
  }
function dJointGetPistonPositionRate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the Piston angular position (i.e. the  twist between the 2 bodies)
 *
 * When the axis is set, the current position of the attached bodies is
 * examined and that position will be the zero position.
 * @ingroup joints
  }
function dJointGetPistonAngle(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the piston angular position's time derivative.
 * @ingroup joints
  }
function dJointGetPistonAngleRate(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief Get the joint anchor
 *
 * This returns the point on body 1. If the joint is perfectly satisfied,
 * this will be the same as the point on body 2 in direction perpendicular
 * to the prismatic axis.
 *
 * @ingroup joints
  }
procedure dJointGetPistonAnchor(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the joint anchor w.r.t. body 2
 *
 * This returns the point on body 2. You can think of a Piston
 * joint as trying to keep the result of dJointGetPistonAnchor() and
 * dJointGetPistonAnchor2() the same in the direction perpendicular to the
 * pirsmatic axis. If the joint is perfectly satisfied,
 * this function will return the same value as dJointGetPistonAnchor() to
 * within roundoff errors. dJointGetPistonAnchor2() can be used, along with
 * dJointGetPistonAnchor(), to see how far the joint has come apart.
 *
 * @ingroup joints
  }
procedure dJointGetPistonAnchor2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief Get the prismatic axis (This is also the rotoide axis.
 * @ingroup joints
  }
procedure dJointGetPistonAxis(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetPistonParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief Get the number of angular axes that will be controlled by the
 * AMotor.
 * @param num can range from 0 (which effectively deactivates the
 * joint) to 3.
 * This is automatically set to 3 in dAMotorEuler mode.
 * @ingroup joints
  }
function dJointGetAMotorNumAxes(para1:TdJointID):longint;cdecl;external;
{*
 * @brief Get the AMotor axes.
 * @param anum selects the axis to change (0,1 or 2).
 * @param rel Each axis can have one of three ``relative orientation'' modes.
 * \li 0: The axis is anchored to the global frame.
 * \li 1: The axis is anchored to the first body.
 * \li 2: The axis is anchored to the second body.
 * @ingroup joints
  }
procedure dJointGetAMotorAxis(para1:TdJointID; anum:longint; result:TdVector3);cdecl;external;
{*
 * @brief Get axis
 * @remarks
 * The axis vector is always specified in global coordinates regardless
 * of the setting of rel.
 * There are two GetAMotorAxis functions, one to return the axis and one to
 * return the relative mode.
 *
 * For dAMotorEuler mode:
 * \li	Only axes 0 and 2 need to be set. Axis 1 will be determined
	automatically at each time step.
 * \li	Axes 0 and 2 must be perpendicular to each other.
 * \li	Axis 0 must be anchored to the first body, axis 2 must be anchored
	to the second body.
 * @ingroup joints
  }
function dJointGetAMotorAxisRel(para1:TdJointID; anum:longint):longint;cdecl;external;
{*
 * @brief Get the current angle for axis.
 * @remarks
 * In dAMotorUser mode this is simply the value that was set with
 * dJointSetAMotorAngle().
 * In dAMotorEuler mode this is the corresponding euler angle.
 * @ingroup joints
  }
function dJointGetAMotorAngle(para1:TdJointID; anum:longint):TdReal;cdecl;external;
{*
 * @brief Get the current angle rate for axis anum.
 * @remarks
 * In dAMotorUser mode this is always zero, as not enough information is
 * available.
 * In dAMotorEuler mode this is the corresponding euler angle rate.
 * @ingroup joints
  }
function dJointGetAMotorAngleRate(para1:TdJointID; anum:longint):TdReal;cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetAMotorParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief Get the angular motor mode.
 * @param mode must be one of the following constants:
 * \li dAMotorUser The AMotor axes and joint angle settings are entirely
 * controlled by the user.  This is the default mode.
 * \li dAMotorEuler Euler angles are automatically computed.
 * The axis a1 is also automatically computed.
 * The AMotor axes must be set correctly when in this mode,
 * as described below.
 * When this mode is initially set the current relative orientations
 * of the bodies will correspond to all euler angles at zero.
 * @ingroup joints
  }
function dJointGetAMotorMode(para1:TdJointID):longint;cdecl;external;
{*
 * @brief Get nr of axes.
 * @ingroup joints
  }
function dJointGetLMotorNumAxes(para1:TdJointID):longint;cdecl;external;
{*
 * @brief Get axis.
 * @ingroup joints
  }
procedure dJointGetLMotorAxis(para1:TdJointID; anum:longint; result:TdVector3);cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetLMotorParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief get joint parameter
 * @ingroup joints
  }
function dJointGetFixedParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief get the contact point of the first wheel of the Transmission joint.
 * @ingroup joints
  }
procedure dJointGetTransmissionContactPoint1(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get contact point of the second wheel of the Transmission joint.
 * @ingroup joints
  }
procedure dJointGetTransmissionContactPoint2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief set the first axis for the Transmission joint
 * @remarks This is the axis around which the first body is allowed to
 * revolve and is attached to it.  It is given in global coordinates
 * and can only be set explicitly in intersecting-axes mode.  For the
 * parallel-axes and chain modes which share one common axis of
 * revolution for both gears dJointSetTransmissionAxis should be used.
 * @ingroup joints
  }
procedure dJointSetTransmissionAxis1(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief get first axis for the Transmission joint
 * @remarks In parallel-axes and chain mode the common axis with
 * respect to the first body is returned.  If the joint constraint is
 * satisfied it should be the same as the axis return with
 * dJointGetTransmissionAxis2 or dJointGetTransmissionAxis.
 * @ingroup joints
  }
procedure dJointGetTransmissionAxis1(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief set second axis for the Transmission joint
 * @remarks This is the axis around which the second body is allowed
 * to revolve and is attached to it.  It is given in global
 * coordinates and can only be set explicitly in intersecting-axes
 * mode.  For the parallel-axes and chain modes which share one common
 * axis of revolution for both gears dJointSetTransmissionAxis should
 * be used.
 * @ingroup joints
  }
procedure dJointSetTransmissionAxis2(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief get second axis for the Transmission joint
 * @remarks In parallel-axes and chain mode the common axis with
 * respect to the second body is returned.  If the joint constraint is
 * satisfied it should be the same as the axis return with
 * dJointGetTransmissionAxis1 or dJointGetTransmissionAxis.
 * @ingroup joints
  }
procedure dJointGetTransmissionAxis2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief set the first anchor for the Transmission joint
 * @remarks This is the point of attachment of the wheel on the
 * first body.  It is given in global coordinates.
 * @ingroup joints
  }
procedure dJointSetTransmissionAnchor1(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief get the first anchor of the Transmission joint
 * @ingroup joints
  }
procedure dJointGetTransmissionAnchor1(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief set the second anchor for the Transmission joint
 * @remarks This is the point of attachment of the wheel on the
 * second body.  It is given in global coordinates.
 * @ingroup joints
  }
procedure dJointSetTransmissionAnchor2(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief get the second anchor for the Transmission joint
 * @ingroup joints
  }
procedure dJointGetTransmissionAnchor2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief set a Transmission joint parameter
 * @ingroup joints
  }
procedure dJointSetTransmissionParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief get a Transmission joint parameter
 * @ingroup joints
  }
function dJointGetTransmissionParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief set the Transmission joint mode
 * @remarks The mode can be one of dTransmissionParallelAxes,
 * dTransmissionIntersectingAxes and dTransmissionChainDrive simulating a
 * set of parallel-axes gears, intersecting-axes beveled gears or
 * chain and sprockets respectively.
 * @ingroup joints
  }
procedure dJointSetTransmissionMode(j:TdJointID; mode:longint);cdecl;external;
{*
 * @brief get the Transmission joint mode
 * @ingroup joints
  }
function dJointGetTransmissionMode(j:TdJointID):longint;cdecl;external;
{*
 * @brief set the Transmission ratio
 * @remarks This is the ratio of the angular speed of the first gear
 * to that of the second gear.  It can only be set explicitly in
 * parallel-axes mode.  In intersecting-axes mode the ratio is defined
 * implicitly by the initial configuration of the wheels and in chain
 * mode it is defined implicitly be the wheel radii.
 * @ingroup joints
  }
procedure dJointSetTransmissionRatio(j:TdJointID; ratio:TdReal);cdecl;external;
{*
 * @brief get the Transmission joint ratio
 * @ingroup joints
  }
function dJointGetTransmissionRatio(j:TdJointID):TdReal;cdecl;external;
{*
 * @brief set the common axis for both wheels of the Transmission joint
 * @remarks This sets the common axis of revolution for both wheels
 * and should only be used in parallel-axes or chain mode.  For
 * intersecting-axes mode where each wheel axis needs to be specified
 * individually dJointSetTransmissionAxis1 and
 * dJointSetTransmissionAxis2 should be used.  The axis is given in
 * global coordinates
 * @ingroup joints
  }
procedure dJointSetTransmissionAxis(j:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief get the common axis for both wheels of the Transmission joint
 * @ingroup joints
  }
procedure dJointGetTransmissionAxis(j:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get the phase, that is the traversed angle for the first
 * wheel of the Transmission joint
 * @ingroup joints
  }
function dJointGetTransmissionAngle1(j:TdJointID):TdReal;cdecl;external;
{*
 * @brief get the phase, that is the traversed angle for the second
 * wheel of the Transmission joint
 * @ingroup joints
  }
function dJointGetTransmissionAngle2(j:TdJointID):TdReal;cdecl;external;
{*
 * @brief get the radius of the first wheel of the Transmission joint
 * @ingroup joints
  }
function dJointGetTransmissionRadius1(j:TdJointID):TdReal;cdecl;external;
{*
 * @brief get the radius of the second wheel of the Transmission joint
 * @ingroup joints
  }
function dJointGetTransmissionRadius2(j:TdJointID):TdReal;cdecl;external;
{*
 * @brief set the radius of the first wheel of the Transmission joint
 * @remarks The wheel radii can only be set explicitly in chain mode.
 * In the other modes they're defined implicitly by the initial
 * configuration and ratio of the wheels.
 * @ingroup joints
  }
procedure dJointSetTransmissionRadius1(j:TdJointID; radius:TdReal);cdecl;external;
{*
 * @brief set the radius of the second wheel of the Transmission joint
 * @remarks The wheel radii can only be set explicitly in chain mode.
 * In the other modes they're defined implicitly by the initial
 * configuration and ratio of the wheels.
 * @ingroup joints
  }
procedure dJointSetTransmissionRadius2(j:TdJointID; radius:TdReal);cdecl;external;
{*
 * @brief get the backlash of the Transmission joint
 * @ingroup joints
  }
function dJointGetTransmissionBacklash(j:TdJointID):TdReal;cdecl;external;
{*
 * @brief set the backlash of the Transmission joint
 * @remarks Backlash is the clearance in the mesh of the wheels of the
 * transmission and is defined as the maximum distance that the
 * geometric contact point can travel without any actual contact or
 * transfer of power between the wheels.  This can be converted in
 * degrees of revolution for each wheel by dividing by the wheel's
 * radius.  To further illustrate this consider the situation where a
 * wheel of radius r_1 is driving another wheel of radius r_2 and
 * there is an amount of backlash equal to b in their mesh.  If the
 * driving wheel were to instantaneously stop there would be no
 * contact and hence the driven wheel would continue to turn for
 * another b / r_2 radians until all the backlash in the mesh was take
 * up and contact restored with the relationship of driving and driven
 * wheel reversed.  The backlash is therefore given in untis of
 * length.
  * @ingroup joints
  }
procedure dJointSetTransmissionBacklash(j:TdJointID; backlash:TdReal);cdecl;external;
{*
 * @brief set anchor1 for double ball joint
 * @ingroup joints
  }
procedure dJointSetDBallAnchor1(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set anchor2 for double ball joint
 * @ingroup joints
  }
procedure dJointSetDBallAnchor2(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief get anchor1 from double ball joint
 * @ingroup joints
  }
procedure dJointGetDBallAnchor1(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get anchor2 from double ball joint
 * @ingroup joints
  }
procedure dJointGetDBallAnchor2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get the target distance from double ball joint
 * @ingroup joints
  }
function dJointGetDBallDistance(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief set the target distance for the double ball joint
 * @ingroup joints
  }
procedure dJointSetDBallDistance(para1:TdJointID; dist:TdReal);cdecl;external;
{*
 * @brief set double ball joint parameter
 * @ingroup joints
  }
procedure dJointSetDBallParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief get double ball joint parameter
 * @ingroup joints
  }
function dJointGetDBallParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @brief set axis for double hinge joint
 * @ingroup joints
  }
procedure dJointSetDHingeAxis(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief get axis for double hinge joint
 * @ingroup joints
  }
procedure dJointGetDHingeAxis(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief set anchor1 for double hinge joint
 * @ingroup joints
  }
procedure dJointSetDHingeAnchor1(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief set anchor2 for double hinge joint
 * @ingroup joints
  }
procedure dJointSetDHingeAnchor2(para1:TdJointID; x:TdReal; y:TdReal; z:TdReal);cdecl;external;
{*
 * @brief get anchor1 from double hinge joint
 * @ingroup joints
  }
procedure dJointGetDHingeAnchor1(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get anchor2 from double hinge joint
 * @ingroup joints
  }
procedure dJointGetDHingeAnchor2(para1:TdJointID; result:TdVector3);cdecl;external;
{*
 * @brief get the set distance from double hinge joint
 * @ingroup joints
  }
function dJointGetDHingeDistance(para1:TdJointID):TdReal;cdecl;external;
{*
 * @brief set double hinge joint parameter
 * @ingroup joints
  }
procedure dJointSetDHingeParam(para1:TdJointID; parameter:longint; value:TdReal);cdecl;external;
{*
 * @brief get double hinge joint parameter
 * @ingroup joints
  }
function dJointGetDHingeParam(para1:TdJointID; parameter:longint):TdReal;cdecl;external;
{*
 * @ingroup joints
  }
function dConnectingJoint(para1:TdBodyID; para2:TdBodyID):TdJointID;cdecl;external;
{*
 * @ingroup joints
  }
function dConnectingJointList(para1:TdBodyID; para2:TdBodyID; para3:PdJointID):longint;cdecl;external;
{*
 * @brief Utility function
 * @return 1 if the two bodies are connected together by
 * a joint, otherwise return 0.
 * @ingroup joints
  }
function dAreConnected(para1:TdBodyID; para2:TdBodyID):longint;cdecl;external;
{*
 * @brief Utility function
 * @return 1 if the two bodies are connected together by
 * a joint that does not have type @argjoint_type, otherwise return 0.
 * @param body1 A body to check.
 * @param body2 A body to check.
 * @param joint_type is a dJointTypeXXX constant.
 * This is useful for deciding whether to add contact joints between two bodies:
 * if they are already connected by non-contact joints then it may not be
 * appropriate to add contacts, however it is okay to add more contact between-
 * bodies that already have contacts.
 * @ingroup joints
  }
function dAreConnectedExcluding(body1:TdBodyID; body2:TdBodyID; joint_type:longint):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
