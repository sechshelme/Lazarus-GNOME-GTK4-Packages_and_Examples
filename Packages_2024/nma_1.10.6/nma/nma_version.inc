{$IFDEF read_interface}


const
  NMA_MAJOR_VERSION = 1;
  NMA_MINOR_VERSION = 10;
  NMA_MICRO_VERSION = 6;

function NMA_ENCODE_VERSION(major, minor, micro: longint): longint;
function NMA_VERSION_1_2: longint;
function NMA_VERSION_1_4: longint;
function NMA_VERSION_1_8: longint;
function NMA_VERSION_1_8_2: longint;
function NMA_VERSION_1_8_4: longint;
function NMA_VERSION_1_8_6: longint;
function NMA_VERSION_1_8_8: longint;
function NMA_VERSION_1_8_10: longint;
function NMA_VERSION_1_8_12: longint;
function NMA_VERSION_1_8_22: longint;
function NMA_VERSION_1_8_26: longint;
function NMA_VERSION_1_8_28: longint;
function NMA_VERSION_1_8_34: longint;
function NMA_VERSION_1_8_36: longint;
function NMA_VERSION_1_10_6: longint;

// === Konventiert am: 8-8-26 13:25:19 ===

function NMA_API_VERSION: integer; inline;
function NMA_CHECK_VERSION(major, minor, micro: integer): boolean; inline;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function NMA_CHECK_VERSION(major, minor, micro: integer): boolean; inline;
begin
  Result := (NMA_MAJOR_VERSION > major) or
    ((NMA_MAJOR_VERSION = major) and (NMA_MINOR_VERSION > minor)) or
    ((NMA_MAJOR_VERSION = major) and (NMA_MINOR_VERSION = minor) and (NMA_MICRO_VERSION >= micro));
end;

function NMA_API_VERSION: integer; inline;
begin
  if (NMA_MINOR_VERSION mod 2) = 1 then begin
    Result := NMA_ENCODE_VERSION(NMA_MAJOR_VERSION, NMA_MINOR_VERSION + 1, 0);
  end else begin
    Result := NMA_ENCODE_VERSION(NMA_MAJOR_VERSION, NMA_MINOR_VERSION, ((NMA_MICRO_VERSION + 1) div 2) * 2);
  end;
end;

function NMA_ENCODE_VERSION(major, minor, micro: longint): longint;
begin
  NMA_ENCODE_VERSION := ((major shl 16) or (minor shl 8)) or micro;
end;

function NMA_VERSION_1_2: longint;
begin
  NMA_VERSION_1_2 := NMA_ENCODE_VERSION(1, 2, 0);
end;

function NMA_VERSION_1_4: longint;
begin
  NMA_VERSION_1_4 := NMA_ENCODE_VERSION(1, 4, 0);
end;

function NMA_VERSION_1_8: longint;
begin
  NMA_VERSION_1_8 := NMA_ENCODE_VERSION(1, 8, 0);
end;

function NMA_VERSION_1_8_2: longint;
begin
  NMA_VERSION_1_8_2 := NMA_ENCODE_VERSION(1, 8, 2);
end;

function NMA_VERSION_1_8_4: longint;
begin
  NMA_VERSION_1_8_4 := NMA_ENCODE_VERSION(1, 8, 4);
end;

function NMA_VERSION_1_8_6: longint;
begin
  NMA_VERSION_1_8_6 := NMA_ENCODE_VERSION(1, 8, 6);
end;

function NMA_VERSION_1_8_8: longint;
begin
  NMA_VERSION_1_8_8 := NMA_ENCODE_VERSION(1, 8, 8);
end;

function NMA_VERSION_1_8_10: longint;
begin
  NMA_VERSION_1_8_10 := NMA_ENCODE_VERSION(1, 8, 10);
end;

function NMA_VERSION_1_8_12: longint;
begin
  NMA_VERSION_1_8_12 := NMA_ENCODE_VERSION(1, 8, 12);
end;

function NMA_VERSION_1_8_22: longint;
begin
  NMA_VERSION_1_8_22 := NMA_ENCODE_VERSION(1, 8, 22);
end;

function NMA_VERSION_1_8_26: longint;
begin
  NMA_VERSION_1_8_26 := NMA_ENCODE_VERSION(1, 8, 26);
end;

function NMA_VERSION_1_8_28: longint;
begin
  NMA_VERSION_1_8_28 := NMA_ENCODE_VERSION(1, 8, 28);
end;

function NMA_VERSION_1_8_34: longint;
begin
  NMA_VERSION_1_8_34 := NMA_ENCODE_VERSION(1, 8, 34);
end;

function NMA_VERSION_1_8_36: longint;
begin
  NMA_VERSION_1_8_36 := NMA_ENCODE_VERSION(1, 8, 36);
end;

function NMA_VERSION_1_10_6: longint;
begin
  NMA_VERSION_1_10_6 := NMA_ENCODE_VERSION(1, 10, 6);
end;


{$ENDIF read_implementation}
