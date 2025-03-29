{$IFDEF read_interface}


const
  GTK_SOURCE_MAJOR_VERSION = 5;
  GTK_SOURCE_MINOR_VERSION = 12;
  GTK_SOURCE_MICRO_VERSION = 0;

function gtk_source_get_major_version: Tguint; cdecl; external libgtksourceview5;
function gtk_source_get_minor_version: Tguint; cdecl; external libgtksourceview5;
function gtk_source_get_micro_version: Tguint; cdecl; external libgtksourceview5;
function gtk_source_check_version(major: Tguint; minor: Tguint; micro: Tguint): Tgboolean; cdecl; external libgtksourceview5;

function GTK_SOURCE_CHECK_VERSION(major, minor, micro: integer): boolean;
function GTK_SOURCE_VERSION_5_0: longint;
function GTK_SOURCE_VERSION_5_2: longint;
function GTK_SOURCE_VERSION_5_4: longint;
function GTK_SOURCE_VERSION_5_6: longint;
function GTK_SOURCE_VERSION_5_8: longint;
function GTK_SOURCE_VERSION_5_10: longint;
function GTK_SOURCE_VERSION_5_12: longint;

// === Konventiert am: 29-3-25 16:48:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result := (GTK_SOURCE_MAJOR_VERSION > major) or
    ((GTK_SOURCE_MAJOR_VERSION = major) and (GTK_SOURCE_MINOR_VERSION > minor)) or
    ((GTK_SOURCE_MAJOR_VERSION = major) and (GTK_SOURCE_MINOR_VERSION = minor) and
    (GTK_SOURCE_MICRO_VERSION >= micro));
end;


function GTK_SOURCE_VERSION_5_0: longint;
begin
  GTK_SOURCE_VERSION_5_0 := G_ENCODE_VERSION(5, 0);
end;

function GTK_SOURCE_VERSION_5_2: longint;
begin
  GTK_SOURCE_VERSION_5_2 := G_ENCODE_VERSION(5, 2);
end;

function GTK_SOURCE_VERSION_5_4: longint;
begin
  GTK_SOURCE_VERSION_5_4 := G_ENCODE_VERSION(5, 4);
end;

function GTK_SOURCE_VERSION_5_6: longint;
begin
  GTK_SOURCE_VERSION_5_6 := G_ENCODE_VERSION(5, 6);
end;

function GTK_SOURCE_VERSION_5_8: longint;
begin
  GTK_SOURCE_VERSION_5_8 := G_ENCODE_VERSION(5, 8);
end;

function GTK_SOURCE_VERSION_5_10: longint;
begin
  GTK_SOURCE_VERSION_5_10 := G_ENCODE_VERSION(5, 10);
end;

function GTK_SOURCE_VERSION_5_12: longint;
begin
  GTK_SOURCE_VERSION_5_12 := G_ENCODE_VERSION(5, 12);
end;


{$ENDIF read_implementation}
