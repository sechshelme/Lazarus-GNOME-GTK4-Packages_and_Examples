
unit efl_ui_frame_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_frame_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_frame_legacy.h
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
PElm_Frame  = ^Elm_Frame;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PElm_Frame = ^TElm_Frame;
  TElm_Frame = TEo;
{*
 * @brief Add a new frame to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Frame_Group
  }

function elm_frame_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{$include "efl_ui_frame_eo.legacy.h"}

implementation


end.
