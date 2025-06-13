unit fp_ecore_audio;

interface

uses
  efl,
  fp_eina,
  fp_eo;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
  {$include ecore-audio-1/Ecore_Audio.inc}                        // io.
  {$include ecore-audio-1/ecore_audio_eo.inc}                     // io.
  {$include ecore-audio-1/ecore_audio_in_eo.inc}                  // io. -> ecore_audio_eo
  {$include ecore-audio-1/ecore_audio_in_sndfile_eo.inc}          // io.
  {$include ecore-audio-1/ecore_audio_in_tone_eo.inc}             // io.
  {$include ecore-audio-1/ecore_audio_out_eo.inc}                 // io. -> ecore_audio_in_eo
  {$include ecore-audio-1/ecore_audio_out_pulse_eo.inc}           // io.
  {$include ecore-audio-1/ecore_audio_out_sndfile_eo.inc}         // io.
  {$include ecore-audio-1/ecore_audio_out_wasapi_eo.inc}          // io.
  {$include ecore-audio-1/ecore_audio_obj_in_tone.inc}            // io.
{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
  {$include ecore-audio-1/Ecore_Audio.inc}                        // io.
  {$include ecore-audio-1/ecore_audio_eo.inc}                     // io.
  {$include ecore-audio-1/ecore_audio_in_eo.inc}                  // io. -> ecore_audio_eo
  {$include ecore-audio-1/ecore_audio_in_sndfile_eo.inc}          // io.
  {$include ecore-audio-1/ecore_audio_in_tone_eo.inc}             // io.
  {$include ecore-audio-1/ecore_audio_out_eo.inc}                 // io. -> ecore_audio_in_eo
  {$include ecore-audio-1/ecore_audio_out_pulse_eo.inc}           // io.
  {$include ecore-audio-1/ecore_audio_out_sndfile_eo.inc}         // io.
  {$include ecore-audio-1/ecore_audio_out_wasapi_eo.inc}          // io.
  {$include ecore-audio-1/ecore_audio_obj_in_tone.inc}            // io.
{$UNDEF read_implementation}

end.

