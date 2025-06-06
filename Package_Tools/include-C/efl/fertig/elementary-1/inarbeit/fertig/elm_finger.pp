
unit elm_finger;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_finger.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_finger.h
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
PEvas_Coord  = ^Evas_Coord;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Elm_Fingers Fingers
 * @ingroup Elementary
 *
 * Elementary is designed to be finger-friendly for touchscreens,
 * and so in addition to scaling for display resolution, it can
 * also scale based on finger "resolution" (or size). You can then
 * customize the granularity of the areas meant to receive clicks
 * on touchscreens.
 *
 * Different profiles may have pre-set values for finger sizes.
 *
 * @ref general_functions_example_page "This" example contemplates
 * some of these functions.
 *
 * @
  }
{*
 * Adjust size of an element for finger usage.
 *
 * @param times_w How many fingers should fit horizontally
 * @param w Pointer to the width size to adjust
 * @param times_h How many fingers should fit vertically
 * @param h Pointer to the height size to adjust
 *
 * This takes width and height sizes (in pixels) as input and a
 * size multiple (which is how many fingers you want to place
 * within the area, being "finger" the size set by
 * elm_config_finger_size_set()), and adjusts the size to be large enough
 * to accommodate the resulting size -- if it doesn't already
 * accommodate it. On return the @p w and @p h sizes pointed to by
 * these parameters will be modified, on those conditions.
 *
 * @note This is kind of low level Elementary call, most useful
 * on size evaluation times for widgets. An external user wouldn't
 * be calling, most of the time.
 *
 * @ingroup Elm_Fingers
  }

procedure elm_coords_finger_size_adjust(times_w:longint; w:PEvas_Coord; times_h:longint; h:PEvas_Coord);cdecl;external;
{*
 * @
  }

implementation


end.
