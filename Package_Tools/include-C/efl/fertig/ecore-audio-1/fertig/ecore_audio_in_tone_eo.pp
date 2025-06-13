
unit ecore_audio_in_tone_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_audio_in_tone_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_audio_in_tone_eo.h
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
PEcore_Audio_In_Tone  = ^Ecore_Audio_In_Tone;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_AUDIO_IN_TONE_EO_H_}
{$define _ECORE_AUDIO_IN_TONE_EO_H_}
{$ifndef _ECORE_AUDIO_IN_TONE_EO_CLASS_TYPE}
{$define _ECORE_AUDIO_IN_TONE_EO_CLASS_TYPE}
type
  PEcore_Audio_In_Tone = ^TEcore_Audio_In_Tone;
  TEcore_Audio_In_Tone = TEo;
{$endif}
{$ifndef _ECORE_AUDIO_IN_TONE_EO_TYPES}
{$define _ECORE_AUDIO_IN_TONE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Ecore Audio tone input.
 *
 * @ingroup Ecore_Audio_In_Tone
  }

{ was #define dname def_expr }
function ECORE_AUDIO_IN_TONE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_audio_in_tone_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ECORE_AUDIO_IN_TONE_CLASS : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_IN_TONE_CLASS:=ecore_audio_in_tone_class_get;
  end;


end.
