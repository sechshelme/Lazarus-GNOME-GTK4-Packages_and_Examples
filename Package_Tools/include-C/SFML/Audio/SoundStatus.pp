
unit SoundStatus;
interface

{
  Automatically converted by H2Pas 1.0.0 from SoundStatus.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SoundStatus.h
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
PsfSoundStatus  = ^sfSoundStatus;
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
{$ifndef SFML_SOUNDSTATUS_H}
{$define SFML_SOUNDSTATUS_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Audio/Export.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Enumeration of statuses for sounds and musics }
{/ }
{////////////////////////////////////////////////////////// }
{/< Sound / music is not playing }
{/< Sound / music is paused }
{/< Sound / music is playing }
type
  PsfSoundStatus = ^TsfSoundStatus;
  TsfSoundStatus =  Longint;
  Const
    sfStopped = 0;
    sfPaused = 1;
    sfPlaying = 2;
;
{$endif}
{ SFML_SOUNDSTATUS_H }

implementation


end.
