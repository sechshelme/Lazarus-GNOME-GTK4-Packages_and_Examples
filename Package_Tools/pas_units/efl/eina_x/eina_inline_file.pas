unit eina_inline_file;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function eina_file_path_join_len(dst: pchar; size: SizeUInt; a: pchar; a_len: SizeUInt; b: pchar; b_len: SizeUInt): SizeUInt;
function eina_file_path_join(dst: pchar; size: SizeUInt; a: pchar; b: pchar): SizeUInt;

implementation

function eina_file_path_join_len(dst: pchar; size: SizeUInt; a: pchar; a_len: SizeUInt; b: pchar; b_len: SizeUInt): SizeUInt;
begin
  Result := eina_str_join_len(dst, size, EINA_PATH_SEP_C, a, a_len, b, b_len);
end;

function eina_file_path_join(dst: pchar; size: SizeUInt; a: pchar; b: pchar): SizeUInt;
begin
  Result := eina_file_path_join_len(dst, size, a, StrLen(a), b, StrLen(b));
end;

end.
