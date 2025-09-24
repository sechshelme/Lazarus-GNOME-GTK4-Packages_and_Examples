
unit Image;
interface

{
  Automatically converted by H2Pas 1.0.0 from Image.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Image.h
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
PsfBuffer  = ^sfBuffer;
PsfImage  = ^sfImage;
PsfInputStream  = ^sfInputStream;
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
{$ifndef SFML_IMAGE_H}
{$define SFML_IMAGE_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Graphics/Export.h>}
{$include <SFML/Graphics/Color.h>}
{$include <SFML/Graphics/Rect.h>}
{$include <SFML/Graphics/Types.h>}
{$include <SFML/System/Buffer.h>}
{$include <SFML/System/InputStream.h>}
{$include <SFML/System/Vector2.h>}
{$include <stddef.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Create an image }
{/ }
{/ This image is filled with black pixels. }
{/ }
{/ \param width  Width of the image }
{/ \param height Height of the image }
{/ }
{/ \return A new sfImage object }
{/ }
{////////////////////////////////////////////////////////// }

function sfImage_create(width:dword; height:dword):PsfImage;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create an image and fill it with a unique color }
{/ }
{/ \param width  Width of the image }
{/ \param height Height of the image }
{/ \param color  Fill color }
{/ }
{/ \return A new sfImage object }
{/ }
{////////////////////////////////////////////////////////// }
function sfImage_createFromColor(width:dword; height:dword; color:TsfColor):PsfImage;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create an image from an array of pixels }
{/ }
{/ The \a pixel array is assumed to contain 32-bits RGBA pixels, }
{/ and have the given \a width and \a height. If not, this is }
{/ an undefined behaviour. }
{/ If \a pixels is null, an empty image is created. }
{/ }
{/ \param width  Width of the image }
{/ \param height Height of the image }
{/ \param pixels Array of pixels to copy to the image }
{/ }
{/ \return A new sfImage object }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfImage_createFromPixels(width:dword; height:dword; pixels:PsfUint8):PsfImage;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create an image from a file on disk }
{/ }
{/ The supported image formats are bmp, png, tga, jpg, gif, }
{/ psd, hdr and pic. Some format options are not supported, }
{/ like progressive jpeg. }
{/ If this function fails, the image is left unchanged. }
{/ }
{/ \param filename Path of the image file to load }
{/ }
{/ \return A new sfImage object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfImage_createFromFile(filename:Pchar):PsfImage;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create an image from a file in memory }
{/ }
{/ The supported image formats are bmp, png, tga, jpg, gif, }
{/ psd, hdr and pic. Some format options are not supported, }
{/ like progressive jpeg. }
{/ If this function fails, the image is left unchanged. }
{/ }
{/ \param data Pointer to the file data in memory }
{/ \param size Size of the data to load, in bytes }
{/ }
{/ \return A new sfImage object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfImage_createFromMemory(data:pointer; size:Tsize_t):PsfImage;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create an image from a custom stream }
{/ }
{/ The supported image formats are bmp, png, tga, jpg, gif, }
{/ psd, hdr and pic. Some format options are not supported, }
{/ like progressive jpeg. }
{/ If this function fails, the image is left unchanged. }
{/ }
{/ \param stream Source stream to read from }
{/ }
{/ \return A new sfImage object, or NULL if it failed }
{/ }
{////////////////////////////////////////////////////////// }
function sfImage_createFromStream(stream:PsfInputStream):PsfImage;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Copy an existing image }
{/ }
{/ \param image Image to copy }
{/ }
{/ \return Copied object }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfImage_copy(image:PsfImage):PsfImage;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy an existing image }
{/ }
{/ \param image Image to delete }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfImage_destroy(image:PsfImage);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Save an image to a file on disk }
{/ }
{/ The format of the image is automatically deduced from }
{/ the extension. The supported image formats are bmp, png, }
{/ tga and jpg. The destination file is overwritten }
{/ if it already exists. This function fails if the image is empty. }
{/ }
{/ \param image    Image object }
{/ \param filename Path of the file to save }
{/ }
{/ \return sfTrue if saving was successful }
{/ }
{/ \see sfImage_saveToMemory }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfImage_saveToFile(image:PsfImage; filename:Pchar):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Save the image to a buffer in memory }
{/ }
{/ The format of the image must be specified. }
{/ The supported image formats are bmp, png, tga and jpg. }
{/ This function fails if the image is empty, or if }
{/ the format was invalid. }
{/ }
{/ \param image  Image object }
{/ \param output Buffer to fill with encoded data }
{/ \param format Encoding format to use }
{/ }
{/ \return sfTrue if saving was successful }
{/ }
{/ \see sfImage_saveToFile }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfImage_saveToMemory(image:PsfImage; output:PsfBuffer; format:Pchar):TsfBool;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Return the size of an image }
{/ }
{/ \param image Image object }
{/ }
{/ \return Size in pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfImage_getSize(image:PsfImage):TsfVector2u;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a transparency mask from a specified color-key }
{/ }
{/ This function sets the alpha value of every pixel matching }
{/ the given color to \a alpha (0 by default), so that they }
{/ become transparent. }
{/ }
{/ \param image Image object }
{/ \param color Color to make transparent }
{/ \param alpha Alpha value to assign to transparent pixels }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfImage_createMaskFromColor(image:PsfImage; color:TsfColor; alpha:TsfUint8);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Copy pixels from an image onto another }
{/ }
{/ This function does a slow pixel copy and should not be }
{/ used intensively. It can be used to prepare a complex }
{/ static image from several others, but if you need this }
{/ kind of feature in real-time you'd better use sfRenderTexture. }
{/ }
{/ If \a sourceRect is empty, the whole image is copied. }
{/ If \a applyAlpha is set to true, the transparency of }
{/ source pixels is applied. If it is false, the pixels are }
{/ copied unchanged with their alpha value. }
{/ }
{/ \param image      Image object }
{/ \param source     Source image to copy }
{/ \param destX      X coordinate of the destination position }
{/ \param destY      Y coordinate of the destination position }
{/ \param sourceRect Sub-rectangle of the source image to copy }
{/ \param applyAlpha Should the copy take in account the source transparency? }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfImage_copyImage(image:PsfImage; source:PsfImage; destX:dword; destY:dword; sourceRect:TsfIntRect; 
            applyAlpha:TsfBool);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Change the color of a pixel in an image }
{/ }
{/ This function doesn't check the validity of the pixel }
{/ coordinates, using out-of-range values will result in }
{/ an undefined behaviour. }
{/ }
{/ \param image Image object }
{/ \param x     X coordinate of pixel to change }
{/ \param y     Y coordinate of pixel to change }
{/ \param color New color of the pixel }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfImage_setPixel(image:PsfImage; x:dword; y:dword; color:TsfColor);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the color of a pixel in an image }
{/ }
{/ This function doesn't check the validity of the pixel }
{/ coordinates, using out-of-range values will result in }
{/ an undefined behaviour. }
{/ }
{/ \param image Image object }
{/ \param x     X coordinate of pixel to get }
{/ \param y     Y coordinate of pixel to get }
{/ }
{/ \return Color of the pixel at coordinates (x, y) }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfImage_getPixel(image:PsfImage; x:dword; y:dword):TsfColor;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get a read-only pointer to the array of pixels of an image }
{/ }
{/ The returned value points to an array of RGBA pixels made of }
{/ 8 bits integers components. The size of the array is }
{/ getWidth() * getHeight() * 4. }
{/ Warning: the returned pointer may become invalid if you }
{/ modify the image, so you should never store it for too long. }
{/ If the image is empty, a null pointer is returned. }
{/ }
{/ \param image Image object }
{/ }
{/ \return Read-only pointer to the array of pixels }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfImage_getPixelsPtr(image:PsfImage):PsfUint8;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Flip an image horizontally (left <-> right) }
{/ }
{/ \param image Image object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfImage_flipHorizontally(image:PsfImage);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Flip an image vertically (top <-> bottom) }
{/ }
{/ \param image Image object }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfImage_flipVertically(image:PsfImage);cdecl;external;
{$endif}
{ SFML_IMAGE_H }

implementation


end.
