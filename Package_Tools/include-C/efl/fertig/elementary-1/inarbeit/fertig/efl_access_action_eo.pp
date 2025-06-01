
unit efl_access_action_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_action_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_action_eo.h
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
PEfl_Access_Action  = ^Efl_Access_Action;
PEfl_Class  = ^Efl_Class;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCESS_ACTION_EO_H_}
{$define _EFL_ACCESS_ACTION_EO_H_}
{$ifndef _EFL_ACCESS_ACTION_EO_CLASS_TYPE}
{$define _EFL_ACCESS_ACTION_EO_CLASS_TYPE}
type
  PEfl_Access_Action = ^TEfl_Access_Action;
  TEfl_Access_Action = TEo;
{$endif}
{$ifndef _EFL_ACCESS_ACTION_EO_TYPES}
{$define _EFL_ACCESS_ACTION_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessible action mixin
 *
 * @ingroup Efl_Access_Action
  }

{ was #define dname def_expr }
function EFL_ACCESS_ACTION_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_access_action_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_ACTION_PROTECTED}
{*
 * @brief Gets action name for given id
 *
 * @param[in] obj The object.
 * @param[in] id ID to get action name for
 *
 * @return Action name
 *
 * @ingroup Efl_Access_Action
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_access_action_name_get(obj:PEo; id:longint):Pchar;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_ACTION_PROTECTED}
{*
 * @brief Gets localized action name for given id
 *
 * @param[in] obj The object.
 * @param[in] id ID to get localized name for
 *
 * @return Localized name
 *
 * @ingroup Efl_Access_Action
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_access_action_localized_name_get(obj:PEo; id:longint):Pchar;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_ACTION_PROTECTED}
{*
 * @brief Action description for given id
 *
 * @param[in] obj The object.
 * @param[in] id ID to set or get description for
 * @param[in] description Action description
 *
 * @return @c true if description was set, @c false otherwise
 *
 * @ingroup Efl_Access_Action
  }
(* Const before type ignored *)

function efl_access_action_description_set(obj:PEo; id:longint; description:Pchar):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_ACTION_PROTECTED}
{*
 * @brief Action description for given id
 *
 * @param[in] obj The object.
 * @param[in] id ID to set or get description for
 *
 * @return Action description
 *
 * @ingroup Efl_Access_Action
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_access_action_description_get(obj:PEo; id:longint):Pchar;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_ACTION_PROTECTED}
{*
 * @brief Get list of available widget actions
 *
 * @param[in] obj The object.
 *
 * @return Contains statically allocated strings.
 *
 * @ingroup Efl_Access_Action
  }
(* Const before type ignored *)

function efl_access_action_actions_get(obj:PEo):PEina_List;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_ACTION_PROTECTED}
{*
 * @brief Performs action on given widget.
 *
 * @param[in] obj The object.
 * @param[in] id ID for widget
 *
 * @return @c true if action was performed, @c false otherwise
 *
 * @ingroup Efl_Access_Action
  }

function efl_access_action_do(obj:PEo; id:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_ACTION_PROTECTED}
{*
 * @brief Gets configured keybinding for specific action and widget.
 *
 * @param[in] obj The object.
 * @param[in] id ID for widget
 *
 * @return Should be freed by the user.
 *
 * @ingroup Efl_Access_Action
  }

function efl_access_action_keybinding_get(obj:PEo; id:longint):Pchar;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCESS_ACTION_MIXIN : longint; { return type might be wrong }
  begin
    EFL_ACCESS_ACTION_MIXIN:=efl_access_action_mixin_get;
  end;


end.
