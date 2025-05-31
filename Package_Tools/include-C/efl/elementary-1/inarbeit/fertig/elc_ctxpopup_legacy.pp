
unit elc_ctxpopup_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elc_ctxpopup_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elc_ctxpopup_legacy.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @brief Add a new Ctxpopup object to the parent.
 *
 * @param parent Parent object
 * @return New object or @c NULL, if it cannot be created
 *
 * @ingroup Elm_Ctxpopup_Group
  }

function elm_ctxpopup_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "elm_ctxpopup_item_eo.legacy.h"}
{$include "elm_ctxpopup_eo.legacy.h"}

implementation


end.
