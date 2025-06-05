unit eina_inline_crc;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function _eina_crc(data: pchar; len, seed: integer; start_stream: TEina_Bool): integer; cdecl; external libeina;

function eina_crc(key: pchar; len, seed: integer; start_stream: TEina_Bool): integer;

implementation

function eina_crc(key: pchar; len, seed: integer; start_stream: TEina_Bool): integer;
begin
  Result := _eina_crc(key, len, seed, start_stream);
end;

end.
