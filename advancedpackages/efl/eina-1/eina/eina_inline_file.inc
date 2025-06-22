{$IFDEF read_interface}

function eina_file_path_join_len(dst: pchar; size: SizeUInt; a: pchar; a_len: SizeUInt; b: pchar; b_len: SizeUInt): SizeUInt;
function eina_file_path_join(dst: pchar; size: SizeUInt; a: pchar; b: pchar): SizeUInt;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_file_path_join_len(dst: pchar; size: SizeUInt; a: pchar; a_len: SizeUInt; b: pchar; b_len: SizeUInt): SizeUInt;
begin
  Result := eina_str_join_len(dst, size, EINA_PATH_SEP_C, a, a_len, b, b_len);
end;

function eina_file_path_join(dst: pchar; size: SizeUInt; a: pchar; b: pchar): SizeUInt;
begin
  Result := eina_file_path_join_len(dst, size, a, strlen(a), b, strlen(b));
end;

{$ENDIF read_implementation}
