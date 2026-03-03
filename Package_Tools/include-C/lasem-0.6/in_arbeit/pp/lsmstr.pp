
unit lsmstr;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmstr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmstr.h
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
Pdouble  = ^double;
PLsmExtents  = ^LsmExtents;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2009 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_STR_H}
{$define LSM_STR_H}
{$include <lsmtypes.h>}
(* Const before type ignored *)

function lsm_str_is_uri(str:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function lsm_str_to_uri(str:Pchar):Pchar;cdecl;external;
function lsm_str_parse_double(str:PPchar; x:Pdouble):Tgboolean;cdecl;external;
function lsm_str_parse_double_list(str:PPchar; n_values:dword; values:Pdouble):dword;cdecl;external;
(* Const before type ignored *)
procedure lsm_str_point_list_exents(point_list:Pchar; extents:PLsmExtents);cdecl;external;
{ xxxxxxxxxxxxxxxxxxxx
static inline void
lsm_str_skip_spaces (char **str)

	while (g_ascii_isspace (**str))
		(*str)++;


static inline void
lsm_str_skip_char (char **str, char c)

	while (**str == c)
		(*str)++;


static inline void
lsm_str_skip_comma_and_spaces (char **str)

	while (g_ascii_isspace (**str) || **str == ',')
		(*str)++;


static inline void
lsm_str_skip_semicolon_and_spaces (char **str)

	while (g_ascii_isspace (**str) || **str == ';')
		(*str)++;


static inline void
lsm_str_skip_colon_and_spaces (char **str)

	while (g_ascii_isspace (**str) || **str == ':')
		(*str)++;



static inline void
lsm_str_consolidate (char *str)

	char *to_ptr;
	char *from_ptr;

	if (str == NULL)
		return;

	from_ptr = str;
	to_ptr = str;
	while (*from_ptr != '\0') 
		if (g_ascii_isspace (*from_ptr)) 
			if (to_ptr != str &&
			    *(to_ptr - 1) != ' ') 
				*to_ptr = ' ';
				to_ptr++;
			
		 else 
			*to_ptr = *from_ptr;
			to_ptr++;
		
		from_ptr++;
	

	if (to_ptr != str && *(to_ptr - 1) == ' ')
		*(to_ptr - 1) = '\0';
	else
		*to_ptr = '\0';


 }
{$endif}

implementation


end.
