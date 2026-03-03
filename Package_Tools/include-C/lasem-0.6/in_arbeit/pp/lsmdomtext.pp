
unit lsmdomtext;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmdomtext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmdomtext.h
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
PLsmDomNode  = ^LsmDomNode;
PLsmDomText  = ^LsmDomText;
PLsmDomTextClass  = ^LsmDomTextClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2008 Emmanuel Pacaud
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
{$ifndef LSM_DOM_TEXT_H}
{$define LSM_DOM_TEXT_H}
{$include <lsmdomcharacterdata.h>}

{ was #define dname def_expr }
function LSM_TYPE_DOM_TEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_TEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_TEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_TEXT_GET_CLASS(obj : longint) : longint;

type
  PLsmDomText = ^TLsmDomText;
  TLsmDomText = record
      character_data : TLsmDomCharacterData;
    end;

  PLsmDomTextClass = ^TLsmDomTextClass;
  TLsmDomTextClass = record
      parent_class : TLsmDomCharacterDataClass;
    end;


function lsm_dom_text_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function lsm_dom_text_new(data:Pchar):PLsmDomNode;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_DOM_TEXT : longint; { return type might be wrong }
  begin
    LSM_TYPE_DOM_TEXT:=lsm_dom_text_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_TEXT(obj : longint) : longint;
begin
  LSM_DOM_TEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_DOM_TEXT,LsmDomText);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_TEXT_CLASS(klass : longint) : longint;
begin
  LSM_DOM_TEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_DOM_TEXT,LsmDomTextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_TEXT(obj : longint) : longint;
begin
  LSM_IS_DOM_TEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_DOM_TEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_TEXT_CLASS(klass : longint) : longint;
begin
  LSM_IS_DOM_TEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_DOM_TEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_TEXT_GET_CLASS(obj : longint) : longint;
begin
  LSM_DOM_TEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_DOM_TEXT,LsmDomTextClass);
end;


end.
