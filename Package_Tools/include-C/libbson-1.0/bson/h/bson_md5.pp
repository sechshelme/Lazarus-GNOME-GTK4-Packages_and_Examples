
unit bson_md5;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_md5.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_md5.h
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
Pbson_md5_t  = ^bson_md5_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Copyright (C) 1999, 2002 Aladdin Enterprises.  All rights reserved.

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgement in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.

  L. Peter Deutsch
  ghost@aladdin.com

  }
{ $Id: md5.h,v 1.4 2002/04/13 19:20:28 lpd Exp $  }
{
  Independent implementation of MD5 (RFC 1321).

  This code implements the MD5 Algorithm defined in RFC 1321, whose
  text is available at
    http://www.ietf.org/rfc/rfc1321.txt
  The code is derived from the text of the RFC, including the test suite
  (section A.5) but excluding the rest of Appendix A.  It does not include
  any code or documentation that is identified in the RFC as being
  copyrighted.

  The original and principal author of md5.h is L. Peter Deutsch
  <ghost@aladdin.com>.  Other authors are noted in the change history
  that follows (in reverse chronological order):

  2002-04-13 lpd Removed support for non-ANSI compilers; removed
    references to Ghostscript; clarified derivation from RFC 1321;
    now handles byte order either statically or dynamically.
  1999-11-04 lpd Edited comments slightly for automatic TOC extraction.
  1999-10-18 lpd Fixed typo in header comment (ansi2knr rather than md5);
    added conditionalization for C++ compilation from Martin
    Purschke <purschke@bnl.gov>.
  1999-05-03 lpd Original version.
  }
{
 * The following MD5 implementation has been modified to use types as
 * specified in libbson.
  }
{$include <bson/bson-prelude.h>}
{$ifndef BSON_MD5_H}
{$define BSON_MD5_H}
{$include <bson/bson-endian.h>}
{ message length in bits, lsw first  }
{ digest buffer  }
{ accumulate block  }
type
  Pbson_md5_t = ^Tbson_md5_t;
  Tbson_md5_t = record
      count : array[0..1] of Tuint32_t;
      abcd : array[0..3] of Tuint32_t;
      buf : array[0..63] of Tuint8_t;
    end;

procedure bson_md5_init(pms:Pbson_md5_t);cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;;; }
(* Const before type ignored *)
procedure bson_md5_append(pms:Pbson_md5_t; data:Puint8_t; nbytes:Tuint32_t);cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;;; }
procedure bson_md5_finish(pms:Pbson_md5_t; digest:array[0..15] of Tuint8_t);cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;;; }
{$endif}
{ BSON_MD5_H  }

implementation


end.
