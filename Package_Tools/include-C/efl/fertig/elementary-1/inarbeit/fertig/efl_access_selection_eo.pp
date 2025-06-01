
unit efl_access_selection_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_selection_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_selection_eo.h
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
PEfl_Access_Selection  = ^Efl_Access_Selection;
PEfl_Class  = ^Efl_Class;
PEfl_Object  = ^Efl_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCESS_SELECTION_EO_H_}
{$define _EFL_ACCESS_SELECTION_EO_H_}
{$ifndef _EFL_ACCESS_SELECTION_EO_CLASS_TYPE}
{$define _EFL_ACCESS_SELECTION_EO_CLASS_TYPE}
type
  PEfl_Access_Selection = ^TEfl_Access_Selection;
  TEfl_Access_Selection = TEo;
{$endif}
{$ifndef _EFL_ACCESS_SELECTION_EO_TYPES}
{$define _EFL_ACCESS_SELECTION_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary access selection interface
 *
 * @ingroup Efl_Access_Selection
  }

{ was #define dname def_expr }
function EFL_ACCESS_SELECTION_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_access_selection_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_SELECTION_PROTECTED}
{*
 * @brief Gets the number of currently selected children
 *
 * @param[in] obj The object.
 *
 * @return Number of currently selected children
 *
 * @ingroup Efl_Access_Selection
  }
(* Const before type ignored *)
function efl_access_selection_selected_children_count_get(obj:PEo):longint;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_SELECTION_PROTECTED}
{*
 * @brief Gets child for given child index
 *
 * @param[in] obj The object.
 * @param[in] selected_child_index Index of child
 *
 * @return Child object
 *
 * @ingroup Efl_Access_Selection
  }
(* Const before type ignored *)

function efl_access_selection_selected_child_get(obj:PEo; selected_child_index:longint):PEfl_Object;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_SELECTION_PROTECTED}
{*
 * @brief Adds selection for given child index
 *
 * @param[in] obj The object.
 * @param[in] child_index Index of child
 *
 * @return @c true if selection was added, @c false otherwise
 *
 * @ingroup Efl_Access_Selection
  }

function efl_access_selection_child_select(obj:PEo; child_index:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_SELECTION_PROTECTED}
{*
 * @brief Removes selection for given child index
 *
 * @param[in] obj The object.
 * @param[in] child_index Index of child
 *
 * @return @c true if selection was removed, @c false otherwise
 *
 * @ingroup Efl_Access_Selection
  }

function efl_access_selection_selected_child_deselect(obj:PEo; child_index:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_SELECTION_PROTECTED}
{*
 * @brief Determines if child specified by index is selected
 *
 * @param[in] obj The object.
 * @param[in] child_index Index of child
 *
 * @return @c true if child is selected, @c false otherwise
 *
 * @ingroup Efl_Access_Selection
  }

function efl_access_selection_is_child_selected(obj:PEo; child_index:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_SELECTION_PROTECTED}
{*
 * @brief Adds selection for all children
 *
 * @param[in] obj The object.
 *
 * @return @c true if selection was added to all children, @c false otherwise
 *
 * @ingroup Efl_Access_Selection
  }

function efl_access_selection_all_children_select(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_SELECTION_PROTECTED}
{*
 * @brief Clears the current selection
 *
 * @param[in] obj The object.
 *
 * @return @c true if selection was cleared, @c false otherwise
 *
 * @ingroup Efl_Access_Selection
  }

function efl_access_selection_clear(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_SELECTION_PROTECTED}
{*
 * @brief Removes selection for given child index
 *
 * @param[in] obj The object.
 * @param[in] child_index Index of child
 *
 * @return @c true if selection was removed, @c false otherwise
 *
 * @ingroup Efl_Access_Selection
  }

function efl_access_selection_child_deselect(obj:PEo; child_index:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
(* Const before type ignored *)
  var
    _EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when selection has been changed.
 *
 * @ingroup Efl_Access_Selection
  }

{ was #define dname def_expr }
function EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCESS_SELECTION_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_ACCESS_SELECTION_INTERFACE:=efl_access_selection_interface_get;
  end;

{ was #define dname def_expr }
function EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED:=@(_EFL_ACCESS_SELECTION_EVENT_ACCESS_SELECTION_CHANGED);
  end;


end.
