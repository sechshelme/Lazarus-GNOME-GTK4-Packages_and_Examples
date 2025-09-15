unit json_version;

interface

uses
  fp_json_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  JSON_MAJOR_VERSION = 1;
  JSON_MINOR_VERSION = 8;
  JSON_MICRO_VERSION = 0;
  JSON_VERSION_S = '1.8.0';

function JSON_ENCODE_VERSION(major, minor, micro: longint): longint;
function JSON_VERSION_HEX: longint;
function JSON_CHECK_VERSION(major, minor, micro: integer): boolean; inline;

// === Konventiert am: 15-9-25 13:27:52 ===


implementation

function JSON_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result :=
    (JSON_MAJOR_VERSION > major) or
    ((JSON_MAJOR_VERSION = major) and (JSON_MINOR_VERSION > minor)) or
    ((JSON_MAJOR_VERSION = major) and (JSON_MINOR_VERSION = minor) and
    (JSON_MICRO_VERSION >= micro));
end;

function JSON_ENCODE_VERSION(major, minor, micro: longint): longint;
begin
  JSON_ENCODE_VERSION := ((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

function JSON_VERSION_HEX: longint;
begin
  JSON_VERSION_HEX := JSON_ENCODE_VERSION(JSON_MAJOR_VERSION, JSON_MINOR_VERSION, JSON_MICRO_VERSION);
end;


end.
