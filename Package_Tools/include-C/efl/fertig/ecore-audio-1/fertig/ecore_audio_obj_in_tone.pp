
unit ecore_audio_obj_in_tone;
interface

{
  Automatically converted by H2Pas 1.0.0 from ecore_audio_obj_in_tone.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ecore_audio_obj_in_tone.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ECORE_AUDIO_IN_TONE_H}
{$define ECORE_AUDIO_IN_TONE_H}
{$include <Eina.h>}
{$include <Eo.h>}
{*
 * @file ecore_audio_obj_in_tone.h
 * @brief Ecore_Audio tone input.
  }
{*
 * @defgroup ecore_audio_obj_in_tone - Ecore_Audio tone input
 * @ingroup Ecore_Audio_Group
 * @
  }
{*
 * @brief The frequency of the tone in Hz.
 *
 * Set with @ref efl_key_data_set()
  }

const
  ECORE_AUDIO_ATTR_TONE_FREQ = 'ecore_audio_freq';  
{$include "ecore_audio_in_tone.eo.h"}
{*
 * @
  }
{$endif}

implementation


end.
