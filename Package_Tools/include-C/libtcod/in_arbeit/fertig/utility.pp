
unit utility;
interface

{
  Automatically converted by H2Pas 1.0.0 from utility.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    utility.h
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


{ BSD 3-Clause License
 *
 * Copyright © 2008-2021, Jice and the libtcod contributors.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef LIBTCOD_UTILITY_H}
{$define LIBTCOD_UTILITY_H}
{*****************************************
 utility macros
 ***************************************** }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MAX(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MIN(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ABS(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CLAMP(a,b,x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LERP(a,b,x : longint) : longint;

{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MAX(a,b : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if a>b then
    if_local1:=a
  else
    if_local1:=b;
  MAX:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MIN(a,b : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if a<b then
    if_local1:=a
  else
    if_local1:=b;
  MIN:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ABS(a : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if 0 then
    if_local1:=-(a)
  else
    if_local1:=a;
  ABS:=a<(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CLAMP(a,b,x : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  if b then
    if_local1:=b
  else
    if_local1:=x;
  if a then
    if_local2:=a
  else
    if_local2:=x>(if_local1);
  CLAMP:=x<(if_local2);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LERP(a,b,x : longint) : longint;
begin
  LERP:=(Ta(+(x)))*(Tb(-(a)));
end;


end.
