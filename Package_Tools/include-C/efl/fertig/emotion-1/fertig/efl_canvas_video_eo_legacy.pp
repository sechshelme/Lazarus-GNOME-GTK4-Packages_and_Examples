
unit efl_canvas_video_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_video_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_video_eo_legacy.h
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
PEfl_Canvas_Video  = ^Efl_Canvas_Video;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_VIDEO_EO_LEGACY_H_}
{$define _EFL_CANVAS_VIDEO_EO_LEGACY_H_}
{$ifndef _EFL_CANVAS_VIDEO_EO_CLASS_TYPE}
{$define _EFL_CANVAS_VIDEO_EO_CLASS_TYPE}
type
  PEfl_Canvas_Video = ^TEfl_Canvas_Video;
  TEfl_Canvas_Video = TEo;
{$endif}
{$ifndef _EFL_CANVAS_VIDEO_EO_TYPES}
{$define _EFL_CANVAS_VIDEO_EO_TYPES}
{$endif}
{*
 * @brief Set the specified option for the current module.
 *
 * This function allows one to mute the video or audio of the emotion object.
 *
 * Please don't use this function, consider using @ref Efl.Player.mute instead.
 *
 * @param[in] obj The object.
 * @param[in] opt The option that is being set. Currently supported options:
 * "video" and "audio".
 * @param[in] val The value of the option. Currently only supports "off"
 * (?!?!?!)
 *
 * @ingroup (null)_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure emotion_object_module_option_set(obj:PEfl_Canvas_Video; opt:Pchar; val:Pchar);cdecl;external;
{*
 * @brief Initializes an emotion object with the specified module.
 *
 * This function is required after creating the emotion object, in order to
 * specify which module will be used with this object. Different objects can
 * use different modules to play a media file. The current supported modules
 * are gstreamer and xine.
 *
 * To use any of them, you need to make sure that support for them was compiled
 * correctly.
 *
 * It's possible to disable the build of a module with --disable-module_name.
 *
 * See also @ref Efl.File.file.
 *
 * @param[in] obj The object.
 * @param[in] module_filename The name of the module to be used (gstreamer or
 * xine).
 *
 * @return @c true if the specified module was successfully initialized for
 * this object, @c false otherwise.
 *
 * @ingroup (null)_Group
  }
(* Const before type ignored *)
function emotion_object_init(obj:PEfl_Canvas_Video; module_filename:Pchar):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
