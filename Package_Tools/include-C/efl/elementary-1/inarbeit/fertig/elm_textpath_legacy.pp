
unit elm_textpath_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_textpath_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_textpath_legacy.h
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
PElm_Textpath  = ^Elm_Textpath;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PElm_Textpath = ^TElm_Textpath;
  TElm_Textpath = TEo;
{*
 * @brief Add a new textpath to the parent
 *
 * @param[in] parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Textpath_Group
 *
 * @since 1.22
  }

function elm_textpath_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set the user text style
 *
 * @param[in] obj The textpath object
 * @param[in] style The user text style. If the sytle is $null, the default style will be applied
 *
 * @note ellipsis in the style will be ignored since textpath supports ellipsis API.
 * @see elm_textpath_ellipsis_set()
 *
 * @ingroup Elm_Textpath_Group
 *
 * @since 1.25
  }
(* Const before type ignored *)
procedure elm_textpath_text_user_style_set(obj:PEvas_Object; style:Pchar);cdecl;external;
{$include "efl_ui_textpath_eo.legacy.h"}

implementation


end.
