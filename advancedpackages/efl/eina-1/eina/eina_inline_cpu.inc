{$IFDEF read_interface}


function eina_swap16(x: uint16): uint16;
function eina_swap32(x: uint32): uint32;
function eina_swap64(x: uint64): uint64;

function eina_htons(host: uint16): uint16;
function eina_htonl(host: uint32): uint32;
function eina_htonll(host: uint64): uint64;

function eina_ntohs(net: uint16): uint16;
function eina_ntohl(net: uint32): uint32;
function eina_ntohll(net: uint64): uint64;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_swap16(x: uint16): uint16;
begin
  Result := ((x and $FF00) shr 8) or ((x and $00FF) shl 8);
end;

function eina_swap32(x: uint32): uint32;
begin
  Result :=
    (x shr 24) or
    ((x shr 8) and $0000FF00) or
    ((x shl 8) and $00FF0000) or
    (x shl 24);
end;

function eina_swap64(x: uint64): uint64;
begin
  Result :=
    ((x and $FF00000000000000) shr 56) or
    ((x and $00FF000000000000) shr 40) or
    ((x and $0000FF0000000000) shr 24) or
    ((x and $000000FF00000000) shr 8) or
    ((x and $00000000FF000000) shl 8) or
    ((x and $0000000000FF0000) shl 24) or
    ((x and $000000000000FF00) shl 40) or
    ((x and $00000000000000FF) shl 56);
end;

function eina_htons(host: uint16): uint16;
begin
  {$IFDEF ENDIAN_BIG}
  Result := host;
  {$ELSE}
  Result := eina_swap16(host);
  {$ENDIF}
end;

function eina_htonl(host: uint32): uint32;
begin
  {$IFDEF ENDIAN_BIG}
  Result := host;
  {$ELSE}
  Result := eina_swap32(host);
  {$ENDIF}
end;

function eina_htonll(host: uint64): uint64;
begin
  {$IFDEF ENDIAN_BIG}
  Result := host;
  {$ELSE}
  Result := eina_swap64(host);
  {$ENDIF}
end;

function eina_ntohs(net: uint16): uint16;
begin
  {$IFDEF ENDIAN_BIG}
  Result := net;
  {$ELSE}
  Result := eina_swap16(net);
  {$ENDIF}
end;

function eina_ntohl(net: uint32): uint32;
begin
  {$IFDEF ENDIAN_BIG}
  Result := net;
  {$ELSE}
  Result := eina_swap32(net);
  {$ENDIF}
end;

function eina_ntohll(net: uint64): uint64;
begin
  {$IFDEF ENDIAN_BIG}
  Result := net;
  {$ELSE}
  Result := eina_swap64(net);
  {$ENDIF}
end;

{$ENDIF read_implementation}
