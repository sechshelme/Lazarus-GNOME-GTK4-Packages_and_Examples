unit arith;

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
{ geometric functions (e.g. on points and boxes) with application to, but
 * no specific dependence on graphs  }
{$ifndef GV_ARITH_H}
{$define GV_ARITH_H}
{ for sincos  }
{$ifndef _GNU_SOURCE}

const
  _GNU_SOURCE = 1;  
{$endif}
{$include <limits.h>}
{$include <math.h>}
{ C++ extern C conditionnal removed }
{$ifdef MIN}
{$undef MIN}
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MIN(a,b : longint) : longint;

{$ifdef MAX}
{$undef MAX}
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function MAX(a,b : longint) : longint;

{$ifdef ABS}
{$undef ABS}
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ABS(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVG(a,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SGN(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CMP(a,b : longint) : longint;

{$ifndef INT_MAX}

{ was #define dname def_expr }
function INT_MAX : longint;  

{$endif}
{$ifndef INT_MIN}

const
  INT_MIN = (-(INT_MAX))-1;  
{$endif}
{$ifndef MAXSHORT}

const
  MAXSHORT = $7fff;  
{$endif}
{$ifndef MAXDOUBLE}

const
  MAXDOUBLE = 1.7976931348623157e+308;  
{$endif}
{$ifndef MAXFLOAT}

{ was #define dname def_expr }
function MAXFLOAT : single;  { exact value: 0x1.fffffep+127f }

{$endif}
{$ifdef BETWEEN}
{$undef BETWEEN}
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function BETWEEN(a,b,c : longint) : longint;

{$ifndef M_PI}

const
  M_PI = 3.14159265358979323846;  
{$endif}
{$ifndef SQRT2}

const
  SQRT2 = 1.41421356237309504880;  
{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ROUND(f : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RADIANS(deg : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DEGREES(rad : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SQR(a : longint) : longint;

{$ifdef HAVE_SINCOS}
procedure sincos(x:Tdouble; s:Pdouble; c:Pdouble);cdecl;external libxxx;
{$else}
{xxxxxxxxxx # define sincos(x,s,c) *s = sin(x); *c = cos(x) }
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 3-12-25 15:08:36 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MIN(a,b : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if b then
    if_local1:=a
  else
    if_local1:=b;
  MIN:=a<(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function MAX(a,b : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if b then
    if_local1:=a
  else
    if_local1:=b;
  MAX:=a>(if_local1);
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
    if_local1:=a
  else
    if_local1:=-(a);
  ABS:=a>=(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function AVG(a,b : longint) : longint;
begin
  AVG:=(a+b)/2;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SGN(a : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if a<0 then
    if_local1:=-(1)
  else
    if_local1:=1;
  SGN:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CMP(a,b : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  if a>b then
    if_local1:=1
  else
    if_local1:=0;
  if a<b then
    if_local2:=-(1)
  else
    if_local2:=if_local1;
  CMP:=if_local2;
end;

{ was #define dname def_expr }
function INT_MAX : longint;
  begin
    INT_MAX:=longint(( not (dword(0))) shr 1);
  end;

{ was #define dname def_expr }
function MAXFLOAT : single;
  begin
    MAXFLOAT:=single(3.40282347e+38);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function BETWEEN(a,b,c : longint) : longint;
begin
  BETWEEN:=(a<=b) and (@(b<=c));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ROUND(f : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if f>=0 then
    if_local1:=longint(f+0.5)
  else
    if_local1:=longint(f-0.5);
  ROUND:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RADIANS(deg : longint) : longint;
begin
  RADIANS:=(deg/180.0)*M_PI;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function DEGREES(rad : longint) : longint;
begin
  DEGREES:=(rad/M_PI)*180.0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SQR(a : longint) : longint;
begin
  SQR:=a*a;
end;


end.
