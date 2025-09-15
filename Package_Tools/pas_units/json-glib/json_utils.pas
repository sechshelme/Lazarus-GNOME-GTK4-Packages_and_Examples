unit json_utils;

interface

uses
  fp_glib2, fp_json_glib, json_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function json_from_string(str: pchar; error: PPGError): PJsonNode; cdecl; external libjsonglib;
function json_to_string(node: PJsonNode; pretty: Tgboolean): pchar; cdecl; external libjsonglib;

// === Konventiert am: 15-9-25 13:27:49 ===


implementation



end.
