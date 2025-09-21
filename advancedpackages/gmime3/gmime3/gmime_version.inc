{$IFDEF read_interface}


const
  GMIME_MAJOR_VERSION_ = 3;  
  GMIME_MINOR_VERSION_ = 2;
  GMIME_MICRO_VERSION_ = 13;
  GMIME_BINARY_AGE_ = 213;
  GMIME_INTERFACE_AGE_ = 0;

function GMIME_CHECK_VERSION(major, minor, micro: Integer): Boolean; inline;

// === Konventiert am: 18-9-25 15:34:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result := (GMIME_MAJOR_VERSION_ > major) or
    ((GMIME_MAJOR_VERSION_ = major) and (GMIME_MINOR_VERSION_ > minor)) or
    ((GMIME_MAJOR_VERSION_ = major) and (GMIME_MINOR_VERSION_ = minor) and
    (GMIME_MICRO_VERSION_ >= micro));
end;


{$ENDIF read_implementation}
