
unit Time;
interface

{
  Automatically converted by H2Pas 1.0.0 from Time.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Time.h
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
PsfTime  = ^sfTime;
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
{$ifndef SFML_TIME_H}
{$define SFML_TIME_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/System/Export.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Represents a time value }
{/ }
{////////////////////////////////////////////////////////// }
type
  PsfTime = ^TsfTime;
  TsfTime = record
      microseconds : TsfInt64;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Predefined "zero" time value }
{/ }
{////////////////////////////////////////////////////////// }
  var
    sfTime_Zero : TsfTime;cvar;external;
{////////////////////////////////////////////////////////// }
{/ \brief Return a time value as a number of seconds }
{/ }
{/ \param time Time value }
{/ }
{/ \return Time in seconds }
{/ }
{////////////////////////////////////////////////////////// }

function sfTime_asSeconds(time:TsfTime):single;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Return a time value as a number of milliseconds }
{/ }
{/ \param time Time value }
{/ }
{/ \return Time in milliseconds }
{/ }
{////////////////////////////////////////////////////////// }
function sfTime_asMilliseconds(time:TsfTime):TsfInt32;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Return a time value as a number of microseconds }
{/ }
{/ \param time Time value }
{/ }
{/ \return Time in microseconds }
{/ }
{////////////////////////////////////////////////////////// }
function sfTime_asMicroseconds(time:TsfTime):TsfInt64;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Construct a time value from a number of seconds }
{/ }
{/ \param amount Number of seconds }
{/ }
{/ \return Time value constructed from the amount of seconds }
{/ }
{////////////////////////////////////////////////////////// }
function sfSeconds(amount:single):TsfTime;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Construct a time value from a number of milliseconds }
{/ }
{/ \param amount Number of milliseconds }
{/ }
{/ \return Time value constructed from the amount of milliseconds }
{/ }
{////////////////////////////////////////////////////////// }
function sfMilliseconds(amount:TsfInt32):TsfTime;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Construct a time value from a number of microseconds }
{/ }
{/ \param amount Number of microseconds }
{/ }
{/ \return Time value constructed from the amount of microseconds }
{/ }
{////////////////////////////////////////////////////////// }
function sfMicroseconds(amount:TsfInt64):TsfTime;cdecl;external;
{$endif}
{ SFML_TIME_H }

implementation


end.
