unit efl_layout_group_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Layout_Group = ^TEfl_Layout_Group;
  TEfl_Layout_Group = TEo;

function edje_object_data_get(obj: PEfl_Layout_Group; key: pchar): pchar; cdecl; external libedje;

// === Konventiert am: 22-5-25 19:57:10 ===


implementation



end.
