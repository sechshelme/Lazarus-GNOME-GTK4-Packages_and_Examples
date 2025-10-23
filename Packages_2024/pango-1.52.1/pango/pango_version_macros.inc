
{$IFDEF read_interface}

function PANGO_VERSION_1_2: longint;
function PANGO_VERSION_1_4: longint;
function PANGO_VERSION_1_6: longint;
function PANGO_VERSION_1_8: longint;
function PANGO_VERSION_1_10: longint;
function PANGO_VERSION_1_12: longint;
function PANGO_VERSION_1_14: longint;
function PANGO_VERSION_1_16: longint;
function PANGO_VERSION_1_18: longint;
function PANGO_VERSION_1_20: longint;
function PANGO_VERSION_1_22: longint;
function PANGO_VERSION_1_24: longint;
function PANGO_VERSION_1_26: longint;
function PANGO_VERSION_1_28: longint;
function PANGO_VERSION_1_30: longint;
function PANGO_VERSION_1_32: longint;
function PANGO_VERSION_1_34: longint;
function PANGO_VERSION_1_36: longint;
function PANGO_VERSION_1_38: longint;
function PANGO_VERSION_1_40: longint;
function PANGO_VERSION_1_42: longint;
function PANGO_VERSION_1_44: longint;
function PANGO_VERSION_1_46: longint;
function PANGO_VERSION_1_48: longint;
function PANGO_VERSION_1_50: longint;
function PANGO_VERSION_1_52: longint;

function PANGO_VERSION_CUR_STABLE: longint;
function PANGO_VERSION_PREV_STABLE: longint;

function PANGO_VERSION_MIN_REQUIRED: longint;
function PANGO_VERSION_MAX_ALLOWED: longint;

// === Konventiert am: 24-11-24 17:24:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_VERSION_MIN_REQUIRED: longint;
begin
  Result := PANGO_VERSION_CUR_STABLE;
end;

function PANGO_VERSION_MAX_ALLOWED: longint;
begin
  Result := PANGO_VERSION_CUR_STABLE;
end;


function PANGO_VERSION_1_2: longint;
begin
  PANGO_VERSION_1_2 := G_ENCODE_VERSION(1, 2);
end;

function PANGO_VERSION_1_4: longint;
begin
  PANGO_VERSION_1_4 := G_ENCODE_VERSION(1, 4);
end;

function PANGO_VERSION_1_6: longint;
begin
  PANGO_VERSION_1_6 := G_ENCODE_VERSION(1, 6);
end;

function PANGO_VERSION_1_8: longint;
begin
  PANGO_VERSION_1_8 := G_ENCODE_VERSION(1, 8);
end;

function PANGO_VERSION_1_10: longint;
begin
  PANGO_VERSION_1_10 := G_ENCODE_VERSION(1, 10);
end;

function PANGO_VERSION_1_12: longint;
begin
  PANGO_VERSION_1_12 := G_ENCODE_VERSION(1, 12);
end;

function PANGO_VERSION_1_14: longint;
begin
  PANGO_VERSION_1_14 := G_ENCODE_VERSION(1, 14);
end;

function PANGO_VERSION_1_16: longint;
begin
  PANGO_VERSION_1_16 := G_ENCODE_VERSION(1, 16);
end;

function PANGO_VERSION_1_18: longint;
begin
  PANGO_VERSION_1_18 := G_ENCODE_VERSION(1, 18);
end;

function PANGO_VERSION_1_20: longint;
begin
  PANGO_VERSION_1_20 := G_ENCODE_VERSION(1, 20);
end;

function PANGO_VERSION_1_22: longint;
begin
  PANGO_VERSION_1_22 := G_ENCODE_VERSION(1, 22);
end;

function PANGO_VERSION_1_24: longint;
begin
  PANGO_VERSION_1_24 := G_ENCODE_VERSION(1, 24);
end;

function PANGO_VERSION_1_26: longint;
begin
  PANGO_VERSION_1_26 := G_ENCODE_VERSION(1, 26);
end;

function PANGO_VERSION_1_28: longint;
begin
  PANGO_VERSION_1_28 := G_ENCODE_VERSION(1, 28);
end;

function PANGO_VERSION_1_30: longint;
begin
  PANGO_VERSION_1_30 := G_ENCODE_VERSION(1, 30);
end;

function PANGO_VERSION_1_32: longint;
begin
  PANGO_VERSION_1_32 := G_ENCODE_VERSION(1, 32);
end;

function PANGO_VERSION_1_34: longint;
begin
  PANGO_VERSION_1_34 := G_ENCODE_VERSION(1, 34);
end;

function PANGO_VERSION_1_36: longint;
begin
  PANGO_VERSION_1_36 := G_ENCODE_VERSION(1, 36);
end;

function PANGO_VERSION_1_38: longint;
begin
  PANGO_VERSION_1_38 := G_ENCODE_VERSION(1, 38);
end;

function PANGO_VERSION_1_40: longint;
begin
  PANGO_VERSION_1_40 := G_ENCODE_VERSION(1, 40);
end;

function PANGO_VERSION_1_42: longint;
begin
  PANGO_VERSION_1_42 := G_ENCODE_VERSION(1, 42);
end;

function PANGO_VERSION_1_44: longint;
begin
  PANGO_VERSION_1_44 := G_ENCODE_VERSION(1, 44);
end;

function PANGO_VERSION_1_46: longint;
begin
  PANGO_VERSION_1_46 := G_ENCODE_VERSION(1, 46);
end;

function PANGO_VERSION_1_48: longint;
begin
  PANGO_VERSION_1_48 := G_ENCODE_VERSION(1, 48);
end;

function PANGO_VERSION_1_50: longint;
begin
  PANGO_VERSION_1_50 := G_ENCODE_VERSION(1, 50);
end;

function PANGO_VERSION_1_52: longint;
begin
  PANGO_VERSION_1_52 := G_ENCODE_VERSION(1, 52);
end;

function PANGO_VERSION_CUR_STABLE: longint;
begin
  PANGO_VERSION_CUR_STABLE := G_ENCODE_VERSION(PANGO_VERSION_MAJOR, PANGO_VERSION_MINOR + 1);
end;

function PANGO_VERSION_PREV_STABLE: longint;
begin
  PANGO_VERSION_PREV_STABLE := G_ENCODE_VERSION(PANGO_VERSION_MAJOR, PANGO_VERSION_MINOR - 1);
end;


{$ENDIF read_implementation}
