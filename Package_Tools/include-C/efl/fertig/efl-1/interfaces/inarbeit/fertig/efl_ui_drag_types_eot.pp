
unit efl_ui_drag_types_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_drag_types_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_drag_types_eot.h
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
PEfl_Ui_Drag_Dir  = ^Efl_Ui_Drag_Dir;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_DRAG_TYPES_EOT_H_}
{$define _EFL_UI_DRAG_TYPES_EOT_H_}
{$ifndef _EFL_UI_DRAG_TYPES_EOT_TYPES}
{$define _EFL_UI_DRAG_TYPES_EOT_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Permitted directions for dragging objects.
 *
 * @ingroup Efl_Ui_Drag_Dir
  }
{*< Not draggable in any direction.  }
{*< Draggable horizontally.  }
{*< Draggable vertically.  }
{*< Draggable in both directions.  }
type
  PEfl_Ui_Drag_Dir = ^TEfl_Ui_Drag_Dir;
  TEfl_Ui_Drag_Dir =  Longint;
  Const
    EFL_UI_DRAG_DIR_NONE = 0;
    EFL_UI_DRAG_DIR_X = 1;
    EFL_UI_DRAG_DIR_Y = 2;
    EFL_UI_DRAG_DIR_XY = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$endif}

implementation


end.
