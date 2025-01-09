unit adw_version;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ADW_MAJOR_VERSION = 1;
  ADW_MINOR_VERSION = 5;
  ADW_MICRO_VERSION = 0;
  //  ADW_VERSION = 1.5.0;
  ADW_VERSION_S = '1.5.0';

function ADW_ENCODE_VERSION(major, minor, micro: longint): longint;
function ADW_VERSION_HEX: longint;
function ADW_CHECK_VERSION(major, minor, micro: longint): Tgboolean;
function ADW_VERSION_1_1: longint;
function ADW_VERSION_1_2: longint;
function ADW_VERSION_1_3: longint;
function ADW_VERSION_1_4: longint;
function ADW_VERSION_1_5: longint;

function adw_get_major_version: Tguint; cdecl; external libadwaita;
function adw_get_minor_version: Tguint; cdecl; external libadwaita;
function adw_get_micro_version: Tguint; cdecl; external libadwaita;

// === Konventiert am: 9-1-25 17:45:20 ===


implementation


function ADW_ENCODE_VERSION(major, minor, micro: longint): longint;
begin
  ADW_ENCODE_VERSION := ((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

function ADW_VERSION_HEX: longint;
begin
  ADW_VERSION_HEX := ADW_ENCODE_VERSION(ADW_MAJOR_VERSION, ADW_MINOR_VERSION, ADW_MICRO_VERSION);
end;

function ADW_CHECK_VERSION(major, minor, micro: longint): Tgboolean;
begin
  Result := (ADW_MAJOR_VERSION > major) or
    ((ADW_MAJOR_VERSION = major) and (ADW_MINOR_VERSION > minor)) or
    ((ADW_MAJOR_VERSION = major) and (ADW_MINOR_VERSION = minor) and (ADW_MICRO_VERSION >= micro));
end;

function ADW_VERSION_1_1: longint;
begin
  ADW_VERSION_1_1 := ADW_ENCODE_VERSION(1, 1, 0);
end;

function ADW_VERSION_1_2: longint;
begin
  ADW_VERSION_1_2 := ADW_ENCODE_VERSION(1, 2, 0);
end;

function ADW_VERSION_1_3: longint;
begin
  ADW_VERSION_1_3 := ADW_ENCODE_VERSION(1, 3, 0);
end;

function ADW_VERSION_1_4: longint;
begin
  ADW_VERSION_1_4 := ADW_ENCODE_VERSION(1, 4, 0);
end;

function ADW_VERSION_1_5: longint;
begin
  ADW_VERSION_1_5 := ADW_ENCODE_VERSION(1, 5, 0);
end;


end.
