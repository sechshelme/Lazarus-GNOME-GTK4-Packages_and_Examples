
{$IFDEF read_interface}

type
  TPangoFcDecoder = record
    parent_instance: TGObject;
  end;
  PPangoFcDecoder = ^TPangoFcDecoder;

  TPangoFcDecoderClass = record
    parent_class: TGObjectClass;
    get_charset: function(decoder: PPangoFcDecoder; fcfont: PPangoFcFont): PFcCharSet; cdecl;
    get_glyph: function(decoder: PPangoFcDecoder; fcfont: PPangoFcFont; wc: Tguint32): TPangoGlyph; cdecl;
    _pango_reserved1: procedure; cdecl;
    _pango_reserved2: procedure; cdecl;
    _pango_reserved3: procedure; cdecl;
    _pango_reserved4: procedure; cdecl;
  end;
  PPangoFcDecoderClass = ^TPangoFcDecoderClass;


function pango_fc_decoder_get_type: TGType; cdecl; external libpangoft2;
function pango_fc_decoder_get_charset(decoder: PPangoFcDecoder; fcfont: PPangoFcFont): PFcCharSet; cdecl; external libpangoft2;
function pango_fc_decoder_get_glyph(decoder: PPangoFcDecoder; fcfont: PPangoFcFont; wc: Tguint32): TPangoGlyph; cdecl; external libpangoft2;

// === Konventiert am: 26-11-24 13:23:44 ===

function PANGO_TYPE_FC_DECODER: TGType;
function PANGO_FC_DECODER(obj: Pointer): PPangoFcDecoder;
function PANGO_FC_DECODER_CLASS(klass: Pointer): PPangoFcDecoderClass;
function PANGO_IS_FC_DECODER(obj: Pointer): Tgboolean;
function PANGO_IS_FC_DECODER_CLASS(klass: Pointer): Tgboolean;
function PANGO_FC_DECODER_GET_CLASS(obj: Pointer): PPangoFcDecoderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_FC_DECODER: TGType;
begin
  PANGO_TYPE_FC_DECODER := pango_fc_decoder_get_type;
end;

function PANGO_FC_DECODER(obj: Pointer): PPangoFcDecoder;
begin
  Result := PPangoFcDecoder(g_type_check_instance_cast(obj, PANGO_TYPE_FC_DECODER));
end;

function PANGO_FC_DECODER_CLASS(klass: Pointer): PPangoFcDecoderClass;
begin
  Result := PPangoFcDecoderClass(g_type_check_class_cast(klass, PANGO_TYPE_FC_DECODER));
end;

function PANGO_IS_FC_DECODER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FC_DECODER);
end;

function PANGO_IS_FC_DECODER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_FC_DECODER);
end;

function PANGO_FC_DECODER_GET_CLASS(obj: Pointer): PPangoFcDecoderClass;
begin
  Result := PPangoFcDecoderClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
