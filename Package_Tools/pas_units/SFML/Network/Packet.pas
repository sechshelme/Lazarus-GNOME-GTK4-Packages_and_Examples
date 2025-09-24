unit Packet;

interface

uses
  fp_sfml, Config, NetWork_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function sfPacket_create: PsfPacket; cdecl; external libsfml_network;
function sfPacket_copy(packet: PsfPacket): PsfPacket; cdecl; external libsfml_network;
procedure sfPacket_destroy(packet: PsfPacket); cdecl; external libsfml_network;
procedure sfPacket_append(packet: PsfPacket; data: pointer; sizeInBytes: Tsize_t); cdecl; external libsfml_network;
function sfPacket_getReadPosition(packet: PsfPacket): Tsize_t; cdecl; external libsfml_network;
procedure sfPacket_clear(packet: PsfPacket); cdecl; external libsfml_network;
function sfPacket_getData(packet: PsfPacket): pointer; cdecl; external libsfml_network;
function sfPacket_getDataSize(packet: PsfPacket): Tsize_t; cdecl; external libsfml_network;
function sfPacket_endOfPacket(packet: PsfPacket): TsfBool; cdecl; external libsfml_network;
function sfPacket_canRead(packet: PsfPacket): TsfBool; cdecl; external libsfml_network;
function sfPacket_readBool(packet: PsfPacket): TsfBool; cdecl; external libsfml_network;
function sfPacket_readInt8(packet: PsfPacket): TsfInt8; cdecl; external libsfml_network;
function sfPacket_readUint8(packet: PsfPacket): TsfUint8; cdecl; external libsfml_network;
function sfPacket_readInt16(packet: PsfPacket): TsfInt16; cdecl; external libsfml_network;
function sfPacket_readUint16(packet: PsfPacket): TsfUint16; cdecl; external libsfml_network;
function sfPacket_readInt32(packet: PsfPacket): TsfInt32; cdecl; external libsfml_network;
function sfPacket_readUint32(packet: PsfPacket): TsfUint32; cdecl; external libsfml_network;
function sfPacket_readFloat(packet: PsfPacket): single; cdecl; external libsfml_network;
function sfPacket_readDouble(packet: PsfPacket): double; cdecl; external libsfml_network;
procedure sfPacket_readString(packet: PsfPacket; _string: pchar); cdecl; external libsfml_network;
procedure sfPacket_readWideString(packet: PsfPacket; _string: Pwchar_t); cdecl; external libsfml_network;
procedure sfPacket_writeBool(packet: PsfPacket; para2: TsfBool); cdecl; external libsfml_network;
procedure sfPacket_writeInt8(packet: PsfPacket; para2: TsfInt8); cdecl; external libsfml_network;
procedure sfPacket_writeUint8(packet: PsfPacket; para2: TsfUint8); cdecl; external libsfml_network;
procedure sfPacket_writeInt16(packet: PsfPacket; para2: TsfInt16); cdecl; external libsfml_network;
procedure sfPacket_writeUint16(packet: PsfPacket; para2: TsfUint16); cdecl; external libsfml_network;
procedure sfPacket_writeInt32(packet: PsfPacket; para2: TsfInt32); cdecl; external libsfml_network;
procedure sfPacket_writeUint32(packet: PsfPacket; para2: TsfUint32); cdecl; external libsfml_network;
procedure sfPacket_writeFloat(packet: PsfPacket; para2: single); cdecl; external libsfml_network;
procedure sfPacket_writeDouble(packet: PsfPacket; para2: double); cdecl; external libsfml_network;
procedure sfPacket_writeString(packet: PsfPacket; _string: pchar); cdecl; external libsfml_network;
procedure sfPacket_writeWideString(packet: PsfPacket; _string: Pwchar_t); cdecl; external libsfml_network;

// === Konventiert am: 24-9-25 16:56:37 ===


implementation



end.
