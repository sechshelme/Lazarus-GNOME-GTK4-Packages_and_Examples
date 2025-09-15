unit json_version_macros;

interface

uses
  fp_glib2, fp_json_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function JSON_VERSION_1_0: longint;
function JSON_VERSION_1_2: longint;
function JSON_VERSION_1_4: longint;
function JSON_VERSION_1_6: longint;
function JSON_VERSION_1_8: longint;

  // === Konventiert am: 15-9-25 13:27:56 ===


implementation


function JSON_VERSION_1_0: longint;
begin
  JSON_VERSION_1_0 := G_ENCODE_VERSION(1, 0);
end;

function JSON_VERSION_1_2: longint;
begin
  JSON_VERSION_1_2 := G_ENCODE_VERSION(1, 2);
end;

function JSON_VERSION_1_4: longint;
begin
  JSON_VERSION_1_4 := G_ENCODE_VERSION(1, 4);
end;

function JSON_VERSION_1_6: longint;
begin
  JSON_VERSION_1_6 := G_ENCODE_VERSION(1, 6);
end;

function JSON_VERSION_1_8: longint;
begin
  JSON_VERSION_1_8 := G_ENCODE_VERSION(1, 8);
end;


end.
