{$IFDEF read_interface}


const
  XMLB_MAJOR_VERSION = 0;
  XMLB_MINOR_VERSION = 3;
  XMLB_MICRO_VERSION = 18;

function LIBXMLB_CHECK_VERSION(major, minor, micro: integer): boolean; inline;

// === Konventiert am: 1-10-25 19:43:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function LIBXMLB_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result :=
    (XMLB_MAJOR_VERSION > major) or
    ((XMLB_MAJOR_VERSION = major) and (XMLB_MINOR_VERSION > minor)) or
    ((XMLB_MAJOR_VERSION = major) and (XMLB_MINOR_VERSION = minor) and
    (XMLB_MICRO_VERSION >= micro));
end;

{$ENDIF read_implementation}
