unit gmime_encodings;

interface

uses
  fp_glib2, fp_gmime3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeContentEncoding = ^TGMimeContentEncoding;
  TGMimeContentEncoding = longint;

const
  GMIME_CONTENT_ENCODING_DEFAULT = 0;
  GMIME_CONTENT_ENCODING_7BIT = 1;
  GMIME_CONTENT_ENCODING_8BIT = 2;
  GMIME_CONTENT_ENCODING_BINARY = 3;
  GMIME_CONTENT_ENCODING_BASE64 = 4;
  GMIME_CONTENT_ENCODING_QUOTEDPRINTABLE = 5;
  GMIME_CONTENT_ENCODING_UUENCODE = 6;

type
  PGMimeEncodingConstraint = ^TGMimeEncodingConstraint;
  TGMimeEncodingConstraint = longint;

const
  GMIME_ENCODING_CONSTRAINT_7BIT = 0;
  GMIME_ENCODING_CONSTRAINT_8BIT = 1;
  GMIME_ENCODING_CONSTRAINT_BINARY = 2;

function g_mime_content_encoding_from_string(str: pchar): TGMimeContentEncoding; cdecl; external libgmime3;
function g_mime_content_encoding_to_string(encoding: TGMimeContentEncoding): pchar; cdecl; external libgmime3;

function GMIME_BASE64_ENCODE_LEN(x: Tsize_t): Tsize_t;
function GMIME_QP_ENCODE_LEN(x: Tsize_t): Tsize_t;
function GMIME_UUENCODE_LEN(x: Tsize_t): Tsize_t;

const
  GMIME_UUDECODE_STATE_INIT = 0;
  GMIME_UUDECODE_STATE_BEGIN = 1 shl 16;
  GMIME_UUDECODE_STATE_END = 1 shl 17;
  GMIME_UUDECODE_STATE_MASK = GMIME_UUDECODE_STATE_BEGIN or GMIME_UUDECODE_STATE_END;

type
  TGMimeEncoding = record
    encoding: TGMimeContentEncoding;
    uubuf: array[0..59] of byte;
    encode: Tgboolean;
    save: Tguint32;
    state: longint;
  end;
  PGMimeEncoding = ^TGMimeEncoding;

procedure g_mime_encoding_init_encode(state: PGMimeEncoding; encoding: TGMimeContentEncoding); cdecl; external libgmime3;
procedure g_mime_encoding_init_decode(state: PGMimeEncoding; encoding: TGMimeContentEncoding); cdecl; external libgmime3;
procedure g_mime_encoding_reset(state: PGMimeEncoding); cdecl; external libgmime3;
function g_mime_encoding_outlen(state: PGMimeEncoding; inlen: Tsize_t): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_step(state: PGMimeEncoding; inbuf: pchar; inlen: Tsize_t; outbuf: pchar): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_flush(state: PGMimeEncoding; inbuf: pchar; inlen: Tsize_t; outbuf: pchar): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_base64_decode_step(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; save: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_base64_encode_step(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; save: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_base64_encode_close(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; save: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_uudecode_step(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; save: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_uuencode_step(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; uubuf: pbyte; state: Plongint;
  save: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_uuencode_close(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; uubuf: pbyte; state: Plongint;
  save: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_quoted_decode_step(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; save: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_quoted_encode_step(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; save: Pguint32): Tsize_t; cdecl; external libgmime3;
function g_mime_encoding_quoted_encode_close(inbuf: pbyte; inlen: Tsize_t; outbuf: pbyte; state: Plongint; save: Pguint32): Tsize_t; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:26:46 ===


implementation


function GMIME_BASE64_ENCODE_LEN(x: Tsize_t): Tsize_t;
begin
  Result := (((x + 2) div 57) * 77) + 77;
end;

function GMIME_QP_ENCODE_LEN(x: Tsize_t): Tsize_t;
begin
  Result := ((x div 24) * 74) + 74;
end;

function GMIME_UUENCODE_LEN(x: Tsize_t): Tsize_t;
begin
  Result := (((x + 2) div 45) * 62) + 64;
end;


end.
