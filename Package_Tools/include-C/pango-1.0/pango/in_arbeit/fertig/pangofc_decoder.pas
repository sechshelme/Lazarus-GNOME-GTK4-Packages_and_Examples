unit pangofc_decoder;

interface

uses
  fp_cairo, fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pangofc-decoder.h: Custom encoders/decoders on a per-font basis.
 *
 * Copyright (C) 2004 Red Hat Software
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
{$ifndef __PANGO_DECODER_H_}
{$define __PANGO_DECODER_H_}
{$include <pango/pangofc-font.h>}

type
{*
 * PangoFcDecoder:
 *
 * `PangoFcDecoder` is a virtual base class that implementations will
 * inherit from.
 *
 * It's the interface that is used to define a custom encoding for a font.
 * These objects are created in your code from a function callback that was
 * originally registered with [method@PangoFc.FontMap.add_decoder_find_func].
 * Pango requires information about the supported charset for a font as well
 * as the individual character to glyph conversions. Pango gets that
 * information via the #get_charset and #get_glyph callbacks into your
 * object implementation.
 *
 * Since: 1.6
 * }
{< private > }
  PPangoFcDecoder = ^TPangoFcDecoder;
  TPangoFcDecoder = record
      parent_instance : TGObject;
    end;

{*
 * PangoFcDecoderClass:
 * @get_charset: This returns an `FcCharset` given a `PangoFcFont` that
 *  includes a list of supported characters in the font.  The
 *  #FcCharSet that is returned should be an internal reference to your
 *  code.  Pango will not free this structure.  It is important that
 *  you make this callback fast because this callback is called
 *  separately for each character to determine Unicode coverage.
 * @get_glyph: This returns a single `PangoGlyph` for a given Unicode
 *  code point.
 *
 * Class structure for `PangoFcDecoder`.
 *
 * Since: 1.6
 * }
{< private > }
{ vtable - not signals  }
{< public > }
{< private > }
{ Padding for future expansion  }
  PPangoFcDecoderClass = ^TPangoFcDecoderClass;
  TPangoFcDecoderClass = record
      parent_class : TGObjectClass;
      get_charset : function (decoder:PPangoFcDecoder; fcfont:PPangoFcFont):PFcCharSet;cdecl;
      get_glyph : function (decoder:PPangoFcDecoder; fcfont:PPangoFcFont; wc:Tguint32):TPangoGlyph;cdecl;
      _pango_reserved1 : procedure ;cdecl;
      _pango_reserved2 : procedure ;cdecl;
      _pango_reserved3 : procedure ;cdecl;
      _pango_reserved4 : procedure ;cdecl;
    end;


function pango_fc_decoder_get_type:TGType;cdecl;external libpango;
function pango_fc_decoder_get_charset(decoder:PPangoFcDecoder; fcfont:PPangoFcFont):PFcCharSet;cdecl;external libpango;
function pango_fc_decoder_get_glyph(decoder:PPangoFcDecoder; fcfont:PPangoFcFont; wc:Tguint32):TPangoGlyph;cdecl;external libpango;
{$endif}
{ __PANGO_DECODER_H_  }

// === Konventiert am: 26-11-24 13:34:35 ===

function PANGO_TYPE_FC_DECODER : TGType;
function PANGO_FC_DECODER(obj : Pointer) : PPangoFcDecoder;
function PANGO_FC_DECODER_CLASS(klass : Pointer) : PPangoFcDecoderClass;
function PANGO_IS_FC_DECODER(obj : Pointer) : Tgboolean;
function PANGO_IS_FC_DECODER_CLASS(klass : Pointer) : Tgboolean;
function PANGO_FC_DECODER_GET_CLASS(obj : Pointer) : PPangoFcDecoderClass;

implementation

function PANGO_TYPE_FC_DECODER : TGType;
  begin
    PANGO_TYPE_FC_DECODER:=pango_fc_decoder_get_type;
  end;

function PANGO_FC_DECODER(obj : Pointer) : PPangoFcDecoder;
begin
  Result := PPangoFcDecoder(g_type_check_instance_cast(obj, PANGO_TYPE_FC_DECODER));
end;

function PANGO_FC_DECODER_CLASS(klass : Pointer) : PPangoFcDecoderClass;
begin
  Result := PPangoFcDecoderClass(g_type_check_class_cast(klass, PANGO_TYPE_FC_DECODER));
end;

function PANGO_IS_FC_DECODER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PANGO_TYPE_FC_DECODER);
end;

function PANGO_IS_FC_DECODER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PANGO_TYPE_FC_DECODER);
end;

function PANGO_FC_DECODER_GET_CLASS(obj : Pointer) : PPangoFcDecoderClass;
begin
  Result := PPangoFcDecoderClass(PGTypeInstance(obj)^.g_class);
end;



end.
