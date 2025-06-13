
unit ecore_audio_in_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_audio_in_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_audio_in_eo.h
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
PEcore_Audio  = ^Ecore_Audio;
PEcore_Audio_In  = ^Ecore_Audio_In;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_AUDIO_IN_EO_H_}
{$define _ECORE_AUDIO_IN_EO_H_}
{$ifndef _ECORE_AUDIO_IN_EO_CLASS_TYPE}
{$define _ECORE_AUDIO_IN_EO_CLASS_TYPE}
type
  PEcore_Audio_In = ^TEcore_Audio_In;
  TEcore_Audio_In = TEo;
{$endif}
{$ifndef _ECORE_AUDIO_IN_EO_TYPES}
{$define _ECORE_AUDIO_IN_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Ecore Audio input object.
 *
 * @ingroup Ecore_Audio_In
  }

{ was #define dname def_expr }
function ECORE_AUDIO_IN_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_audio_in_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Playback speed of the input.
 *
 * @param[in] obj The object.
 * @param[in] speed The speed, 1.0 is the default
 *
 * @ingroup Ecore_Audio_In
  }
procedure ecore_audio_obj_in_speed_set(obj:PEo; speed:Tdouble);cdecl;external;
{*
 * @brief Playback speed of the input.
 *
 * @param[in] obj The object.
 *
 * @return The speed, 1.0 is the default
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
function ecore_audio_obj_in_speed_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Sample-rate of the input
 *
 * @param[in] obj The object.
 * @param[in] samplerate The samplerate in Hz
 *
 * @ingroup Ecore_Audio_In
  }
procedure ecore_audio_obj_in_samplerate_set(obj:PEo; samplerate:longint);cdecl;external;
{*
 * @brief Sample-rate of the input
 *
 * @param[in] obj The object.
 *
 * @return The samplerate in Hz
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
function ecore_audio_obj_in_samplerate_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Amount of channels the input has
 *
 * @param[in] obj The object.
 * @param[in] channels The number of channels
 *
 * @ingroup Ecore_Audio_In
  }
procedure ecore_audio_obj_in_channels_set(obj:PEo; channels:longint);cdecl;external;
{*
 * @brief Amount of channels the input has
 *
 * @param[in] obj The object.
 *
 * @return The number of channels
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
function ecore_audio_obj_in_channels_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Preloaded state of the input
 *
 * @param[in] obj The object.
 * @param[in] preloaded @c true if the input should be cached, @c false
 * otherwise
 *
 * @ingroup Ecore_Audio_In
  }
procedure ecore_audio_obj_in_preloaded_set(obj:PEo; preloaded:TEina_Bool);cdecl;external;
{*
 * @brief Preloaded state of the input
 *
 * @param[in] obj The object.
 *
 * @return @c true if the input should be cached, @c false otherwise
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
function ecore_audio_obj_in_preloaded_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Looped state of the input
 *
 * If the input is looped and reaches the end it will start from the beginning
 * again. At the same time the event @ref ECORE_AUDIO_EV_IN_LOOPED will be
 * emitted
 *
 * @param[in] obj The object.
 * @param[in] looped @c true if the input should be looped, @c false otherwise
 *
 * @ingroup Ecore_Audio_In
  }
procedure ecore_audio_obj_in_looped_set(obj:PEo; looped:TEina_Bool);cdecl;external;
{*
 * @brief Looped state of the input
 *
 * If the input is looped and reaches the end it will start from the beginning
 * again. At the same time the event @ref ECORE_AUDIO_EV_IN_LOOPED will be
 * emitted
 *
 * @param[in] obj The object.
 *
 * @return @c true if the input should be looped, @c false otherwise
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
function ecore_audio_obj_in_looped_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Length of the input
 *
 * This function is only implemented by some classes (i.e.
 * ECORE_AUDIO_OBJ_IN_TONE_CLASS)
 *
 * @param[in] obj The object.
 * @param[in] length The length of the input in seconds
 *
 * @ingroup Ecore_Audio_In
  }
