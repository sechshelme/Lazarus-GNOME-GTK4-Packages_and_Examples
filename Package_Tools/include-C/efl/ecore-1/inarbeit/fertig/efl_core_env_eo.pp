
unit efl_core_env_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_core_env_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_core_env_eo.h
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
PEfl_Core_Env  = ^Efl_Core_Env;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CORE_ENV_EO_H_}
{$define _EFL_CORE_ENV_EO_H_}
{$ifndef _EFL_CORE_ENV_EO_CLASS_TYPE}
{$define _EFL_CORE_ENV_EO_CLASS_TYPE}
type
  PEfl_Core_Env = ^TEfl_Core_Env;
  TEfl_Core_Env = TEo;
{$endif}
{$ifndef _EFL_CORE_ENV_EO_TYPES}
{$define _EFL_CORE_ENV_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief This object can maintain a set of key value pairs
 *
 * A object of this type alone does not apply the object to the system. For
 * getting the value into the system, see @ref Efl_Core_Proc_Env.
 *
 * A object can be forked, which will only copy its values, changes to the
 * returned object will not change the object where it is forked off.
 *
 * @ingroup Efl_Core_Env
  }

{ was #define dname def_expr }
function EFL_CORE_ENV_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_core_env_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Stored var value pairs of this object.
 *
 * Var must contain only: underscores ('_'), letters ('a-z', 'A-Z'), numbers
 * ('0-9'), but the first character may not be a number.
 *
 * Add a new pair to this object
 *
 * @param[in] obj The object.
 * @param[in] var The name of the variable
 * @param[in] value Set var to this value if not @c NULL, otherwise clear this
 * env value if value is @c NULL or if it is an empty string
 *
 * @ingroup Efl_Core_Env
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_core_env_set(obj:PEo; var:Pchar; value:Pchar);cdecl;external;
{*
 * @brief Stored var value pairs of this object.
 *
 * Var must contain only: underscores ('_'), letters ('a-z', 'A-Z'), numbers
 * ('0-9'), but the first character may not be a number.
 *
 * Get the value of the @c var, or @c null if no such @c var exists in the
 * object
 *
 * @param[in] obj The object.
 * @param[in] var The name of the variable
 *
 * @return Set var to this value if not @c NULL, otherwise clear this env value
 * if value is @c NULL or if it is an empty string
 *
 * @ingroup Efl_Core_Env
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_core_env_get(obj:PEo; var:Pchar):Pchar;cdecl;external;
{*
 * @brief Remove the pair with the matching @c var from this object
 *
 * @param[in] obj The object.
 * @param[in] var The name of the variable
 *
 * @ingroup Efl_Core_Env
  }
(* Const before type ignored *)
procedure efl_core_env_unset(obj:PEo; var:Pchar);cdecl;external;
{* Remove all pairs from this object
 *
 * @ingroup Efl_Core_Env
  }
procedure efl_core_env_clear(obj:PEo);cdecl;external;
{*
 * @brief Get the content of this object.
 *
 * This will return a iterator that contains all keys that are part of this
 * object.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Core_Env
  }
(* Const before type ignored *)
function efl_core_env_content_get(obj:PEo):PEina_Iterator;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CORE_ENV_CLASS : longint; { return type might be wrong }
  begin
    EFL_CORE_ENV_CLASS:=efl_core_env_class_get;
  end;


end.
