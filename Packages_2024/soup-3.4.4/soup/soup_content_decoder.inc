{$IFDEF read_interface}

type
  TSoupContentDecoder = record
  end;
  PSoupContentDecoder = ^TSoupContentDecoder;

  TSoupContentDecoderClass = record
    parent_class: TGObjectClass;
  end;
  PSoupContentDecoderClass = ^TSoupContentDecoderClass;

function soup_content_decoder_get_type: TGType; cdecl; external libsoup;


// === Konventiert am: 29-9-25 19:45:18 ===

function SOUP_TYPE_CONTENT_DECODER: TGType;
function SOUP_CONTENT_DECODER(obj: Pointer): PSoupContentDecoder;
function SOUP_IS_CONTENT_DECODER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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



{$ENDIF read_implementation}
