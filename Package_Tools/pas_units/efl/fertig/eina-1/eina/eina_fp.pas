unit eina_fp;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  EINA_F32P32_PI = $00000003243f6a89;

type
  PEina_F32p32 = ^TEina_F32p32;
  TEina_F32p32 = int64;

  PEina_F16p16 = ^TEina_F16p16;
  TEina_F16p16 = int32;

  PEina_F8p24 = ^TEina_F8p24;
  TEina_F8p24 = int32;

function eina_fp32p32_llabs(a: int32): int32;

function eina_f32p32_cos(a: TEina_F32p32): TEina_F32p32; cdecl; external libeina;
function eina_f32p32_sin(a: TEina_F32p32): TEina_F32p32; cdecl; external libeina;

const
  EINA_F16P16_ONE = 1 shl 16;
  EINA_F16P16_HALF = 1 shl 15;

  // === Konventiert am: 15-5-25 17:35:21 ===


implementation

function eina_fp32p32_llabs(a: int32): int32;
begin
  if a < 0 then begin
    Result := -a;
  end else begin
    Result := a;
  end;
end;


end.
