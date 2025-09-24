
unit SoundBuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from SoundBuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SoundBuffer.h
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
PsfInputStream  = ^sfInputStream;
PsfInt16  = ^sfInt16;
PsfSoundBuffer  = ^sfSoundBuffer;
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
{$ifndef SFML_SOUNDBUFFER_H}
{$define SFML_SOUNDBUFFER_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Audio/Export.h>}
{$include <SFML/Audio/Types.h>}
{$include <SFML/System/InputStream.h>}
{$include <SFML/System/Time.h>}
{$include <stddef.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Create a new sound buffer and load it from a file }
{/ }
{/ Here is a complete list of all the supported audio formats: }
{/ ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam, }
{/ w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64. }
{/ }
{/ \param filename Path of the sound file to load }
{/ }
{/ \return A new sfSoundBuffer object (NULL if failed) }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)

function sfSoundBuffer_createFromFile(filename:Pchar):PsfSoundBuffer;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new sound buffer and load it from a file in memory }
{/ }
{/ Here is a complete list of all the supported audio formats: }
{/ ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam, }
{/ w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64. }
{/ }
{/ \param data        Pointer to the file data in memory }
{/ \param sizeInBytes Size of the data to load, in bytes }
{/ }
{/ \return A new sfSoundBuffer object (NULL if failed) }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundBuffer_createFromMemory(data:pointer; sizeInBytes:Tsize_t):PsfSoundBuffer;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new sound buffer and load it from a custom stream }
{/ }
{/ Here is a complete list of all the supported audio formats: }
{/ ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam, }
{/ w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64. }
{/ }
{/ \param stream Source stream to read from }
{/ }
{/ \return A new sfSoundBuffer object (NULL if failed) }
{/ }
{////////////////////////////////////////////////////////// }
function sfSoundBuffer_createFromStream(stream:PsfInputStream):PsfSoundBuffer;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new sound buffer and load it from an array of samples in memory }
{/ }
{/ The assumed format of the audio samples is 16 bits signed integer }
{/ (sfInt16). }
{/ }
{/ \param samples      Pointer to the array of samples in memory }
{/ \param sampleCount  Number of samples in the array }
{/ \param channelCount Number of channels (1 = mono, 2 = stereo, ...) }
{/ \param sampleRate   Sample rate (number of samples to play per second) }
{/ }
{/ \return A new sfSoundBuffer object (NULL if failed) }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundBuffer_createFromSamples(samples:PsfInt16; sampleCount:TsfUint64; channelCount:dword; sampleRate:dword):PsfSoundBuffer;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new sound buffer by copying an existing one }
{/ }
{/ \param soundBuffer Sound buffer to copy }
{/ }
{/ \return A new sfSoundBuffer object which is a copy of \a soundBuffer }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundBuffer_copy(soundBuffer:PsfSoundBuffer):PsfSoundBuffer;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a sound buffer }
{/ }
{/ \param soundBuffer Sound buffer to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfSoundBuffer_destroy(soundBuffer:PsfSoundBuffer);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Save a sound buffer to an audio file }
{/ }
{/ Here is a complete list of all the supported audio formats: }
{/ ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam, }
{/ w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64. }
{/ }
{/ \param soundBuffer Sound buffer object }
{/ \param filename    Path of the sound file to write }
{/ }
{/ \return sfTrue if saving succeeded, sfFalse if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfSoundBuffer_saveToFile(soundBuffer:PsfSoundBuffer; filename:Pchar):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the array of audio samples stored in a sound buffer }
{/ }
{/ The format of the returned samples is 16 bits signed integer }
{/ (sfInt16). The total number of samples in this array }
{/ is given by the sfSoundBuffer_getSampleCount function. }
{/ }
{/ \param soundBuffer Sound buffer object }
{/ }
{/ \return Read-only pointer to the array of sound samples }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfSoundBuffer_getSamples(soundBuffer:PsfSoundBuffer):PsfInt16;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the number of samples stored in a sound buffer }
{/ }
{/ The array of samples can be accessed with the }
{/ sfSoundBuffer_getSamples function. }
{/ }
{/ \param soundBuffer Sound buffer object }
{/ }
{/ \return Number of samples }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundBuffer_getSampleCount(soundBuffer:PsfSoundBuffer):TsfUint64;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the sample rate of a sound buffer }
{/ }
{/ The sample rate is the number of samples played per second. }
{/ The higher, the better the quality (for example, 44100 }
{/ samples/s is CD quality). }
{/ }
{/ \param soundBuffer Sound buffer object }
{/ }
{/ \return Sample rate (number of samples per second) }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundBuffer_getSampleRate(soundBuffer:PsfSoundBuffer):dword;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the number of channels used by a sound buffer }
{/ }
{/ If the sound is mono then the number of channels will }
{/ be 1, 2 for stereo, etc. }
{/ }
{/ \param soundBuffer Sound buffer object }
{/ }
{/ \return Number of channels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundBuffer_getChannelCount(soundBuffer:PsfSoundBuffer):dword;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the total duration of a sound buffer }
{/ }
{/ \param soundBuffer Sound buffer object }
{/ }
{/ \return Sound duration }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfSoundBuffer_getDuration(soundBuffer:PsfSoundBuffer):TsfTime;cdecl;external;
{$endif}
{ SFML_SOUNDBUFFER_H }

implementation


end.
