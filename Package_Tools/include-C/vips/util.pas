unit util;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Various useful definitions.
 *
 * J.Cupitt, 8/4/93
 * 15/7/96 JC
 *	- C++ stuff added
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
{$ifndef VIPS_UTIL_H}
{$define VIPS_UTIL_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{$include <stdio.h>}
{$include <math.h>}
{ Some platforms don't have M_PI :-(
  }
{ Testing status before the function call saves a lot of time.
  }
{ VIPS_RINT() does "bankers rounding", it rounds to the nearest even integer.
 * For things like image geometry, we want strict nearest int.
 *
 * If you know it's unsigned, _UINT is a little faster.
  }

function vips_enum_string(enm:TGType; value:longint):Pchar;cdecl;external libvips;
function vips_enum_nick(enm:TGType; value:longint):Pchar;cdecl;external libvips;
function vips_enum_from_nick(domain:Pchar; _type:TGType; str:Pchar):longint;cdecl;external libvips;
function vips_flags_from_nick(domain:Pchar; _type:TGType; nick:Pchar):longint;cdecl;external libvips;
function vips_slist_equal(l1:PGSList; l2:PGSList):Tgboolean;cdecl;external libvips;
function vips_slist_map2(list:PGSList; fn:TVipsSListMap2Fn; a:pointer; b:pointer):pointer;cdecl;external libvips;
function vips_slist_map2_rev(list:PGSList; fn:TVipsSListMap2Fn; a:pointer; b:pointer):pointer;cdecl;external libvips;
function vips_slist_map4(list:PGSList; fn:TVipsSListMap4Fn; a:pointer; b:pointer; c:pointer; 
           d:pointer):pointer;cdecl;external libvips;
function vips_slist_fold2(list:PGSList; start:pointer; fn:TVipsSListFold2Fn; a:pointer; b:pointer):pointer;cdecl;external libvips;
function vips_slist_filter(list:PGSList; fn:TVipsSListMap2Fn; a:pointer; b:pointer):PGSList;cdecl;external libvips;
procedure vips_slist_free_all(list:PGSList);cdecl;external libvips;
function vips_map_equal(a:pointer; b:pointer):pointer;cdecl;external libvips;
function vips_hash_table_map(hash:PGHashTable; fn:TVipsSListMap2Fn; a:pointer; b:pointer):pointer;cdecl;external libvips;
function vips_strncpy(dest:Pchar; src:Pchar; n:longint):Pchar;cdecl;external libvips;
function vips_strrstr(haystack:Pchar; needle:Pchar):Pchar;cdecl;external libvips;
function vips_ispostfix(a:Pchar; b:Pchar):Tgboolean;cdecl;external libvips;
function vips_iscasepostfix(a:Pchar; b:Pchar):Tgboolean;cdecl;external libvips;
function vips_isprefix(a:Pchar; b:Pchar):Tgboolean;cdecl;external libvips;
function vips_break_token(str:Pchar; brk:Pchar):Pchar;cdecl;external libvips;
procedure vips__chomp(str:Pchar);cdecl;external libvips;
function vips_vsnprintf(str:Pchar; size:Tsize_t; format:Pchar; ap:Tva_list):longint;cdecl;external libvips;
function vips_snprintf(str:Pchar; size:Tsize_t; format:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_snprintf(str:Pchar; size:Tsize_t; format:Pchar):longint;cdecl;external libvips;
function vips_filename_suffix_match(path:Pchar; suffixes:PPchar):longint;cdecl;external libvips;
function vips_file_length(fd:longint):Tgint64;cdecl;external libvips;
{ TODO(kleisauke): extern is required by vipsedit.
  }
function vips__write(fd:longint; buf:pointer; count:Tsize_t):longint;cdecl;external libvips;
{ TODO(kleisauke): extern is required by test_connections.
  }
function vips__open(filename:Pchar; flags:longint; mode:longint):longint;cdecl;external libvips;
function vips__open_read(filename:Pchar):longint;cdecl;external libvips;
function vips__fopen(filename:Pchar; mode:Pchar):PFILE;cdecl;external libvips;
function vips__file_open_read(filename:Pchar; fallback_dir:Pchar; text_mode:Tgboolean):PFILE;cdecl;external libvips;
function vips__file_open_write(filename:Pchar; text_mode:Tgboolean):PFILE;cdecl;external libvips;
{ TODO(kleisauke): extern is required by vipsedit.
  }
function vips__file_read(fp:PFILE; name:Pchar; length_out:Psize_t):Pchar;cdecl;external libvips;
function vips__file_read_name(name:Pchar; fallback_dir:Pchar; length_out:Psize_t):Pchar;cdecl;external libvips;
function vips__file_write(data:pointer; size:Tsize_t; nmemb:Tsize_t; stream:PFILE):longint;cdecl;external libvips;
{ TODO(kleisauke): extern is required by the magick module.
  }
function vips__get_bytes(filename:Pchar; buf:Pbyte; len:Tgint64):Tgint64;cdecl;external libvips;
function vips__fgetc(fp:PFILE):longint;cdecl;external libvips;
function vips__gvalue_ref_string_new(text:Pchar):PGValue;cdecl;external libvips;
procedure vips__gslist_gvalue_free(list:PGSList);cdecl;external libvips;
function vips__gslist_gvalue_copy(list:PGSList):PGSList;cdecl;external libvips;
function vips__gslist_gvalue_merge(a:PGSList; b:PGSList):PGSList;cdecl;external libvips;
function vips__gslist_gvalue_get(list:PGSList):Pchar;cdecl;external libvips;
function vips__seek_no_error(fd:longint; pos:Tgint64; whence:longint):Tgint64;cdecl;external libvips;
{ TODO(kleisauke): extern is required by vipsedit.
  }
function vips__seek(fd:longint; pos:Tgint64; whence:longint):Tgint64;cdecl;external libvips;
function vips__ftruncate(fd:longint; pos:Tgint64):longint;cdecl;external libvips;
function vips_existsf(name:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_existsf(name:Pchar):longint;cdecl;external libvips;
function vips_isdirf(name:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_isdirf(name:Pchar):longint;cdecl;external libvips;
function vips_mkdirf(name:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_mkdirf(name:Pchar):longint;cdecl;external libvips;
function vips_rmdirf(name:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_rmdirf(name:Pchar):longint;cdecl;external libvips;
function vips_rename(old_name:Pchar; new_name:Pchar):longint;cdecl;external libvips;
{*
 * VipsToken:
 * @VIPS_TOKEN_LEFT: left bracket
 * @VIPS_TOKEN_RIGHT: right bracket
 * @VIPS_TOKEN_STRING: string constant
 * @VIPS_TOKEN_EQUALS: equals sign
 * @VIPS_TOKEN_COMMA: comma
 *
 * Tokens returned by the vips lexical analyzer, see vips__token_get(). This
 * is used to parse option strings for arguments.
 *
 * Left and right brackets can be any of (, , [, <.
 *
 * Strings may be in double quotes, and may contain escaped quote characters,
 * for example string, "string" and "str\"ing".
 *
  }
type
  PVipsToken = ^TVipsToken;
  TVipsToken =  Longint;
  Const
    VIPS_TOKEN_LEFT = 1;
    VIPS_TOKEN_RIGHT = 2;
    VIPS_TOKEN_STRING = 3;
    VIPS_TOKEN_EQUALS = 4;
    VIPS_TOKEN_COMMA = 5;
;

function vips__token_get(buffer:Pchar; token:PVipsToken; _string:Pchar; size:longint):Pchar;cdecl;external libvips;
function vips__token_must(buffer:Pchar; token:PVipsToken; _string:Pchar; size:longint):Pchar;cdecl;external libvips;
function vips__token_need(buffer:Pchar; need_token:TVipsToken; _string:Pchar; size:longint):Pchar;cdecl;external libvips;
function vips__token_segment(p:Pchar; token:PVipsToken; _string:Pchar; size:longint):Pchar;cdecl;external libvips;
function vips__token_segment_need(p:Pchar; need_token:TVipsToken; _string:Pchar; size:longint):Pchar;cdecl;external libvips;
function vips__find_rightmost_brackets(p:Pchar):Pchar;cdecl;external libvips;
{ TODO(kleisauke): extern is required by libvips-cpp and vipsheader.
  }
procedure vips__filename_split8(name:Pchar; filename:Pchar; option_string:Pchar);cdecl;external libvips;
function vips_ispoweroftwo(p:longint):longint;cdecl;external libvips;
function vips_amiMSBfirst:longint;cdecl;external libvips;
{ TODO(kleisauke): extern is required by jpegsave_file_fuzzer.
  }
function vips__temp_name(format:Pchar):Pchar;cdecl;external libvips;
procedure vips__change_suffix(name:Pchar; out:Pchar; mx:longint; new_suff:Pchar; olds:PPchar; 
            nolds:longint);cdecl;external libvips;
function vips_realpath(path:Pchar):Pchar;cdecl;external libvips;
function vips__random(seed:Tguint32):Tguint32;cdecl;external libvips;
function vips__random_add(seed:Tguint32; value:longint):Tguint32;cdecl;external libvips;
function vips__icc_dir:Pchar;cdecl;external libvips;
function vips__windows_prefix:Pchar;cdecl;external libvips;
function vips__get_iso8601:Pchar;cdecl;external libvips;
function vips_strtod(str:Pchar; out:Pdouble):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_UTIL_H }

// === Konventiert am: 26-4-26 16:08:34 ===


implementation



end.
