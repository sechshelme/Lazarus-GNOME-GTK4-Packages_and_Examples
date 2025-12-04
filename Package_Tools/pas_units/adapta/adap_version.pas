unit adap_version;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ADAP_MAJOR_VERSION = 1;
  ADAP_MINOR_VERSION = 5;
  ADAP_MICRO_VERSION = 0;
  ADAP_VERSION_S = '1.5.0';

function ADAP_ENCODE_VERSION(major, minor, micro: longint): longint;
function ADAP_VERSION_HEX: longint;

function ADAP_CHECK_VERSION(major, minor, micro: integer): boolean; inline;

function ADAP_VERSION_1_1: longint;
function ADAP_VERSION_1_2: longint;
function ADAP_VERSION_1_3: longint;
function ADAP_VERSION_1_4: longint;
function ADAP_VERSION_1_5: longint;

function adap_get_major_version: Tguint; cdecl; external libadapta;
function adap_get_minor_version: Tguint; cdecl; external libadapta;
function adap_get_micro_version: Tguint; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:27:35 ===


implementation

function ADAP_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result :=
    (ADAP_MAJOR_VERSION > major) or
    ((ADAP_MAJOR_VERSION = major) and (ADAP_MINOR_VERSION > minor)) or
    ((ADAP_MAJOR_VERSION = major) and (ADAP_MINOR_VERSION = minor) and
    (ADAP_MICRO_VERSION >= micro));
end;

function ADAP_ENCODE_VERSION(major, minor, micro: longint): longint;
begin
  ADAP_ENCODE_VERSION := ((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

function ADAP_VERSION_HEX: longint;
begin
  ADAP_VERSION_HEX := ADAP_ENCODE_VERSION(ADAP_MAJOR_VERSION, ADAP_MINOR_VERSION, ADAP_MICRO_VERSION);
end;

function ADAP_VERSION_1_1: longint;
begin
  ADAP_VERSION_1_1 := ADAP_ENCODE_VERSION(1, 1, 0);
end;

function ADAP_VERSION_1_2: longint;
begin
  ADAP_VERSION_1_2 := ADAP_ENCODE_VERSION(1, 2, 0);
end;

function ADAP_VERSION_1_3: longint;
begin
  ADAP_VERSION_1_3 := ADAP_ENCODE_VERSION(1, 3, 0);
end;

function ADAP_VERSION_1_4: longint;
begin
  ADAP_VERSION_1_4 := ADAP_ENCODE_VERSION(1, 4, 0);
end;

function ADAP_VERSION_1_5: longint;
begin
  ADAP_VERSION_1_5 := ADAP_ENCODE_VERSION(1, 5, 0);
end;


end.
