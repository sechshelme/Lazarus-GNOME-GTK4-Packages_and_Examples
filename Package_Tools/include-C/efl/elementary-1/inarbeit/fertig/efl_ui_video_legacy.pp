
unit efl_ui_video_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_video_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_video_legacy.h
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
PElm_Video  = ^Elm_Video;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PElm_Video = ^TElm_Video;
  TElm_Video = TEo;
{*
 * @defgroup Elm_Video Video
 * @ingroup Elementary
  }
{*
 * @brief Add a new Elm_Player object to the given parent Elementary (container) object.
 *
 * @param parent The parent object
 * @return a new player widget handle or @c NULL, on errors.
 *
 * This function inserts a new player widget on the canvas.
 *
 * @see elm_object_part_content_set()
 *
 * @ingroup Elm_Video
  }

function elm_player_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Add a new Elm_Video object to the given parent Elementary (container) object.
 *
 * @param parent The parent object
 * @return a new video widget handle or @c NULL, on errors.
 *
 * This function inserts a new video widget on the canvas.
 *
 * @see elm_video_file_set()
 *
 * @ingroup Elm_Video
  }
function elm_video_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 *
 * @brief Define the file or URI that will be the video source.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * This function will explicitly define a file or URI as a source
 * for the video of the Elm_Video object.
 *
 * @see elm_video_add()
 * @see elm_player_add()
 *
 * @ingroup Elm_Video
 *
 * @param[in] filename The file or URI to target.
Local files can be specified using file:// or by using full file paths.
URI could be remote source of video, like http:// or local source like
WebCam (v4l2://). (You can use Emotion API to request and list
the available Webcam on your system).
  }
(* Const before type ignored *)
function elm_video_file_set(obj:PEo; filename:Pchar):TEina_Bool;cdecl;external;
{*
 *
 * @brief Get the file or URI that is used as the video source.
 *
 * @ingroup Elm_Video
 *
 * @param filename The file or URI.
 *
 * @since 1.14
  }
(* Const before type ignored *)
procedure elm_video_file_get(obj:PEo; filename:PPchar);cdecl;external;
{*
 * @brief Set the audio level of an Elm_Video object.
 *
 * @param[in] volume The audio level.
 *
 * @ingroup Elm_Video
  }
procedure elm_video_audio_level_set(obj:PEvas_Object; volume:Tdouble);cdecl;external;
{*
 * @brief Get the audio level of the current video.
 *
 * @return The audio level.
 *
 * @ingroup Elm_Video
  }
(* Const before type ignored *)
function elm_video_audio_level_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Change the mute state of the Elm_Video object.
 *
 * @param[in] mute The mute state.
 *
 * @ingroup Elm_Video
  }
procedure elm_video_audio_mute_set(obj:PEvas_Object; mute:TEina_Bool);cdecl;external;
{*
 * @brief Get whether audio is muted.
 *
 * @return The mute state.
 *
 * @ingroup Elm_Video
  }
(* Const before type ignored *)
function elm_video_audio_mute_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Get the total playing time (in seconds) of the Elm_Video object.
 *
 * @return The total duration (in seconds) of the media file.
 *
 * @ingroup Elm_Video
  }
(* Const before type ignored *)
function elm_video_play_length_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Is it possible to seek inside the video.
 *
 * @return true if is possible to seek inside the video.
 *
 * @ingroup Elm_Video
  }
(* Const before type ignored *)
function elm_video_is_seekable_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the current position (in seconds) to be played in the Elm_Video
 * object.
 *
 * @param[in] position The time (in seconds) since the beginning of the media
 * file.
 *
 * @ingroup Elm_Video
  }
procedure elm_video_play_position_set(obj:PEvas_Object; position:Tdouble);cdecl;external;
{*
 * @brief Get the current position (in seconds) being played in the Elm_Video
 * object.
 *
 * @return The time (in seconds) since the beginning of the media file.
 *
 * @ingroup Elm_Video
  }
(* Const before type ignored *)
function elm_video_play_position_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Get whether the video actually playing.
 * You should consider watching event on the object instead of
 * polling the object state.
 *
 * @return @c true if the video is playing, @c false otherwise.
 *
 * @ingroup Elm_Video
  }
function elm_video_is_playing_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Start playing a video.
 *
 * @ingroup Elm_Video
  }
procedure elm_video_play(obj:PEvas_Object);cdecl;external;
{*
 * @brief Stop a video.
 *
 * @ingroup Elm_Video
  }
procedure elm_video_stop(obj:PEvas_Object);cdecl;external;
{*
 * @brief Pause a video.
 *
 * @ingroup Elm_Video
  }
procedure elm_video_pause(obj:PEvas_Object);cdecl;external;
{$include "efl_ui_video_eo.legacy.h"}

implementation


end.
