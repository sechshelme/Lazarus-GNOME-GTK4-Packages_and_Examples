{$IFDEF read_interface}

function eina_dbl_exact(a, b: double): TEina_Bool;
function eina_flt_exact(a, b: single): TEina_Bool;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_dbl_exact(a, b: double): TEina_Bool;
begin
  Result := memcmp(@a, @b, SizeOf(double)) = 0;
end;

function eina_flt_exact(a, b: single): TEina_Bool;
begin
  Result := memcmp(@a, @b, SizeOf(single)) = 0;
end;

{$ENDIF read_implementation}
