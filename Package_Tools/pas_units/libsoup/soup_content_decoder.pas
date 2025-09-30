unit soup_content_decoder;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2009 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-message-body.h"}

{G_DECLARE_FINAL_TYPE (SoupContentDecoder, soup_content_decoder, SOUP, CONTENT_DECODER, GObject) }

// === Konventiert am: 29-9-25 19:45:18 ===

function SOUP_TYPE_CONTENT_DECODER: TGType;
function SOUP_CONTENT_DECODER(obj: Pointer): PSoupContentDecoder;
function SOUP_IS_CONTENT_DECODER(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_CONTENT_DECODER: TGType;
begin
  Result := soup_content_decoder_get_type;
end;

function SOUP_CONTENT_DECODER(obj: Pointer): PSoupContentDecoder;
begin
  Result := PSoupContentDecoder(g_type_check_instance_cast(obj, SOUP_TYPE_CONTENT_DECODER));
end;

function SOUP_IS_CONTENT_DECODER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_CONTENT_DECODER);
end;

type 
  TSoupContentDecoder = record
  end;
  PSoupContentDecoder = ^TSoupContentDecoder;

  TSoupContentDecoderClass = record
    parent_class: TGObjectClass;
  end;
  PSoupContentDecoderClass = ^TSoupContentDecoderClass;

function soup_content_decoder_get_type: TGType; cdecl; external libgxxxxxxx;



end.
