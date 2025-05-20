
unit efl_audio_control_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_audio_control_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_audio_control_eo.h
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
PEfl_Audio_Control  = ^Efl_Audio_Control;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_AUDIO_CONTROL_EO_H_}
{$define _EFL_AUDIO_CONTROL_EO_H_}
{$ifndef _EFL_AUDIO_CONTROL_EO_CLASS_TYPE}
{$define _EFL_AUDIO_CONTROL_EO_CLASS_TYPE}
type
  PEfl_Audio_Control = ^TEfl_Audio_Control;
  TEfl_Audio_Control = TEo;
{$endif}
{$ifndef _EFL_AUDIO_CONTROL_EO_TYPES}
{$define _EFL_AUDIO_CONTROL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Player interface for audio related properties
 *
 * @ingroup Efl_Audio_Control
  }

{ was #define dname def_expr }
function EFL_AUDIO_CONTROL_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_audio_control_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Control the audio volume.
 *
 * Controls the audio volume of the stream being played. This has nothing to do
 * with the system volume. This volume will be multiplied by the system volume.
 * e.g.: if the current volume level is 0.5, and the system volume is 50%, it
 * will be 0.5 * 0.5 = 0.25.
 *
 * @param[in] obj The object.
 * @param[in] volume The volume level
 *
 * @ingroup Efl_Audio_Control
  }
procedure efl_audio_control_volume_set(obj:PEo; volume:Tdouble);cdecl;external;
{*
 * @brief Control the audio volume.
 *
 * Controls the audio volume of the stream being played. This has nothing to do
 * with the system volume. This volume will be multiplied by the system volume.
 * e.g.: if the current volume level is 0.5, and the system volume is 50%, it
 * will be 0.5 * 0.5 = 0.25.
 *
 * @param[in] obj The object.
 *
 * @return The volume level
 *
 * @ingroup Efl_Audio_Control
  }
(* Const before type ignored *)
function efl_audio_control_volume_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief This property controls the audio mute state.
 *
 * @param[in] obj The object.
 * @param[in] mute The mute state. @c true or @c false.
 *
 * @ingroup Efl_Audio_Control
  }
procedure efl_audio_control_mute_set(obj:PEo; mute:TEina_Bool);cdecl;external;
{*
 * @brief This property controls the audio mute state.
 *
 * @param[in] obj The object.
 *
 * @return The mute state. @c true or @c false.
 *
 * @ingroup Efl_Audio_Control
  }
(* Const before type ignored *)
function efl_audio_control_mute_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_AUDIO_CONTROL_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_AUDIO_CONTROL_INTERFACE:=efl_audio_control_interface_get;
  end;


end.
