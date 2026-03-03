
unit lsmdomview;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmdomview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmdomview.h
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
Pcairo_t  = ^cairo_t;
Pchar  = ^char;
Pdouble  = ^double;
Pdword  = ^dword;
PLsmBox  = ^LsmBox;
PLsmDomDocument  = ^LsmDomDocument;
PLsmDomView  = ^LsmDomView;
PLsmDomViewClass  = ^LsmDomViewClass;
PPangoFontDescription  = ^PangoFontDescription;
PPangoLayout  = ^PangoLayout;
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
{$ifndef LSM_DOM_VIEW_H}
{$define LSM_DOM_VIEW_H}
{$include <lsmdomtypes.h>}
{$include <lsmutils.h>}
{$include <cairo.h>}
{$include <pango/pangocairo.h>}

const
  LSM_DOM_VIEW_DEFAULT_RESOLUTION = 72.0;  
  LSM_DOM_VIEW_DEFAULT_VIEWBOX_WIDTH = 320.0;  
  LSM_DOM_VIEW_DEFAULT_VIEWBOX_HEIGHT = 200.0;  

{ was #define dname def_expr }
function LSM_TYPE_DOM_VIEW : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_VIEW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_VIEW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_VIEW(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_VIEW_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_VIEW_GET_CLASS(obj : longint) : longint;

type
  PLsmDomView = ^TLsmDomView;
  TLsmDomView = record
      object : TGObject;
      document : PLsmDomDocument;
      font_description : PPangoFontDescription;
      pango_layout : PPangoLayout;
      measure_pango_layout : PPangoLayout;
      cairo : Pcairo_t;
      is_vector : Tgboolean;
      resolution_ppi : Tdouble;
      viewport_pt : TLsmBox;
    end;

(* Const before type ignored *)
  PLsmDomViewClass = ^TLsmDomViewClass;
  TLsmDomViewClass = record
      parent_class : TGObjectClass;
      document_type : TGType;
      measure : procedure (view:PLsmDomView; width:Pdouble; height:Pdouble; baseline:Pdouble);cdecl;
      render : procedure (view:PLsmDomView);cdecl;
      set_debug : procedure (view:PLsmDomView; feature:Pchar; enable:Tgboolean);cdecl;
    end;


function lsm_dom_view_get_type:TGType;cdecl;external;
function lsm_dom_view_get_resolution(self:PLsmDomView):Tdouble;cdecl;external;
procedure lsm_dom_view_set_resolution(self:PLsmDomView; ppi:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure lsm_dom_view_set_viewport(self:PLsmDomView; viewport_pt:PLsmBox);cdecl;external;
(* Const before type ignored *)
procedure lsm_dom_view_set_viewport_pixels(self:PLsmDomView; viewport:PLsmBox);cdecl;external;
function lsm_dom_view_get_viewport(self:PLsmDomView):TLsmBox;cdecl;external;
function lsm_dom_view_get_viewport_pixels(self:PLsmDomView):TLsmBox;cdecl;external;
procedure lsm_dom_view_render(view:PLsmDomView; cairo:Pcairo_t; x:Tdouble; y:Tdouble);cdecl;external;
procedure lsm_dom_view_get_size(view:PLsmDomView; width:Pdouble; height:Pdouble; baseline:Pdouble);cdecl;external;
procedure lsm_dom_view_get_size_pixels(view:PLsmDomView; width:Pdword; height:Pdword; baseline:Pdword);cdecl;external;
(* Const before type ignored *)
procedure lsm_dom_view_set_debug(view:PLsmDomView; feature:Pchar; enable:Tgboolean);cdecl;external;
procedure lsm_dom_view_set_document(view:PLsmDomView; document:PLsmDomDocument);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function LSM_TYPE_DOM_VIEW : longint; { return type might be wrong }
  begin
    LSM_TYPE_DOM_VIEW:=lsm_dom_view_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_VIEW(obj : longint) : longint;
begin
  LSM_DOM_VIEW:=G_TYPE_CHECK_INSTANCE_CAST(obj,LSM_TYPE_DOM_VIEW,LsmDomView);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_VIEW_CLASS(klass : longint) : longint;
begin
  LSM_DOM_VIEW_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,LSM_TYPE_DOM_VIEW,LsmDomViewClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_VIEW(obj : longint) : longint;
begin
  LSM_IS_DOM_VIEW:=G_TYPE_CHECK_INSTANCE_TYPE(obj,LSM_TYPE_DOM_VIEW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_IS_DOM_VIEW_CLASS(klass : longint) : longint;
begin
  LSM_IS_DOM_VIEW_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,LSM_TYPE_DOM_VIEW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LSM_DOM_VIEW_GET_CLASS(obj : longint) : longint;
begin
  LSM_DOM_VIEW_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,LSM_TYPE_DOM_VIEW,LsmDomViewClass);
end;


end.
