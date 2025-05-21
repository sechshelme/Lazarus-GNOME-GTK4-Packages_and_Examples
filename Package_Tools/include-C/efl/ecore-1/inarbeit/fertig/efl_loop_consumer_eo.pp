
unit efl_loop_consumer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_loop_consumer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_loop_consumer_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Loop  = ^Efl_Loop;
PEfl_Loop_Consumer  = ^Efl_Loop_Consumer;
PEina_Future  = ^Eina_Future;
PEina_Promise  = ^Eina_Promise;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LOOP_CONSUMER_EO_H_}
{$define _EFL_LOOP_CONSUMER_EO_H_}
{$ifndef _EFL_LOOP_CONSUMER_EO_CLASS_TYPE}
{$define _EFL_LOOP_CONSUMER_EO_CLASS_TYPE}
type
  PEfl_Loop_Consumer = ^TEfl_Loop_Consumer;
  TEfl_Loop_Consumer = TEo;
{$endif}
{$ifndef _EFL_LOOP_CONSUMER_EO_TYPES}
{$define _EFL_LOOP_CONSUMER_EO_TYPES}
{$endif}
{* An @ref Efl_Loop_Consumer is a class which requires one of the parents to
 * provide an @ref Efl_Loop interface when performing @ref efl_provider_find.
 * It will enforce this by only allowing parents which provide such an
 * interface or @c NULL.
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Consumer
  }

{ was #define dname def_expr }
function EFL_LOOP_CONSUMER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_loop_consumer_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Handle of the loop this object belongs to.
 *
 * @param[in] obj The object.
 *
 * @return Efl loop.
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Consumer
  }
(* Const before type ignored *)
function efl_loop_get(obj:PEo):PEfl_Loop;cdecl;external;
{*
 * @brief Creates a new future that is already resolved to a value.
 *
 * This function creates a new future with an already known value, that will be
 * resolved and dispatched by the loop scheduler as usual.
 *
 * This is a helper that behaves the same as eina_future_resolved.
 *
 * @param[in] obj The object.
 * @param[in] result The value to be delivered.
 *
 * @return The future or @c NULL on error.
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Consumer
  }
(* Const before type ignored *)
function efl_loop_future_resolved(obj:PEo; result:TEina_Value):PEina_Future;cdecl;external;
{*
 * @brief Creates a new future that is already rejected to a specified error
 * using the @ref efl_loop_get.
 *
 * This function creates a new future with an already known error, that will be
 * resolved and dispatched by the loop scheduler as usual.
 *
 * This is a helper that behaves the same as @ref eina_future_rejected.
 *
 * @param[in] obj The object.
 * @param[in] error An Eina_Error value
 *
 * @return The future or @c NULL on error.
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Consumer
  }
(* Const before type ignored *)
function efl_loop_future_rejected(obj:PEo; error:TEina_Error):PEina_Future;cdecl;external;
{*
 * @brief Create a new promise with the scheduler coming from the loop provided
 * by this object.
 *
 * @note You should not use eina_promise_data_set as this function rely on
 * controlling the promise data.
 *
 * @param[in] obj The object.
 *
 * @return The new promise.
 *
 * @since 1.22
 *
 * @ingroup Efl_Loop_Consumer
  }
(* Const before type ignored *)
function efl_loop_promise_new(obj:PEo):PEina_Promise;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_LOOP_CONSUMER_CLASS : longint; { return type might be wrong }
  begin
    EFL_LOOP_CONSUMER_CLASS:=efl_loop_consumer_class_get;
  end;


end.
