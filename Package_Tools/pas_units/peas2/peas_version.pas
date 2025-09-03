unit peas_version;

interface

uses
  fp_glib2, fp_peas2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  PEAS_MAJOR_VERSION = 2;
  PEAS_MINOR_VERSION = 0;
  PEAS_MICRO_VERSION = 1;
  PEAS_VERSION_S = '2.0.1';

function PEAS_ENCODE_VERSION(major, minor, micro: longint): longint;
function PEAS_VERSION_HEX: longint;
function PEAS_CHECK_VERSION(major, minor, micro: integer): boolean;


// === Konventiert am: 3-9-25 15:45:34 ===


implementation


function PEAS_ENCODE_VERSION(major, minor, micro: longint): longint;
begin
  PEAS_ENCODE_VERSION := ((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

function PEAS_VERSION_HEX: longint;
begin
  PEAS_VERSION_HEX := PEAS_ENCODE_VERSION(PEAS_MAJOR_VERSION, PEAS_MINOR_VERSION, PEAS_MICRO_VERSION);
end;

function PEAS_CHECK_VERSION(major, minor, micro: integer): boolean;
begin
  Result :=
    (PEAS_MAJOR_VERSION > major) or
    ((PEAS_MAJOR_VERSION = major) and (PEAS_MINOR_VERSION > minor)) or
    ((PEAS_MAJOR_VERSION = major) and (PEAS_MINOR_VERSION = minor) and
    (PEAS_MICRO_VERSION >= micro));
end;


end.
