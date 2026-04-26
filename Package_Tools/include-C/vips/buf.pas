unit buf;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ A static string buffer, with overflow protection.
  }
{

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_BUF_H}
{$define VIPS_BUF_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/basic.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ A string in the process of being written to ... multiple calls to
 * vips_buf_append add to it. On overflow append "..." and block further
 * writes.
  }
{ All fields are private.
	  }
{< private > }
{ String base  }
{ Maximum length  }
{ Current write point  }
{ String has filled, block writes  }
{ For read-recent  }
{ We own the string with malloc()  }
type
  PVipsBuf = ^TVipsBuf;
  TVipsBuf = record
      base : Pchar;
      mx : longint;
      i : longint;
      full : Tgboolean;
      lasti : longint;
      dynamic : Tgboolean;
    end;

{ Init and append to one of the above.
  }

procedure vips_buf_rewind(buf:PVipsBuf);cdecl;external libvips;
procedure vips_buf_destroy(buf:PVipsBuf);cdecl;external libvips;
procedure vips_buf_init(buf:PVipsBuf);cdecl;external libvips;
procedure vips_buf_set_static(buf:PVipsBuf; base:Pchar; mx:longint);cdecl;external libvips;
procedure vips_buf_set_dynamic(buf:PVipsBuf; mx:longint);cdecl;external libvips;
procedure vips_buf_init_static(buf:PVipsBuf; base:Pchar; mx:longint);cdecl;external libvips;
procedure vips_buf_init_dynamic(buf:PVipsBuf; mx:longint);cdecl;external libvips;
function vips_buf_appendns(buf:PVipsBuf; str:Pchar; sz:longint):Tgboolean;cdecl;external libvips;
function vips_buf_appends(buf:PVipsBuf; str:Pchar):Tgboolean;cdecl;external libvips;
function vips_buf_appendf(buf:PVipsBuf; fmt:Pchar; args:array of const):Tgboolean;cdecl;external libvips;
function vips_buf_appendf(buf:PVipsBuf; fmt:Pchar):Tgboolean;cdecl;external libvips;
function vips_buf_vappendf(buf:PVipsBuf; fmt:Pchar; ap:Tva_list):Tgboolean;cdecl;external libvips;
function vips_buf_appendc(buf:PVipsBuf; ch:char):Tgboolean;cdecl;external libvips;
function vips_buf_appendsc(buf:PVipsBuf; quote:Tgboolean; str:Pchar):Tgboolean;cdecl;external libvips;
function vips_buf_appendgv(buf:PVipsBuf; value:PGValue):Tgboolean;cdecl;external libvips;
function vips_buf_append_size(buf:PVipsBuf; n:Tsize_t):Tgboolean;cdecl;external libvips;
function vips_buf_removec(buf:PVipsBuf; ch:char):Tgboolean;cdecl;external libvips;
function vips_buf_change(buf:PVipsBuf; o:Pchar; n:Pchar):Tgboolean;cdecl;external libvips;
function vips_buf_is_empty(buf:PVipsBuf):Tgboolean;cdecl;external libvips;
function vips_buf_is_full(buf:PVipsBuf):Tgboolean;cdecl;external libvips;
function vips_buf_all(buf:PVipsBuf):Pchar;cdecl;external libvips;
function vips_buf_firstline(buf:PVipsBuf):Pchar;cdecl;external libvips;
function vips_buf_appendg(buf:PVipsBuf; g:Tdouble):Tgboolean;cdecl;external libvips;
function vips_buf_appendd(buf:PVipsBuf; d:longint):Tgboolean;cdecl;external libvips;
function vips_buf_len(buf:PVipsBuf):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_BUF_H }

// === Konventiert am: 26-4-26 16:15:17 ===


implementation



end.
