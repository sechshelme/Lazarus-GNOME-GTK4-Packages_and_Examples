
unit hpdf_conf;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_conf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_conf.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_conf.h
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
{$ifndef _HPDF_CONF_H}
{$define _HPDF_CONF_H}
{$include <stdlib.h>}
{$include <stdio.h>}
{$if defined(_MSC_VER)}
{$ifndef _USE_MATH_DEFINES}

const
  _USE_MATH_DEFINES = 1;  
{$endif}
{ _USE_MATH_DEFINES  }
{$endif}
{$ifndef __USE_XOPEN}
{ for M_PI  }
{$define __USE_XOPEN}
{$endif}
{ __USE_XOPEN  }
{$include <math.h>}
{---------------------------------------------------------------------------- }
{----- standard C library functions ----------------------------------------- }
{---------------------------------------------------------------------------- }
{----- parameters in relation to performance -------------------------------- }
{ default buffer size of memory-stream-object  }

const
  HPDF_STREAM_BUF_SIZ = 4096;  
{ default array size of list-object  }
  HPDF_DEF_ITEMS_PER_BLOCK = 20;  
{ default array size of cross-reference-table  }
  HPDF_DEFALUT_XREF_ENTRY_NUM = 1024;  
{ default array size of widths-table of cid-fontdef  }
  HPDF_DEF_CHAR_WIDTHS_NUM = 128;  
{ default array size of page-list-tablef  }
  HPDF_DEF_PAGE_LIST_NUM = 256;  
{ default array size of range-table of cid-fontdef  }
  HPDF_DEF_RANGE_TBL_NUM = 128;  
{ default buffer size of memory-pool-object  }
  HPDF_MPOOL_BUF_SIZ = 8192;  
  HPDF_MIN_MPOOL_BUF_SIZ = 256;  
  HPDF_MAX_MPOOL_BUF_SIZ = 1048576;  
{ alignment size of memory-pool-object
  }

{ was #define dname def_expr }
function HPDF_ALIGNMENT_SIZE : longint; { return type might be wrong }

{$define G3CODES}
{$endif}
{ _HPDF_CONF_H  }

implementation

{ was #define dname def_expr }
function HPDF_ALIGNMENT_SIZE : longint; { return type might be wrong }
  begin
    HPDF_ALIGNMENT_SIZE:=sizeof(longint);
  end;


end.
