
unit efl_gfx_frame_controller_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_frame_controller_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_frame_controller_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Frame_Controller  = ^Efl_Gfx_Frame_Controller;
PEfl_Gfx_Frame_Controller_Loop_Hint  = ^Efl_Gfx_Frame_Controller_Loop_Hint;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_FRAME_CONTROLLER_EO_H_}
{$define _EFL_GFX_FRAME_CONTROLLER_EO_H_}
{$ifndef _EFL_GFX_FRAME_CONTROLLER_EO_CLASS_TYPE}
{$define _EFL_GFX_FRAME_CONTROLLER_EO_CLASS_TYPE}
type
  PEfl_Gfx_Frame_Controller = ^TEfl_Gfx_Frame_Controller;
  TEfl_Gfx_Frame_Controller = TEo;
{$endif}
{$ifndef _EFL_GFX_FRAME_CONTROLLER_EO_TYPES}
{$define _EFL_GFX_FRAME_CONTROLLER_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Frame loop modes
 *
 * @ingroup Efl_Gfx_Frame_Controller_Loop_Hint
  }
{*< No looping order specified.
                                                 }
{*< Standard loop:
                                                * 1->2->3->1->2->3->1  }
{*< Ping-pong bouncing loop:
                                                   * 1->2->3->2->1->2->3->1  }
type
  PEfl_Gfx_Frame_Controller_Loop_Hint = ^TEfl_Gfx_Frame_Controller_Loop_Hint;
  TEfl_Gfx_Frame_Controller_Loop_Hint =  Longint;
  Const
    EFL_GFX_FRAME_CONTROLLER_LOOP_HINT_NONE = 0;
    EFL_GFX_FRAME_CONTROLLER_LOOP_HINT_LOOP = 1;
    EFL_GFX_FRAME_CONTROLLER_LOOP_HINT_PINGPONG = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl frame controller of frame based animated object interface.
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }

{ was #define dname def_expr }
function EFL_GFX_FRAME_CONTROLLER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_frame_controller_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Whether an object can be animated (has multiple frames).
 *
 * This will be @c true for animated object for instance but @c false for a
 * single frame object.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the object is animated
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }
(* Const before type ignored *)
function efl_gfx_frame_controller_animated_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Index of the current frame of an animated object.
 *
 * Ranges from 1 to @ref efl_gfx_frame_controller_frame_count_get. Valid only
 * if @ref efl_gfx_frame_controller_animated_get is @c true.
 *
 * @param[in] obj The object.
 * @param[in] frame_index The index of current frame.
 *
 * @return Returns @c true if the frame index is valid.
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }
function efl_gfx_frame_controller_frame_set(obj:PEo; frame_index:longint):TEina_Bool;cdecl;external;
{*
 * @brief Index of the current frame of an animated object.
 *
 * Ranges from 1 to @ref efl_gfx_frame_controller_frame_count_get. Valid only
 * if @ref efl_gfx_frame_controller_animated_get is @c true.
 *
 * @param[in] obj The object.
 *
 * @return The index of current frame.
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }
(* Const before type ignored *)
function efl_gfx_frame_controller_frame_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The total number of frames of the object, if animated.
 *
 * Returns -1 if not animated.
 *
 * @param[in] obj The object.
 *
 * @return The number of frames in the animated object.
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }
(* Const before type ignored *)
function efl_gfx_frame_controller_frame_count_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The kind of looping the animated object does.
 *
 * If it returns @ref EFL_GFX_FRAME_CONTROLLER_LOOP_HINT_LOOP, you should
 * display frames in a sequence like: 1->2->3->1->2->3->1...
 *
 * If it returns @ref EFL_GFX_FRAME_CONTROLLER_LOOP_HINT_PINGPONG, it is better
 * to display frames in a sequence like: 1->2->3->2->1->2->3->1...
 *
 * The default type is @ref EFL_GFX_FRAME_CONTROLLER_LOOP_HINT_LOOP.
 *
 * @param[in] obj The object.
 *
 * @return Loop type of the animated object.
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }
(* Const before type ignored *)
function efl_gfx_frame_controller_loop_type_get(obj:PEo):TEfl_Gfx_Frame_Controller_Loop_Hint;cdecl;external;
{*
 * @brief The number times the animation of the object loops.
 *
 * This returns loop count of animated object. The loop count is the number of
 * times the animation will play fully from first to last frame until the
 * animation should stop (at the final frame).
 *
 * If 0 is returned, then looping should happen indefinitely (no limit to the
 * number of times it loops).
 *
 * @param[in] obj The object.
 *
 * @return The number of loop of an animated object.
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }
(* Const before type ignored *)
function efl_gfx_frame_controller_loop_count_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The duration of a sequence of frames.
 *
 * This returns total duration in seconds that the specified sequence of frames
 * should take.
 *
 * If @c start_frame is 1 and @c frame_num is 0, this returns the duration of
 * frame 1. If @c start_frame is 1 and @c frame_num is 1, this returns the
 * total duration of frame 1 + frame 2.
 *
 * @param[in] obj The object.
 * @param[in] start_frame The first frame, rangers from 1 to
 * @ref efl_gfx_frame_controller_frame_count_get.
 * @param[in] frame_num Number of frames in the sequence, starts from 0.
 *
 * @return Duration in seconds
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }
(* Const before type ignored *)
function efl_gfx_frame_controller_frame_duration_get(obj:PEo; start_frame:longint; frame_num:longint):Tdouble;cdecl;external;
{*
 * @brief The sector for playing section.
 *
 * Returns the start and end frame of the sector specified by the name.
 *
 * @param[in] obj The object.
 * @param[in] name The name of sector
 * @param[in] startframe The start frame of sector
 * @param[in] endframe The end frame of sector
 *
 * @return Returns @c true if sector and frame set success.
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }
(* Const before type ignored *)
function efl_gfx_frame_controller_sector_set(obj:PEo; name:Pchar; startframe:longint; endframe:longint):TEina_Bool;cdecl;external;
{*
 * @brief The sector for playing section.
 *
 * Returns the start and end frame of the sector specified by the name.
 *
 * @param[in] obj The object.
 * @param[in] name The name of sector
 * @param[out] startframe The start frame of sector
 * @param[out] endframe The end frame of sector
 *
 * @return Returns @c true if frames get success.
 *
 * @ingroup Efl_Gfx_Frame_Controller
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gfx_frame_controller_sector_get(obj:PEo; name:Pchar; startframe:Plongint; endframe:Plongint):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_FRAME_CONTROLLER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_FRAME_CONTROLLER_INTERFACE:=efl_gfx_frame_controller_interface_get;
  end;


end.
