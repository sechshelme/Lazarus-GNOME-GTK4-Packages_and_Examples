unit gversion;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  glib_major_version: Tguint; cvar;external libglib2;
  glib_minor_version: Tguint; cvar;external libglib2;
  glib_micro_version: Tguint; cvar;external libglib2;
  glib_interface_age: Tguint; cvar;external libglib2;
  glib_binary_age: Tguint; cvar;external libglib2;

function glib_check_version(required_major: Tguint; required_minor: Tguint; required_micro: Tguint): Pgchar; cdecl; external libglib2;

function GLIB_CHECK_VERSION(major, minor, micro: longint): Tgboolean; inline;

// === Konventiert am: 22-6-26 20:03:06 ===


implementation

function GLIB_CHECK_VERSION(major, minor, micro: longint): Tgboolean;
begin
  Result :=
    (GLIB_MAJOR_VERSION > major) or
    ((GLIB_MAJOR_VERSION = major) and (GLIB_MINOR_VERSION > minor)) or
    ((GLIB_MAJOR_VERSION = major) and (GLIB_MINOR_VERSION = minor) and (GLIB_MICRO_VERSION >= micro));
end;



end.
