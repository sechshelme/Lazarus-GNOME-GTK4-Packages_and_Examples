unit color;

interface

uses
  ctypes;

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
{$ifndef GV_COLOR_H}
{$define GV_COLOR_H}
{ #include "arith.h"  }
{ C++ extern C conditionnal removed }
type
  Phsvrgbacolor_t = ^Thsvrgbacolor_t;
  Thsvrgbacolor_t = record
      name : Pchar;
      h : byte;
      s : byte;
      v : byte;
      r : byte;
      g : byte;
      b : byte;
      a : byte;
    end;
{ possible representations of color in gvcolor_t  }

  Pcolor_type_t = ^Tcolor_type_t;
  Tcolor_type_t =  Longint;
  Const
    HSVA_DOUBLE = 0;
    RGBA_BYTE = 1;
    RGBA_WORD = 2;
    CMYK_BYTE = 3;
    RGBA_DOUBLE = 4;
    COLOR_STRING = 5;
    COLOR_INDEX = 6;
;
{ gvcolor_t can hold a color spec in a choice or representations  }
type
  Pcolor_s = ^Tcolor_s;
  Tcolor_s = record
      u : record
          case longint of
            0 : ( RGBA : array[0..3] of Tdouble );
            1 : ( HSVA : array[0..3] of Tdouble );
            2 : ( rgba : array[0..3] of byte );
            3 : ( cmyk : array[0..3] of byte );
            4 : ( rrggbbaa : array[0..3] of longint );
            5 : ( _string : Pchar );
            6 : ( index : longint );
          end;
      _type : Tcolor_type_t;
    end;
  Tgvcolor_t = Tcolor_s;
  Pgvcolor_t = ^Tgvcolor_t;

const
  COLOR_MALLOC_FAIL = -(1);  
  COLOR_UNKNOWN = 1;  
  COLOR_OK = 0;  
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 3-12-25 15:08:25 ===


implementation



end.
