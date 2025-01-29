unit chafa_version_macros;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function CHAFA_VERSION_1_0: longint;
function CHAFA_VERSION_1_2: longint;
function CHAFA_VERSION_1_4: longint;
function CHAFA_VERSION_1_6: longint;
function CHAFA_VERSION_1_8: longint;
function CHAFA_VERSION_1_10: longint;
function CHAFA_VERSION_1_12: longint;
function CHAFA_VERSION_1_14: longint;

// === Konventiert am: 29-1-25 19:32:39 ===


implementation

function CHAFA_VERSION_1_0: longint;
begin
  CHAFA_VERSION_1_0 := G_ENCODE_VERSION(1, 0);
end;

function CHAFA_VERSION_1_2: longint;
begin
  CHAFA_VERSION_1_2 := G_ENCODE_VERSION(1, 2);
end;

function CHAFA_VERSION_1_4: longint;
begin
  CHAFA_VERSION_1_4 := G_ENCODE_VERSION(1, 4);
end;

function CHAFA_VERSION_1_6: longint;
begin
  CHAFA_VERSION_1_6 := G_ENCODE_VERSION(1, 6);
end;

function CHAFA_VERSION_1_8: longint;
begin
  CHAFA_VERSION_1_8 := G_ENCODE_VERSION(1, 8);
end;

function CHAFA_VERSION_1_10: longint;
begin
  CHAFA_VERSION_1_10 := G_ENCODE_VERSION(1, 10);
end;

function CHAFA_VERSION_1_12: longint;
begin
  CHAFA_VERSION_1_12 := G_ENCODE_VERSION(1, 12);
end;

function CHAFA_VERSION_1_14: longint;
begin
  CHAFA_VERSION_1_14 := G_ENCODE_VERSION(1, 14);
end;


end.
