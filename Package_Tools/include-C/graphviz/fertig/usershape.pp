
unit usershape;
interface

{
  Automatically converted by H2Pas 1.0.0 from usershape.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    usershape.h
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
PFILE  = ^FILE;
Pimagepos_t  = ^imagepos_t;
Pimagescale_t  = ^imagescale_t;
Pimagetype_t  = ^imagetype_t;
Pusershape_s  = ^usershape_s;
Pusershape_t  = ^usershape_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $Id$ $Revision$  }
{ vim:set shiftwidth=4 ts=8:  }
{************************************************************************
 * Copyright (c) 2011 AT&T Intellectual Property 
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors: See CVS logs. Details at http://www.graphviz.org/
 ************************************************************************ }
{$ifndef USERSHAPE_H}
{$define USERSHAPE_H}
{$include "cdt.h"}
{ C++ extern C conditionnal removed }
type
  Pimagetype_t = ^Timagetype_t;
  Timagetype_t =  Longint;
  Const
    FT_NULL = 0;
    FT_BMP = 1;
    FT_GIF = 2;
    FT_PNG = 3;
    FT_JPEG = 4;
    FT_PDF = 5;
    FT_PS = 6;
    FT_EPS = 7;
    FT_SVG = 8;
    FT_XML = 9;
    FT_RIFF = 10;
    FT_WEBP = 11;
    FT_ICO = 12;
    FT_TIFF = 13;
;
{ no image scaling  }
{ scale image to fit but keep aspect ratio  }
{ scale image width to fit, keep height fixed  }
{ scale image height to fit, keep width fixed  }
{ scale image to fit without regard for aspect ratio  }
type
  Pimagescale_t = ^Timagescale_t;
  Timagescale_t =  Longint;
  Const
    IMAGESCALE_FALSE = 0;
    IMAGESCALE_TRUE = 1;
    IMAGESCALE_WIDTH = 2;
    IMAGESCALE_HEIGHT = 3;
    IMAGESCALE_BOTH = 4;
;
{ top left  }
{ top center  }
{ top right  }
{ middle left  }
{ middle center (true center, the default) }
{ middle right  }
{ bottom left  }
{ bottom center  }
{ bottom right  }
type
  Pimagepos_t = ^Timagepos_t;
  Timagepos_t =  Longint;
  Const
    IMAGEPOS_TOP_LEFT = 0;
    IMAGEPOS_TOP_CENTER = 1;
    IMAGEPOS_TOP_RIGHT = 2;
    IMAGEPOS_MIDDLE_LEFT = 3;
    IMAGEPOS_MIDDLE_CENTER = 4;
    IMAGEPOS_MIDDLE_RIGHT = 5;
    IMAGEPOS_BOTTOM_LEFT = 6;
    IMAGEPOS_BOTTOM_CENTER = 7;
    IMAGEPOS_BOTTOM_RIGHT = 8;
;
type
  Tusershape_s = Tusershape_t;
(* Const before type ignored *)
{ data loaded by a renderer  }
{ size of data (if mmap'ed)  }
{ renderer's function for freeing data  }
  Pusershape_s = ^Tusershape_s;
  Tusershape_s = record
      link : TDtlink_t;
      name : Pchar;
      macro_id : longint;
      must_inline : Tboolean;
      nocache : Tboolean;
      f : PFILE;
      _type : Timagetype_t;
      stringtype : Pchar;
      x : longint;
      y : longint;
      w : longint;
      h : longint;
      dpi : longint;
      data : pointer;
      datasize : Tsize_t;
      datafree : procedure (us:Pusershape_t);cdecl;
    end;

{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
