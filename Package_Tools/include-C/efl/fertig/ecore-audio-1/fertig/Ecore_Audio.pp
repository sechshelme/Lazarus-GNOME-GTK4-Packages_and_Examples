
unit Ecore_Audio;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Audio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Audio.h
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
PEcore_Audio_Type  = ^Ecore_Audio_Type;
PEcore_Audio_Vio  = ^Ecore_Audio_Vio;
PEfl_Object  = ^Efl_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ECORE_AUDIO_H}
{$define ECORE_AUDIO_H}
{$include <Eina.h>}
{$include <Eo.h>}
{$ifdef extern}
{$error extern should not be already defined}
{$endif}
{*
 * @file Ecore_Audio.h
 * @brief Audio utility functions.
  }
{*
 * @defgroup Ecore_Audio_Group Ecore_Audio - Convenience audio API
 * @ingroup Ecore

 * @since 1.8
 *
 * @
  }
{* @since 1.8
    }
{*< Use Pulseaudio module  }
{*< Use ALSA module }
{*< Use libsndfile module  }
{*< Use tone module  }
{*< Use Core Audio module (Apple) - DEPRECATED  }
{*< Use custom module  }
{*< Use Wasapi module @since 1.21 }
{*< Sentinel  }
type
  TEcore_Audio_Type =  Longint;
  Const
    ECORE_AUDIO_TYPE_PULSE = 0;
    ECORE_AUDIO_TYPE_ALSA = 1;
    ECORE_AUDIO_TYPE_SNDFILE = 2;
    ECORE_AUDIO_TYPE_TONE = 3;
    ECORE_AUDIO_TYPE_CORE_AUDIO = 4;
    ECORE_AUDIO_TYPE_CUSTOM = 5;
    ECORE_AUDIO_TYPE_WASAPI = 6;
    ECORE_AUDIO_MODULE_LAST = 7;

{*
 * @since 1.8
  }
type
  PEcore_Audio_Type = ^TEcore_Audio_Type;
  TEcore_Audio_Type = TEcore_Audio_Type;
{* @since 1.8
    }
{*< The audio module  }
{* @since 1.8
    }
{*< The audio object  }
{
 * @brief Structure to hold the callbacks needed to implement virtual file IO
 * @since 1.8
  }
{*
     * @brief Gets the length of the file.
     *
     * @param data User data from the ecore_audio_obj_set_vio call
     * @param eo_obj The Ecore_Audio object this operates on
     *
     * @return The length of the virtual file in bytes
     *
     * @since 1.8
      }
{*
     * @brief Seeks to a position within the file.
     *
     * @param data User data from the ecore_audio_obj_set_vio call
     * @param eo_obj The Ecore_Audio object this operates on
     * @param offset The number of bytes to move (can be negative)
     * @param whence Accepts the same values as fseek(), which are:
     *               SEEK_SET: offset is absolute
     *               SEEK_CUR: offset is relative to the current position
     *               SEEK_END: offset is relative to the end
     *
     * @return The resulting position from the start of the file (in bytes)
     *         or -1 if an error occurred (i.e. out of bounds)
     *
     * @since 1.8
      }
{*
     * @brief Gets the current position within the file.
     *
     * @param data User data from the ecore_audio_obj_set_vio call
     * @param eo_obj The Ecore_Audio object this operates on
     *
     * @return The resulting position from the start of the file (in bytes)
     *
     * This is equivalent to calling seek() with offset 0 and whence SEEK_CUR.
     *
     * @since 1.8
      }
{*
     * @brief Reads some data from the file.
     *
     * @param data User data from the ecore_audio_obj_set_vio call
     * @param eo_obj The Ecore_Audio object this operates on
     * @param[out] buffer the buffer to write the data to
     * @param length The number of bytes to read
     *
     * @return The number of bytes read from the file. May be less than length
     *
     * @since 1.8
      }
{*
     * @brief Writes some data to the file.
     *
     * @param data User data from the ecore_audio_obj_set_vio call
     * @param eo_obj The Ecore_Audio object this operates on
     * @param buffer Write data from here to the file
     * @param length The number of bytes to write
     *
     * @return The number of bytes written to the file. May be less than length
     *
     * @since 1.8
      }
(* Const before type ignored *)
  PEcore_Audio_Vio = ^TEcore_Audio_Vio;
  TEcore_Audio_Vio = record
      get_length : function (data:pointer; eo_obj:PEo):longint;cdecl;
      seek : function (data:pointer; eo_obj:PEo; offset:longint; whence:longint):longint;cdecl;
      tell : function (data:pointer; eo_obj:PEo):longint;cdecl;
      read : function (data:pointer; eo_obj:PEo; buffer:pointer; length:longint):longint;cdecl;
      write : function (data:pointer; eo_obj:PEo; buffer:pointer; length:longint):longint;cdecl;
    end;

{*
 * @brief Holds the callback functions to implement virtual file IO.
 * @since 1.8
  }
{ Audio operations  }
{*
 * @brief Initializes the Ecore_Audio library.
 *
 * @return @c 1 or greater on success, @c 0 on error.
 *
 * @since 1.8
 *
 * This function sets up Ecore_Audio and initializes the modules that
 * provide the in- and outputs to use. It returns 0 on failure, otherwise
 * it returns the number of times it has already been called.
 *
 * When Ecore_Audio is not used anymore, call ecore_audio_shutdown()
 * to shut down the Ecore_Audio library.
  }

function ecore_audio_init:longint;cdecl;external;
{*
 * @brief Shuts down the Ecore_Audio library.
 *
 * @return @c 0 when the library is completely shut down, @c 1 or
 * greater otherwise.
 *
 * @since 1.8
 *
 * This function shuts down the Ecore_Audio library. It returns 0 when it has
 * been called the same number of times than ecore_audio_init(). In that case
 * it shuts down all the services it uses.
  }
function ecore_audio_shutdown:longint;cdecl;external;
{Legacy compatibility code }
{*
 * @brief Get the name of the object
 *
 * @since 1.8
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_audio_obj_name_get(obj:PEfl_Object):Pchar;cdecl;external;
{*
 * @brief Name of the object
 *
 * @since 1.8
 *
  }
(* Const before type ignored *)
procedure ecore_audio_obj_name_set(obj:PEfl_Object; name:Pchar);cdecl;external;
{$include <ecore_audio_obj.h>}
{$include <ecore_audio_obj_in.h>}
{$include <ecore_audio_obj_out.h>}
{$include <ecore_audio_obj_in_sndfile.h>}
{$include <ecore_audio_obj_out_sndfile.h>}
{$include <ecore_audio_obj_in_tone.h>}
{$include <ecore_audio_obj_out_pulse.h>}
{$include <ecore_audio_obj_out_wasapi.h>}
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
