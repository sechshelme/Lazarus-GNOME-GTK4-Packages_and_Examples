unit eina_sha;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TdstArr = array[0..19] of byte;

procedure eina_sha1(data: pbyte; size: longint; dst: TdstArr); cdecl; external libeina;

// === Konventiert am: 17-5-25 16:32:02 ===


implementation



end.
