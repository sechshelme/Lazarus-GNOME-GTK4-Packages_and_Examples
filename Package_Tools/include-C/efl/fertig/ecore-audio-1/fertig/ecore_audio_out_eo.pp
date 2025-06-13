
unit ecore_audio_out_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_audio_out_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_audio_out_eo.h
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
PEcore_Audio_In  = ^Ecore_Audio_In;
PEcore_Audio_Out  = ^Ecore_Audio_Out;
PEfl_Class  = ^Efl_Class;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_AUDIO_OUT_EO_H_}
{$define _ECORE_AUDIO_OUT_EO_H_}
{$ifndef _ECORE_AUDIO_OUT_EO_CLASS_TYPE}
{$define _ECORE_AUDIO_OUT_EO_CLASS_TYPE}
type
  PEcore_Audio_Out = ^TEcore_Audio_Out;
  TEcore_Audio_Out = TEo;
{$endif}
{$ifndef _ECORE_AUDIO_OUT_EO_TYPES}
{$define _ECORE_AUDIO_OUT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Ecore Audio output object.
 *
 * @ingroup Ecore_Audio_Out
  }

{ was #define dname def_expr }
function ECORE_AUDIO_OUT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_audio_out_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Attaches an input to an output
 *
 * @param[in] obj The object.
 * @param[in] input The input to attach to the output
 *
 * @return @c true if the input was attached, @c false otherwise
 *
 * @ingroup Ecore_Audio_Out
  }
function ecore_audio_obj_out_input_attach(obj:PEo; input:PEcore_Audio_In):TEina_Bool;cdecl;external;
{*
 * @brief Detaches an input from an output
 *
 * @param[in] obj The object.
 * @param[in] input The input to detach to the output
 *
 * @return @c true if the input was detached, @c false otherwise
 *
 * @ingroup Ecore_Audio_Out
  }
function ecore_audio_obj_out_input_detach(obj:PEo; input:PEcore_Audio_In):TEina_Bool;cdecl;external;
{*
 * @brief Returns the list of all attached inputs
 *
 * @param[in] obj The object.
 *
 * @return A list of the inputs that are attached to the output
 *
 * @ingroup Ecore_Audio_Out
  }
function ecore_audio_obj_out_inputs_get(obj:PEo):PEina_List;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ECORE_AUDIO_OUT_CLASS : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_OUT_CLASS:=ecore_audio_out_class_get;
  end;


end.
