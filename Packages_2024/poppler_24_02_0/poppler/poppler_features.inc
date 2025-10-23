{$IFDEF read_interface}


const
  POPPLER_HAS_CAIRO = 1;
  POPPLER_MAJOR_VERSION = 24;
  POPPLER_MINOR_VERSION = 2;
  POPPLER_MICRO_VERSION = 0;

function POPPLER_CHECK_VERSION(major, minor, micro: integer): boolean;

// === Konventiert am: 15-8-25 16:54:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function POPPLER_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result := (POPPLER_MAJOR_VERSION > major) or
    ((POPPLER_MAJOR_VERSION = major) and (POPPLER_MINOR_VERSION > minor)) or
    ((POPPLER_MAJOR_VERSION = major) and (POPPLER_MINOR_VERSION = minor) and (POPPLER_MICRO_VERSION >= micro));
end;


{$ENDIF read_implementation}
