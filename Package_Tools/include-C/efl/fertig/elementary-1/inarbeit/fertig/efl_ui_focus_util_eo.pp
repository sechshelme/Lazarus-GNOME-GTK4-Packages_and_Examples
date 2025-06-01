
unit efl_ui_focus_util_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_focus_util_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_focus_util_eo.h
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
PEfl_Ui_Focus_Manager  = ^Efl_Ui_Focus_Manager;
PEfl_Ui_Focus_Object  = ^Efl_Ui_Focus_Object;
PEfl_Ui_Focus_Util  = ^Efl_Ui_Focus_Util;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_FOCUS_UTIL_EO_H_}
{$define _EFL_UI_FOCUS_UTIL_EO_H_}
{$ifndef _EFL_UI_FOCUS_UTIL_EO_CLASS_TYPE}
{$define _EFL_UI_FOCUS_UTIL_EO_CLASS_TYPE}
type
  PEfl_Ui_Focus_Util = ^TEfl_Ui_Focus_Util;
  TEfl_Ui_Focus_Util = TEo;
{$endif}
{$ifndef _EFL_UI_FOCUS_UTIL_EO_TYPES}
{$define _EFL_UI_FOCUS_UTIL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief EFL UI Focus Utility class.
 *
 * This class contains a series of static methods that simplify common focus
 * management operations. There's no need to instantiate this class.
 *
 * @ingroup Efl_Ui_Focus_Util
  }

{ was #define dname def_expr }
function EFL_UI_FOCUS_UTIL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_focus_util_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Sets the focus to the given object.
 *
 * @param[in] focus_elem Object to receive focus.
 *
 * @ingroup Efl_Ui_Focus_Util
  }
procedure efl_ui_focus_util_focus(focus_elem:PEfl_Ui_Focus_Object);cdecl;external;
{*
 * @brief Gets the highest manager in the redirect chain.
 *
 * @param[in] manager Manager to start looking from.
 *
 * @ingroup Efl_Ui_Focus_Util
  }
function efl_ui_focus_util_active_manager(manager:PEfl_Ui_Focus_Manager):PEfl_Ui_Focus_Manager;cdecl;external;
{*
 * @brief Returns the complementary (opposite) focus direction.
 *
 * The defined opposites are Left-Right, Up-Down and Next-Previous.
 *
 * @param[in] dir Direction to complement.
 *
 * @return The opposite direction.
 *
 * @ingroup Efl_Ui_Focus_Util
  }
function efl_ui_focus_util_direction_complement(dir:TEfl_Ui_Focus_Direction):TEfl_Ui_Focus_Direction;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_FOCUS_UTIL_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_FOCUS_UTIL_CLASS:=efl_ui_focus_util_class_get;
  end;


end.
