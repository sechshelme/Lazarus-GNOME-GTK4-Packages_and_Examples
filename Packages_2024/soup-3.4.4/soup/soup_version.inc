{$IFDEF read_interface}


const
  SOUP_MAJOR_VERSION = 3;
  SOUP_MINOR_VERSION = 4;
  SOUP_MICRO_VERSION = 4;

function SOUP_CHECK_VERSION(major, minor, micro: integer): boolean; inline;

function SOUP_VERSION_3_0: longint;
function SOUP_VERSION_3_2: longint;
function SOUP_VERSION_3_4: longint;

function soup_get_major_version: Tguint; cdecl; external libsoup;
function soup_get_minor_version: Tguint; cdecl; external libsoup;
function soup_get_micro_version: Tguint; cdecl; external libsoup;
function soup_check_version(major: Tguint; minor: Tguint; micro: Tguint): Tgboolean; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:43:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result :=
    (SOUP_MAJOR_VERSION > major) or
    ((SOUP_MAJOR_VERSION = major) and (SOUP_MINOR_VERSION > minor)) or
    ((SOUP_MAJOR_VERSION = major) and (SOUP_MINOR_VERSION = minor) and
    (SOUP_MICRO_VERSION >= micro));
end;

function SOUP_VERSION_3_0: longint;
begin
  SOUP_VERSION_3_0 := G_ENCODE_VERSION(3, 0);
end;

function SOUP_VERSION_3_2: longint;
begin
  SOUP_VERSION_3_2 := G_ENCODE_VERSION(3, 2);
end;

function SOUP_VERSION_3_4: longint;
begin
  SOUP_VERSION_3_4 := G_ENCODE_VERSION(3, 4);
end;


{$ENDIF read_implementation}
