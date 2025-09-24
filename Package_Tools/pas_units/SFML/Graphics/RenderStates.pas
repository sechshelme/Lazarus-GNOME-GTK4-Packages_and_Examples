unit RenderStates;

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
{$ifndef SFML_RENDERSTATES_H}
{$define SFML_RENDERSTATES_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Graphics/Export.h>}
{$include <SFML/Graphics/BlendMode.h>}
{$include <SFML/Graphics/Transform.h>}
{$include <SFML/Graphics/Types.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Define the states used for drawing to a RenderTarget }
{/ }
{////////////////////////////////////////////////////////// }
{/< Blending mode }
{/< Transform }
{/< Texture }
{/< Shader }
type
  PsfRenderStates = ^TsfRenderStates;
  TsfRenderStates = record
      blendMode : TsfBlendMode;
      transform : TsfTransform;
      texture : PsfTexture;
      shader : PsfShader;
    end;
{////////////////////////////////////////////////////////// }
{/ \brief Define the default values for a RenderState }
{/ }
{////////////////////////////////////////////////////////// }

function sfRenderStates_default:TsfRenderStates;cdecl;external libsfml_graphics;
{$endif}
{ SFML_RENDERSTATES_H }

// === Konventiert am: 24-9-25 16:55:14 ===


implementation



end.
