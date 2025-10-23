
{$IFDEF read_interface}

function G_ENCODE_VERSION(major, minor: longint): longint;

function GLIB_VERSION_2_2: longint;
function GLIB_VERSION_2_4: longint;
function GLIB_VERSION_2_6: longint;
function GLIB_VERSION_2_8: longint;
function GLIB_VERSION_2_10: longint;
function GLIB_VERSION_2_12: longint;
function GLIB_VERSION_2_14: longint;
function GLIB_VERSION_2_16: longint;
function GLIB_VERSION_2_18: longint;
function GLIB_VERSION_2_20: longint;
function GLIB_VERSION_2_22: longint;
function GLIB_VERSION_2_24: longint;
function GLIB_VERSION_2_26: longint;
function GLIB_VERSION_2_28: longint;
function GLIB_VERSION_2_30: longint;
function GLIB_VERSION_2_32: longint;
function GLIB_VERSION_2_34: longint;
function GLIB_VERSION_2_36: longint;
function GLIB_VERSION_2_38: longint;
function GLIB_VERSION_2_40: longint;
function GLIB_VERSION_2_42: longint;
function GLIB_VERSION_2_44: longint;
function GLIB_VERSION_2_46: longint;
function GLIB_VERSION_2_48: longint;
function GLIB_VERSION_2_50: longint;
function GLIB_VERSION_2_52: longint;
function GLIB_VERSION_2_54: longint;
function GLIB_VERSION_2_56: longint;
function GLIB_VERSION_2_58: longint;
function GLIB_VERSION_2_60: longint;
function GLIB_VERSION_2_62: longint;
function GLIB_VERSION_2_64: longint;
function GLIB_VERSION_2_66: longint;
function GLIB_VERSION_2_68: longint;
function GLIB_VERSION_2_70: longint;
function GLIB_VERSION_2_72: longint;
function GLIB_VERSION_2_74: longint;
function GLIB_VERSION_2_76: longint;
function GLIB_VERSION_2_78: longint;
function GLIB_VERSION_2_80: longint;

function GLIB_VERSION_CUR_STABLE: longint;
function GLIB_VERSION_PREV_STABLE: longint;

// === Konventiert am: 24-11-24 16:39:45 ===

function GLIB_VERSION_MIN_REQUIRED: longint;
function GLIB_VERSION_MAX_ALLOWED: longint;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GLIB_VERSION_MIN_REQUIRED: longint;
begin
  Result := GLIB_VERSION_CUR_STABLE;
end;

function GLIB_VERSION_MAX_ALLOWED: longint;
begin
  Result := GLIB_VERSION_CUR_STABLE;
end;

function G_ENCODE_VERSION(major, minor: longint): longint;
begin
  G_ENCODE_VERSION := (major shl 16) or (minor shl 8);
end;

function GLIB_VERSION_2_2: longint;
begin
  GLIB_VERSION_2_2 := G_ENCODE_VERSION(2, 2);
end;

function GLIB_VERSION_2_4: longint;
begin
  GLIB_VERSION_2_4 := G_ENCODE_VERSION(2, 4);
end;

function GLIB_VERSION_2_6: longint;
begin
  GLIB_VERSION_2_6 := G_ENCODE_VERSION(2, 6);
end;

function GLIB_VERSION_2_8: longint;
begin
  GLIB_VERSION_2_8 := G_ENCODE_VERSION(2, 8);
end;

function GLIB_VERSION_2_10: longint;
begin
  GLIB_VERSION_2_10 := G_ENCODE_VERSION(2, 10);
end;

function GLIB_VERSION_2_12: longint;
begin
  GLIB_VERSION_2_12 := G_ENCODE_VERSION(2, 12);
end;

function GLIB_VERSION_2_14: longint;
begin
  GLIB_VERSION_2_14 := G_ENCODE_VERSION(2, 14);
end;

function GLIB_VERSION_2_16: longint;
begin
  GLIB_VERSION_2_16 := G_ENCODE_VERSION(2, 16);
end;

function GLIB_VERSION_2_18: longint;
begin
  GLIB_VERSION_2_18 := G_ENCODE_VERSION(2, 18);
end;

function GLIB_VERSION_2_20: longint;
begin
  GLIB_VERSION_2_20 := G_ENCODE_VERSION(2, 20);
end;

function GLIB_VERSION_2_22: longint;
begin
  GLIB_VERSION_2_22 := G_ENCODE_VERSION(2, 22);
end;

function GLIB_VERSION_2_24: longint;
begin
  GLIB_VERSION_2_24 := G_ENCODE_VERSION(2, 24);
end;

function GLIB_VERSION_2_26: longint;
begin
  GLIB_VERSION_2_26 := G_ENCODE_VERSION(2, 26);
