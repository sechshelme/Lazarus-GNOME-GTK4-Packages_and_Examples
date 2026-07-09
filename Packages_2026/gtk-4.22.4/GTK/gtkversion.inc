

  {$IFDEF read_enum}
const
  GTK_MAJOR_VERSION = 4;
  GTK_MINOR_VERSION = 22;
  GTK_MICRO_VERSION = 4;
  GTK_BINARY_AGE = 2204;
  GTK_INTERFACE_AGE = 4;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gtk_get_major_version: Tguint; cdecl; external libgtk4;
function gtk_get_minor_version: Tguint; cdecl; external libgtk4;
function gtk_get_micro_version: Tguint; cdecl; external libgtk4;
function gtk_get_binary_age: Tguint; cdecl; external libgtk4;
function gtk_get_interface_age: Tguint; cdecl; external libgtk4;
function gtk_check_version(required_major: Tguint; required_minor: Tguint; required_micro: Tguint): pchar; cdecl; external libgtk4;

function GTK_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
{$ENDIF read_function}

// === Konventiert am: 6-7-26 16:33:00 ===



{$IFDEF read_implementation}

function GTK_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result := (GTK_MAJOR_VERSION > major) or
    ((GTK_MAJOR_VERSION = major) and (GTK_MINOR_VERSION > minor)) or
    ((GTK_MAJOR_VERSION = major) and (GTK_MINOR_VERSION = minor) and (GTK_MICRO_VERSION >= micro));
end;

{$ENDIF read_implementation}
