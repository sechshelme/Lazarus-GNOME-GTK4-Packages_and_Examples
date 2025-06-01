
unit elm_panel_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_panel_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_panel_common.h
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
PElm_Panel_Scroll_Info  = ^Elm_Panel_Scroll_Info;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Panel_Group
 *
 * @
  }
{*
 * Panel scroll information
 *
 * @since 1.11
  }
type
{*
 * Panel scroll information
 *
 * @since 1.11
  }
{*<content scrolled position (0.0 ~ 1.0) in the panel> }
{*<content scrolled position (0.0 ~ 1.0) in the panel> }
  PElm_Panel_Scroll_Info = ^TElm_Panel_Scroll_Info;
  TElm_Panel_Scroll_Info = record
      rel_x : Tdouble;
      rel_y : Tdouble;
    end;

{*
 * @
  }

implementation


end.
