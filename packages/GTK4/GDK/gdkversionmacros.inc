/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GDK_MAJOR_VERSION = 4;
  GDK_MINOR_VERSION = 14;
  GDK_MICRO_VERSION = 2;

function GDK_VERSION_4_0: longint;
function GDK_VERSION_4_2: longint;
function GDK_VERSION_4_4: longint;
function GDK_VERSION_4_6: longint;
function GDK_VERSION_4_8: longint;
function GDK_VERSION_4_10: longint;
function GDK_VERSION_4_12: longint;
function GDK_VERSION_4_14: longint;

function GDK_VERSION_CUR_STABLE: longint;
function GDK_VERSION_PREV_STABLE: longint;

function GDK_VERSION_MIN_REQUIRED: longint;
function GDK_VERSION_MAX_ALLOWED: longint;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_VERSION_MIN_REQUIRED: longint;
begin
  Result := GDK_VERSION_CUR_STABLE;
end;

function GDK_VERSION_MAX_ALLOWED: longint;
begin
  Result := GDK_VERSION_CUR_STABLE;
end;


function GDK_VERSION_4_0: longint;
begin
  GDK_VERSION_4_0 := G_ENCODE_VERSION(4, 0);
end;

function GDK_VERSION_4_2: longint;
begin
  GDK_VERSION_4_2 := G_ENCODE_VERSION(4, 2);
end;

function GDK_VERSION_4_4: longint;
begin
  GDK_VERSION_4_4 := G_ENCODE_VERSION(4, 4);
end;

function GDK_VERSION_4_6: longint;
begin
  GDK_VERSION_4_6 := G_ENCODE_VERSION(4, 6);
end;

function GDK_VERSION_4_8: longint;
begin
  GDK_VERSION_4_8 := G_ENCODE_VERSION(4, 8);
end;

function GDK_VERSION_4_10: longint;
begin
  GDK_VERSION_4_10 := G_ENCODE_VERSION(4, 10);
end;

function GDK_VERSION_4_12: longint;
begin
  GDK_VERSION_4_12 := G_ENCODE_VERSION(4, 12);
end;

function GDK_VERSION_4_14: longint;
begin
  GDK_VERSION_4_14 := G_ENCODE_VERSION(4, 14);
end;

function GDK_VERSION_CUR_STABLE: longint;
begin
  GDK_VERSION_CUR_STABLE := G_ENCODE_VERSION(GDK_MAJOR_VERSION, GDK_MINOR_VERSION + 1);
end;

function GDK_VERSION_PREV_STABLE: longint;
begin
  GDK_VERSION_PREV_STABLE := G_ENCODE_VERSION(GDK_MAJOR_VERSION, GDK_MINOR_VERSION - 1);
end;


{$ENDIF read_implementation}
