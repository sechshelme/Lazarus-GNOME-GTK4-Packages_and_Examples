
unit gskroundedrect;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskroundedrect.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskroundedrect.h
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
Pgraphene_point_t  = ^graphene_point_t;
Pgraphene_rect_t  = ^graphene_rect_t;
Pgraphene_size_t  = ^graphene_size_t;
PGskRoundedRect  = ^GskRoundedRect;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GSK - The GTK Scene Kit
 *
 * Copyright 2016  Endless
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <gsk/gsktypes.h>}
{* xxxxxxxxx
#define GSK_ROUNDED_RECT_INIT(_x,_y,_w,_h)       (GskRoundedRect)  .bounds = GRAPHENE_RECT_INIT(_x,_y,_w,_h), \
                                                                    .corner =  \
                                                                       GRAPHENE_SIZE_INIT(0, 0),\
                                                                       GRAPHENE_SIZE_INIT(0, 0),\
                                                                       GRAPHENE_SIZE_INIT(0, 0),\
                                                                       GRAPHENE_SIZE_INIT(0, 0),\
                                                                    

  }
type
  PGskRoundedRect = ^TGskRoundedRect;
  TGskRoundedRect = record
      bounds : Tgraphene_rect_t;
      corner : array[0..3] of Tgraphene_size_t;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsk_rounded_rect_init(self:PGskRoundedRect; bounds:Pgraphene_rect_t; top_left:Pgraphene_size_t; top_right:Pgraphene_size_t; bottom_right:Pgraphene_size_t; 
           bottom_left:Pgraphene_size_t):PGskRoundedRect;cdecl;external;
(* Const before type ignored *)
function gsk_rounded_rect_init_copy(self:PGskRoundedRect; src:PGskRoundedRect):PGskRoundedRect;cdecl;external;
(* Const before type ignored *)
function gsk_rounded_rect_init_from_rect(self:PGskRoundedRect; bounds:Pgraphene_rect_t; radius:single):PGskRoundedRect;cdecl;external;
function gsk_rounded_rect_normalize(self:PGskRoundedRect):PGskRoundedRect;cdecl;external;
function gsk_rounded_rect_offset(self:PGskRoundedRect; dx:single; dy:single):PGskRoundedRect;cdecl;external;
function gsk_rounded_rect_shrink(self:PGskRoundedRect; top:single; right:single; bottom:single; left:single):PGskRoundedRect;cdecl;external;
(* Const before type ignored *)
function gsk_rounded_rect_is_rectilinear(self:PGskRoundedRect):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_rounded_rect_contains_point(self:PGskRoundedRect; point:Pgraphene_point_t):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_rounded_rect_contains_rect(self:PGskRoundedRect; rect:Pgraphene_rect_t):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_rounded_rect_intersects_rect(self:PGskRoundedRect; rect:Pgraphene_rect_t):Tgboolean;cdecl;external;

implementation


end.
