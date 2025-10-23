{$IFDEF read_interface}


const
  GMIME_YDECODE_STATE_INIT = 0;
  GMIME_YENCODE_STATE_INIT = 0;
  GMIME_YDECODE_STATE_EOLN = 1 shl 8;
  GMIME_YDECODE_STATE_ESCAPE = 1 shl 9;
  GMIME_YDECODE_STATE_BEGIN = 1 shl 12;
  GMIME_YDECODE_STATE_PART = 1 shl 13;
  GMIME_YDECODE_STATE_DECODE = 1 shl 14;
  GMIME_YDECODE_STATE_END = 1 shl 15;
  GMIME_YENCODE_CRC_INIT = not (0);

function GMIME_YENCODE_CRC_FINAL(crc: DWord): DWord;

type
  TGMimeFilterYenc = record
    parent_object: TGMimeFilter;
    encode: Tgboolean;
    part: longint;
    state: longint;
    pcrc: Tguint32;
    crc: Tguint32;
  end;
  PGMimeFilterYenc = ^TGMimeFilterYenc;

  TGMimeFilterYencClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterYencClass = ^TGMimeFilterYencClass;

function g_mime_filter_yenc_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_yenc_new(encode: Tgboolean): PGMimeFilter; cdecl; external libgmime3;
procedure g_mime_filter_yenc_set_state(yenc: PGMimeFilterYenc; state: longint); cdecl; external libgmime3;
procedure g_mime_filter_yenc_set_crc(yenc: PGMimeFilterYenc; crc: Tguint32); cdecl; external libgmime3;
function g_mime_filter_yenc_get_pcrc(yenc: PGMimeFilterYenc): Tguint32; cdecl; external libgmime3;
function g_mime_filter_yenc_get_crc(yenc: PGMimeFilterYenc): Tguint32; cdecl; external libgmime3;
function g_mime_ydecode_step(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; pcrc: Pguint32;
  crc: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_yencode_step(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; pcrc: Pguint32;
  crc: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_yencode_close(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; pcrc: Pguint32;
  crc: Pguint32): Tsize_t; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:28:28 ===

function GMIME_TYPE_FILTER_YENC: TGType;
function GMIME_FILTER_YENC(obj: Pointer): PGMimeFilterYenc;
function GMIME_FILTER_YENC_CLASS(klass: Pointer): PGMimeFilterYencClass;
function GMIME_IS_FILTER_YENC(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_YENC_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_YENC_GET_CLASS(obj: Pointer): PGMimeFilterYencClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_FILTER_YENC: TGType;
begin
  GMIME_TYPE_FILTER_YENC := g_mime_filter_yenc_get_type;
end;

function GMIME_FILTER_YENC(obj: Pointer): PGMimeFilterYenc;
begin
  Result := PGMimeFilterYenc(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_YENC));
end;

function GMIME_FILTER_YENC_CLASS(klass: Pointer): PGMimeFilterYencClass;
begin
  Result := PGMimeFilterYencClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_YENC));
end;

function GMIME_IS_FILTER_YENC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_YENC);
end;

function GMIME_IS_FILTER_YENC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_YENC);
end;

function GMIME_FILTER_YENC_GET_CLASS(obj: Pointer): PGMimeFilterYencClass;
begin
  Result := PGMimeFilterYencClass(PGTypeInstance(obj)^.g_class);
end;


function GMIME_YENCODE_CRC_FINAL(crc: DWord): DWord;
begin
  GMIME_YENCODE_CRC_FINAL := not (crc);
end;


{$ENDIF read_implementation}
