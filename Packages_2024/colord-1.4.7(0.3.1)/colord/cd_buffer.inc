{$IFDEF read_interface}


type
  PCdBufferKind = ^TCdBufferKind;
  TCdBufferKind = longint;

const
  CD_BUFFER_KIND_REQUEST = 0;
  CD_BUFFER_KIND_RESPONSE = 1;
  CD_BUFFER_KIND_UNKNOWN = 2;

procedure cd_buffer_debug(buffer_kind: TCdBufferKind; data: Pguint8; length: Tgsize); cdecl; external libcolord;
function cd_buffer_read_uint16_be(buffer: Pguint8): Tguint16; cdecl; external libcolord;
function cd_buffer_read_uint16_le(buffer: Pguint8): Tguint16; cdecl; external libcolord;
procedure cd_buffer_write_uint16_be(buffer: Pguint8; value: Tguint16); cdecl; external libcolord;
procedure cd_buffer_write_uint16_le(buffer: Pguint8; value: Tguint16); cdecl; external libcolord;
function cd_buffer_read_uint32_be(buffer: Pguint8): Tguint32; cdecl; external libcolord;
function cd_buffer_read_uint32_le(buffer: Pguint8): Tguint32; cdecl; external libcolord;
procedure cd_buffer_write_uint32_be(buffer: Pguint8; value: Tguint32); cdecl; external libcolord;
procedure cd_buffer_write_uint32_le(buffer: Pguint8; value: Tguint32); cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:08:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
