unit eina_inline_unicode;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ERROR_REPLACEMENT_BASE = $DC80;

function eina_unicode_utf8_next_get(buf: pchar; iindex: PInteger): TEina_Unicode;

implementation

function _eina_unicode_utf8_next_get(ind: integer; d: byte; buf: pchar; iindex: PInteger): TEina_Unicode; cdecl; external libeina;

function EINA_IS_INVALID_BYTE(x: byte): boolean;
begin
  Result := (x = 192) or (x = 193) or (x >= 245);
end;

function EINA_IS_CONTINUATION_BYTE(x: byte): boolean;
begin
  Result := (x and $C0) = $80;
end;

function eina_unicode_utf8_next_get(buf: pchar; iindex: PInteger): TEina_Unicode;
var
  ind: integer;
  r: TEina_Unicode;
  d: byte;
label
  error2;
begin
  if (buf = nil) or (iindex = nil) then begin
    Exit(#0);
  end;

  ind := iindex^;
  d := byte(buf[ind]);
  Inc(ind);

  if d = 0 then begin
    Exit(#0);
  end;

  if (d and $80) = 0 then begin
    iindex^ := ind;
    Exit(TEina_Unicode(d));
  end;

  // 2-Byte-Sequenz
  if (d and $E0) = $C0 then begin
    r := TEina_Unicode((d and $1F) shl 6);
    d := byte(buf[ind]);
    if (d = 0) or EINA_IS_INVALID_BYTE(d) or not EINA_IS_CONTINUATION_BYTE(d) then begin
      goto error2;
    end;
    Inc(ind);
    r := TEina_Unicode(byte(r) or (d and $3F));
    if r <= #$7F then begin
      goto error2;
    end;
    iindex^ := ind;
    Exit(r);
  end;

  // 3- und 4-Byte-Sequenzen
  Exit(_eina_unicode_utf8_next_get(ind, d, buf, iindex));

  error2:
    d := byte(buf[iindex^]);
  Inc(iindex^);
  Exit(TEina_Unicode(ERROR_REPLACEMENT_BASE or d));
end;

end.
