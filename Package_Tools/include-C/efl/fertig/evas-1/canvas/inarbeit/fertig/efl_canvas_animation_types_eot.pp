
unit efl_canvas_animation_types_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_animation_types_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_animation_types_eot.h
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
PEfl_Canvas_Animation_Repeat_Mode  = ^Efl_Canvas_Animation_Repeat_Mode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_ANIMATION_TYPES_EOT_H_}
{$define _EFL_CANVAS_ANIMATION_TYPES_EOT_H_}
{$ifndef _EFL_CANVAS_ANIMATION_TYPES_EOT_TYPES}
{$define _EFL_CANVAS_ANIMATION_TYPES_EOT_TYPES}
{* Animation repeat mode.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Animation_Repeat_Mode
  }
{*< Restart animation when the
                                                 * animation ends: The
                                                 * animation will play again
                                                 * from the beginning to the
                                                 * end.
                                                 *
                                                 * @since 1.24  }
{*< Reverse animation when the
                                                 * animation ends: The
                                                 * animation will continue
                                                 * playing from the end to the
                                                 * beginning.
                                                 *
                                                 * @since 1.24  }
type
  PEfl_Canvas_Animation_Repeat_Mode = ^TEfl_Canvas_Animation_Repeat_Mode;
  TEfl_Canvas_Animation_Repeat_Mode =  Longint;
  Const
    EFL_CANVAS_ANIMATION_REPEAT_MODE_RESTART = 0;
    EFL_CANVAS_ANIMATION_REPEAT_MODE_REVERSE = 1;
    EFL_CANVAS_ANIMATION_REPEAT_MODE_LAST = 2;
;
{$endif}
{$endif}

implementation


end.
