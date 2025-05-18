
unit Eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eo.h
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
PEfl_Callback_Array_Item  = ^Efl_Callback_Array_Item;
PEfl_Callback_Array_Item_Full  = ^Efl_Callback_Array_Item_Full;
PEfl_Class  = ^Efl_Class;
PEfl_Class_Description  = ^Efl_Class_Description;
PEfl_Class_Type  = ^Efl_Class_Type;
PEfl_Dbg_Info  = ^Efl_Dbg_Info;
PEfl_Domain_Data  = ^Efl_Domain_Data;
PEfl_Event  = ^Efl_Event;
PEfl_Event_Description  = ^Efl_Event_Description;
PEfl_Future_Cb_Desc  = ^Efl_Future_Cb_Desc;
PEfl_Id_Domain  = ^Efl_Id_Domain;
PEfl_Object  = ^Efl_Object;
PEfl_Object_Op  = ^Efl_Object_Op;
PEfl_Object_Op_Call_Data  = ^Efl_Object_Op_Call_Data;
PEfl_Object_Ops  = ^Efl_Object_Ops;
PEfl_Object_Property_Reflection  = ^Efl_Object_Property_Reflection;
PEfl_Object_Property_Reflection_Ops  = ^Efl_Object_Property_Reflection_Ops;
PEfl_Op_Description  = ^Efl_Op_Description;
PEfl_Substitute_Ctor_Cb  = ^Efl_Substitute_Ctor_Cb;
PEina_Future  = ^Eina_Future;
PEina_Future_Scheduler  = ^Eina_Future_Scheduler;
PEina_Iterator  = ^Eina_Iterator;
PEina_Stringshare  = ^Eina_Stringshare;
PEina_Value  = ^Eina_Value;
PEina_Value_Type  = ^Eina_Value_Type;
PEo  = ^Eo;
PEo_Object  = ^Eo_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EO_H}
{$define EO_H}
{$include <stdarg.h>}
{$include <Eina.h>}
{$ifdef extern}
{$error extern should not be already defined}
{$endif}
{*
 * @page eo_main Eo
 *
 * @date 2012 (created)
 *
 * @section eo_toc Table of Contents
 *
 * @li @ref eo_main_intro
 * @li @ref eo_main_compiling
 * @li @ref eo_main_next_steps
 * @li @ref eo_main_intro_example
 * @li @ref eo_lifecycle_debug
 *
 * @section eo_main_intro Introduction
 *
 * The Eo generic object system. It's designed to be the base object
 * system for the EFL.

 * @section eo_main_compiling How to compile
 *
 * Eo is a library to which your application can link. The procedure for this is
 * very simple. You simply have to compile your application with the
 * appropriate compiler flags that the @c pkg-config script outputs. For
 * example:
 *
 * Compiling C or C++ files into object files:
 *
 * @verbatim
   gcc -c -o main.o main.c `pkg-config --cflags eo`
   @endverbatim
 *
 * Linking object files into a binary executable:
 *
 * @verbatim
   gcc -o my_application main.o `pkg-config --libs eo`
   @endverbatim
 *
 * See @ref pkgconfig
 *
 * @section eo_main_next_steps Next Steps
 *
 * After you've understood and installed Eo,
 * you can then learn more about the programming interface.
 *
 * Recommended reading:
 *
 * @li @ref Efl_Class_Base
 * @li @ref Efl_Class
 * @li @ref Efl_Events
 * @li @ref Eo_Composite_Objects
 *
 * @section eo_lifecycle_debug Debug Object Lifecycle
 *
 * When dealing with objects it's important to investigate the object
 * lifecycle: in other words when they were created and deleted. This is not
 * that trivial since objects can have extra references added with
 * efl_ref() as well as removed with efl_unref(), efl_parent_set() to
 * NULL or efl_del().
 *
 * To aid development process as well as debug memory leaks and invalid
 * access, you can use the eo_debug script helper to preload
 * libeo_dbg.so, run as:
 *
 * @verbatim
   export EO_LIFECYCLE_DEBUG=1
   export EINA_LOG_LEVELS=eo_lifecycle:4
   eo_debug my_app
 * @endverbatim
 *
 * This will print out all the objects that were created and deleted,
 * as well as keep the stack trace that originated those. If a double
 * free or user-after-free occurs it will print out the backtrace
 * where the object was created and where it was deleted. If only
 * errors should be displayed decrease the log level to 2:
 *
 * @verbatim
   export EO_LIFECYCLE_DEBUG=1
   export EINA_LOG_LEVELS=eo_lifecycle:2  # just critical, error and warning
   eo_debug my_app
 * @endverbatim
 *
 * Keep in mind that the log will consume memory for all objects and
 * that main loop primitives such as timers, jobs, promises and
 * futures are all objects. If created in large numbers, they will
 * consume large amounts of of memory.
 *
 * To address log pollution and memory consumption, you can
 * select just a handful classes to be logged using @c
 * EO_LIFECYCLE_DEBUG with a list of comma-separated class names. Use
 * @c EO_LIFECYCLE_DEBUG=1 or @c EO_LIFECYCLE_DEBUG=* to log all
 * classes, otherwise just the classes listed will be
 * (whitelist).
 *
 * @verbatim
   # Log only 2 classes: Efl_Loop and Efl_Net_Dialer_Tcp
   export EO_LIFECYCLE_DEBUG=Efl_Loop,Efl_Net_Dialer_Tcp
   export EINA_LOG_LEVELS=eo_lifecycle:4
   eo_debug my_app
 * @endverbatim
 *
 * Another approach is to log all but a few classes, also known as
 * a blacklist. This is done with another environment variable @c
 * EO_LIFECYCLE_NO_DEBUG=class1,class2.
 *
 * @verbatim
   # Log all but Efl_Loop_Timer
   export EO_LIFECYCLE_NO_DEBUG=Efl_Loop_Timer
   export EINA_LOG_LEVELS=eo_lifecycle:4
   eo_debug my_app
 * @endverbatim
 *
 * @section eo_main_intro_example Introductory Example
 *
 * @ref Eo_Tutorial

 *
 *
 * @addtogroup Eo
 * @
  }
type
{*
 * @typedef Eo
 * The basic Object type.
  }
  TEo_Opaque = TEo;
{*
 * @typedef Efl_Class
 * The basic class type - should be removed, for compatibility reasons.
  }

  PEfl_Class = ^TEfl_Class;
  TEfl_Class = TEo;
{$define _EFL_CLASS_EO_CLASS_TYPE}

  PEfl_Object = ^TEfl_Object;
  TEfl_Object = TEo;
{$define _EFL_OBJECT_EO_CLASS_TYPE}
{*
 * @var _efl_class_creation_lock
 * This variable is used for locking purposes in the class_get function
 * defined in #EFL_DEFINE_CLASS.
 * This is just to work around the fact that you need to init locks before
 * using them.
 * Don't touch it if you don't know what you are doing.
 * @internal
  }
  var
    _efl_class_creation_lock : TEina_Lock;cvar;external;
{*
 * @var _efl_object_init_generation
 * This variable stores the current eo init generation. In other words how many times
 * you have completed full init/shutdown cycles. This starts at 1 and is incremeted on
 * every call to shutdown that actually shuts down eo.
 * @internal
  }
    _efl_object_init_generation : dword;cvar;external;
{*
 * @typedef Efl_Del_Intercept
 *
 * A function to be called on object deletion/destruction instead of normal
 * destruction taking place.
 *
 * @param obj_id The object needing to be destroyed.
  }
type

  TEfl_Del_Intercept = procedure (obj_id:PEo);cdecl;
{*
 * This is a no-operation. Its presence behind a function parameter indicates that
 * ownership of the parameter is transferred to the callee.
 * When present after a method, it indicates that the return value of the method is
 * transferred to the caller.
 * For objects, ownership transfer means that exactly one reference is transferred.
 * If you transfer ownership without owning a reference in the first place, you will
 * get unexpected behavior.
 * For non-Objects, ownership transfer means that the responsibility of freeing a
 * segment of memory is passed on.
  }
{$define EFL_TRANSFER_OWNERSHIP}
{$include "efl_object_override.eo.h"}
{$include "efl_object.eo.h"}
{*
 * @brief A parameter passed in event callbacks holding extra event parameters.
 *
 * This is the full event information passed to callbacks in C.
 *
 * @since 1.22
 *
 * @ingroup Efl
  }
{*< The object the callback was called on.
                       *
                       * @since 1.22  }
(* Const before type ignored *)
{*< The event description.
                                      *
                                      * @since 1.22  }
{*< Extra event information passed by the event caller. Must be
               * cast to the event type declared in the EO file. Keep in mind
               * that: 1) Objects are passed as a normal Eo*. Event subscribers
               * can call functions on these objects. 2) Structs, built-in
               * types and containers are passed as const pointers, with one
               * level of indirection.
               *
               * @since 1.22  }
type
  PEfl_Event = ^TEfl_Event;
  TEfl_Event = record
      object : PEfl_Object;
      desc : PEfl_Event_Description;
      info : pointer;
    end;

const
  EO_CLASS = EFL_OBJECT_CLASS;  
{* An event callback prototype.  }
(* Const before type ignored *)
type

  TEfl_Event_Cb = procedure (data:pointer; event:PEfl_Event);cdecl;
{*
 * @struct _Efl_Callback_Array_Item
 * @brief An item in an array of callback desc/func.
 *
 * See also efl_event_callback_array_add().
  }
