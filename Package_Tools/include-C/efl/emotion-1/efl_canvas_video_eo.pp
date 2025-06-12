
unit efl_canvas_video_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_video_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_video_eo.h
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
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_VIDEO_EO_H_}
{$define _EFL_CANVAS_VIDEO_EO_H_}
{$ifndef _EFL_CANVAS_VIDEO_EO_CLASS_TYPE}
{$define _EFL_CANVAS_VIDEO_EO_CLASS_TYPE}
type
  PEfl_Canvas_Video = ^TEfl_Canvas_Video;
  TEfl_Canvas_Video = TEo;
{$endif}
{$ifndef _EFL_CANVAS_VIDEO_EO_TYPES}
{$define _EFL_CANVAS_VIDEO_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl canvas video class
 *
 * @ingroup Efl_Canvas_Video
  }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_video_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Sets options for the current module.
 *
 * This function allows one to mute the video or audio of the emotion object.
 *
 * Please don't use this function, consider using
 * @ref efl_audio_control_mute_get instead.
 *
 * @param[in] obj The object.
 * @param[in] opt The option that is being set. Currently supported options:
 * "video" and "audio".
 * @param[in] val The value of the option. Currently only supports "off"
 * (?!?!?!)
 *
 * @ingroup Efl_Canvas_Video
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_canvas_video_option_set(obj:PEo; opt:Pchar; val:Pchar);cdecl;external;
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
 * See also @ref efl_file_get.
 *
 * @param[in] obj The object.
 * @param[in] module_filename The name of the module to be used (gstreamer or
 * xine).
 *
 * @return @c true if the specified module was successfully initialized for
 * this object, @c false otherwise.
 *
 * @ingroup Efl_Canvas_Video
  }
(* Const before type ignored *)
function efl_canvas_video_engine_set(obj:PEo; module_filename:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_REF_CHANGE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_OPEN_DONE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL : TEfl_Event_Description;cvar;external;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_REF_CHANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_OPEN_DONE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_CLASS:=efl_canvas_video_class_get;
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE:=@(_EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE:=@(_EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE:=@(_EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE:=@(_EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START:=@(_EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP:=@(_EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE:=@(_EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE:=@(_EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE:=@(_EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE:=@(_EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_REF_CHANGE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_REF_CHANGE:=@(_EFL_CANVAS_VIDEO_EVENT_REF_CHANGE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE:=@(_EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE:=@(_EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_OPEN_DONE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_OPEN_DONE:=@(_EFL_CANVAS_VIDEO_EVENT_OPEN_DONE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE:=@(_EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL:=@(_EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE:=@(_EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL:=@(_EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL);
  end;


end.
