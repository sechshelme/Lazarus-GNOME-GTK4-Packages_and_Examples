unit fwupd_version;

interface

uses
  fp_glib2, fp_fwupd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  FWUPD_MAJOR_VERSION = 1;
  FWUPD_MINOR_VERSION = 9;
  FWUPD_MICRO_VERSION = 34;

function FWUPD_CHECK_VERSION(major, minor, micro: integer): boolean; inline;

function fwupd_version_string: Pgchar; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:36:29 ===


implementation

function FWUPD_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result :=
    (FWUPD_MAJOR_VERSION > major) or
    ((FWUPD_MAJOR_VERSION = major) and (FWUPD_MINOR_VERSION > minor)) or
    ((FWUPD_MAJOR_VERSION = major) and (FWUPD_MINOR_VERSION = minor) and
    (FWUPD_MICRO_VERSION >= micro));
end;


end.
