unit hpdf_image;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_image.h
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
  }
{$ifndef _HPDF_IMAGE_H}
{$define _HPDF_IMAGE_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }

function HPDF_Image_Load1BitImageFromMem(mmgr:THPDF_MMgr; buf:PHPDF_BYTE; xref:THPDF_Xref; width:THPDF_UINT; height:THPDF_UINT; 
           line_width:THPDF_UINT; top_is_first:THPDF_BOOL):THPDF_Image;cdecl;external libhpdf;
{$ifdef LIBHPDF_HAVE_LIBPNG}
function HPDF_Image_LoadPngImage(mmgr:THPDF_MMgr; png_data:THPDF_Stream; xref:THPDF_Xref; delayed_loading:THPDF_BOOL):THPDF_Image;cdecl;external libhpdf;
{$endif}

function HPDF_Image_LoadJpegImage(mmgr:THPDF_MMgr; jpeg_data:THPDF_Stream; xref:THPDF_Xref):THPDF_Image;cdecl;external libhpdf;
function HPDF_Image_LoadJpegImageFromMem(mmgr:THPDF_MMgr; buf:PHPDF_BYTE; size:THPDF_UINT; xref:THPDF_Xref):THPDF_Image;cdecl;external libhpdf;
function HPDF_Image_LoadRawImage(mmgr:THPDF_MMgr; stream:THPDF_Stream; xref:THPDF_Xref; width:THPDF_UINT; height:THPDF_UINT; 
           color_space:THPDF_ColorSpace):THPDF_Image;cdecl;external libhpdf;
function HPDF_Image_LoadRawImageFromMem(mmgr:THPDF_MMgr; buf:PHPDF_BYTE; xref:THPDF_Xref; width:THPDF_UINT; height:THPDF_UINT; 
           color_space:THPDF_ColorSpace; bits_per_component:THPDF_UINT):THPDF_Image;cdecl;external libhpdf;
function HPDF_Image_Validate(image:THPDF_Image):THPDF_BOOL;cdecl;external libhpdf;
function HPDF_Image_SetMask(image:THPDF_Image; mask:THPDF_BOOL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Image_SetColorSpace(image:THPDF_Image; colorspace:THPDF_Array):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Image_SetRenderingIntent(image:THPDF_Image; intent:Pchar):THPDF_STATUS;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_XOBJECTS_H  }

// === Konventiert am: 28-1-26 14:02:36 ===


implementation



end.
