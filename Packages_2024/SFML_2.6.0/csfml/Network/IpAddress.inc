{$IFDEF read_interface}


type
  TsfIpAddress = record
    address: array[0..15] of char;
  end;
  PsfIpAddress = ^TsfIpAddress;

var
  sfIpAddress_None: TsfIpAddress; cvar;external libcsfml_network;
  sfIpAddress_Any: TsfIpAddress; cvar;external libcsfml_network;
  sfIpAddress_LocalHost: TsfIpAddress; cvar;external libcsfml_network;
  sfIpAddress_Broadcast: TsfIpAddress; cvar;external libcsfml_network;

function sfIpAddress_fromString(address: pchar): TsfIpAddress; cdecl; external libcsfml_network;
function sfIpAddress_fromBytes(byte0: TsfUint8; byte1: TsfUint8; byte2: TsfUint8; byte3: TsfUint8): TsfIpAddress; cdecl; external libcsfml_network;
function sfIpAddress_fromInteger(address: TsfUint32): TsfIpAddress; cdecl; external libcsfml_network;
procedure sfIpAddress_toString(address: TsfIpAddress; _string: pchar); cdecl; external libcsfml_network;
function sfIpAddress_toInteger(address: TsfIpAddress): TsfUint32; cdecl; external libcsfml_network;
function sfIpAddress_getLocalAddress: TsfIpAddress; cdecl; external libcsfml_network;
function sfIpAddress_getPublicAddress(timeout: TsfTime): TsfIpAddress; cdecl; external libcsfml_network;

// === Konventiert am: 24-9-25 16:56:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
