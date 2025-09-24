
unit Music;
interface

{
  Automatically converted by H2Pas 1.0.0 from Music.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Music.h
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
PsfMusic  = ^sfMusic;
PsfTimeSpan  = ^sfTimeSpan;
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
{$ifndef SFML_MUSIC_H}
{$define SFML_MUSIC_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Audio/Export.h>}
{$include <SFML/Audio/SoundStatus.h>}
{$include <SFML/Audio/Types.h>}
{$include <SFML/System/InputStream.h>}
{$include <SFML/System/Time.h>}
{$include <SFML/System/Vector3.h>}
{$include <stddef.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Structure defining a time range }
{/ }
{////////////////////////////////////////////////////////// }
{/< The beginning offset of the time range }
{/< The length of the time range }
type
  PsfTimeSpan = ^TsfTimeSpan;
  TsfTimeSpan = record
      offset : TsfTime;
      length : TsfTime;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new music and load it from a file }
{/ }
{/ This function doesn't start playing the music (call }
{/ sfMusic_play to do so). }
{/ Here is a complete list of all the supported audio formats: }
{/ ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam, }
{/ w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64. }
{/ }
{/ \param filename Path of the music file to open }
{/ }
{/ \return A new sfMusic object (NULL if failed) }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)

function sfMusic_createFromFile(filename:Pchar):PsfMusic;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new music and load it from a file in memory }
{/ }
{/ This function doesn't start playing the music (call }
{/ sfMusic_play to do so). }
{/ Here is a complete list of all the supported audio formats: }
{/ ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam, }
{/ w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64. }
{/ }
{/ \param data        Pointer to the file data in memory }
{/ \param sizeInBytes Size of the data to load, in bytes }
{/ }
{/ \return A new sfMusic object (NULL if failed) }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_createFromMemory(data:pointer; sizeInBytes:Tsize_t):PsfMusic;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new music and load it from a custom stream }
{/ }
{/ This function doesn't start playing the music (call }
{/ sfMusic_play to do so). }
{/ Here is a complete list of all the supported audio formats: }
{/ ogg, wav, flac, mp3, aiff, au, raw, paf, svx, nist, voc, ircam, }
{/ w64, mat4, mat5 pvf, htk, sds, avr, sd2, caf, wve, mpc2k, rf64. }
{/ }
{/ \param stream Source stream to read from }
{/ }
{/ \return A new sfMusic object (NULL if failed) }
{/ }
{////////////////////////////////////////////////////////// }
function sfMusic_createFromStream(stream:PsfInputStream):PsfMusic;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a music }
{/ }
{/ \param music Music to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_destroy(music:PsfMusic);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set whether or not a music should loop after reaching the end }
{/ }
{/ If set, the music will restart from beginning after }
{/ reaching the end and so on, until it is stopped or }
{/ sfMusic_setLoop(music, sfFalse) is called. }
{/ The default looping state for musics is false. }
{/ }
{/ \param music Music object }
{/ \param loop  sfTrue to play in loop, sfFalse to play once }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_setLoop(music:PsfMusic; loop:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether or not a music is in loop mode }
{/ }
{/ \param music Music object }
{/ }
{/ \return sfTrue if the music is looping, sfFalse otherwise }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getLoop(music:PsfMusic):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the total duration of a music }
{/ }
{/ \param music Music object }
{/ }
{/ \return Music duration }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getDuration(music:PsfMusic):TsfTime;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the positions of the of the sound's looping sequence }
{/ }
{/ \return Loop Time position class. }
{/ }
{/ \warning Since sfMusic_setLoopPoints() performs some adjustments on the }
{/ provided values and rounds them to internal samples, a call to }
{/ sfMusic_getLoopPoints() is not guaranteed to return the same times passed }
{/ into a previous call to sfMusic_setLoopPoints(). However, it is guaranteed }
{/ to return times that will map to the valid internal samples of }
{/ this Music if they are later passed to sfMusic_setLoopPoints(). }
{/ }
{/ \see setLoopPoints }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getLoopPoints(music:PsfMusic):TsfTimeSpan;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Sets the beginning and end of the sound's looping sequence using sf::Time }
{/ }
{/ Loop points allow one to specify a pair of positions such that, when the music }
{/ is enabled for looping, it will seamlessly seek to the beginning whenever it }
{/ encounters the end. Valid ranges for timePoints.offset and timePoints.length are }
{/ [0, Dur) and (0, Dur-offset] respectively, where Dur is the value returned by sfMusic_getDuration(). }
{/ Note that the EOF "loop point" from the end to the beginning of the stream is still honored, }
{/ in case the caller seeks to a point after the end of the loop range. This function can be }
{/ safely called at any point after a stream is opened, and will be applied to a playing sound }
{/ without affecting the current playing offset. }
{/ }
{/ \warning Setting the loop points while the stream's status is Paused }
{/ will set its status to Stopped. The playing offset will be unaffected. }
{/ }
{/ \param timePoints The definition of the loop. Can be any time points within the sound's length }
{/ }
{/ \see getLoopPoints }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_setLoopPoints(music:PsfMusic; timePoints:TsfTimeSpan);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Start or resume playing a music }
{/ }
{/ This function starts the music if it was stopped, resumes }
{/ it if it was paused, and restarts it from beginning if it }
{/ was it already playing. }
{/ This function uses its own thread so that it doesn't block }
{/ the rest of the program while the music is played. }
{/ }
{/ \param music Music object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_play(music:PsfMusic);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Pause a music }
{/ }
{/ This function pauses the music if it was playing, }
{/ otherwise (music already paused or stopped) it has no effect. }
{/ }
{/ \param music Music object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_pause(music:PsfMusic);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Stop playing a music }
{/ }
{/ This function stops the music if it was playing or paused, }
{/ and does nothing if it was already stopped. }
{/ It also resets the playing position (unlike sfMusic_pause). }
{/ }
{/ \param music Music object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_stop(music:PsfMusic);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Return the number of channels of a music }
{/ }
{/ 1 channel means a mono sound, 2 means stereo, etc. }
{/ }
{/ \param music Music object }
{/ }
{/ \return Number of channels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getChannelCount(music:PsfMusic):dword;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the sample rate of a music }
{/ }
{/ The sample rate is the number of audio samples played per }
{/ second. The higher, the better the quality. }
{/ }
{/ \param music Music object }
{/ }
{/ \return Sample rate, in number of samples per second }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getSampleRate(music:PsfMusic):dword;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the current status of a music (stopped, paused, playing) }
{/ }
{/ \param music Music object }
{/ }
{/ \return Current status }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getStatus(music:PsfMusic):TsfSoundStatus;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the current playing position of a music }
{/ }
{/ \param music Music object }
{/ }
{/ \return Current playing position }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getPlayingOffset(music:PsfMusic):TsfTime;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the pitch of a music }
{/ }
{/ The pitch represents the perceived fundamental frequency }
{/ of a sound; thus you can make a music more acute or grave }
{/ by changing its pitch. A side effect of changing the pitch }
{/ is to modify the playing speed of the music as well. }
{/ The default value for the pitch is 1. }
{/ }
{/ \param music Music object }
{/ \param pitch New pitch to apply to the music }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_setPitch(music:PsfMusic; pitch:single);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the volume of a music }
{/ }
{/ The volume is a value between 0 (mute) and 100 (full volume). }
{/ The default value for the volume is 100. }
{/ }
{/ \param music  Music object }
{/ \param volume Volume of the music }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_setVolume(music:PsfMusic; volume:single);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the 3D position of a music in the audio scene }
{/ }
{/ Only musics with one channel (mono musics) can be }
{/ spatialized. }
{/ The default position of a music is (0, 0, 0). }
{/ }
{/ \param music    Music object }
{/ \param position Position of the music in the scene }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_setPosition(music:PsfMusic; position:TsfVector3f);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Make a musics's position relative to the listener or absolute }
{/ }
{/ Making a music relative to the listener will ensure that it will always }
{/ be played the same way regardless the position of the listener. }
{/ This can be useful for non-spatialized musics, musics that are }
{/ produced by the listener, or musics attached to it. }
{/ The default value is false (position is absolute). }
{/ }
{/ \param music    Music object }
{/ \param relative sfTrue to set the position relative, sfFalse to set it absolute }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_setRelativeToListener(music:PsfMusic; relative:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the minimum distance of a music }
{/ }
{/ The "minimum distance" of a music is the maximum }
{/ distance at which it is heard at its maximum volume. Further }
{/ than the minimum distance, it will start to fade out according }
{/ to its attenuation factor. A value of 0 ("inside the head }
{/ of the listener") is an invalid value and is forbidden. }
{/ The default value of the minimum distance is 1. }
{/ }
{/ \param music    Music object }
{/ \param distance New minimum distance of the music }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_setMinDistance(music:PsfMusic; distance:single);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the attenuation factor of a music }
{/ }
{/ The attenuation is a multiplicative factor which makes }
{/ the music more or less loud according to its distance }
{/ from the listener. An attenuation of 0 will produce a }
{/ non-attenuated music, i.e. its volume will always be the same }
{/ whether it is heard from near or from far. On the other hand, }
{/ an attenuation value such as 100 will make the music fade out }
{/ very quickly as it gets further from the listener. }
{/ The default value of the attenuation is 1. }
{/ }
{/ \param music       Music object }
{/ \param attenuation New attenuation factor of the music }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_setAttenuation(music:PsfMusic; attenuation:single);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Change the current playing position of a music }
{/ }
{/ The playing position can be changed when the music is }
{/ either paused or playing. }
{/ }
{/ \param music      Music object }
{/ \param timeOffset New playing position }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfMusic_setPlayingOffset(music:PsfMusic; timeOffset:TsfTime);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the pitch of a music }
{/ }
{/ \param music Music object }
{/ }
{/ \return Pitch of the music }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getPitch(music:PsfMusic):single;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the volume of a music }
{/ }
{/ \param music Music object }
{/ }
{/ \return Volume of the music, in the range [0, 100] }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getVolume(music:PsfMusic):single;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the 3D position of a music in the audio scene }
{/ }
{/ \param music Music object }
{/ }
{/ \return Position of the music in the world }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getPosition(music:PsfMusic):TsfVector3f;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether a music's position is relative to the }
{/        listener or is absolute }
{/ }
{/ \param music Music object }
{/ }
{/ \return sfTrue if the position is relative, sfFalse if it's absolute }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_isRelativeToListener(music:PsfMusic):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the minimum distance of a music }
{/ }
{/ \param music Music object }
{/ }
{/ \return Minimum distance of the music }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getMinDistance(music:PsfMusic):single;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the attenuation factor of a music }
{/ }
{/ \param music Music object }
{/ }
{/ \return Attenuation factor of the music }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfMusic_getAttenuation(music:PsfMusic):single;cdecl;external;
{$endif}
{ SFML_MUSIC_H }

implementation


end.
