
unit Config;
interface

{
  Automatically converted by H2Pas 1.0.0 from Config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Config.h
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
PsfBool  = ^sfBool;
PsfInt16  = ^sfInt16;
PsfInt32  = ^sfInt32;
PsfInt64  = ^sfInt64;
PsfInt8  = ^sfInt8;
PsfUint16  = ^sfUint16;
PsfUint32  = ^sfUint32;
PsfUint64  = ^sfUint64;
PsfUint8  = ^sfUint8;
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
{$ifndef SFML_CONFIG_H}
{$define SFML_CONFIG_H}
{////////////////////////////////////////////////////////// }
{ Define the CSFML version }
{////////////////////////////////////////////////////////// }

const
  CSFML_VERSION_MAJOR = 2;  
  CSFML_VERSION_MINOR = 6;  
  CSFML_VERSION_PATCH = 0;  
{////////////////////////////////////////////////////////// }
{ Check if we need to mark functions as extern "C" }
{////////////////////////////////////////////////////////// }
{////////////////////////////////////////////////////////// }
{ Identify the operating system }
{////////////////////////////////////////////////////////// }
{$if defined(_WIN32) || defined(__WIN32__)}
{ Windows }
{$define CSFML_SYSTEM_WINDOWS}
(*** was #elif ****){$else defined(linux) || defined(__linux)}
{ Linux }
{$define CSFML_SYSTEM_LINUX}
(*** was #elif ****){$else defined(__APPLE__) || defined(MACOSX) || defined(macintosh) || defined(Macintosh)}
{ MacOS }
{$define CSFML_SYSTEM_MACOS}
(*** was #elif ****){$else defined(__FreeBSD__) || defined(__FreeBSD_kernel__)}
{ FreeBSD }
{$define CSFML_SYSTEM_FREEBSD}
{$else}
{ Unsupported system }
{$error This operating system is not supported by SFML library}
{$endif}
{////////////////////////////////////////////////////////// }
{ Define helpers to create portable import / export macros for each module }
{////////////////////////////////////////////////////////// }
{////////////////////////////////////////////////////////// }
{ Cross-platform warning for deprecated functions and classes }
{ }
{ Usage: }
{ struct CSFML_DEPRECATED MyStruct }
{  }
{     ... }
{ ; }
{ }
{ CSFML_DEPRECATED void globalFunc(void); }
{////////////////////////////////////////////////////////// }
{////////////////////////////////////////////////////////// }
{ Define a portable boolean type }
{////////////////////////////////////////////////////////// }
type
  PsfBool = ^TsfBool;
  TsfBool = longint;

const
  sfFalse = 0;  
  sfTrue = 1;  
{////////////////////////////////////////////////////////// }
{ Define portable fixed-size types }
{////////////////////////////////////////////////////////// }
{ All "common" platforms use the same size for char, short and int }
{ (basically there are 3 types for 3 sizes, so no other match is possible), }
{ we can use them without doing any kind of check }
{ 8 bits integer types }
type
  PsfInt8 = ^TsfInt8;
  TsfInt8 = char;

  PsfUint8 = ^TsfUint8;
  TsfUint8 = byte;
{ 16 bits integer types }

  PsfInt16 = ^TsfInt16;
  TsfInt16 = smallint;

  PsfUint16 = ^TsfUint16;
  TsfUint16 = word;
{ 32 bits integer types }

  PsfInt32 = ^TsfInt32;
  TsfInt32 = longint;

  PsfUint32 = ^TsfUint32;
  TsfUint32 = dword;
{ 64 bits integer types }

  PsfInt64 = ^TsfInt64;
  TsfInt64 = int64;

  PsfUint64 = ^TsfUint64;
  TsfUint64 = qword;
{$endif}
{ SFML_CONFIG_H }

implementation


end.
