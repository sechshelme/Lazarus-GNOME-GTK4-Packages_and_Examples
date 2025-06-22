{$IFDEF read_interface}

function _eina_crc(data: pchar; len, seed: integer; start_stream: TEina_Bool): integer; cdecl; external libeina;

function eina_crc(key: pchar; len, seed: integer; start_stream: TEina_Bool): integer;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_crc(key: pchar; len, seed: integer; start_stream: TEina_Bool): integer;
begin
  Result := _eina_crc(key, len, seed, start_stream);
end;

{$ENDIF read_implementation}
