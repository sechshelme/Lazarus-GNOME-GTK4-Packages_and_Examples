{$IFDEF read_interface}


const
  IBUS_MAJOR_VERSION = 1;
  IBUS_MINOR_VERSION = 5;
  IBUS_MICRO_VERSION = 29;


function IBUS_CHECK_VERSION(major, minor, micro: integer): boolean;


// === Konventiert am: 26-7-25 16:17:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result := (IBUS_MAJOR_VERSION > major) or
    ((IBUS_MAJOR_VERSION = major) and (IBUS_MINOR_VERSION > minor)) or
    ((IBUS_MAJOR_VERSION = major) and (IBUS_MINOR_VERSION = minor) and (IBUS_MICRO_VERSION >= micro));
end;

{$ENDIF read_implementation}