end;

function GLIB_VERSION_2_28: longint;
begin
  GLIB_VERSION_2_28 := G_ENCODE_VERSION(2, 28);
end;

function GLIB_VERSION_2_30: longint;
begin
  GLIB_VERSION_2_30 := G_ENCODE_VERSION(2, 30);
end;

function GLIB_VERSION_2_32: longint;
begin
  GLIB_VERSION_2_32 := G_ENCODE_VERSION(2, 32);
end;

function GLIB_VERSION_2_34: longint;
begin
  GLIB_VERSION_2_34 := G_ENCODE_VERSION(2, 34);
end;

function GLIB_VERSION_2_36: longint;
begin
  GLIB_VERSION_2_36 := G_ENCODE_VERSION(2, 36);
end;

function GLIB_VERSION_2_38: longint;
begin
  GLIB_VERSION_2_38 := G_ENCODE_VERSION(2, 38);
end;

function GLIB_VERSION_2_40: longint;
begin
  GLIB_VERSION_2_40 := G_ENCODE_VERSION(2, 40);
end;

function GLIB_VERSION_2_42: longint;
begin
  GLIB_VERSION_2_42 := G_ENCODE_VERSION(2, 42);
end;

function GLIB_VERSION_2_44: longint;
begin
  GLIB_VERSION_2_44 := G_ENCODE_VERSION(2, 44);
end;

function GLIB_VERSION_2_46: longint;
begin
  GLIB_VERSION_2_46 := G_ENCODE_VERSION(2, 46);
end;

function GLIB_VERSION_2_48: longint;
begin
  GLIB_VERSION_2_48 := G_ENCODE_VERSION(2, 48);
end;

function GLIB_VERSION_2_50: longint;
begin
  GLIB_VERSION_2_50 := G_ENCODE_VERSION(2, 50);
end;

function GLIB_VERSION_2_52: longint;
begin
  GLIB_VERSION_2_52 := G_ENCODE_VERSION(2, 52);
end;

function GLIB_VERSION_2_54: longint;
begin
  GLIB_VERSION_2_54 := G_ENCODE_VERSION(2, 54);
end;

function GLIB_VERSION_2_56: longint;
begin
  GLIB_VERSION_2_56 := G_ENCODE_VERSION(2, 56);
end;

function GLIB_VERSION_2_58: longint;
begin
  GLIB_VERSION_2_58 := G_ENCODE_VERSION(2, 58);
end;

function GLIB_VERSION_2_60: longint;
begin
  GLIB_VERSION_2_60 := G_ENCODE_VERSION(2, 60);
end;

function GLIB_VERSION_2_62: longint;
begin
  GLIB_VERSION_2_62 := G_ENCODE_VERSION(2, 62);
end;

function GLIB_VERSION_2_64: longint;
begin
  GLIB_VERSION_2_64 := G_ENCODE_VERSION(2, 64);
end;

function GLIB_VERSION_2_66: longint;
begin
  GLIB_VERSION_2_66 := G_ENCODE_VERSION(2, 66);
end;

function GLIB_VERSION_2_68: longint;
begin
  GLIB_VERSION_2_68 := G_ENCODE_VERSION(2, 68);
end;

function GLIB_VERSION_2_70: longint;
begin
  GLIB_VERSION_2_70 := G_ENCODE_VERSION(2, 70);
end;

function GLIB_VERSION_2_72: longint;
begin
  GLIB_VERSION_2_72 := G_ENCODE_VERSION(2, 72);
end;

function GLIB_VERSION_2_74: longint;
begin
  GLIB_VERSION_2_74 := G_ENCODE_VERSION(2, 74);
end;

function GLIB_VERSION_2_76: longint;
begin
  GLIB_VERSION_2_76 := G_ENCODE_VERSION(2, 76);
end;

function GLIB_VERSION_2_78: longint;
begin
  GLIB_VERSION_2_78 := G_ENCODE_VERSION(2, 78);
end;

function GLIB_VERSION_2_80: longint;
begin
  GLIB_VERSION_2_80 := G_ENCODE_VERSION(2, 80);
end;

function GLIB_VERSION_CUR_STABLE: longint;
begin
  GLIB_VERSION_CUR_STABLE := G_ENCODE_VERSION(GLIB_MAJOR_VERSION, GLIB_MINOR_VERSION + 1);
end;

function GLIB_VERSION_PREV_STABLE: longint;
begin
  GLIB_VERSION_PREV_STABLE := G_ENCODE_VERSION(GLIB_MAJOR_VERSION, GLIB_MINOR_VERSION - 1);
end;


{$ENDIF read_implementation}
