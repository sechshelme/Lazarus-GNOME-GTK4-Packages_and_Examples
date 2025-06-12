
unit Eolian_Aux;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eolian_Aux.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eolian_Aux.h
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
PEina_Hash  = ^Eina_Hash;
PEina_List  = ^Eina_List;
PEolian_Class  = ^Eolian_Class;
PEolian_Documentation  = ^Eolian_Documentation;
PEolian_Function  = ^Eolian_Function;
PEolian_Implement  = ^Eolian_Implement;
PEolian_State  = ^Eolian_State;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EOLIAN_AUX_H}
{$define EOLIAN_AUX_H}
{$include <Eolian.h>}
{ C++ extern C conditionnal removed }
{*
 * @page eolian_aux_main Eolian Auxiliary Library (BETA)
 *
 * @date 2018 (created)
 *
 * @section eolian_aux_toc Table of Contents
 *
 * @li @ref eolian_aux_main_intro
 *
 * @section eolian_aux_main_intro Introduction
 *
 * This is the Eolian auxiliary library, providing API to support generators
 * and other utilities which do not fit into the primary Eolian library. All
 * these APIs are built on top of the core Eolian APIs.
 *
 * Recommended reading:
 *
 * @li @ref Eolian
 *
 * @addtogroup Eolian
 * @
  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Build reverse children hierarchy of an Eolian state.
 *
 * The point of this is basically to figure out reverse inheritance. The
 * keys of the returned hash will be class pointers and the values will
 * be lists. If classes A and B both inherit from C, they will be in C's
 * list after lookup.
 *
 * You are responsible for freeing this hash using standard eina_hash_free().
 *
 * @param[in] state the Eolian state.
 * @return a hash containing the hierarchy.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)

function eolian_aux_state_class_children_find(state:PEolian_State):PEina_Hash;cdecl;external;
{*
 * @brief Get all APIs that are usable on the class.
 *
 * The @p funcs parameter will contain the functions, while @p events will
 * contain events. The initial items in the lists will be the funcs and
 * events defined by the class itself, followed by those defined in the
 * classes it inherits from.
 *
 * Funcs will contain implement pointers, events will contain event pointers.
 *
 * The @p ownfuncs param defines how many of the list's items are the classes'
 * own API. Same happens with @p ownevs for events.
 *
 * You are responsible for freeing the returned lists but not their contents.
 * If you want to skip either of the lists, pass NULL.
 *
 * @param[in] klass the class.
 * @param[out] funcs the functions list reference, NULL if not used.
 * @param[out] events the event list reference, NULL if not used.
 * @param[out] ownfuncs the number of own functions, NULL if not used.
 * @param[out] ownevs the number of own events, NULL if not used.
 * @return the total number of items written into either list.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_aux_class_callables_get(klass:PEolian_Class; funcs:PPEina_List; events:PPEina_List; ownfuncs:Psize_t; ownevs:Psize_t):Tsize_t;cdecl;external;
{*
 * @brief Get all implementations of a function in a state.
 *
 * Given a function and a children hierarchy from
 * eolian_aux_state_class_children_find(), this will func
 * all implementations of that function in the system. This
 * is useful for various utilities. You need to free the list
 * but not the contents.
 *
 * @param[in] func the function.
 * @param[in] class_children the children hierarchy.
 * @return a list of implementations.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
function eolian_aux_function_all_implements_get(func:PEolian_Function; class_children:PEina_Hash):PEina_List;cdecl;external;
{*
 * @brief Get previous implementation in the inheritance hierarchy.
 *
 * This performs a depth-first search in the hierarchy, starting with the
 * specific given implementation. Once it is found, this parent implementation
 * is returned.
 *
 * @param[in] impl the implementation.
 * @return the parent implementation.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_aux_implement_parent_get(impl:PEolian_Implement):PEolian_Implement;cdecl;external;
{*
 * @brief Get documentation for an implementation.
 *
 * This first checks if the implementation has documentation for the given
 * type. If so, it is returned; if not, parent implementations as specified
 * in eolian_aux_implement_parent_get() are searched and the first one to
 * have the documentation is used.
 *
 * @param[in] impl the implementation.
 * @param[in] ftype the function type (method, property, getter, setter).
 * @return the documentation or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_aux_implement_documentation_get(impl:PEolian_Implement; ftype:TEolian_Function_Type):PEolian_Documentation;cdecl;external;
{*
 * @brief Get documentation fallback for an implementation.
 *
 * This is used when the implement does not have a "common" documentation
 * block. If the given implement is a getter and not a setter, this returns
 * the getter's documentation. If it's a setter but not a getter, it returns
 * the setter documentation. Otherwise, it returns NULL.
 *
 * @param[in] impl the implementation.
 * @return the documentation or NULL.
 *
 * @ingroup Eolian
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eolian_aux_implement_documentation_fallback_get(impl:PEolian_Implement):PEolian_Documentation;cdecl;external;
{$endif}
{*
 * @
  }
{$endif}

implementation


end.
