
unit efl_observable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_observable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_observable_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Observable  = ^Efl_Observable;
PEfl_Observable_Tuple  = ^Efl_Observable_Tuple;
PEfl_Observer  = ^Efl_Observer;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_OBSERVABLE_EO_H_}
{$define _EFL_OBSERVABLE_EO_H_}
{$ifndef _EFL_OBSERVABLE_EO_CLASS_TYPE}
{$define _EFL_OBSERVABLE_EO_CLASS_TYPE}
type
  PEfl_Observable = ^TEfl_Observable;
  TEfl_Observable = TEo;
{$endif}
{$ifndef _EFL_OBSERVABLE_EO_TYPES}
{$define _EFL_OBSERVABLE_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* This type describes an observable touple
 *
 * @ingroup Efl_Observable_Tuple
  }
(* Const before type ignored *)
{*< Touple key  }
{*< Touple data  }
type
  PEfl_Observable_Tuple = ^TEfl_Observable_Tuple;
  TEfl_Observable_Tuple = record
      key : Pchar;
      data : PEina_Iterator;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl observable class
 *
 * @ingroup Efl_Observable
  }

{ was #define dname def_expr }
function EFL_OBSERVABLE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_observable_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Add an observer to a group of observers.
 *
 * @note Observers that observe this observable are grouped by the @c key and
 * an observer can belong to multiple groups at the same time.
 *
 * @param[in] obj The object.
 * @param[in] key A key to classify observer groups
 * @param[in] obs An observer object
 *
 * @ingroup Efl_Observable
  }
(* Const before type ignored *)
procedure efl_observable_observer_add(obj:PEo; key:Pchar; obs:PEfl_Observer);cdecl;external;
{*
 * @brief Delete an observer from a group of observers.
 *
 * See also @ref efl_observable_observer_add().
 *
 * @param[in] obj The object.
 * @param[in] key A key to classify observer groups
 * @param[in] obs An observer object
 *
 * @ingroup Efl_Observable
  }
(* Const before type ignored *)
procedure efl_observable_observer_del(obj:PEo; key:Pchar; obs:PEfl_Observer);cdecl;external;
{*
 * @brief Clear an observer from all groups of observers.
 *
 * @param[in] obj The object.
 * @param[in] obs An observer object
 *
 * @ingroup Efl_Observable
  }
procedure efl_observable_observer_clean(obj:PEo; obs:PEfl_Observer);cdecl;external;
{*
 * @brief Return a new iterator associated with a group of observers.
 *
 * @param[in] obj The object.
 * @param[in] key A key to classify observer groups
 *
 * @return Iterator for observers group
 *
 * @ingroup Efl_Observable
  }
(* Const before type ignored *)
function efl_observable_observers_iterator_new(obj:PEo; key:Pchar):PEina_Iterator;cdecl;external;
{*
 * @brief Update all observers in a group by calling their update() method.
 *
 * @param[in] obj The object.
 * @param[in] key A key to classify observer groups
 * @param[in] data Required data to update observer
 *
 * @ingroup Efl_Observable
  }
(* Const before type ignored *)
procedure efl_observable_observers_update(obj:PEo; key:Pchar; data:pointer);cdecl;external;
{*
 * @brief Return a new iterator associated to this observable.
 *
 * @param[in] obj The object.
 *
 * @return Iterator for observer
 *
 * @ingroup Efl_Observable
  }
function efl_observable_iterator_tuple_new(obj:PEo):PEina_Iterator;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_OBSERVABLE_CLASS : longint; { return type might be wrong }
  begin
    EFL_OBSERVABLE_CLASS:=efl_observable_class_get;
  end;


end.