(* Const before type ignored *)
{*< The event description.  }
{*< The callback function.  }

  PEfl_Callback_Array_Item = ^TEfl_Callback_Array_Item;
  TEfl_Callback_Array_Item = record
      desc : PEfl_Event_Description;
      func : TEfl_Event_Cb;
    end;
{*
 * @struct _Efl_Callback_Array_Item_Full
 * @brief An item provided by EFL_EVENT_CALLBACK_ADD/EFL_EVENT_CALLBACK_DEL.
 *
 * See also EFL_EVENT_CALLBACK_ADD EFL_EVENT_CALLBACK_DEL.
  }
(* Const before type ignored *)
{*< The event description.  }
{* < The priorit of the event  }
{*< The callback function.  }
{*< The user data pointer to be passed to the func  }

  PEfl_Callback_Array_Item_Full = ^TEfl_Callback_Array_Item_Full;
  TEfl_Callback_Array_Item_Full = record
      desc : PEfl_Event_Description;
      priority : TEfl_Callback_Priority;
      func : TEfl_Event_Cb;
      user_data : pointer;
    end;
{*
 * @brief Add a callback for an event with a specific priority.
 *
 * Callbacks of the same priority are called in reverse order of creation.
 *
 * A callback is only executed on events emitted after this call finished.
 *
 * @param[in] desc The description of the event to listen to
 * @param[in] priority The priority of the callback
 * @param[in] cb the callback to call
 * @param[in] data additional data to pass to the callback
 *
 * @return Return @c true when the callback has been successfully added.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_event_callback_priority_add(obj:PEo; desc:PEfl_Event_Description; priority:TEfl_Callback_Priority; cb:TEfl_Event_Cb; data:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Delete a callback with a specific data associated with it for an event.
 *
 * The callback will never be emitted again after this call, even if a event
 * emission is taking place.
 *
 * @param[in] desc The description of the event to listen to
 * @param[in] func The callback to delete
 * @param[in] user_data The data to compare
 *
 * @return Return @c true when the callback has been successfully removed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_event_callback_del(obj:PEo; desc:PEfl_Event_Description; func:TEfl_Event_Cb; user_data:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Get the Eina_Future scheduler that trigger them on a specific set of events on an object.
 *
 * @param[in] obj The object that the scheduler is attached to.
 * @param[in] array The events that when triggered on the object will trigger the Eina_Future.
 *
 * @return Return a scheduler that will trigger future exactly when the event are triggered.
 *
 * @note You must use EFL_SCHEDULER_ARRAY_DEFINE() to create the @p array.
  }
(* Const before type ignored *)
function efl_event_future_scheduler_get(obj:PEo; array:PEfl_Callback_Array_Item):PEina_Future_Scheduler;cdecl;external;
{*
 * @brief Add an array of callbacks created by @ref EFL_CALLBACKS_ARRAY_DEFINE
 * for an event with a specific priority. The array need to be sorted with @ref
 * efl_callbacks_cmp if you are not using the @ref EFL_CALLBACKS_ARRAY_DEFINE
 * macro.
 *
 * Callbacks of the same priority are called in reverse order of creation.
 *
 * A callback from the array is only executed on events emitted  after this
 * call finished.
 *
 * @param[in] array An #Efl_Callback_Array_Item of events to listen to
 * @param[in] priority The priority of the callback
 * @param[in] data Additional data to pass to the callback
 *
 * @return Return @c true when the callback has been successfully added.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_event_callback_array_priority_add(obj:PEo; array:PEfl_Callback_Array_Item; priority:TEfl_Callback_Priority; data:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Del a callback array with a specific data associated to it for an
 * event. The callbacks from the array will never be emitted again after this
 * call, even if a event emission is going on.
 *
 * @param[in] array An #Efl_Callback_Array_Item of events to listen to
 * @param[in] user_data The data to compare
 *
 * @return Return @c true when the callback has been successfully removed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_event_callback_array_del(obj:PEo; array:PEfl_Callback_Array_Item; user_data:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Call the callbacks for an event of an object.
 *
 * @param[in] desc The description of the event to call.
 * @param[in] event_info Extra event info to pass to the callbacks. Please provide objects of the same type as
 *    advertised in the EO file, as this is what listeners of this event will be expecting. Keep in mind that:
 *    1) Objects must be passed as a normal Eo*. Event subscribers can call functions on these objects.
 *    2) Structs, built-in types and containers must be passed as const pointers, with one level of indirection.
 *
 * @return @c false If one of the callbacks aborted the call, @c true otherwise
  }
(* Const before type ignored *)
function efl_event_callback_call(obj:PEo; desc:PEfl_Event_Description; event_info:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Call the callbacks for an event of an object.
 *
 * Like @ref efl_event_callback_call but also call legacy smart callbacks that
 * have the same name of the given event.
 *
 * @param[in] desc The description of the event to call.
 * @param[in] event_info Extra event info to pass to the callbacks.
 *
 * @return @c false If one of the callbacks aborted the call, @c true otherwise
 *
 * @since 1.19
  }
(* Const before type ignored *)
function efl_event_callback_legacy_call(obj:PEo; desc:PEfl_Event_Description; event_info:pointer):TEina_Bool;cdecl;external;
{*
 * @struct _Efl_Future_Cb_Desc
 *
 * A structure with callbacks to be used by efl_future_cb_from_desc() and efl_future_chain_array()
 *
 * @see efl_future_cb_from_desc()
 * @see efl_future_chain_array()
  }
{*
    * Called on success (value.type is not @c EINA_VALUE_TYPE_ERROR).
    *
    * If @c success_type is not NULL, then the value is guaranteed to be of that type.
    * If not, it will trigger @c error with @c EINVAL.
    *
    * After this function returns, @c free callback is called if provided.
    *
    * @note This function is always called from a safe context (main loop or some platform defined safe context).
    *
    * @param o The object used to create the link in efl_future_cb_from_desc() or efl_future_chain_array().
    * @param value The operation result
    * @return An Eina_Value to pass to the next Eina_Future in the chain (if any).
    * If there is no need to convert the received value, it's @b recommended
    * to passthrough @p value argument. If you need to convert to a different type
    * or generate a new value, use @c eina_value_setup() on @b another Eina_Value
    * and return it. By returning a promise Eina_Value (eina_promise_as_value()) the
    * whole chain will wait until the promise is resolved in
    * order to continue execution.
    * Note that the value contents must survive this function scope.
    * In other words, do @b not use stack allocated blobs, arrays, structures or types that
    * keeps references to memory you assign. Values will be automatically cleaned up
    * using @c eina_value_flush() once they are unused (no more future or futures
    * returned a new value).
     }
(* Const before type ignored *)
{*
    * Called on error (value.type is @c EINA_VALUE_TYPE_ERROR).
    *
    * This function can return another error then propagate or convert it. However it
    * may also return a non-error, in which case the next future in the chain will receive a regular
    * value, which may call its @c success.
    *
    * If this function is not provided, then it will passthrough the error to the next error handler.
    *
    * It may be called with @c EINVAL if @c success_type is provided and doesn't
    * match the received type.
    *
    * It may be called with @c ECANCELED if future was canceled.
    *
    * It may be called with @c ENOMEM if memory allocation failed during callback creation.
    *
    * After this function returns, @c free callback is called if provided.
    *
    * @note On future creation errors and future cancellation this function is called
    * from the current context with the following errors respectively: `EINVAL`, `ENOMEM` and  `ECANCELED`.
    * Otherwise this function is called from a safe context.
    *
    *
    * @param o The object used to create the link in efl_future_cb_from_desc() or efl_future_chain_array().
    * @param error The operation error
    * @return An Eina_Value to pass to the next Eina_Future in the chain (if any).
    * If you need to convert to a different type or generate a new value,
    * use @c eina_value_setup() on @b another Eina_Value
    * and return it. By returning a promise Eina_Value (eina_promise_as_value()) the
    * whole chain will wait until the promise is resolved in
    * order to continue execution.
    * Note that the value contents must survive this function scope.
    * In other words @b not use stack allocated blobs, arrays, structures or types that
    * keeps references to memory you give. Values will be automatically cleaned up
    * using @c eina_value_flush() once they are unused (no more future or futures
    * returned a new value).
     }
{*
    * Called on @b all situations to notify future destruction.
    *
    * This is called after @c success or @c error, as well as it's called if none of them are
    * provided. Thus can be used as a "weak ref" mechanism.
    *
    * @note On future creation errors and future cancellation this function is called
    * from the current context with the following errors respectively: `EINVAL`, `ENOMEM` and  `ECANCELED`.
    * Otherwise this function is called from a safe context.
    *
    * @param o The object used to create the link in efl_future_cb_from_desc() or efl_future_chain_array().
    * @param dead_future The future that's been freed.
     }
(* Const before type ignored *)
{*
    * If provided, then @c success will only be called if the value type matches the given pointer.
    *
    * If provided and no match is found, @c error will be called with @c EINVAL. If there's no @c error,
    * then it will be propagated to the next future in the chain.
     }
(* Const before type ignored *)
{*
    * Context data given to every callback.
    *
    * This must be freed @b only by @c free callback as it's called from every case,
    * otherwise it may lead to memory leaks.
     }
(* Const before type ignored *)
{*
    * This is used by Eo to cancel pending futures in case
    * an Eo object is deleted. It can be @c NULL.
     }
type
  PEfl_Future_Cb_Desc = ^TEfl_Future_Cb_Desc;
  TEfl_Future_Cb_Desc = record
      success : function (o:PEo; data:pointer; value:TEina_Value):TEina_Value;cdecl;
      error : function (o:PEo; data:pointer; error:TEina_Error):TEina_Value;cdecl;
      free : procedure (o:PEo; data:pointer; dead_future:PEina_Future);cdecl;
      success_type : PEina_Value_Type;
      data : pointer;
      storage : ^PEina_Future;
    end;
{*
 * Creates an Eina_Future_Desc for an EO object.
 *
 * This function creates an Eina_Future_Desc based on an Efl_Future_Cb_Desc.
 * The main purpose of this function is create a "link" between the future
 * and the object. In case the object is deleted before the future is resolved/rejected,
 * the object destructor will cancel the future.
 *
 * @note In case context info is required for the #Efl_Future_Desc, callbacks efl_key_data_set()
 * can be used.
 *
 * The example below demonstrates a file download using an Eo object. If the download
 * lasts more than 30 seconds the Eo object will be deleted along with the future.
 * Usually this would be done with an eina_future_race() of the download promise and a timeout promise,
 * however the following example is useful to illustrate efl_key_data_set() usage.
 *
 * @code
 *
 * static Eina_Bool
 * _timeout(void *data)
 * 
 *    Eo *downloader = data;
 *    //In case the download is not completed yet.
 *    //Delete the downloader (cancels the file download and the future)
 *    efl_key_data_set(downloader, "timer", NULL);
 *    efl_unref(downloader);
 *    return EINA_FALSE;
 * 
 *
 * static Eina_Value
 * _file_ok(Eo *o EINA_UNUSED, void *data EINA_UNUSED, const Eina_Value value)
 * 
 *    const char *data;
 *    //There's no need to check the value type since EO infra already has done so.
 *    eina_value_get(&value, &data);
 *    //Deliver the data to the user
 *    data_deliver(data);
 *    return v;
 * 
 *
 * static Eina_Value
 * _file_err(Eo *o EINA_UNUSED, void *data EINA_UNUSED, Eina_Error error)
 * 
 *    //In case the downloader is deleted before the future is resolved, the future will be canceled thus this callback will be called.
 *    fprintf(stderr, "Could not download the file. Reason: %s\n", eina_error_msg_get(error));
 *    return EINA_VALUE_EMPTY;
 * 
 *
 * static void
 * _downlader_free(Eo *o, void *data EINA_UNUSED, const Eina_Future *dead_future EINA_UNUSED)
 * 
 *    Ecore_Timer *t = efl_key_data_get(o, "timer");
 *    //The download finished before the timer expired. Cancel it...
 *    if (t)
 *    
 *      ecore_timer_del(t);
 *      efl_unref(o); //Delete the object
 *     //else - In this case the future was canceled due efl_unref() in _timeout - No need to call efl_unref()
 * 
 *
 * void download_file(const char *file)
 * 
 *   //This could be rewritten using eina_future_race()
 *   Eo *downloader = efl_add(MY_DOWNLOADER_CLASS, NULL);
 *   Eina_Future *f = downloader_download_file(downloader, file);
 *   timer = ecore_timer_add(30, _timeout, downloader);
 *   //Usually this would be done with an eina_future_race() of the download promise and a timeout promise,
 *   //however the following example is useful to illustrate efl_key_data_set() usage.
 *   efl_key_data_set(downloader, "timer", timer);
 *   efl_future_then(downloader, f, .success = _file_ok, .error = _file_err, .success_type = EINA_VALUE_TYPE_STRING, .free = downloader_free);
 * 
 * @endcode
 *
 * @param obj The object to create the link.
 * @param desc An Efl_Future_Cb_Desc
 * @return An Eina_Future_Desc to be used by eina_future_then(), eina_future_chain() and friends.
 * @see efl_future_chain_array()
 * @see efl_future_cb()
 * @see #Efl_Future_Cb_Desc
 * @see efl_key_data_set()
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_future_cb_from_desc(obj:PEo; desc:TEfl_Future_Cb_Desc):TEina_Future_Desc;cdecl;external;
{*
 * Syntax suger over efl_future_cb_from_desc()
 *
 * Usage:
 * @code
 * eina_future_then_from_desc(future, efl_future_cb(my_object, .succes = success, .success_type = EINA_VALUE_TYPE_INT));
 * @endcode
 *
 * @see efl_future_cb_from_desc()
 * @see efl_future_then()
  }
{*
 * Creates a Future chain based on #Efl_Future_Cb_Desc
 *
 * This function is an wrapper around efl_future_cb_from_desc() and eina_future_then_from_desc()
 *
 * For more information about these check the documentation.
 *
 *
 * @param obj An EO object to link to the future
 * @param prev The previous future
 * @param descs An array of Efl_Future_Cb_Desc
 * @return An Eina_Future or @c NULL on error.
 * @note If an error occurs the whole future chain will be CANCELED, causing
 * desc.error to be called passing `ENOMEM` or `EINVAL` and desc.free
 * to free the @p obj if necessary.
 *
 * @see efl_future_chain()
 * @see efl_future_cb()
 * @see eina_future_then_from_desc()
 * @see #Efl_Future_Cb_Desc
  }
(* Const before type ignored *)
function efl_future_chain_array(obj:PEo; prev:PEina_Future; descs:PEfl_Future_Cb_Desc):PEina_Future;cdecl;external;
{*
 * Syntax suger over efl_future_chain_array()
 *
 * Usage:
 * @code
 * Eina_Future *f = efl_future_chain(my_object, prev_future, , );
 * @endcode
 *
 * @see efl_future_chain_array()
  }
{*
 * @addtogroup Eo_Debug_Information Eo's Debug information helper.
 * @
  }
{*
 * @struct _Efl_Dbg_Info
 * The structure for the debug info used by Eo.
  }
{*< The name of the part (stringshare).  }
{*< The value.  }
type
  PEfl_Dbg_Info = ^TEfl_Dbg_Info;
  TEfl_Dbg_Info = record
      name : PEina_Stringshare;
      value : TEina_Value;
    end;
{*
 * @brief Get debug information from an object.
 *
 * @param[in] root_node the tree Node
  }

procedure efl_dbg_info_get(obj:PEo; root_node:PEfl_Dbg_Info);cdecl;external;
{*
 * @var EFL_DBG_INFO_TYPE
 * The Eina_Value_Type for the debug info.
  }
(* Const before type ignored *)
  var
    EFL_DBG_INFO_TYPE : PEina_Value_Type;cvar;external;
{*
 * Creates a list inside debug info list.
 * @param[in] list list where to append
 * @param[in] name name of the list
 * @return the new list
  }
{
static inline Efl_Dbg_Info *
EFL_DBG_INFO_LIST_APPEND(Efl_Dbg_Info *list, const char *name)

   Efl_Dbg_Info *tmp = (Efl_Dbg_Info *)calloc(1, sizeof(*tmp));

   if (!tmp) return NULL;
   tmp->name = eina_stringshare_add(name);
   eina_value_list_setup(&(tmp->value), EFL_DBG_INFO_TYPE);
   if (list)
     
        eina_value_list_pappend(&(list->value), tmp);
     
   return tmp;

 }
{*
 * @def EFL_DBG_INFO_APPEND
 * Creates a new debug info into a list
 * @param[in] LIST list where to append (Efl_Dbg_Info *)
 * @param[in] NAME name of the parameter (const char *)
 * @param[in] TYPE type of the parameter (Eina_Value_Type *)
 * @param[in] VALUE value of the parameter
  }
{*
 * Frees the Efl_Dbg_Info tree. (The whole tree recursively).
 * @param[in] info The tree to delete.
  }

procedure efl_dbg_info_free(info:PEfl_Dbg_Info);cdecl;external;
{*
 * @
  }
{*
 * @typedef Efl_Object_Op
 * The Eo operation type id.
  }
type
  PEfl_Object_Op = ^TEfl_Object_Op;
  TEfl_Object_Op = dword;
{*
 * @def EFL_NOOP
 * A special #Efl_Object_Op meaning "No operation".
  }

{ was #define dname def_expr }
function EFL_NOOP : TEfl_Object_Op;  

{*
 * @addtogroup Efl_Events Eo's Event Handling
 * @
  }
{*
 * @def EFL_EVENT_DESCRIPTION(name)
 * A helper macro to help populate #Efl_Event_Description
 * @param name The name of the event.
 * @see Efl_Event_Description
  }
{*
 * @
  }
{*
 * @addtogroup Efl_Class Efl Class
 * @
  }
{*
 * @def EFL_DEFINE_CLASS(class_get_func_name, class_desc, parent_class, ...)
 * A convenient macro to be used for creating the class_get function. This
 * macro is fairly simple and makes for better code.
 * @param class_get_func_name the name of the wanted class_get function name.
 * @param class_desc the class description.
 * @param parent_class The parent class for the function. See efl_class_new() for more information.
 * @param ... List of extensions. See efl_class_new() for more information.
 *
 * You must use this macro if you want thread safety in class creation.
  }
{*
 * An enum representing the possible types of an Eo class.
  }
{*< Regular class.  }
{*< Regular non instant-able class.  }
{*< Interface  }
{*< Mixin  }
type
  TEfl_Class_Type =  Longint;
  Const
    EFL_CLASS_TYPE_REGULAR = 0;
    EFL_CLASS_TYPE_REGULAR_NO_INSTANT = 1;
    EFL_CLASS_TYPE_INTERFACE = 2;
    EFL_CLASS_TYPE_MIXIN = 3;
    EFL_CLASS_TYPE_INVALID = 4;

{*
 * @typedef Efl_Class_Type
 * A convenience typedef for #_Efl_Class_Type.
  }
type
  PEfl_Class_Type = ^TEfl_Class_Type;
  TEfl_Class_Type = TEfl_Class_Type;
{*
 * @def EO_VERSION
 * The current version of EO.
  }

const
  EO_VERSION = 2;  
{*< The extern function offering this op. (The name of the func on windows)  }
{*< The static function to call for the op.  }
type
  PEfl_Op_Description = ^TEfl_Op_Description;
  TEfl_Op_Description = record
      api_func : pointer;
      func : pointer;
    end;
{*
 * @struct _Efl_Object_Ops
 *
 * This structure holds the ops and the size of the ops.
  }
(* Const before type ignored *)
{*< The op descriptions array of size count.  }
{*< Number of op descriptions.  }

  PEfl_Object_Ops = ^TEfl_Object_Ops;
  TEfl_Object_Ops = record
      descs : PEfl_Op_Description;
      count : Tsize_t;
    end;
{*
 * @struct _Efl_Class_Description
 * This structure holds the class description.
 * This description should be passed to efl_class_new.
  }
{*< The current version of eo, use #EO_VERSION  }
(* Const before type ignored *)
{*< The name of the class.  }
{*< The type of the class.  }
{*< The size of data (private + protected + public) this class needs per object.  }
{*< The initializer for the class  }
{*< The constructor of the class.  }
{*< The destructor of the class.  }
  PEfl_Class_Description = ^TEfl_Class_Description;
  TEfl_Class_Description = record
      version : dword;
      name : Pchar;
      _type : TEfl_Class_Type;
      data_size : Tsize_t;
      class_initializer : function (klass:PEfl_Class):TEina_Bool;cdecl;
      class_constructor : procedure (klass:PEfl_Class);cdecl;
      class_destructor : procedure (klass:PEfl_Class);cdecl;
    end;

{*
 * Setter type which is used to set an #Eina_Value, this function should access one particular property field
  }

  TEfl_Object_Property_Reflection_Setter = function (obj:PEo; value:TEina_Value):TEina_Error;cdecl;
{*
 * Getter type which is used to get an #Eina_Value, this function should access one particular property field
  }
(* Const before type ignored *)

  TEfl_Object_Property_Reflection_Getter = function (obj:PEo):TEina_Value;cdecl;
{*
 * @struct _Efl_Object_Property_Reflection
 *
 * This structure holds one line of the reflection table.
 * The two fields get and set might be NULL,
 * the property_name is a normal c string containing the name of the property
 * that the get and set function changes.
  }
(* Const before type ignored *)
{*< The name of the property  }
{*< The function used to set a generic #Eina_Value on this property of the object.  }
{*< The function used to retrieve a generic #Eina_Value from this property of the object.  }

  PEfl_Object_Property_Reflection = ^TEfl_Object_Property_Reflection;
  TEfl_Object_Property_Reflection = record
      property_name : Pchar;
      set : TEfl_Object_Property_Reflection_Setter;
      get : TEfl_Object_Property_Reflection_Getter;
    end;
{*
 * @struct _Efl_Object_Property_Reflection_Ops
 *
 * This structure holds the reflection table and the size of this table.
  }
(* Const before type ignored *)
{*< The reflection table.  }
{*< Number of table lines descriptions.  }

  PEfl_Object_Property_Reflection_Ops = ^TEfl_Object_Property_Reflection_Ops;
  TEfl_Object_Property_Reflection_Ops = record
      table : PEfl_Object_Property_Reflection;
      count : Tsize_t;
    end;
{*
 * @typedef Efl_Class_Description
 * A convenience typedef for #_Efl_Class_Description
  }
{*
 * @brief Create a new class.
 * @param desc the class description to create the class with.
 * @param parent the class to inherit from.
 * @param ... A NULL terminated list of extensions (interfaces, mixins and the classes of any composite objects).
 * @return The new class' handle on success or NULL otherwise.
 *
 * @note There are two types of extensions, mixins and none-mixins.
 *       Mixins are inheriting both the API AND the implementation.
 *       Non-mixins only inherit the API, so a class which inherits a non-mixin as an extension must implement the api.
 *
 * Use #EFL_DEFINE_CLASS. This will provide thread safety and other
 * features easily.
 *
 * @see #EFL_DEFINE_CLASS
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function efl_class_new(desc:PEfl_Class_Description; parent:PEfl_Class; args:array of const):PEfl_Class;cdecl;external;
function efl_class_new(desc:PEfl_Class_Description; parent:PEfl_Class):PEfl_Class;cdecl;external;
{*
 * @brief Set the functions of a class
 * @param klass_id the class whose functions we are setting.
 * @param object_ops The function structure we are setting for object functions
 * @param class_ops The function structure we are setting for class functions
 * @param reflection_table The reflection table to use within eo
 * @return True on success, False otherwise.
 *
 * This should only be called from within the initializer function.
 * The reflection_table contains a getter and setter per property name. Which are called when either
 * efl_property_reflection_set() or efl_property_reflection_get() is called.
 * @see #EFL_DEFINE_CLASS
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_class_functions_set(klass_id:PEfl_Class; object_ops:PEfl_Object_Ops; reflection_table:PEfl_Object_Property_Reflection_Ops):TEina_Bool;cdecl;external;
{*
 * @brief Override Eo functions of this object.
 * @param ops The op description to override with.
 * @return true on success, false otherwise.
 *
 * This lets you override all of the Eo functions of this object (this
 * one included) and replace them with ad-hoc implementation.
 * The contents of the array are copied so they can reside
 * on the stack for instance.
 *
 * You are only allowed to override functions that are defined in the
 * class or any of its interfaces (that is, efl_isa returning true).
 *
 * If @p ops is #NULL, this will revert the @p obj to its original class
 * without any function overrides.
 *
 * It is not possible to override a function table of an object when it's
 * already been overridden. Call efl_object_override(obj, NULL) first if you really
 * need to do that.
 *
 * @see EFL_OPS_DEFINE
  }
(* Const before type ignored *)
function efl_object_override(obj:PEo; ops:PEfl_Object_Ops):TEina_Bool;cdecl;external;
{*
 * @brief Define an array of override functions for @ref efl_object_override
 * @param ops A name for the Efl_Object_Ops local variable to define
 * @param ... A comma separated list of Efl_Object_Op overrides, using
 *            #EFL_OBJECT_OP_FUNC or #EFL_OBJECT_OP_CLASS_FUNC
 *
 * This can be used as follows:
 * @code
 * EFL_OPS_DEFINE(ops, EFL_OBJECT_OP_FUNC(public_func, _my_func));
 * efl_object_override(obj, &ops);
 * @endcode
 *
 * @see efl_object_override
  }
{*
 * @brief Check if an object "is a" klass.
 * @param obj The object to check
 * @param klass The klass to check against.
 * @return @c EINA_TRUE if obj implements klass or is an Efl_Class which inherits
 * from/implements klass, @c EINA_FALSE otherwise.
 *
 * Notice: This function does not support composite objects.
 * Note: that an Efl_Class is also an Efl_Object, so if you pass an Efl_Class
 * as obj, it will check if that class contain klass.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_isa(obj:PEo; klass:PEfl_Class):TEina_Bool;cdecl;external;
{*
 * @brief Gets the name of the passed class.
 * @param[in] klass The class (or object) to work on.
 * @return The class' name.
 *
 * @see efl_class_get()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_class_name_get(klass:PEfl_Class):Pchar;cdecl;external;
{*
 * @brief Gets the amount of memory this class object would use.
 * @param[in] klass The class (or object) to work on.
 * @return The amount of memory in Bytes.
 *
 * @see efl_class_get()
  }
(* Const before type ignored *)
function efl_class_memory_size_get(klass:PEfl_Class):Tsize_t;cdecl;external;
{*
 * @brief Gets a debug name for this object
 * @param obj_id The object (or class)
 * @return A name to use in logs and for other debugging purposes
 *
 * Note that subclasses can override Efl.Object "debug_name_override" to
 * provide more meaningful debug strings. The standard format includes the
 * class name, the object ID (this @p obj_id), the reference count and
 * optionally the object name (as defined by Efl.Object.name).
 *
 * This might return a temporary string, as created by eina_slstr, which means
 * that a main loop should probably be running.
 *
 * @since 1.21
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_debug_name_get(obj_id:PEo):Pchar;cdecl;external;
{*
 * @
  }
{*
 * @brief Init the eo subsystem
 * @return @c EINA_TRUE if eo is init, @c EINA_FALSE otherwise.
 *
 * @see eo_shutdown()
  }
function efl_object_init:TEina_Bool;cdecl;external;
{*
 * @brief Shutdown the eo subsystem
 * @return @c EINA_TRUE if eo is init, @c EINA_FALSE otherwise.
 *
 * @see efl_object_init()
  }
function efl_object_shutdown:TEina_Bool;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * The virtual allocation domain where an object lives
 *
 * You cannot mix objects between domains in the object tree or as direct
 * or indirect references unless you explicitly handle it and ensure the
 * other domain is adopted into your local thread space.
  }
{*< Invalid  }
{*< The main loop domain where eo_init() is called  }
{*< A special shared domain visible to all threads but with extra locking and unlocking costs to access  }
{*< The normal domain for threads so they can adopt the main loop domain at times  }
{ One more slot for future expansion here - maybe fine-grain locked objs  }
type
  PEfl_Id_Domain = ^TEfl_Id_Domain;
  TEfl_Id_Domain =  Longint;
  Const
    EFL_ID_DOMAIN_INVALID = -(1);
    EFL_ID_DOMAIN_MAIN = 0;
    EFL_ID_DOMAIN_SHARED = 1;
    EFL_ID_DOMAIN_THREAD = 2;
;
{*
 * @typedef Efl_Domain_Data
 * An opaque handle for private domain data
  }
type
{*
 * @brief Get the native domain for the current thread
 *
 * @return The native domain
 *
 * This will return the native eo object allocation domain for the current
 * thread. This can only be changed with efl_domain_switch() and can
 * only be called before any objects are created/allocated on the thread
 * where it's called. Calling it after this point will result in
 * undefined behavior, so be sure to call this immediaetly after a thread
 * begins to execute. You must not change the domain of the main thread.
 *
 * @see efl_domain_switch()
 * @see efl_domain_current_get()
 * @see efl_domain_current_set()
 * @see efl_domain_current_push()
 * @see efl_domain_current_pop()
 * @see efl_domain_data_get()
 * @see efl_domain_data_adopt()
 * @see efl_domain_data_return()
 * @see efl_compatible()
  }

function efl_domain_get:TEfl_Id_Domain;cdecl;external;
{*
 * @brief Switch the native domain for the current thread.
 * @param domain The domain to switch to
 * @return EINA_TRUE if the switch succeeds and EINA_FALSE if it fails.
 *
 * Permanently switch the native domain for new objects for the calling
 * thread. All objects created on this thread UNLESS it has switched to a
 * new domain temporarily with efl_domain_current_set(),
 * efl_domain_current_push() or efl_domain_current_pop(),
 * efl_domain_data_adopt() and efl_domain_data_return().
 *
 * @see efl_domain_get()
  }
function efl_domain_switch(domain:TEfl_Id_Domain):TEina_Bool;cdecl;external;
{*
 * @brief Get the current domain used for allocating new objects
 * @return The current domain
 *
 * Get the currently used domain that is at the top of the domain stack.
 * There is actually a stack of domans to use. You can alter this via
 * efl_domain_current_push() and efl_domain_current_pop(). This only gets
 * the domain for the current thread.
 *
 * @see efl_domain_get()
  }
function efl_domain_current_get:TEfl_Id_Domain;cdecl;external;
{*
 * @brief Set the current domain used for allocating new objects.
 * @return EINA_TRUE if it succeeds and EINA_FALSE on failure.
 *
 * Temporarily switch the current domain being used for allocation. There
 * is actually a stack of domans to use. You can alter this via
 * efl_domain_current_push() and efl_domain_current_pop(). The current
 * domain is the one on the top of the stack, so this entry is altered
 * without pushing or popping. This only applies to the calling thread.
 *
 * @see efl_domain_get()
  }
function efl_domain_current_set(domain:TEfl_Id_Domain):TEina_Bool;cdecl;external;
{*
 * @brief Push a new domain onto the domain stack.
 * @param domain The domain to push.
 * @return EINA_TRUE if it succeeds and EINA_FALSE on failure.
 *
 * This pushes a domain on the domain stack that can be popped later with
 * efl_domain_current_pop(). If the stack is full this may fail and return
 * EINA_FALSE. This applies only to the calling thread.
 *
 * @see efl_domain_get()
  }
function efl_domain_current_push(domain:TEfl_Id_Domain):TEina_Bool;cdecl;external;
{*
 * @brief Pop a previously pushed domain from the domain stack
 *
 * This pops the top domain off the domain stack for the calling thread
 * that was pushed with efl_domain_current_push().
 *
 * @see efl_domain_get()
  }
procedure efl_domain_current_pop;cdecl;external;
{*
 * @brief Get an opaque handle to the local native domain eoid data
 * @return A handle to the local native domain data or NULl on failure
 *
 * This gets a handle to the domain data for the current thread, intended
 * to be used by another thread to adopt with efl_domain_data_adopt().
 * Once you use efl_domain_data_adopt(), the thread which called
 * efl_domain_data_get() should suspend and not execute anything
 * related to eo or efl objects until the thread that adopted the data
 * calls efl_domain_data_return() to return the data to its owner and
 * stop making it available to that thread.
 *
 * @see efl_domain_get()
  }
function efl_domain_data_get:PEfl_Domain_Data;cdecl;external;
{*
 * @brief Adopt a single extra domain to be the current domain
 * @param datas_in The domain data to adopt
 * @return The domain that was adopted or EFL_ID_DOMAIN_INVALID on failure
 *
 * This will adopt the given domain data pointed to by @p data_in
 * as an extra domain locally. The adopted domain must have a domain ID
 * that is not the same as the current thread domain or local domain. You
 * may not adopt a domain that clashes with the current domain. If you
 * set, push or pop domains in such a way that these are the same then
 * undefined behaviour will occur.
 *
 * This will also push the adopted domain as the current domain so that
 * all newly created objects (unless their parent is of a differing domain)
 * will be part of this adopted domain. You can still access objects from
 * your local domain as well, but be aware that creation will require
 * some switch of domain by push, pop or set. Return the domain with
 * efl_domain_data_return() when done.
 *
 * @see efl_domain_get()
  }
function efl_domain_data_adopt(data_in:PEfl_Domain_Data):TEfl_Id_Domain;cdecl;external;
{*
 * @brief Return a domain to its original owning thread
 * @param domain The domain to return
 * @return EINA_TRUE on success EINA_FALSE on failure
 *
 * This returns the domain specified by @p domain to the thread it came
 * from, allowing said thread to continue execution afterwards. This
 * will implicitly pop the current domain from the stack, assuming that
 * the current domain is the same one pushed implicitly by
 * efl_domain_data_adopt(). You cannot return your own native local
 * domain, only the one that was adopted by efl_domain_data_adopt().
 *
 * @see efl_domain_get()
  }
function efl_domain_data_return(domain:TEfl_Id_Domain):TEina_Bool;cdecl;external;
{*
 * @brief Check if 2 objects are compatible
 * @param obj The basic object
 * @param obj_target The alternate object that may be referenced by @p obj
 * @return EINA_TRUE if compatible, EINA_FALSE if not
 *
 * This checks to see if 2 objects are compatible : whether they are parent or
 * children of each other, could reference each other etc. You only
 * need to call this if you have objects from multiple domains (an
 * adopted domain with efl_domain_data_adopt() or the shared domain
 * EFL_ID_DOMAIN_SHARED where objects may be accessed by any thread).
 *
 * @see efl_domain_get()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_compatible(obj:PEo; obj_target:PEo):TEina_Bool;cdecl;external;
{$endif}
{ to fetch internal function and object data at once }
{ for future use to avoid ABI issues }
{ for future use to avoid ABI issues }
{ for future use to avoid ABI issues }
{ for future use to avoid ABI issues }
type
  PEfl_Object_Op_Call_Data = ^TEfl_Object_Op_Call_Data;
  TEfl_Object_Op_Call_Data = record
      eo_id : PEo;
      obj : PEo_Object;
      func : pointer;
      data : pointer;
      extn1 : pointer;
      extn2 : pointer;
      extn3 : pointer;
      extn4 : pointer;
    end;
{ to pass the internal function call to EFL_FUNC_BODY (as Func parameter) }
{ returns the OP id corresponding to the given api_func }
{ EINA_DEPRECATED xxxxxxxxxxxxxxxxxxx }
(* Const before type ignored *)

function _efl_object_api_op_id_get(api_func:pointer):TEfl_Object_Op;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function _efl_object_op_api_id_get(api_func:pointer; obj:PEo; api_func_name:Pchar; file:Pchar; line:longint):TEfl_Object_Op;cdecl;external;
{ gets the real function pointer and the object data }
(* Const before type ignored *)
(* Const before type ignored *)
function _efl_object_call_resolve(obj:PEo; func_name:Pchar; call:PEfl_Object_Op_Call_Data; op:TEfl_Object_Op; file:Pchar; 
           line:longint):TEina_Bool;cdecl;external;
{ end of the eo call barrier, unref the obj }
procedure _efl_object_call_end(call:PEfl_Object_Op_Call_Data);cdecl;external;
{ end of the efl_add. Calls finalize among others }
function _efl_add_end(obj:PEo; is_ref:TEina_Bool; is_fallback:TEina_Bool):PEo;cdecl;external;
{*************************************************************************** }
{*
 * @brief Prepare a call to the parent class implementation of a function.
 *
 * @param obj        The object to call (can be a class).
 * @param cur_klass  The current class.
 * @return An EO handle which must be used as part of an EO function call.
 *
 * @warning The returned value must always be used as the first argument (the
 * object) of a method or property function call, and should never be handled
 * in any other way. Do not call any function from this file on the returned
 * value (eg. efl_ref, etc...).
 *
 * Usage:
 * @code
 * // Inside the implementation code for MY_CLASS
 * my_property_set(efl_super(obj, MY_CLASS), value);
 * @endcode
 *
 * A common usage pattern is to forward function calls to the parent function:
 * @code
 * EOLIAN static void
 * _my_class_my_property_set(Eo *obj, My_Class_Data *pd, int value)
 * 
 *   // Do some processing on this class data, or on the value
 *   if (value < 0) value = 0;
 *   pd->last_value = value;
 *   // Pass the call to the parent class
 *   my_property_set(efl_super(obj, MY_CLASS), value);
 *   // Do some more processing
 * 
 * @endcode
 *
 * @p cur_klass must be a valid class in the inheritance hierarchy of @p obj's
 * class. Invalid values will lead to undefined behaviour.
 *
 * @see efl_cast
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_super(obj:PEo; cur_klass:PEfl_Class):PEo;cdecl;external;
{*
 * @brief Prepare a call to cast to a parent class implementation of a function.
 *
 * @param obj        The object to call (can be a class).
 * @param cur_klass  The class to cast into.
 * @return An EO handle that must be used as part of an EO function call.
 *
 * @warning The returned value must always be used as the first argument (the
 * object) of a method or property function call and should never be handled
 * in any other way. Do not call any function from this file on the returned
 * value (eg. efl_ref, etc...).
 *
 * Usage:
 * @code
 * // Inside the implementation code for MY_CLASS
 * my_property_set(efl_cast(obj, SOME_OTHER_CLASS), value);
 * @endcode
 *
 * In the above example, @p obj is assumed to inherit from @c SOME_OTHER_CLASS
 * as either a mixin or direct class inheritance. If @c SOME_OTHER_CLASS
 * implements @c my_property.set then that implementation shall be called,
 * otherwise the call will be propagated to the parent implementation (if any).
 *
 * @p cur_klass must be a valid class in the inheritance hierarchy of @p obj's
 * class. Invalid values will lead to undefined behaviour.
 *
 * @see efl_cast
 *
 * @since 1.20
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_cast(obj:PEo; cur_klass:PEfl_Class):PEo;cdecl;external;
{*************************************************************************** }
{*
 * @brief Gets the class of the object.
 * @param obj The object to work on
 * @return The object's class.
 *
 * @see efl_class_name_get()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_class_get(obj:PEo):PEfl_Class;cdecl;external;
function _efl_added_get:PEo;cdecl;external;
{ Check if GCC compatible (both GCC and clang define this)  }
{$if defined(__GNUC__) && !defined(_EO_ADD_FALLBACK_FORCE)}

const
  efl_added = __efl_added;  
{*
 * @def efl_add
 * @brief Create a new object and add it to an existing parent object.
 *
 * The object returned by this function will always have 1 ref
 * (reference count) which belongs to its parent. Therefore, it is not safe
 * to use the returned object outside the constructor methods passed as
 * parameters. If you need to further manipulate the object, use #efl_add_ref
 * and remember to #efl_unref the object when done.
 *
 * If the object is created using this function, then it will
 * automatically be deleted when the parent object is.
 * There is no need to call efl_unref on the child. This is convenient
 * in C.
 *
 * If the object's class has a constructor, it is called.
 *
 * @param klass The class of the object to create.
 * @param parent The parent to set to the object (MUST not be @c NULL)
 * @param ... The ops to run.
 * @return An handle to the new object on success, NULL otherwise.
  }
{*
 * @def efl_new
 * @brief Create a new object
 *
 * The object returned by this function has 1 ref which belongs to the caller.
 * You need to manually remove the ref by calling #efl_unref when you are done
 * working with the object. The object will be destroyed when all other refs
 * obtained with #efl_ref have been returned with #efl_unref.
 *
 * If the object's class has a constructor, it is called.
 *
 * @param klass The class of the object to create.
 * @param ... The ops to run.
 * @return An handle to the new object on success, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function _efl_add_internal_start(file:Pchar; line:longint; klass_id:PEfl_Class; parent:PEo; ref:TEina_Bool; 
           is_fallback:TEina_Bool):PEo;cdecl;external;
{*
 * @typedef Efl_Substitute_Ctor_Cb
 * Callback to be called instead of the object constructor.
 *
 * Only intended for binding creators.
 *
 * @param data Additional data previously supplied by the user
 * @param obj_id The object being constructed.
 * @return The constructed object in case of success, NULL otherwise.
  }
type
  PEfl_Substitute_Ctor_Cb = ^TEfl_Substitute_Ctor_Cb;
  TEfl_Substitute_Ctor_Cb = function (data:pointer; obj_id:PEo):PEo;cdecl;
{*
 * @brief Just like _efl_add_internal_start() but with additional options
 *
 * Only intended for binding creators.
 *
 * @param file File name of the call site, used for debug logs.
 * @param line Line number of the call site,  used for debug logs.
 * @param klass_id Pointer for the class being instantiated.
 * @param ref Whether or not the object will have an additional reference if it has a parent.
 * @param parent Object parent, can be NULL.
 * @param is_fallback Whether or not the fallback @c efl_added behaviour is to be used.
 * @param substitute_ctor Optional callback to replace the call for efl_constructor(), if NULL efl_constructor() will be called normally.
 * @param sub_ctor_data Additional data to be passed to the @p substitute_ctor callback.
 * @return An handle to the new object on success, NULL otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function _efl_add_internal_start_bindings(file:Pchar; line:longint; klass_id:PEfl_Class; parent:PEo; ref:TEina_Bool; 
           is_fallback:TEina_Bool; substitute_ctor:TEfl_Substitute_Ctor_Cb; sub_ctor_data:pointer):PEo;cdecl;external;
{*
 * @brief Unrefs the object and reparents it to NULL.
 *
 * Because efl_del() unrefs and reparents to NULL, it doesn't really delete the
 * object.
 *
 * This method accepts a const object for convenience, so all objects can be
 * passed to it easily.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
procedure efl_del(obj:PEo);cdecl;external;
{*
 * @brief Set an override for a class
 *
 * This can be used to override a class with another class such that when @p klass is added
 * with efl_add(), an object of type @p override is returned.
 *
 * @param[in] klass The class to be overridden
 * @param[in] override The class to override with; must inherit from or implement @p klass
 * @return Return @c true if the override was successfully set
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_class_override_register(klass:PEfl_Class; override:PEfl_Class):TEina_Bool;cdecl;external;
{*
 * @brief Unset an override for a class
 *
 * This is used to unset a previously-set override on a given class. It will only succeed if
 * @p override is the currently-set override for @p klass.
 *
 * @param[in] klass The class to unset the override from
 * @param[in] override The class override to be removed
 * @return Return @c true if the override was successfully unset
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_class_override_unregister(klass:PEfl_Class; override:PEfl_Class):TEina_Bool;cdecl;external;
{*
 * @brief Get a pointer to the data of an object for a specific class.
 *
 * The data reference count is not incremented. The pointer must be used only
 * in the scope of the function and its callees.
 *
 * @param obj the object to work on.
 * @param klass the klass associated with the data.
 * @return a pointer to the data.
 *
 * @see efl_data_ref()
 * @see efl_data_unref()
 * @see efl_data_scope_safe_get()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_data_scope_get(obj:PEo; klass:PEfl_Class):pointer;cdecl;external;
{*
 * @brief Safely get a pointer to the data of an object for a specific class.
 *
 * This call runs a dynamic check and returns NULL if there is no valid data
 * to return.
 *
 * The data reference count is not incremented. The pointer must be used only
 * in the scope of the function and its callees. This function will return NULL
 * if there is no data for this class, or if this object is not an instance of
 * the given class. The function will return NULL if the data size is 0.
 * Note that objects of class A inheriting from another class C as an
 * interface (like: class A(B, C)  ) will have no data for class C. This
 * means that efl_isa(a, C) will return true but there is no data for C. This
 * function's behaviour is similar to efl_data_scope_get() when running in
 * debug mode (but this prints less error logs).
 *
 * @param obj the object to work on.
 * @param klass the klass associated with the data.
 * @return a pointer to the data or NULL in case of error or $obj was NULL.
 *
 * @see efl_data_scope_get()
 *
 * @since 1.20
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_data_scope_safe_get(obj:PEo; klass:PEfl_Class):pointer;cdecl;external;
{*
 * @def efl_data_xref(obj, klass, ref_obj)
 * Use this macro if you want to associate a referencer object.
 * Convenience macro around efl_data_xref_internal()
  }
{*
 * @brief Get a pointer to the data of an object for a specific class and
 * increment the data reference count.
 * @param obj the object to work on.
 * @param klass the klass associated with the data.
 * @param ref_obj the object that references the data.
 * @param file the call's filename.
 * @param line the call's line number.
 * @return a pointer to the data.
 *
 * @see efl_data_xunref_internal()
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_data_xref_internal(file:Pchar; line:longint; obj:PEo; klass:PEfl_Class; ref_obj:PEo):pointer;cdecl;external;
{*
 * @def efl_data_xunref(obj, data, ref_obj)
 * Use this function if you used efl_data_xref to reference the data.
 * Convenience macro around efl_data_xunref_internal().
 * @see efl_data_xref()
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_data_xunref(obj,data,ref_obj : longint) : longint;

{*
 * @def efl_data_unref(obj, data)
 * Use this function if you used efl_data_ref to reference the data.
 * Convenience macro around efl_data_unref_internal().
 * @see efl_data_ref()
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_data_unref(obj,data : longint) : longint;

{*
 * @brief Decrement the object data reference count by 1.
 * @param obj the object to work on.
 * @param data a pointer to the data to unreference.
 * @param file the call's filename.
 * @param line the call's line number.
 *
 * @see efl_data_xref_internal()
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_data_xunref_internal(obj:PEo; data:pointer; ref_obj:PEo);cdecl;external;
{*
 * @brief Increment the object's reference count by 1.
 * @param obj the object to work on.
 * @return The object passed.
 *
 * It's very easy to get a refcount leak and start leaking memory because
 * of a forgotten unref or an extra ref. Both efl_xref
 * and efl_xunref that make debugging easier in these situations.
 * These functions should only be used on a small scale i.e at the
 * start of some section in which an object may be freed unless you really
 * know what you are doing.
 *
 * @see efl_unref()
 * @see efl_ref_count()
  }
(* Const before type ignored *)
function efl_ref(obj:PEo):PEo;cdecl;external;
{*
 * @brief Decrement the object's reference count by 1 and free it if needed.
 * @param obj the object to work on.
 *
 * @see efl_ref()
 * @see efl_ref_count()
  }
(* Const before type ignored *)
procedure efl_unref(obj:PEo);cdecl;external;
{*
 * @brief Return the ref count of the object passed.
 * @param obj the object to work on.
 * @return the ref count of the object.
 *
 * @see efl_ref()
 * @see efl_unref()
  }
(* Const before type ignored *)
function efl_ref_count(obj:PEo):longint;cdecl;external;
{*
 * @brief Set a deletion interceptor function.
 * @param obj The object to set the interceptor on.
 * @param del_intercept_func The interceptor function to call.
 *
 * This sets the function @p del_intercept_func to be called when an object
 * is about to go from a reference count of 1 to 0, thus triggering actual
 * destruction of the object. Instead of going to a reference count of 0 and
 * being destroyed, the object will stay alive with a reference count of 1
 * and this intercept function will be called instead.
 * The interceptor function handles any further deletion of of the object
 * from here.
 *
 * Note that by default objects have no interceptor function set and thus
 * will be destroyed as normal. To return an object to this state, simply
 * set the @p del_intercept_func to NULL which is the default.
 *
 * A good use for this feature is to ensure an object is destroyed by its
 * owning main loop and not in a foreign loop. This makes it possible to
 * safely unrefor delete objects from any loop as an interceptor can be set
 * on an object that will abort destruction and instead queue the object
 * on its owning loop to be destroyed at some time in the future and now
 * set the intercept function to NULL so it is not called again on the next
 * "real deletion".
 *
 * @see efl_del_intercept_get()
 * @see efl_unref()
 * @see efl_del()
  }
procedure efl_del_intercept_set(obj:PEo; del_intercept_func:TEfl_Del_Intercept);cdecl;external;
{*
 * @brief Get the deletion interceptor function
 * @param obj The object to get the interceptor of
 * @return The intercept function or NULL if none is set.
 *
 * This returns the interceptor function set by efl_del_intercept_set(). Note
 * that objects by default have no interceptor (NULL) set but certain
 * classes may set one up in a constructor. Make sure that
 * the interceptor function knows if this has happened.
 * If you want to override the interceptor be sure to call it after your
 * own interceptor function has finished. It's generally be a bad idea
 * to override these functions however.
 *
 * @see efl_del_intercept_set()
  }
(* Const before type ignored *)
function efl_del_intercept_get(obj:PEo):TEfl_Del_Intercept;cdecl;external;
{*
 * @brief Clears the object so it can be reused (for example in a cache).
 * @param obj The object to mark for reusal.
 *
 * This assumes the destructor has been called on the object so it
 * should probably only be used from the del intercept.
 *
 * @see efl_del_intercept_set()
  }
(* Const before type ignored *)
procedure efl_reuse(obj:PEo);cdecl;external;
{*
 * @def efl_xref(obj, ref_obj)
 * Convenience macro around efl_xref_internal()
 * @see efl_xref()
  }
{*
 * @brief Increment the object's reference count by 1 (and associate the ref with ref_obj).
 * @param obj the object to work on.
 * @param ref_obj the object that references obj.
 * @param file the call's filename.
 * @param line the call's line number.
 * @return The object passed (obj)
 *
 * Do not use this function, use #efl_xref instead.
 * A compile flag may make it and eobj_xunref() behave the same as eobj_ref()
 * and eobj_unref() respectively. This should be used wherever possible.
 *
 * @see efl_xunref()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_xref_internal(file:Pchar; line:longint; obj:PEo; ref_obj:PEo):PEo;cdecl;external;
{*
 * @brief Decrement the object's reference count by 1 and free it if needed. Will free the ref associated with ref_obj).
 * @param obj the object to work on.
 * @param ref_obj the object that references obj.
 *
 * This function only enforces the checks for object association. Don't rely
 * on it. If such enforces are compiled out this function behaves the same as
 * efl_unref().
 *
 * @see efl_xref_internal()
  }
(* Const before type ignored *)
procedure efl_xunref(obj:PEo; ref_obj:PEo);cdecl;external;
{*
 * @brief Add a new weak reference to obj.
 *
 * This function registers the object handle pointed by wref to obj so when obj
 * is deleted, it'll be updated to NULL. The function should be used when you
 * want to keep track of an object in a safe way but you don't want to prevent
 * it from being freed.
 *
 * @param[in] wref The weak ref
  }
procedure efl_wref_add(obj:PEo; wref:PPEfl_Object);cdecl;external;
{*
 * @brief Delete the weak reference passed.
 *
 * This function will set *wref to NULL after its execution.
 *
 * @param[in] wref The weak ref
  }
procedure efl_wref_del(obj:PEo; wref:PPEfl_Object);cdecl;external;
{*
 * @brief Generic data with string key on an object.
 *
 * The user is in charge of freeing the data.
 *
 * @param[in] key The key associated with the data
 * @param[in] data The data to set
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_key_data_set(obj:PEo; key:Pchar; data:pointer);cdecl;external;
{*
 * @brief Generic data with string key on an object.
 *
 * The user is in charge of freeing the data.
 *
 * @param[in] key The key associated with the data
 *
 * @return The data to set
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_key_data_get(obj:PEo; key:Pchar):pointer;cdecl;external;
{*
 * @brief Generic object reference with string key to object.
 *
 * The object will be automatically ref'd when set and unref'd when replaced or
 * deleted or when the referring object is deleted. If the referenced object
 * is deleted, then the key is deleted automatically.
 *
 * This is the same key store used by key_data and key_value. Keys are shared
 * and can store only one thing.
 *
 * @param[in] key The key associated with the object ref
 * @param[in] objdata The object to set
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_key_ref_set(obj:PEo; key:Pchar; objdata:PEfl_Object);cdecl;external;
{*
 * @brief Generic object reference with string key to object.
 *
 * The object will be automatically ref'd when set and unref'd when replaced or
 * deleted or when the referring object is deleted. If the referenced object is
 * deleted then the key is deleted automatically.
 *
 * This is the same key store used by key_data and key_value. Keys are shared
 * and can store only one thing.
 *
 * @param[in] key The key associated with the object ref
 *
 * @return The object to set
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_key_ref_get(obj:PEo; key:Pchar):PEfl_Object;cdecl;external;
{*
 * @brief Generic weak object reference with string key to object.
 *
 * The object key will be removed if the object is removed, but will not take
 * or removed references like key_obj.
 *
 * This is the same key store used by key_data and key_value. Keys are shared
 * and can store only one thing.
 *
 * @param[in] key The key associated with the object ref
 * @param[in] objdata The object to set
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_key_wref_set(obj:PEo; key:Pchar; objdata:PEfl_Object);cdecl;external;
{*
 * @brief Generic weak object reference with string key to object.
 *
 * The object key will be removed if the object is removed, but will not take
 * or removed references like key_obj.
 *
 * This is the same key store used by key_data and key_value. Keys are shared
 * and can store only one thing
 *
 * @param[in] key The key associated with the object ref
 *
 * @return The object to set
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_key_wref_get(obj:PEo; key:Pchar):PEfl_Object;cdecl;external;
{*
 * @brief Value on with string key on the object.
 *
 * This stores the value with the given string key on the object and it will be
 * freed when replaced or deleted, or when the referring object is deleted.
 *
 * This is the same key store used by key_data and key_obj. Keys are shared
 * and can store only one thing.
 *
 * @param[in] key The key associated with the value
 * @param[in] value The value to set
  }
(* Const before type ignored *)
procedure efl_key_value_set(obj:PEo; key:Pchar; value:PEina_Value);cdecl;external;
{*
 * @brief Value on with string key on the object.
 *
 * This stores the value with the given string key on the object and it will be
 * freed when replaced or deleted, or when the referring object is deleted.
 *
 * This is the same key store used by key_data and key_obj. Keys are shared
 * and can store only one thing.
 *
 * @param[in] key The key associated with the value
 *
 * @return The value to set
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_key_value_get(obj:PEo; key:Pchar):PEina_Value;cdecl;external;
{*
 * @brief Enable or disable the manual free feature.
 * @param obj the object to work on.
 * @param manual_free indicates if the free is manual (EINA_TRUE) or automatic (EINA_FALSE).
 *
 * The developer is in charge of calling the function efl_manual_free to free the memory
 * allocated for this object.
 *
 * Do not use this unless you really know what you are doing. It's used by Evas
 * because evas wants to keep its private data available even after the object
 * is deleted. Setting this to true makes Eo destroy the object but doesn't free
 * the private data nor the object itself.
 *
 * @see efl_manual_free()
  }
procedure efl_manual_free_set(obj:PEo; manual_free:TEina_Bool);cdecl;external;
{*
 * @brief Frees the object.
 * @param obj the object to work on.
 * This function must be called by the developer if the function
 * efl_manual_free_set has been called beforehand with the parameter EINA_TRUE.
 * An error will display if this function is called when the manual
 * free option is not set to EINA_TRUE or the number of refs is not 0.
 * @return EINA_TRUE if successfully freed. EINA_FALSE otherwise.
 *
 * @see efl_manual_free_set()
  }
function efl_manual_free(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Checks if the object was already descructed (only relevant for manual_free objects).
 * @param obj the object to check.
 * This function checks if the object was already destructed (but not alraedy
 * freed). It should only be used with objects that are supposed to be manually
 * freed but are not yet free such as those which have been destroyed.
 *
 * @see efl_manual_free_set()
  }
(* Const before type ignored *)
function efl_destructed_is(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Set the given #Eina_Value to the property with the specified \c property_name.
 * @param obj The object to set the property on
 * @param property_name The name of the property to modify.
 * @param value The value to set, the value passed here will be flushed by the function
 *
 * @see efl_property_reflection_get() and efl_property_reflection_exist()
  }
(* Const before type ignored *)
function efl_property_reflection_set(obj:PEo; property_name:Pchar; value:TEina_Value):TEina_Error;cdecl;external;
{*
 * @brief Retrieve an #Eina_Value containing the current value of the property specified with \c property_name.
 * @param obj The object to set the property on
 * @param property_name The name of the property to get.
 *
 * @return The value that got returned by the actual property in form of a generic Eina_Value. The user of this API is owning the returned Value.
 *
 * @see efl_property_reflection_set() and efl_property_reflection_exist()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_property_reflection_get(obj:PEo; property_name:Pchar):TEina_Value;cdecl;external;
{*
 * @brief Check if a property exist for reflection.
 * @param obj The object to inspect.
 * @param property_name The name of the property to check if it exist.
 *
 * @return EINA_TRUE if the property exist, EINA_FALSE otherwise.
 *
 * @see efl_property_reflection_set() and efl_property_reflection_get()
  }
(* Const before type ignored *)
function efl_property_reflection_exist(obj:PEo; property_name:Pchar):TEina_Bool;cdecl;external;
{*
 * @addtogroup Efl_Class_Class Eo's Class class.
 * @
  }
{$include "efl_class.eo.h"}
{*
 * @brief Get the type of this class.
 * @param klass The Efl_Class to get the type from.
 *
 * @return The type of this class or INVALID if the klass parameter was invalid.
  }
(* Const before type ignored *)

function efl_class_type_get(klass:PEfl_Class):TEfl_Class_Type;cdecl;external;
{*
 * @
  }
{*
 * @addtogroup Efl_Class_Base Eo's Base class.
 * @
  }
{*
 * @typedef efl_key_data_free_func
 * Data free func prototype.
 * XXX: DO NOT USE, only here for legacy.
  }
type

  Tefl_key_data_free_func = procedure (para1:pointer);cdecl;
{*
 * @def efl_weak_ref
 * @brief Reference a pointer to an Eo object
 * @param wref the pointer to use for the weak ref
 *
 * @see efl_weak_unref
 * @see efl_wref_add
  }
{*
 * @def efl_wref_del_safe
 * @brief Delete the weak reference passed.
 * @param wref the weak reference to free.
 *
 * @see #efl_wref_del
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function efl_wref_del_safe(wref : longint) : longint;

{*
 * @
  }
{*
 * @addtogroup Efl_Events Eo's Event Handling
 * @
  }
{*
 * Helper for sorting callbacks array. Automatically used by
 * @ref EFL_CALLBACKS_ARRAY_DEFINE
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_callbacks_cmp(a:PEfl_Callback_Array_Item; b:PEfl_Callback_Array_Item):longint;cdecl;external;
{*
 * Helper for creating global callback arrays.
 * Problems occur here in windows where you can't declare a static array with
 * external symbols in them. These addresses are only known at runtime.
 * This also allows for automatic sorting for better performance.
  }
{*
 * @def efl_event_callback_add(obj, desc, cb, data)
 * Add a callback for an event.
 * @param[in] desc An #Efl_Event_Description of the event to listen to.
 * @param[in] cb the callback to call.
 * @param[in] data additional data to pass to the callback.
 *
 * Callbacks of the same priority are called in reverse order of creation.
 *
 * @see efl_event_callback_priority_add()
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_event_callback_add(obj,desc,cb,data : longint) : longint;

{*
 * @def efl_event_callback_array_add(obj, desc, cb, data)
 * Add an array of callbacks for an event.
 *
 * @param[in] obj The object.
 * @param[in] array an #Efl_Callback_Array_Item of events to listen to.
 * @param[in] data additional data to pass to the callback.
 *
 * Callbacks of the same priority are called in reverse order of creation.
 * The array should have been created by @ref EFL_CALLBACKS_ARRAY_DEFINE. If
 * this isn't the case, be careful of portability issues and make sure that
 * it is properly sorted with @ref efl_callbacks_cmp.
 *
 * @see efl_event_callback_array_priority_add()
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_event_callback_array_add(obj,array,data : longint) : longint;

{*
 * @def efl_event_callback_forwarder_add(obj, desc, new_obj)
 * @brief Add an event callback forwarder for an event and an object.
 *
 * @param[in] obj The object.
 * @param[in] desc An #Efl_Event_Description of the event to forward to.
 * @param[in] new_obj The object to emit events from
 *
 * @ingroup Efl_Object
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_event_callback_forwarder_add(obj,desc,new_obj : longint) : longint;

{*
 * @brief Count the number of event handler registered for a specific event.
 *
 * @param[in] obj The object.
 * @param[in] desc The specific event.
 * @return The number of handler registered for this specific events.
 *
 * @ingroup Efl_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_event_callback_count(obj:PEo; desc:PEfl_Event_Description):dword;cdecl;external;
{*
 * @brief Replace the previous Eo pointer with new content.
 *
 * @param storage Pointer to the space holding the object to be replaced.
 * It can not be @c NULL.
 * @param new_obj The new object. It may be @c NULL.
 * @return @c true if objects were different and thus replaced, @c false
 * if nothing happened, i.e. either the objects were the same or a @c NULL
 * pointer was wrongly given as @a storage.
 *
 * The object pointed by @c *storage must be previously an Eo or
 * @c NULL; if it is an Eo then it will be efl_unref(). The @a new_obj
 * will be passed to efl_ref() if not @c NULL, and then assigned to @c *storage.
 *
 * @note The return is NOT a success/error flag, it just signalizes if
 * the value has changed.
 * @see efl_ref()
 * @see efl_unref()
  }
{
static inline Eina_Bool
efl_replace(Eo **storage, const Eo *new_obj)

   Eo *tmp = NULL;

   EINA_SAFETY_ON_NULL_RETURN_VAL(storage, EINA_FALSE);
   if (*storage == new_obj) return EINA_FALSE;
   if (new_obj) tmp = efl_ref(new_obj);
   if (*storage) efl_unref(*storage);
   *storage = tmp;
   return EINA_TRUE;

 }
(* Const before type ignored *)
  var
    EINA_VALUE_TYPE_OBJECT : PEina_Value_Type;cvar;external;
{*
 * @brief Create a new #Eina_Value containing the passed parameter.
 * @param obj The object to use
 * @return The #Eina_Value
 * @see eina_value_object_get(), eina_value_object_init()
 * @since 1.21
  }
{
static inline Eina_Value *
eina_value_object_new(Eo *obj)

   Eina_Value *v;

   v = eina_value_new(EINA_VALUE_TYPE_OBJECT);
   if (v) eina_value_set(v, obj);
   return v;


static inline Eina_Value
eina_value_object_init(Eo *obj)

   Eina_Value v = EINA_VALUE_EMPTY;

   if (eina_value_setup(&v, EINA_VALUE_TYPE_OBJECT))
     eina_value_set(&v, obj);
   return v;


static inline Eo *
eina_value_object_get(const Eina_Value *v)

   Eo *r = NULL;

   if (!v) return NULL;
   if (eina_value_type_get(v) != EINA_VALUE_TYPE_OBJECT)
     return NULL;

   if (!eina_value_pget(v, &r)) return NULL;
   return r;

 }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Get if the object is in its main lifetime.
 * @param obj the object to check
 * @return true if the object is finalized, but not invalidating nor invalidated.
 * @since 1.22
  }
{
static inline Eina_Bool
efl_alive_get(const Eo *obj)

  return efl_finalized_get(obj) && !efl_invalidating_get(obj) && !efl_invalidated_get(obj);

 }
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief Event triggered when a callback was added to the object
  }

{ was #define dname def_expr }
function EFL_EVENT_CALLBACK_ADD : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_CALLBACK_ADD : TEfl_Event_Description;cvar;external;
{*
 * @brief Event triggered when a callback was removed from the object
  }

{ was #define dname def_expr }
function EFL_EVENT_CALLBACK_DEL : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_CALLBACK_DEL : TEfl_Event_Description;cvar;external;
{*
 * @
  }
{*
 * @addtogroup Eo_Iterators Eo iterators
 * @
  }
{*
 * @brief Get an iterator on the Eo classes.
 *
 * You can use this function to go over the Eo classes.
 *
 * @return an iterator on success, NULL otherwise
  }

function eo_classes_iterator_new:PEina_Iterator;cdecl;external;
{*
 * @brief Get an iterator on the Eo objects
 *
 * You can use this function to go over the Eo objects.
 *
 * @return an iterator on success, NULL otherwise
  }
function eo_objects_iterator_new:PEina_Iterator;cdecl;external;
{*
 * @brief Check if a object can be owned
 *
 * This API checks if the passed object has at least one free reference that is not taken by the parent relation.
 * If this is not the case, a ERR will be printed.
 *
 * @return EINA_TRUE if the object is ownable. EINA_FALSE if not.
  }
(* Const before type ignored *)
function efl_ownable_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @
  }
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NOOP : TEfl_Object_Op;
  begin
    EFL_NOOP:=TEfl_Object_Op(0);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_data_xunref(obj,data,ref_obj : longint) : longint;
begin
  efl_data_xunref:=efl_data_xunref_internal(obj,data,ref_obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_data_unref(obj,data : longint) : longint;
begin
  efl_data_unref:=efl_data_xunref_internal(obj,data,obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_wref_del_safe(wref : longint) : longint;
begin
  efl_wref_del_safe:=efl_weak_unref(wref);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_event_callback_add(obj,desc,cb,data : longint) : longint;
begin
  efl_event_callback_add:=efl_event_callback_priority_add(obj,desc,EFL_CALLBACK_PRIORITY_DEFAULT,cb,data);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_event_callback_array_add(obj,array,data : longint) : longint;
begin
  efl_event_callback_array_add:=efl_event_callback_array_priority_add(obj,array,EFL_CALLBACK_PRIORITY_DEFAULT,data);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function efl_event_callback_forwarder_add(obj,desc,new_obj : longint) : longint;
begin
  efl_event_callback_forwarder_add:=efl_event_callback_forwarder_priority_add(obj,desc,EFL_CALLBACK_PRIORITY_DEFAULT,new_obj);
end;

{ was #define dname def_expr }
function EFL_EVENT_CALLBACK_ADD : longint; { return type might be wrong }
  begin
    EFL_EVENT_CALLBACK_ADD:=@(_EFL_EVENT_CALLBACK_ADD);
  end;

{ was #define dname def_expr }
function EFL_EVENT_CALLBACK_DEL : longint; { return type might be wrong }
  begin
    EFL_EVENT_CALLBACK_DEL:=@(_EFL_EVENT_CALLBACK_DEL);
  end;


end.
