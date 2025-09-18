unit gmime_part_iter;

interface

uses
  fp_glib2, fp_gmime3;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_PART_ITER_H__}
{$define __GMIME_PART_ITER_H__}
{$include <gmime/gmime-object.h>}

{*
 * GMimePartIter:
 *
 * A MIME part iterator.
 * }
type

function g_mime_part_iter_get_type:TGType;cdecl;external libgmime3;
function g_mime_part_iter_new(toplevel:PGMimeObject):PGMimePartIter;cdecl;external libgmime3;
procedure g_mime_part_iter_free(iter:PGMimePartIter);cdecl;external libgmime3;
function g_mime_part_iter_clone(iter:PGMimePartIter):PGMimePartIter;cdecl;external libgmime3;
procedure g_mime_part_iter_reset(iter:PGMimePartIter);cdecl;external libgmime3;
function g_mime_part_iter_jump_to(iter:PGMimePartIter; path:Pchar):Tgboolean;cdecl;external libgmime3;
function g_mime_part_iter_is_valid(iter:PGMimePartIter):Tgboolean;cdecl;external libgmime3;
function g_mime_part_iter_next(iter:PGMimePartIter):Tgboolean;cdecl;external libgmime3;
function g_mime_part_iter_prev(iter:PGMimePartIter):Tgboolean;cdecl;external libgmime3;
function g_mime_part_iter_get_toplevel(iter:PGMimePartIter):PGMimeObject;cdecl;external libgmime3;
function g_mime_part_iter_get_current(iter:PGMimePartIter):PGMimeObject;cdecl;external libgmime3;
function g_mime_part_iter_get_parent(iter:PGMimePartIter):PGMimeObject;cdecl;external libgmime3;
function g_mime_part_iter_get_path(iter:PGMimePartIter):Pchar;cdecl;external libgmime3;
function g_mime_part_iter_replace(iter:PGMimePartIter; replacement:PGMimeObject):Tgboolean;cdecl;external libgmime3;
function g_mime_part_iter_remove(iter:PGMimePartIter):Tgboolean;cdecl;external libgmime3;
{$endif}
{ __GMIME_PART_ITER_H__  }

// === Konventiert am: 18-9-25 15:33:04 ===

function GMIME_TYPE_PART_ITER : TGType;

implementation

function GMIME_TYPE_PART_ITER : TGType;
  begin
    GMIME_TYPE_PART_ITER:=g_mime_part_iter_get_type;
  end;



end.
