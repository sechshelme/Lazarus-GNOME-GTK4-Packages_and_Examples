unit pangoxft;

interface

uses
  fp_cairo, fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pangoxft.h:
 *
 * Copyright (C) 1999 Red Hat Software
 * Copyright (C) 2000 SuSE Linux Ltd
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGOXFT_H__}
{$define __PANGOXFT_H__}
{$include <pango/pangofc-fontmap.h>}
{$include <pango/pango-context.h>}
{$include <pango/pango-ot.h>}
{$include <pango/pangofc-font.h>}
{$include <pango/pango-layout.h>}
{$include <pango/pangoxft-render.h>}
{$ifndef __GI_SCANNER__}
{*
 * PANGO_RENDER_TYPE_XFT: (skip)
 *
 * A string constant that was used to identify shape engines that work
 * with the Xft backend. See %PANGO_RENDER_TYPE_FC for the replacement.
  }
{$ifndef PANGO_DISABLE_DEPRECATED}

const
  PANGO_RENDER_TYPE_XFT = 'PangoRenderXft';  
{$endif}
{$endif}
{ __GI_SCANNER__  }
{*
 * PangoXftFontMap:
 *
 * `PangoXftFontMap` is an implementation of `PangoFcFontMap` suitable for
 * the Xft library as the renderer.  It is used in to create fonts of
 * type `PangoXftFont`.
  }
{ This is a hack needed because PangoXft hijacks the Pango namespace
 * for the identifiers, but consumers expect these symbols to be under
 * the PangoXft namespace.
  }

type
{*
 * PangoXftFont:
 *
 * `PangoXftFont` is an implementation of `PangoFcFont` using the Xft
 * library for rendering.  It is used in conjunction with `PangoXftFontMap`.
  }
{*
 * PangoXftSubstituteFunc:
 * @pattern: the FcPattern to tweak.
 * @data: user data.
 *
 * Function type for doing final config tweaking on prepared FcPatterns.
  }

  TPangoXftSubstituteFunc = procedure (pattern:PFcPattern; data:Tgpointer);cdecl;
{ Calls for applications
  }

function pango_xft_get_font_map(display:PDisplay; screen:longint):PPangoFontMap;cdecl;external libpango;
{$ifndef PANGO_DISABLE_DEPRECATED}

function pango_xft_get_context(display:PDisplay; screen:longint):PPangoContext;cdecl;external libpango;
{$endif}

procedure pango_xft_shutdown_display(display:PDisplay; screen:longint);cdecl;external libpango;
{$ifndef PANGO_DISABLE_DEPRECATED}

procedure pango_xft_set_default_substitute(display:PDisplay; screen:longint; func:TPangoXftSubstituteFunc; data:Tgpointer; notify:TGDestroyNotify);cdecl;external libpango;
procedure pango_xft_substitute_changed(display:PDisplay; screen:longint);cdecl;external libpango;
{$endif}

function pango_xft_font_map_get_type:TGType;cdecl;external libpango;
{ was #define dname def_expr }
function PANGO_TYPE_XFT_FONT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_FONT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_IS_FONT(obj : longint) : longint;

function pango_xft_font_get_type:TGType;cdecl;external libpango;
{ For shape engines
  }
{$ifndef PANGO_DISABLE_DEPRECATED}

function pango_xft_font_get_font(font:PPangoFont):PXftFont;cdecl;external libpango;
function pango_xft_font_get_display(font:PPangoFont):PDisplay;cdecl;external libpango;
function pango_xft_font_lock_face(font:PPangoFont):TFT_Face;cdecl;external libpango;
procedure pango_xft_font_unlock_face(font:PPangoFont);cdecl;external libpango;
function pango_xft_font_get_glyph(font:PPangoFont; wc:Tgunichar):Tguint;cdecl;external libpango;
function pango_xft_font_has_char(font:PPangoFont; wc:Tgunichar):Tgboolean;cdecl;external libpango;
function pango_xft_font_get_unknown_glyph(font:PPangoFont; wc:Tgunichar):TPangoGlyph;cdecl;external libpango;
{$endif}
{ PANGO_DISABLE_DEPRECATED  }
{$endif}
{ __PANGOXFT_H__  }

// === Konventiert am: 26-11-24 13:57:44 ===

function PANGO_TYPE_XFT_FONT_MAP : TGType;
function PANGO_XFT_FONT_MAP(obj : Pointer) : PPangoXftFontMap;
function PANGO_XFT_IS_FONT_MAP(obj : Pointer) : Tgboolean;

implementation

function PANGO_TYPE_XFT_FONT_MAP : TGType;
  begin
    PANGO_TYPE_XFT_FONT_MAP:=pango_xft_font_map_get_type;
  end;

function PANGO_XFT_FONT_MAP(obj : Pointer) : PPangoXftFontMap;
begin
  Result := PPangoXftFontMap(g_type_check_instance_cast(obj, PANGO_TYPE_XFT_FONT_MAP));
end;

function PANGO_XFT_IS_FONT_MAP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PANGO_TYPE_XFT_FONT_MAP);
end;


{ was #define dname def_expr }
function PANGO_TYPE_XFT_FONT : longint; { return type might be wrong }
  begin
    PANGO_TYPE_XFT_FONT:=pango_xft_font_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_FONT(obj : longint) : longint;
begin
  PANGO_XFT_FONT:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_XFT_FONT,PangoXftFont);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_IS_FONT(obj : longint) : longint;
begin
  PANGO_XFT_IS_FONT:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_XFT_FONT);
end;


end.
