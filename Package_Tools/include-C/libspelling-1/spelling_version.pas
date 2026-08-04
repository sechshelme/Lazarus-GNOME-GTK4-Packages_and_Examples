unit spelling_version;

interface

uses
  fp_glib2, fp_spelling;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SPELLING_MAJOR_VERSION = 0;
  SPELLING_MINOR_VERSION = 2;
  SPELLING_MICRO_VERSION = 0;
  SPELLING_VERSION_S = '0.2.0';

function SPELLING_ENCODE_VERSION(major, minor, micro: longint): longint;
function SPELLING_VERSION_HEX: longint;
function SPELLING_CHECK_VERSION(major, minor, micro: integer): boolean;

// === Konventiert am: 4-8-26 17:15:18 ===


implementation

function SPELLING_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result := (SPELLING_MAJOR_VERSION > major) or
    ((SPELLING_MAJOR_VERSION = major) and (SPELLING_MINOR_VERSION > minor)) or
    ((SPELLING_MAJOR_VERSION = major) and (SPELLING_MINOR_VERSION = minor) and (SPELLING_MICRO_VERSION >= micro));
end;

function SPELLING_ENCODE_VERSION(major, minor, micro: longint): longint;
begin
  SPELLING_ENCODE_VERSION := ((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

function SPELLING_VERSION_HEX: longint;
begin
  SPELLING_VERSION_HEX := SPELLING_ENCODE_VERSION(SPELLING_MAJOR_VERSION, SPELLING_MINOR_VERSION, SPELLING_MICRO_VERSION);
end;

end.
