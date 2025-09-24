unit Glsl;

interface

uses
  fp_sfml;

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
{$ifndef SFML_GLSL_H}
{$define SFML_GLSL_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Graphics/Transform.h>}
{$include <SFML/Graphics/Color.h>}
{$include <SFML/System/Vector2.h>}
{$include <SFML/System/Vector3.h>}
{ 2D vectors }
type
  PsfGlslVec2 = ^TsfGlslVec2;
  TsfGlslVec2 = TsfVector2f;

  PsfGlslIvec2 = ^TsfGlslIvec2;
  TsfGlslIvec2 = TsfVector2i;

  PsfGlslBvec2 = ^TsfGlslBvec2;
  TsfGlslBvec2 = record
      x : TsfBool;
      y : TsfBool;
    end;
{ 3D vectors }

  PsfGlslVec3 = ^TsfGlslVec3;
  TsfGlslVec3 = TsfVector3f;

  PsfGlslIvec3 = ^TsfGlslIvec3;
  TsfGlslIvec3 = record
      x : longint;
      y : longint;
      z : longint;
    end;

  PsfGlslBvec3 = ^TsfGlslBvec3;
  TsfGlslBvec3 = record
      x : TsfBool;
      y : TsfBool;
      z : TsfBool;
    end;
{ 4D vectors }

  PsfGlslVec4 = ^TsfGlslVec4;
  TsfGlslVec4 = record
      x : single;
      y : single;
      z : single;
      w : single;
    end;

  PsfGlslIvec4 = ^TsfGlslIvec4;
  TsfGlslIvec4 = record
      x : longint;
      y : longint;
      z : longint;
      w : longint;
    end;

  PsfGlslBvec4 = ^TsfGlslBvec4;
  TsfGlslBvec4 = record
      x : TsfBool;
      y : TsfBool;
      z : TsfBool;
      w : TsfBool;
    end;
{ matrices }

  PsfGlslMat3 = ^TsfGlslMat3;
  TsfGlslMat3 = record
      array : array[0..(3*3)-1] of single;
    end;

  PsfGlslMat4 = ^TsfGlslMat4;
  TsfGlslMat4 = record
      array : array[0..(4*4)-1] of single;
    end;
{$endif}
{ SFML_GLSL_H }

// === Konventiert am: 24-9-25 16:55:34 ===


implementation



end.
