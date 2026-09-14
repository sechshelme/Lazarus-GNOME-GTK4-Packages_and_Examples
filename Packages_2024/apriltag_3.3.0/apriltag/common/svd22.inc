{$IFDEF read_interface}


procedure svd22(A: Pdouble; U: Pdouble; S: Pdouble; V: Pdouble); cdecl; external libapriltag;
procedure svd_sym_singular_values(A00: Tdouble; A01: Tdouble; A11: Tdouble; Lmin: Pdouble; Lmax: Pdouble); cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:28:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
