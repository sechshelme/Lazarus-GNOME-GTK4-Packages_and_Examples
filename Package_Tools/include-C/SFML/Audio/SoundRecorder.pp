
unit SoundRecorder;
interface

{
  Automatically converted by H2Pas 1.0.0 from SoundRecorder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SoundRecorder.h
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
PsfInt16  = ^sfInt16;
PsfSoundRecorder  = ^sfSoundRecorder;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{////////////////////////////////////////////////////////// }
{ }
{ SFML - Simple and Fast Multimedia Library }
{ Copyright (C) 2007-2023 Laurent Gomila (laurent@sfml-dev.org) }
{ }
{ This software is provided 'as-is', without any express or implied warranty. }
{ In no event will the authors be held liable for any damages arising from the use of this software. }
{ }
{ Permission is granted to anyone to use this software for any purpose, }
{ including commercial applications, and to alter it and redistribute it freely, }
{ subject to the following restrictions: }
{ }
{ 1. The origin of this software must not be misrepresented; }
{    you must not claim that you wrote the original software. }
{    If you use this software in a product, an acknowledgment }
{    in the product documentation would be appreciated but is not required. }
{ }
{ 2. Altered source versions must be plainly marked as such, }
{    and must not be misrepresented as being the original software. }
{ }
{ 3. This notice may not be removed or altered from any source distribution. }
{ }
{////////////////////////////////////////////////////////// }
{$ifndef SFML_SOUNDRECORDER_H}
{$define SFML_SOUNDRECORDER_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Audio/Export.h>}
{$include <SFML/Audio/Types.h>}
{$include <SFML/System/Time.h>}
{$include <stddef.h>}
type

  TsfSoundRecorderStartCallback = function (para1:pointer):TsfBool;cdecl;
{/< Type of the callback used when starting a capture }
(* Const before type ignored *)

  TsfSoundRecorderProcessCallback = function (para1:PsfInt16; para2:Tsize_t; para3:pointer):TsfBool;cdecl;
{/< Type of the callback used to process audio data }

  TsfSoundRecorderStopCallback = procedure (para1:pointer);cdecl;
{/< Type of the callback used when stopping a capture }
{////////////////////////////////////////////////////////// }
{/ \brief Construct a new sound recorder from callback functions }
{/ }
{/ \param onStart   Callback function which will be called when a new capture starts (can be NULL) }
{/ \param onProcess Callback function which will be called each time there's audio data to process }
{/ \param onStop    Callback function which will be called when the current capture stops (can be NULL) }
{/ \param userData  Data to pass to the callback function (can be NULL) }
{/ }
{/ \return A new sfSoundRecorder object (NULL if failed) }
{/ }
{////////////////////////////////////////////////////////// }

function sfSoundRecorder_create(onStart:TsfSoundRecorderStartCallback; onProcess:TsfSoundRecorderProcessCallback; onStop:TsfSoundRecorderStopCallback; userData:pointer):PsfSoundRecorder;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a sound recorder }
{/ }
{/ \param soundRecorder Sound recorder to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfSoundRecorder_destroy(soundRecorder:PsfSoundRecorder);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Start the capture of a sound recorder }
{/ }
{/ The \a sampleRate parameter defines the number of audio samples }
{/ captured per second. The higher, the better the quality }
{/ (for example, 44100 samples/sec is CD quality). }
{/ This function uses its own thread so that it doesn't block }
{/ the rest of the program while the capture runs. }
{/ Please note that only one capture can happen at the same time. }
{/ }
{/ \param soundRecorder Sound recorder object }
{/ \param sampleRate    Desired capture rate, in number of samples per second }
{/ }
{/ \return True, if start of capture was successful }
{/ }
{////////////////////////////////////////////////////////// }
function sfSoundRecorder_start(soundRecorder:PsfSoundRecorder; sampleRate:dword):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Stop the capture of a sound recorder }
{/ }
{/ \param soundRecorder Sound recorder object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfSoundRecorder_stop(soundRecorder:PsfSoundRecorder);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the sample rate of a sound recorder }
{/ }
{/ The sample rate defines the number of audio samples }
{/ captured per second. The higher, the better the quality }
{/ (for example, 44100 samples/sec is CD quality). }
{/ }
{/ \param soundRecorder Sound recorder object }
{/ }
{/ \return Sample rate, in samples per second }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundRecorder_getSampleRate(soundRecorder:PsfSoundRecorder):dword;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Check if the system supports audio capture }
{/ }
{/ This function should always be called before using }
{/ the audio capture features. If it returns false, then }
{/ any attempt to use sfSoundRecorder will fail. }
{/ }
{/ \return sfTrue if audio capture is supported, sfFalse otherwise }
{/ }
{////////////////////////////////////////////////////////// }
function sfSoundRecorder_isAvailable:TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the processing interval }
{/ }
{/ The processing interval controls the period }
{/ between calls to the onProcessSamples function. You may }
{/ want to use a small interval if you want to process the }
{/ recorded data in real time, for example. }
{/ }
{/ Note: this is only a hint, the actual period may vary. }
{/ So don't rely on this parameter to implement precise timing. }
{/ }
{/ The default processing interval is 100 ms. }
{/ }
{/ \param soundRecorder Sound recorder object }
{/ \param interval      Processing interval }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfSoundRecorder_setProcessingInterval(soundRecorder:PsfSoundRecorder; interval:TsfTime);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get a list of the names of all availabe audio capture devices }
{/ }
{/ This function returns an array of strings (null terminated), }
{/ containing the names of all availabe audio capture devices. }
{/ If no devices are available then NULL is returned. }
{/ }
{/ \param count Pointer to a variable that will be filled with the number of modes in the array }
{/ }
{/ \return An array of strings containing the names }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundRecorder_getAvailableDevices(count:Psize_t):^Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the name of the default audio capture device }
{/ }
{/ This function returns the name of the default audio }
{/ capture device. If none is available, NULL is returned. }
{/ }
{/ \return The name of the default audio capture device (null terminated) }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundRecorder_getDefaultDevice:Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the audio capture device }
{/ }
{/ This function sets the audio capture device to the device }
{/ with the given name. It can be called on the fly (i.e: }
{/ while recording). If you do so while recording and }
{/ opening the device fails, it stops the recording. }
{/ }
{/ \param soundRecorder Sound recorder object }
{/ \param name          The name of the audio capture device }
{/ }
{/ \return sfTrue, if it was able to set the requested device }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundRecorder_setDevice(soundRecorder:PsfSoundRecorder; name:Pchar):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the name of the current audio capture device }
{/ }
{/ \param soundRecorder Sound recorder object }
{/ }
{/ \return The name of the current audio capture device }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundRecorder_getDevice(soundRecorder:PsfSoundRecorder):Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the channel count of the audio capture device }
{/ }
{/ This method allows you to specify the number of channels }
{/ used for recording. Currently only 16-bit mono and }
{/ 16-bit stereo are supported. }
{/ }
{/ \param channelCount Number of channels. Currently only }
{/                     mono (1) and stereo (2) are supported. }
{/ }
{/ \see sfSoundRecorder_getChannelCount }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfSoundRecorder_setChannelCount(soundRecorder:PsfSoundRecorder; channelCount:dword);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the number of channels used by this recorder }
{/ }
{/ Currently only mono and stereo are supported, so the }
{/ value is either 1 (for mono) or 2 (for stereo). }
{/ }
{/ \return Number of channels }
{/ }
{/ \see sfSoundRecorder_setChannelCount }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundRecorder_getChannelCount(soundRecorder:PsfSoundRecorder):dword;cdecl;external;
{$endif}
{ SFML_SOUNDRECORDER_H }

implementation


end.