procedure ecore_audio_obj_in_length_set(obj:PEo; length:Tdouble);cdecl;external;
{*
 * @brief Length of the input
 *
 * This function is only implemented by some classes (i.e.
 * ECORE_AUDIO_OBJ_IN_TONE_CLASS)
 *
 * @param[in] obj The object.
 *
 * @return The length of the input in seconds
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
function ecore_audio_obj_in_length_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief The output that this input is attached to
 *
 * @param[in] obj The object.
 *
 * @return The output
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
function ecore_audio_obj_in_output_get(obj:PEo):PEcore_Audio;cdecl;external;
{*
 * @brief The remaining time of the input
 *
 * @param[in] obj The object.
 *
 * @return The amount of time in seconds left to play
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
function ecore_audio_obj_in_remaining_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Reads from the input
 *
 * @param[in] obj The object.
 * @param[in] buf The buffer to read into
 * @param[in] len The amount of samples to read
 *
 * @return The amount of samples written to buf
 *
 * @ingroup Ecore_Audio_In
  }
function ecore_audio_obj_in_read(obj:PEo; buf:pointer; len:Tsize_t):Tssize_t;cdecl;external;
{*
 * @brief Internal read function
 *
 * @param[in] obj The object.
 * @param[in] buf The buffer to read into
 * @param[in] len The amount of samples to read
 *
 * @return The amount of samples written to buf
 *
 * @ingroup Ecore_Audio_In
  }
function ecore_audio_obj_in_read_internal(obj:PEo; buf:pointer; len:Tsize_t):Tssize_t;cdecl;external;
{*
 * @brief Seeks within the input
 *
 * @param[in] obj The object.
 * @param[in] offs The offset in seconds
 * @param[in] mode The seek mode. Is absolute with SEEK_SET, relative to the
 * current position with SEEK_CUR and relative to the end with SEEK_END.
 *
 * @return The current absolute position in seconds within the input
 *
 * @ingroup Ecore_Audio_In
  }
function ecore_audio_obj_in_seek(obj:PEo; offs:Tdouble; mode:longint):Tdouble;cdecl;external;
(* Const before type ignored *)
  var
    _ECORE_AUDIO_IN_EVENT_IN_LOOPED : TEfl_Event_Description;cvar;external;
{* Called when an input has looped.
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
    _ECORE_AUDIO_IN_EVENT_IN_STOPPED : TEfl_Event_Description;cvar;external;
{* Called when an input has stopped playing.
 *
 * @ingroup Ecore_Audio_In
  }
(* Const before type ignored *)
    _ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when the input samplerate has changed.
 *
 * @ingroup Ecore_Audio_In
  }

{ was #define dname def_expr }
function ECORE_AUDIO_IN_EVENT_IN_LOOPED : longint; { return type might be wrong }

{ was #define dname def_expr }
function ECORE_AUDIO_IN_EVENT_IN_STOPPED : longint; { return type might be wrong }

{ was #define dname def_expr }
function ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ECORE_AUDIO_IN_CLASS : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_IN_CLASS:=ecore_audio_in_class_get;
  end;

{ was #define dname def_expr }
function ECORE_AUDIO_IN_EVENT_IN_LOOPED : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_IN_EVENT_IN_LOOPED:=@(_ECORE_AUDIO_IN_EVENT_IN_LOOPED);
  end;

{ was #define dname def_expr }
function ECORE_AUDIO_IN_EVENT_IN_STOPPED : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_IN_EVENT_IN_STOPPED:=@(_ECORE_AUDIO_IN_EVENT_IN_STOPPED);
  end;

{ was #define dname def_expr }
function ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED:=@(_ECORE_AUDIO_IN_EVENT_IN_SAMPLERATE_CHANGED);
  end;


end.
