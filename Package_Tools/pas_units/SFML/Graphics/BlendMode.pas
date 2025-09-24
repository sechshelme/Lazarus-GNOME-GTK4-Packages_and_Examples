unit BlendMode;

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
{$ifndef SFML_BLENDMODE_H}
{$define SFML_BLENDMODE_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Graphics/Export.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Enumeration of the blending factors }
{/ }
{////////////////////////////////////////////////////////// }
{/< (0, 0, 0, 0) }
{/< (1, 1, 1, 1) }
{/< (src.r, src.g, src.b, src.a) }
{/< (1, 1, 1, 1) - (src.r, src.g, src.b, src.a) }
{/< (dst.r, dst.g, dst.b, dst.a) }
{/< (1, 1, 1, 1) - (dst.r, dst.g, dst.b, dst.a) }
{/< (src.a, src.a, src.a, src.a) }
{/< (1, 1, 1, 1) - (src.a, src.a, src.a, src.a) }
{/< (dst.a, dst.a, dst.a, dst.a) }
{/< (1, 1, 1, 1) - (dst.a, dst.a, dst.a, dst.a) }
type
  PsfBlendFactor = ^TsfBlendFactor;
  TsfBlendFactor =  Longint;
  Const
    sfBlendFactorZero = 0;
    sfBlendFactorOne = 1;
    sfBlendFactorSrcColor = 2;
    sfBlendFactorOneMinusSrcColor = 3;
    sfBlendFactorDstColor = 4;
    sfBlendFactorOneMinusDstColor = 5;
    sfBlendFactorSrcAlpha = 6;
    sfBlendFactorOneMinusSrcAlpha = 7;
    sfBlendFactorDstAlpha = 8;
    sfBlendFactorOneMinusDstAlpha = 9;
;
{////////////////////////////////////////////////////////// }
{/ \brief Enumeration of the blending equations }
{/ }
{////////////////////////////////////////////////////////// }
{/< Pixel = Src * SrcFactor + Dst * DstFactor }
{/< Pixel = Src * SrcFactor - Dst * DstFactor }
{/< Pixel = Dst * DstFactor - Src * SrcFactor }
{/< Pixel = min(Dst, Src) }
{/< Pixel = max(Dst, Src) }
type
  PsfBlendEquation = ^TsfBlendEquation;
  TsfBlendEquation =  Longint;
  Const
    sfBlendEquationAdd = 0;
    sfBlendEquationSubtract = 1;
    sfBlendEquationReverseSubtract = 2;
    sfBlendEquationMin = 3;
    sfBlendEquationMax = 4;
;
{////////////////////////////////////////////////////////// }
{/ \brief Blending mode for drawing }
{/ }
{////////////////////////////////////////////////////////// }
{/< Source blending factor for the color channels }
{/< Destination blending factor for the color channels }
{/< Blending equation for the color channels }
{/< Source blending factor for the alpha channel }
{/< Destination blending factor for the alpha channel }
{/< Blending equation for the alpha channel }
type
  PsfBlendMode = ^TsfBlendMode;
  TsfBlendMode = record
      colorSrcFactor : TsfBlendFactor;
      colorDstFactor : TsfBlendFactor;
      colorEquation : TsfBlendEquation;
      alphaSrcFactor : TsfBlendFactor;
      alphaDstFactor : TsfBlendFactor;
      alphaEquation : TsfBlendEquation;
    end;
  var
    sfBlendAlpha : TsfBlendMode;cvar;external libsfml_graphics;
{/< Blend source and dest according to dest alpha }
    sfBlendAdd : TsfBlendMode;cvar;external libsfml_graphics;
{/< Add source to dest }
    sfBlendMultiply : TsfBlendMode;cvar;external libsfml_graphics;
{/< Multiply source and dest }
    sfBlendMin : TsfBlendMode;cvar;external libsfml_graphics;
{/< Take minimum between source and dest }
    sfBlendMax : TsfBlendMode;cvar;external libsfml_graphics;
{/< Take maximum between source and dest }
    sfBlendNone : TsfBlendMode;cvar;external libsfml_graphics;
{/< Overwrite dest with source }
{$endif}
{ SFML_BLENDMODE_H }

// === Konventiert am: 24-9-25 16:55:55 ===


implementation



end.
