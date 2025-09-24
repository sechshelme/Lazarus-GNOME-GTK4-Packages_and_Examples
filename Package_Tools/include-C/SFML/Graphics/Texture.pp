
unit Texture;
interface

{
  Automatically converted by H2Pas 1.0.0 from Texture.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Texture.h
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
PsfImage  = ^sfImage;
PsfInputStream  = ^sfInputStream;
PsfIntRect  = ^sfIntRect;
PsfRenderWindow  = ^sfRenderWindow;
PsfTexture  = ^sfTexture;
PsfTextureCoordinateType  = ^sfTextureCoordinateType;
PsfUint8  = ^sfUint8;
PsfWindow  = ^sfWindow;
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
{$ifndef SFML_TEXTURE_H}
{$define SFML_TEXTURE_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Graphics/Export.h>}
{$include <SFML/Graphics/Rect.h>}
{$include <SFML/Graphics/Types.h>}
{$include <SFML/Window/Types.h>}
{$include <SFML/System/InputStream.h>}
{$include <SFML/System/Vector2.h>}
{$include <stddef.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Types of texture coordinates that can be used for rendering. }
{/ }
{////////////////////////////////////////////////////////// }
{/< sfTexture coordinates in range [0 .. 1]. }
{/< sfTexture coordinates in range [0 .. size]. }
type
  PsfTextureCoordinateType = ^TsfTextureCoordinateType;
  TsfTextureCoordinateType =  Longint;
  Const
    sfTextureNormalized = 0;
    sfTexturePixels = 1;
;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new texture }
{/ }
{/ \param width  Texture width }
{/ \param height Texture height }
{/ }
{/ \return A new sfTexture object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }

function sfTexture_create(width:dword; height:dword):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new texture from a file }
{/ }
{/ \param filename Path of the image file to load }
{/ \param area     Area of the source image to load (NULL to load the entire image) }
{/ }
{/ \return A new sfTexture object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfTexture_createFromFile(filename:Pchar; area:PsfIntRect):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new sRGB-enabled texture from a file }
{/ }
{/ When providing texture data from an image file or memory, it can }
{/ either be stored in a linear color space or an sRGB color space. }
{/ Most digital images account for gamma correction already, so they }
{/ would need to be "uncorrected" back to linear color space before }
{/ being processed by the hardware. The hardware can automatically }
{/ convert it from the sRGB color space to a linear color space when }
{/ it gets sampled. When the rendered image gets output to the final }
{/ framebuffer, it gets converted back to sRGB. }
{/ }
{/ This load option is only useful in conjunction with an sRGB capable }
{/ framebuffer. This can be requested during window creation. }
{/ }
{/ \param filename Path of the image file to load }
{/ \param area     Area of the source image to load (NULL to load the entire image) }
{/ }
{/ \return A new sfTexture object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfTexture_createSrgbFromFile(filename:Pchar; area:PsfIntRect):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new texture from a file in memory }
{/ }
{/ \param data        Pointer to the file data in memory }
{/ \param sizeInBytes Size of the data to load, in bytes }
{/ \param area        Area of the source image to load (NULL to load the entire image) }
{/ }
{/ \return A new sfTexture object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfTexture_createFromMemory(data:pointer; sizeInBytes:Tsize_t; area:PsfIntRect):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new sRGB-enabled texture from a file in memory }
{/ }
{/ \param data        Pointer to the file data in memory }
{/ \param sizeInBytes Size of the data to load, in bytes }
{/ \param area        Area of the source image to load (NULL to load the entire image) }
{/ }
{/ \return A new sfTexture object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfTexture_createSrgbFromMemory(data:pointer; sizeInBytes:Tsize_t; area:PsfIntRect):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new texture from a custom stream }
{/ }
{/ \param stream Source stream to read from }
{/ \param area   Area of the source image to load (NULL to load the entire image) }
{/ }
{/ \return A new sfTexture object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTexture_createFromStream(stream:PsfInputStream; area:PsfIntRect):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new sRGB-enabled texture from a custom stream }
{/ }
{/ \param stream Source stream to read from }
{/ \param area   Area of the source image to load (NULL to load the entire image) }
{/ }
{/ \return A new sfTexture object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTexture_createSrgbFromStream(stream:PsfInputStream; area:PsfIntRect):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new texture from an image }
{/ }
{/ \param image Image to upload to the texture }
{/ \param area  Area of the source image to load (NULL to load the entire image) }
{/ }
{/ \return A new sfTexture object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfTexture_createFromImage(image:PsfImage; area:PsfIntRect):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new sRGB-enabled texture from an image }
{/ }
{/ \param image Image to upload to the texture }
{/ \param area  Area of the source image to load (NULL to load the entire image) }
{/ }
{/ \return A new sfTexture object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfTexture_createSrgbFromImage(image:PsfImage; area:PsfIntRect):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Copy an existing texture }
{/ }
{/ \param texture Texture to copy }
{/ }
{/ \return Copied object }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTexture_copy(texture:PsfTexture):PsfTexture;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy an existing texture }
{/ }
{/ \param texture Texture to delete }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfTexture_destroy(texture:PsfTexture);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Return the size of the texture }
{/ }
{/ \param texture Texture to read }
{/ }
{/ \return Size in pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTexture_getSize(texture:PsfTexture):TsfVector2u;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Copy a texture's pixels to an image }
{/ }
{/ \param texture Texture to copy }
{/ }
{/ \return Image containing the texture's pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTexture_copyToImage(texture:PsfTexture):PsfImage;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Update a texture from an array of pixels }
{/ }
{/ \param texture Texture to update }
{/ \param pixels  Array of pixels to copy to the texture }
{/ \param width   Width of the pixel region contained in \a pixels }
{/ \param height  Height of the pixel region contained in \a pixels }
{/ \param x       X offset in the texture where to copy the source pixels }
{/ \param y       Y offset in the texture where to copy the source pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfTexture_updateFromPixels(texture:PsfTexture; pixels:PsfUint8; width:dword; height:dword; x:dword; 
            y:dword);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Update a part of this texture from another texture }
{/ }
{/ No additional check is performed on the size of the texture, }
{/ passing an invalid combination of texture size and offset }
{/ will lead to an undefined behavior. }
{/ }
{/ This function does nothing if either texture was not }
{/ previously created. }
{/ }
{/ \param destination Destination texture to copy source texture to }
{/ \param source      Source texture to copy to destination texture }
{/ \param x           X offset in this texture where to copy the source texture }
{/ \param y           Y offset in this texture where to copy the source texture }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfTexture_updateFromTexture(destination:PsfTexture; source:PsfTexture; x:dword; y:dword);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Update a texture from an image }
{/ }
{/ \param texture Texture to update }
{/ \param image   Image to copy to the texture }
{/ \param x       X offset in the texture where to copy the source pixels }
{/ \param y       Y offset in the texture where to copy the source pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfTexture_updateFromImage(texture:PsfTexture; image:PsfImage; x:dword; y:dword);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Update a texture from the contents of a window }
{/ }
{/ \param texture Texture to update }
{/ \param window  Window to copy to the texture }
{/ \param x       X offset in the texture where to copy the source pixels }
{/ \param y       Y offset in the texture where to copy the source pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfTexture_updateFromWindow(texture:PsfTexture; window:PsfWindow; x:dword; y:dword);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Update a texture from the contents of a render-window }
{/ }
{/ \param texture      Texture to update }
{/ \param renderWindow Render-window to copy to the texture }
{/ \param x            X offset in the texture where to copy the source pixels }
{/ \param y            Y offset in the texture where to copy the source pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfTexture_updateFromRenderWindow(texture:PsfTexture; renderWindow:PsfRenderWindow; x:dword; y:dword);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Enable or disable the smooth filter on a texture }
{/ }
{/ \param texture The texture object }
{/ \param smooth  sfTrue to enable smoothing, sfFalse to disable it }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfTexture_setSmooth(texture:PsfTexture; smooth:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether the smooth filter is enabled or not for a texture }
{/ }
{/ \param texture The texture object }
{/ }
{/ \return sfTrue if smoothing is enabled, sfFalse if it is disabled }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTexture_isSmooth(texture:PsfTexture):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether the texture source is converted from sRGB or not }
{/ }
{/ \return True if the texture source is converted from sRGB, false if not }
{/ }
{/ \see sfTexture_createSrgbFromFile }
{/ \see sfTexture_createSrgbFromMemory }
{/ \see sfTexture_createSrgbFromStream }
{/ \see sfTexture_createSrgbFromImage }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTexture_isSrgb(texture:PsfTexture):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Enable or disable repeating for a texture }
{/ }
{/ Repeating is involved when using texture coordinates }
{/ outside the texture rectangle [0, 0, width, height]. }
{/ In this case, if repeat mode is enabled, the whole texture }
{/ will be repeated as many times as needed to reach the }
{/ coordinate (for example, if the X texture coordinate is }
{/ 3 * width, the texture will be repeated 3 times). }
{/ If repeat mode is disabled, the "extra space" will instead }
{/ be filled with border pixels. }
{/ Warning: on very old graphics cards, white pixels may appear }
{/ when the texture is repeated. With such cards, repeat mode }
{/ can be used reliably only if the texture has power-of-two }
{/ dimensions (such as 256x128). }
{/ Repeating is disabled by default. }
{/ }
{/ \param texture  The texture object }
{/ \param repeated True to repeat the texture, false to disable repeating }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfTexture_setRepeated(texture:PsfTexture; repeated:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether a texture is repeated or not }
{/ }
{/ \param texture The texture object }
{/ }
{/ \return sfTrue if repeat mode is enabled, sfFalse if it is disabled }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTexture_isRepeated(texture:PsfTexture):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Generate a mipmap using the current texture data }
{/ }
{/ Mipmaps are pre-computed chains of optimized textures. Each }
{/ level of texture in a mipmap is generated by halving each of }
{/ the previous level's dimensions. This is done until the final }
{/ level has the size of 1x1. The textures generated in this process may }
{/ make use of more advanced filters which might improve the visual quality }
{/ of textures when they are applied to objects much smaller than they are. }
{/ This is known as minification. Because fewer texels (texture elements) }
{/ have to be sampled from when heavily minified, usage of mipmaps }
{/ can also improve rendering performance in certain scenarios. }
{/ }
{/ Mipmap generation relies on the necessary OpenGL extension being }
{/ available. If it is unavailable or generation fails due to another }
{/ reason, this function will return false. Mipmap data is only valid from }
{/ the time it is generated until the next time the base level image is }
{/ modified, at which point this function will have to be called again to }
{/ regenerate it. }
{/ }
{/ \return sfTrue if mipmap generation was successful, sfFalse if unsuccessful }
{/ }
{////////////////////////////////////////////////////////// }
function sfTexture_generateMipmap(texture:PsfTexture):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Swap the contents of a texture with those of another }
{/ }
{/ \param left  Instance to swap from }
{/ \param right Instance to swap with }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfTexture_swap(left:PsfTexture; right:PsfTexture);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the underlying OpenGL handle of the texture. }
{/ }
{/ You shouldn't need to use this function, unless you have }
{/ very specific stuff to implement that SFML doesn't support, }
{/ or implement a temporary workaround until a bug is fixed. }
{/ }
{/ \param texture The texture object }
{/ }
{/ \return OpenGL handle of the texture or 0 if not yet created }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfTexture_getNativeHandle(texture:PsfTexture):dword;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Bind a texture for rendering }
{/ }
{/ This function is not part of the graphics API, it mustn't be }
{/ used when drawing SFML entities. It must be used only if you }
{/ mix sfTexture with OpenGL code. }
{/ }
{/ \code }
{/ sfTexture *t1, *t2; }
{/ ... }
{/ sfTexture_bind(t1); }
{/ // draw OpenGL stuff that use t1... }
{/ sfTexture_bind(t2); }
{/ // draw OpenGL stuff that use t2... }
{/ sfTexture_bind(NULL); }
{/ // draw OpenGL stuff that use no texture... }
{/ \endcode }
{/ }
{/ \param texture Pointer to the texture to bind, can be null to use no texture }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfTexture_bind(texture:PsfTexture; _type:TsfTextureCoordinateType);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the maximum texture size allowed }
{/ }
{/ \return Maximum size allowed for textures, in pixels }
{/ }
{////////////////////////////////////////////////////////// }
function sfTexture_getMaximumSize:dword;cdecl;external;
{$endif}
{ SFML_TEXTURE_H }

implementation


end.
