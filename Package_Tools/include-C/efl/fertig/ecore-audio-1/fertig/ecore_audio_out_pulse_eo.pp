
unit ecore_audio_out_pulse_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_audio_out_pulse_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_audio_out_pulse_eo.h
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
PEcore_Audio_Out_Pulse  = ^Ecore_Audio_Out_Pulse;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_AUDIO_OUT_PULSE_EO_H_}
{$define _ECORE_AUDIO_OUT_PULSE_EO_H_}
{$ifndef _ECORE_AUDIO_OUT_PULSE_EO_CLASS_TYPE}
{$define _ECORE_AUDIO_OUT_PULSE_EO_CLASS_TYPE}
type
  PEcore_Audio_Out_Pulse = ^TEcore_Audio_Out_Pulse;
  TEcore_Audio_Out_Pulse = TEo;
{$endif}
{$ifndef _ECORE_AUDIO_OUT_PULSE_EO_TYPES}
{$define _ECORE_AUDIO_OUT_PULSE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Ecore audio ouput for PulseAudio.
 *
 * @ingroup Ecore_Audio_Out_Pulse
  }

{ was #define dname def_expr }
function ECORE_AUDIO_OUT_PULSE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_audio_out_pulse_class_get:PEfl_Class;cdecl;external;
(* Const before type ignored *)
  var
    _ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_READY : TEfl_Event_Description;cvar;external;
{* Called when the output is ready for playback.
 *
 * @ingroup Ecore_Audio_Out_Pulse
  }
(* Const before type ignored *)
    _ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_FAIL : TEfl_Event_Description;cvar;external;
{* Called when context fails.
 *
 * @ingroup Ecore_Audio_Out_Pulse
  }

{ was #define dname def_expr }
function ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_READY : longint; { return type might be wrong }

{ was #define dname def_expr }
function ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_FAIL : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ECORE_AUDIO_OUT_PULSE_CLASS : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_OUT_PULSE_CLASS:=ecore_audio_out_pulse_class_get;
  end;

{ was #define dname def_expr }
function ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_READY : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_READY:=@(_ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_READY);
  end;

{ was #define dname def_expr }
function ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_FAIL : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_FAIL:=@(_ECORE_AUDIO_OUT_PULSE_EVENT_CONTEXT_FAIL);
  end;


end.
