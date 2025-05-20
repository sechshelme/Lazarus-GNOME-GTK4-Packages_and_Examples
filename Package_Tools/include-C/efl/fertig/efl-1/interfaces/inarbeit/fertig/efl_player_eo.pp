
unit efl_player_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_player_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_player_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Player  = ^Efl_Player;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_PLAYER_EO_H_}
{$define _EFL_PLAYER_EO_H_}
{$ifndef _EFL_PLAYER_EO_CLASS_TYPE}
{$define _EFL_PLAYER_EO_CLASS_TYPE}
type
  PEfl_Player = ^TEfl_Player;
  TEfl_Player = TEo;
{$endif}
{$ifndef _EFL_PLAYER_EO_TYPES}
{$define _EFL_PLAYER_EO_TYPES}
{$endif}
{* Efl media player interface
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }

{ was #define dname def_expr }
function EFL_PLAYER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_player_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Playback state of the media file.
 *
 * This property sets the playback state of the object. Re-setting the current
 * playback state has no effect.
 *
 * If set to @c false, the object's @ref efl_player_playback_progress_get
 * property is, by default, reset to <tt>0.0</tt>. A class may alter this
 * behavior, and it will be stated in the documentation for a class if such
 * behavior changes should be expected.
 *
 * Applying the @c false playing state also has the same effect as the player
 * object reaching the end of its playback, which may invoke additional
 * behavior based on a class's implementation.
 *
 * @param[in] obj The object.
 * @param[in] playing @c true if playing, @c false otherwise.
 *
 * @return If @c true, the property change has succeeded.
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
function efl_player_playing_set(obj:PEo; playing:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Playback state of the media file.
 *
 * This property sets the playback state of the object. Re-setting the current
 * playback state has no effect.
 *
 * If set to @c false, the object's @ref efl_player_playback_progress_get
 * property is, by default, reset to <tt>0.0</tt>. A class may alter this
 * behavior, and it will be stated in the documentation for a class if such
 * behavior changes should be expected.
 *
 * Applying the @c false playing state also has the same effect as the player
 * object reaching the end of its playback, which may invoke additional
 * behavior based on a class's implementation.
 *
 * @param[in] obj The object.
 *
 * @return @c true if playing, @c false otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
(* Const before type ignored *)
function efl_player_playing_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Pause state of the media file.
 *
 * This property sets the pause state of the media.  Re-setting the current
 * pause state has no effect.
 *
 * If @ref efl_player_playing_get is set to @c true, this property can be used
 * to pause and resume playback of the media without changing its
 * @ref efl_player_playback_progress_get property. This property cannot be
 * changed if @ref efl_player_playing_get is @c false.
 *
 * @param[in] obj The object.
 * @param[in] paused @c true if paused, @c false otherwise.
 *
 * @return If @c true, the property change has succeeded.
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
function efl_player_paused_set(obj:PEo; paused:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Pause state of the media file.
 *
 * This property sets the pause state of the media.  Re-setting the current
 * pause state has no effect.
 *
 * If @ref efl_player_playing_get is set to @c true, this property can be used
 * to pause and resume playback of the media without changing its
 * @ref efl_player_playback_progress_get property. This property cannot be
 * changed if @ref efl_player_playing_get is @c false.
 *
 * @param[in] obj The object.
 *
 * @return @c true if paused, @c false otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
(* Const before type ignored *)
function efl_player_paused_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Position in the media file.
 *
 * This property sets the current position of the media file to @c sec seconds
 * since the beginning of the media file. This only works on seekable streams.
 * Setting the position doesn't change the @ref efl_player_playing_get or
 * @ref efl_player_paused_get states of the media file.
 *
 * @param[in] obj The object.
 * @param[in] sec The position (in seconds).
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
procedure efl_player_playback_position_set(obj:PEo; sec:Tdouble);cdecl;external;
{*
 * @brief Position in the media file.
 *
 * This property sets the current position of the media file to @c sec seconds
 * since the beginning of the media file. This only works on seekable streams.
 * Setting the position doesn't change the @ref efl_player_playing_get or
 * @ref efl_player_paused_get states of the media file.
 *
 * @param[in] obj The object.
 *
 * @return The position (in seconds).
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
(* Const before type ignored *)
function efl_player_playback_position_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief How much of the file has been played.
 *
 * This function sets or gets the progress in playing the file, the value is in
 * the [0, 1] range.
 *
 * @param[in] obj The object.
 * @param[in] progress The progress within the [0, 1] range.
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
procedure efl_player_playback_progress_set(obj:PEo; progress:Tdouble);cdecl;external;
{*
 * @brief How much of the file has been played.
 *
 * This function sets or gets the progress in playing the file, the value is in
 * the [0, 1] range.
 *
 * @param[in] obj The object.
 *
 * @return The progress within the [0, 1] range.
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
(* Const before type ignored *)
function efl_player_playback_progress_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Control the playback speed of the media file.
 *
 * This function control the speed with which the media file will be played.
 * 1.0 represents the normal speed, 2 double speed, 0.5 half speed and so on.
 *
 * @param[in] obj The object.
 * @param[in] speed The play speed in the [0, infinity) range.
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
procedure efl_player_playback_speed_set(obj:PEo; speed:Tdouble);cdecl;external;
{*
 * @brief Control the playback speed of the media file.
 *
 * This function control the speed with which the media file will be played.
 * 1.0 represents the normal speed, 2 double speed, 0.5 half speed and so on.
 *
 * @param[in] obj The object.
 *
 * @return The play speed in the [0, infinity) range.
 *
 * @since 1.23
 *
 * @ingroup Efl_Player
  }
(* Const before type ignored *)
function efl_player_playback_speed_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief When @c true, playback will start as soon as the media is ready.
 *
 * This means that the media file has been successfully loaded and the object
 * is visible.
 *
 * If the object becomes invisible later on the playback is paused, resuming
 * when it is visible again.
 *
 * Changing this property affects the next media being loaded, so set it before
 * setting the media file.
 *
 * @param[in] obj The object.
 * @param[in] autoplay Auto play mode, Default is @c false unless specified by
 * the implementing class.
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }
procedure efl_player_autoplay_set(obj:PEo; autoplay:TEina_Bool);cdecl;external;
{*
 * @brief When @c true, playback will start as soon as the media is ready.
 *
 * This means that the media file has been successfully loaded and the object
 * is visible.
 *
 * If the object becomes invisible later on the playback is paused, resuming
 * when it is visible again.
 *
 * Changing this property affects the next media being loaded, so set it before
 * setting the media file.
 *
 * @param[in] obj The object.
 *
 * @return Auto play mode, Default is @c false unless specified by the
 * implementing class.
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }
(* Const before type ignored *)
function efl_player_autoplay_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Enable playback looping.
 *
 * When @c true, playback continues from the beginning when it reaches the last
 * frame. Otherwise, playback stops. This works both when playing forward and
 * backward.
 *
 * @param[in] obj The object.
 * @param[in] looping Loop mode, Default is @c false unless specified by the
 * implementing class.
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }
procedure efl_player_playback_loop_set(obj:PEo; looping:TEina_Bool);cdecl;external;
{*
 * @brief Enable playback looping.
 *
 * When @c true, playback continues from the beginning when it reaches the last
 * frame. Otherwise, playback stops. This works both when playing forward and
 * backward.
 *
 * @param[in] obj The object.
 *
 * @return Loop mode, Default is @c false unless specified by the implementing
 * class.
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }
(* Const before type ignored *)
function efl_player_playback_loop_get(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_PLAYER_EVENT_PLAYING_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when the playing state has changed. The event value reflects the
 * current state.
 * @return Eina_Bool
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYING_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_PLAYER_EVENT_PAUSED_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when the paused state has changed. The event value reflects the
 * current state.
 * @return Eina_Bool
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PAUSED_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when the playback_progress state has changed. The event value
 * reflects the current state.
 * @return double
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when the playback_position state has changed. The event value
 * reflects the current state.
 * @return double
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_PLAYER_EVENT_PLAYBACK_REPEATED : TEfl_Event_Description;cvar;external;
{* Called when the player has begun to repeat its data stream. The event value
 * is the current number of repeats.
 * @return int
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYBACK_REPEATED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_PLAYER_EVENT_PLAYBACK_FINISHED : TEfl_Event_Description;cvar;external;
{* Called when the player has completed playing its data stream.
 *
 * @since 1.24
 *
 * @ingroup Efl_Player
  }

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYBACK_FINISHED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_PLAYER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_PLAYER_INTERFACE:=efl_player_interface_get;
  end;

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYING_CHANGED : longint; { return type might be wrong }
  begin
    EFL_PLAYER_EVENT_PLAYING_CHANGED:=@(_EFL_PLAYER_EVENT_PLAYING_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PAUSED_CHANGED : longint; { return type might be wrong }
  begin
    EFL_PLAYER_EVENT_PAUSED_CHANGED:=@(_EFL_PLAYER_EVENT_PAUSED_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED : longint; { return type might be wrong }
  begin
    EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED:=@(_EFL_PLAYER_EVENT_PLAYBACK_PROGRESS_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED:=@(_EFL_PLAYER_EVENT_PLAYBACK_POSITION_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYBACK_REPEATED : longint; { return type might be wrong }
  begin
    EFL_PLAYER_EVENT_PLAYBACK_REPEATED:=@(_EFL_PLAYER_EVENT_PLAYBACK_REPEATED);
  end;

{ was #define dname def_expr }
function EFL_PLAYER_EVENT_PLAYBACK_FINISHED : longint; { return type might be wrong }
  begin
    EFL_PLAYER_EVENT_PLAYBACK_FINISHED:=@(_EFL_PLAYER_EVENT_PLAYBACK_FINISHED);
  end;


end.
