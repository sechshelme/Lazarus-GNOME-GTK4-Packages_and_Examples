
unit elc_combobox_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elc_combobox_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elc_combobox_legacy.h
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
PElm_Combobox  = ^Elm_Combobox;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_COMBOBOX_EO_CLASS_TYPE}
{$define _ELM_COMBOBOX_EO_CLASS_TYPE}
type
  PElm_Combobox = ^TElm_Combobox;
  TElm_Combobox = TEo;
{$endif}
{*
 * @brief Add a new Combobox object
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Combobox
  }

function elm_combobox_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Returns whether the combobox is expanded.
 *
 * This will return EINA_TRUE if the combobox is expanded or EINA_FALSE if it
 * is not expanded.
 *
 * @param[in] obj The object.
 *
 * @return @c true if combobox is expenaded, @c false otherwise
 *
 * @since 1.17
 *
 * @ingroup Elm_Combobox_Group
  }
(* Const before type ignored *)
function elm_combobox_expanded_get(obj:PElm_Combobox):TEina_Bool;cdecl;external;
{* This triggers the combobox popup from code, the same as if the user had
 * clicked the button.
 *
 * @since 1.17
 *
 * @ingroup Elm_Combobox_Group
  }
procedure elm_combobox_hover_begin(obj:PElm_Combobox);cdecl;external;
{* This dismisses the combobox popup as if the user had clicked outside the
 * hover.
 *
 * @since 1.17
 *
 * @ingroup Elm_Combobox_Group
  }
procedure elm_combobox_hover_end(obj:PElm_Combobox);cdecl;external;

implementation


end.
