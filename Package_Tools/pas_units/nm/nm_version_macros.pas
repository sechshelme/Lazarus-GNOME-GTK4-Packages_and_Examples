unit nm_version_macros;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_MAJOR_VERSION = 1;
  NM_MINOR_VERSION = 46;
  NM_MICRO_VERSION = 0;
  {$ENDIF read_enum}

{$IFDEF read_function}
function NM_CHECK_VERSION(major, minor, micro: integer): boolean; inline;

function NM_ENCODE_VERSION(major, minor, micro: longint): longint;
function NM_VERSION_0_9_8: longint;
function NM_VERSION_0_9_10: longint;
function NM_VERSION_1_0: longint;
function NM_VERSION_1_2: longint;
function NM_VERSION_1_4: longint;
function NM_VERSION_1_6: longint;
function NM_VERSION_1_8: longint;
function NM_VERSION_1_10: longint;
function NM_VERSION_1_12: longint;
function NM_VERSION_1_14: longint;
function NM_VERSION_1_16: longint;
function NM_VERSION_1_18: longint;
function NM_VERSION_1_20: longint;
function NM_VERSION_1_22: longint;
function NM_VERSION_1_24: longint;
function NM_VERSION_1_26: longint;
function NM_VERSION_1_28: longint;
function NM_VERSION_1_30: longint;
function NM_VERSION_1_32: longint;
function NM_VERSION_1_34: longint;
function NM_VERSION_1_36: longint;
function NM_VERSION_1_38: longint;
function NM_VERSION_1_40: longint;
function NM_VERSION_1_42: longint;
function NM_VERSION_1_44: longint;
function NM_VERSION_1_46: longint;

function NM_VERSION: longint;
{$ENDIF read_function}

// === Konventiert am: 19-4-26 19:20:22 ===


implementation

function NM_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result :=
    (NM_MAJOR_VERSION > major) or
    ((NM_MAJOR_VERSION = major) and (NM_MINOR_VERSION > minor)) or
    ((NM_MAJOR_VERSION = major) and (NM_MINOR_VERSION = minor) and (NM_MICRO_VERSION >= micro));
end;


function NM_ENCODE_VERSION(major, minor, micro: longint): longint;
begin
  NM_ENCODE_VERSION := ((major shl 16) or (minor shl 8)) or micro;
end;

function NM_VERSION_0_9_8: longint;
begin
  NM_VERSION_0_9_8 := NM_ENCODE_VERSION(0, 9, 8);
end;

function NM_VERSION_0_9_10: longint;
begin
  NM_VERSION_0_9_10 := NM_ENCODE_VERSION(0, 9, 10);
end;

function NM_VERSION_1_0: longint;
begin
  NM_VERSION_1_0 := NM_ENCODE_VERSION(1, 0, 0);
end;

function NM_VERSION_1_2: longint;
begin
  NM_VERSION_1_2 := NM_ENCODE_VERSION(1, 2, 0);
end;

function NM_VERSION_1_4: longint;
begin
  NM_VERSION_1_4 := NM_ENCODE_VERSION(1, 4, 0);
end;

function NM_VERSION_1_6: longint;
begin
  NM_VERSION_1_6 := NM_ENCODE_VERSION(1, 6, 0);
end;

function NM_VERSION_1_8: longint;
begin
  NM_VERSION_1_8 := NM_ENCODE_VERSION(1, 8, 0);
end;

function NM_VERSION_1_10: longint;
begin
  NM_VERSION_1_10 := NM_ENCODE_VERSION(1, 10, 0);
end;

function NM_VERSION_1_12: longint;
begin
  NM_VERSION_1_12 := NM_ENCODE_VERSION(1, 12, 0);
end;

function NM_VERSION_1_14: longint;
begin
  NM_VERSION_1_14 := NM_ENCODE_VERSION(1, 14, 0);
end;

function NM_VERSION_1_16: longint;
begin
  NM_VERSION_1_16 := NM_ENCODE_VERSION(1, 16, 0);
end;

function NM_VERSION_1_18: longint;
begin
  NM_VERSION_1_18 := NM_ENCODE_VERSION(1, 18, 0);
end;

function NM_VERSION_1_20: longint;
begin
  NM_VERSION_1_20 := NM_ENCODE_VERSION(1, 20, 0);
end;

function NM_VERSION_1_22: longint;
begin
  NM_VERSION_1_22 := NM_ENCODE_VERSION(1, 22, 0);
end;

function NM_VERSION_1_24: longint;
begin
  NM_VERSION_1_24 := NM_ENCODE_VERSION(1, 24, 0);
end;

function NM_VERSION_1_26: longint;
begin
  NM_VERSION_1_26 := NM_ENCODE_VERSION(1, 26, 0);
end;

function NM_VERSION_1_28: longint;
begin
  NM_VERSION_1_28 := NM_ENCODE_VERSION(1, 28, 0);
end;

function NM_VERSION_1_30: longint;
begin
  NM_VERSION_1_30 := NM_ENCODE_VERSION(1, 30, 0);
end;

function NM_VERSION_1_32: longint;
begin
  NM_VERSION_1_32 := NM_ENCODE_VERSION(1, 32, 0);
end;

function NM_VERSION_1_34: longint;
begin
  NM_VERSION_1_34 := NM_ENCODE_VERSION(1, 34, 0);
end;

function NM_VERSION_1_36: longint;
begin
  NM_VERSION_1_36 := NM_ENCODE_VERSION(1, 36, 0);
end;

function NM_VERSION_1_38: longint;
begin
  NM_VERSION_1_38 := NM_ENCODE_VERSION(1, 38, 0);
end;

function NM_VERSION_1_40: longint;
begin
  NM_VERSION_1_40 := NM_ENCODE_VERSION(1, 40, 0);
end;

function NM_VERSION_1_42: longint;
begin
  NM_VERSION_1_42 := NM_ENCODE_VERSION(1, 42, 0);
end;

function NM_VERSION_1_44: longint;
begin
  NM_VERSION_1_44 := NM_ENCODE_VERSION(1, 44, 0);
end;

function NM_VERSION_1_46: longint;
begin
  NM_VERSION_1_46 := NM_ENCODE_VERSION(1, 46, 0);
end;

function NM_VERSION: longint;
begin
  NM_VERSION := NM_ENCODE_VERSION(NM_MAJOR_VERSION, NM_MINOR_VERSION, NM_MICRO_VERSION);
end;


end.
