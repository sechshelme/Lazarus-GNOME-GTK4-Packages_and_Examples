unit lsmdomtext;

interface

uses
  fp_glib2, fp_lasem;

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

type
  PLsmDomText = ^TLsmDomText;
  TLsmDomText = record
      character_data : TLsmDomCharacterData;
    end;

  PLsmDomTextClass = ^TLsmDomTextClass;
  TLsmDomTextClass = record
      parent_class : TLsmDomCharacterDataClass;
    end;


function lsm_dom_text_get_type:TGType;cdecl;external liblasem;
function lsm_dom_text_new(data:Pchar):PLsmDomNode;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:38:07 ===

function LSM_TYPE_DOM_TEXT : TGType;
function LSM_DOM_TEXT(obj : Pointer) : PLsmDomText;
function LSM_DOM_TEXT_CLASS(klass : Pointer) : PLsmDomTextClass;
function LSM_IS_DOM_TEXT(obj : Pointer) : Tgboolean;
function LSM_IS_DOM_TEXT_CLASS(klass : Pointer) : Tgboolean;
function LSM_DOM_TEXT_GET_CLASS(obj : Pointer) : PLsmDomTextClass;

implementation

function LSM_TYPE_DOM_TEXT : TGType;
  begin
    LSM_TYPE_DOM_TEXT:=lsm_dom_text_get_type;
  end;

function LSM_DOM_TEXT(obj : Pointer) : PLsmDomText;
begin
  Result := PLsmDomText(g_type_check_instance_cast(obj, LSM_TYPE_DOM_TEXT));
end;

function LSM_DOM_TEXT_CLASS(klass : Pointer) : PLsmDomTextClass;
begin
  Result := PLsmDomTextClass(g_type_check_class_cast(klass, LSM_TYPE_DOM_TEXT));
end;

function LSM_IS_DOM_TEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_DOM_TEXT);
end;

function LSM_IS_DOM_TEXT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_DOM_TEXT);
end;

function LSM_DOM_TEXT_GET_CLASS(obj : Pointer) : PLsmDomTextClass;
begin
  Result := PLsmDomTextClass(PGTypeInstance(obj)^.g_class);
end;



end.
