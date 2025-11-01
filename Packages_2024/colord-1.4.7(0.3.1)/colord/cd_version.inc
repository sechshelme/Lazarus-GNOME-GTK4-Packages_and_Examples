{$IFDEF read_interface}


const
  CD_MAJOR_VERSION = 1;
  CD_MINOR_VERSION = 4;
  CD_MICRO_VERSION = 7;

function CD_CHECK_VERSION(major, minor, micro: integer): boolean;

// === Konventiert am: 1-11-25 16:02:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function CD_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result :=
    (CD_MAJOR_VERSION > major) or
    ((CD_MAJOR_VERSION = major) and (CD_MINOR_VERSION > minor)) or
    ((CD_MAJOR_VERSION = major) and (CD_MINOR_VERSION = minor) and
    (CD_MICRO_VERSION >= micro));
end;


{$ENDIF read_implementation}
