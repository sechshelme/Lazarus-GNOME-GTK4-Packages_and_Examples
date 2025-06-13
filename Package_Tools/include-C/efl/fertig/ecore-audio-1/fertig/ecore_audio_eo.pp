
unit ecore_audio_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_audio_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_audio_eo.h
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
PEcore_Audio  = ^Ecore_Audio;
PEcore_Audio_Format  = ^Ecore_Audio_Format;
PEcore_Audio_Vio  = ^Ecore_Audio_Vio;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_AUDIO_EO_H_}
{$define _ECORE_AUDIO_EO_H_}
{$ifndef _ECORE_AUDIO_EO_CLASS_TYPE}
{$define _ECORE_AUDIO_EO_CLASS_TYPE}
type
  PEcore_Audio = ^TEcore_Audio;
  TEcore_Audio = TEo;
{$endif}
{$ifndef _ECORE_AUDIO_EO_TYPES}
{$define _ECORE_AUDIO_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Ecore audio format type
 *
 * @ingroup Ecore_Audio_Format
  }
{*< Automatically detect the format (for inputs)
                                 }
{*< RAW samples (float)  }
{*< WAV format  }
{*< OGG  }
{*< FLAC, the Free Lossless Audio Codec  }
{*< MP3 (not supported)  }
{*< Sentinel value to indicate last enum field during
                           * iteration  }
type
  PEcore_Audio_Format = ^TEcore_Audio_Format;
  TEcore_Audio_Format =  Longint;
  Const
    ECORE_AUDIO_FORMAT_AUTO = 0;
    ECORE_AUDIO_FORMAT_RAW = 1;
    ECORE_AUDIO_FORMAT_WAV = 2;
    ECORE_AUDIO_FORMAT_OGG = 3;
    ECORE_AUDIO_FORMAT_FLAC = 4;
    ECORE_AUDIO_FORMAT_MP3 = 5;
    ECORE_AUDIO_FORMAT_LAST = 6;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Convenience audio class.
 *
 * @ingroup Ecore_Audio
  }

{ was #define dname def_expr }
function ECORE_AUDIO_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function ecore_audio_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Pauses state of the object
 *
 * @param[in] obj The object.
 * @param[in] paused @c true if object is paused, @c false otherwise
 *
 * @ingroup Ecore_Audio
  }
procedure ecore_audio_obj_paused_set(obj:PEo; paused:TEina_Bool);cdecl;external;
{*
 * @brief Pauses state of the object
 *
 * @param[in] obj The object.
 *
 * @return @c true if object is paused, @c false otherwise
 *
 * @ingroup Ecore_Audio
  }
(* Const before type ignored *)
function ecore_audio_obj_paused_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Volume of the object
 *
 * @param[in] obj The object.
 * @param[in] volume The volume
 *
 * @ingroup Ecore_Audio
  }
procedure ecore_audio_obj_volume_set(obj:PEo; volume:Tdouble);cdecl;external;
{*
 * @brief Volume of the object
 *
 * @param[in] obj The object.
 *
 * @return The volume
 *
 * @ingroup Ecore_Audio
  }
(* Const before type ignored *)
function ecore_audio_obj_volume_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Source of the object
 *
 * What sources are supported depends on the actual object. For example, the
 * libsndfile class accepts WAV, OGG, FLAC files as source.
 *
 * @param[in] obj The object.
 * @param[in] source The source to set to (i.e. file, URL, device)
 *
 * @return @c true if the source was set correctly (i.e. the file was opened),
 * @c false otherwise
 *
 * @ingroup Ecore_Audio
  }
(* Const before type ignored *)
function ecore_audio_obj_source_set(obj:PEo; source:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Source of the object
 *
 * What sources are supported depends on the actual object. For example, the
 * libsndfile class accepts WAV, OGG, FLAC files as source.
 *
 * @param[in] obj The object.
 *
 * @return The source to set to (i.e. file, URL, device)
 *
 * @ingroup Ecore_Audio
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_audio_obj_source_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Format of the object.
 *
 * Sets the format of the object
 *
 * What formats are supported depends on the actual object. Default is
 * ECORE_AUDIO_FORMAT_AUTO
 *
 * @param[in] obj The object.
 * @param[in] format The audio format of the object
 *
 * @return @c true if the format was supported, @c false otherwise
 *
 * @ingroup Ecore_Audio
  }
function ecore_audio_obj_format_set(obj:PEo; format:TEcore_Audio_Format):TEina_Bool;cdecl;external;
{*
 * @brief Format of the object.
 *
 * Gets the format of the object
 *
 * After setting the source if the format was ECORE_AUDIO_FORMAT_AUTO this
 * function will now return the actual format.
 *
 * @param[in] obj The object.
 *
 * @return The audio format of the object
 *
 * @ingroup Ecore_Audio
  }
(* Const before type ignored *)
function ecore_audio_obj_format_get(obj:PEo):TEcore_Audio_Format;cdecl;external;
{*
 * @brief Sets the virtual IO functions
 *
 * @param[in] obj The object.
 * @param[in] vio The @ref Ecore_Audio_Vio struct with the function callbacks
 * @param[in] data User data to pass to the VIO functions
 * @param[in] free_func This function takes care to clean up @c data when he
 * VIO is destroyed. @c NULL means do nothing.
 *
 * @ingroup Ecore_Audio
  }
procedure ecore_audio_obj_vio_set(obj:PEo; vio:PEcore_Audio_Vio; data:pointer; free_func:Tefl_key_data_free_func);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ECORE_AUDIO_CLASS : longint; { return type might be wrong }
  begin
    ECORE_AUDIO_CLASS:=ecore_audio_class_get;
  end;


end.
