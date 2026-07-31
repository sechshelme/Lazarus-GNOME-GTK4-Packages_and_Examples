

  {$IFDEF read_enum}
const
  AS_MAJOR_VERSION = 1;
  AS_MINOR_VERSION = 0;
  AS_MICRO_VERSION = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
function as_version_string: Pgchar; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:34:11 ===

function AS_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result := (AS_MAJOR_VERSION > major) or
    ((AS_MAJOR_VERSION = major) and (AS_MINOR_VERSION > minor)) or
    ((AS_MAJOR_VERSION = major) and (AS_MINOR_VERSION = minor) and (AS_MICRO_VERSION >= micro));
end;

{$ENDIF read_implementation}
