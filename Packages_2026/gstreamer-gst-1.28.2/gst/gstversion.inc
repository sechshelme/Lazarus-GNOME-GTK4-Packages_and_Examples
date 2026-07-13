

  {$IFDEF read_enum}
const
  GST_VERSION_MAJOR = 1;
  GST_VERSION_MINOR = 28;
  GST_VERSION_MICRO = 2;
  GST_VERSION_NANO = 0;
  {$ENDIF read_enum}

{$IFDEF read_function}
function GST_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 15:53:49 ===



{$IFDEF read_implementation}

function GST_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result := (GST_VERSION_MAJOR > major) or
    ((GST_VERSION_MAJOR = major) and (GST_VERSION_MINOR > minor)) or
    ((GST_VERSION_MAJOR = major) and (GST_VERSION_MINOR = minor) and (GST_VERSION_MICRO >= micro));
end;

{$ENDIF read_implementation}
