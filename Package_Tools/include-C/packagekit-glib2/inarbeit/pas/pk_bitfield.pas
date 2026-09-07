unit pk_bitfield;

interface

uses
  fp_glib2, fp_packagekit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2007-2008 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_BITFIELD_H}
{$define __PK_BITFIELD_H}
{$include <glib.h>}
{*
 * PkBitfield:
 *
 * A bitfield capable of storing enumerations with up to 64 values.
  }
type
  PPkBitfield = ^TPkBitfield;
  TPkBitfield = Tguint64;
{*
 * PK_BITFIELD_FORMAT:
 *
 * printf format string suitable for printing #PkBitfield values.
  }

const
  PK_BITFIELD_FORMAT = G_GUINT64_FORMAT;  
{ convenience functions as it's easy to forget the bitwise operators  }
{
xxxxxxxxxxxxxxxx
  }
{#define pk_bitfield_add(bitfield,enum)		do  ((bitfield) |= (pk_bitfield_value(enum)));  while (0) }
{#define pk_bitfield_remove(bitfield,enum)	do  ((bitfield) &= ~(pk_bitfield_value(enum)));  while (0) }
{#define pk_bitfield_invert(bitfield,enum)	do  ((bitfield) ^= (pk_bitfield_value(enum)));  while (0) }
{#define pk_bitfield_contain(bitfield,enum)	(((bitfield) & (pk_bitfield_value(enum))) > 0) }
{#define pk_bitfield_value(enum)			((PkBitfield) 1 << (enum)) }

function pk_bitfield_contain_priority(values:TPkBitfield; value:Tgint; args:array of const):Tgint;cdecl;external libpackagekit ;
function pk_bitfield_contain_priority(values:TPkBitfield; value:Tgint):Tgint;cdecl;external libpackagekit ;
function pk_bitfield_from_enums(value:Tgint; args:array of const):TPkBitfield;cdecl;external libpackagekit ;
function pk_bitfield_from_enums(value:Tgint):TPkBitfield;cdecl;external libpackagekit ;
function pk_role_bitfield_from_string(roles:Pgchar):TPkBitfield;cdecl;external libpackagekit ;
function pk_role_bitfield_to_string(roles:TPkBitfield):Pgchar;cdecl;external libpackagekit ;
function pk_group_bitfield_from_string(groups:Pgchar):TPkBitfield;cdecl;external libpackagekit ;
function pk_group_bitfield_to_string(groups:TPkBitfield):Pgchar;cdecl;external libpackagekit ;
function pk_filter_bitfield_from_string(filters:Pgchar):TPkBitfield;cdecl;external libpackagekit ;
function pk_filter_bitfield_to_string(filters:TPkBitfield):Pgchar;cdecl;external libpackagekit ;
function pk_transaction_flag_bitfield_from_string(transaction_flags:Pgchar):TPkBitfield;cdecl;external libpackagekit ;
function pk_transaction_flag_bitfield_to_string(transaction_flags:TPkBitfield):Pgchar;cdecl;external libpackagekit ;
{$endif}
{ __PK_BITFIELD_H  }

// === Konventiert am: 7-9-26 15:04:31 ===


implementation



end.
