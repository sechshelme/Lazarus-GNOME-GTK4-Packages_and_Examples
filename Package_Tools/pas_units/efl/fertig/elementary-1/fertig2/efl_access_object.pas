unit efl_access_object;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure efl_access_attributes_list_free(list: PEina_List); cdecl; external libelementary;
procedure efl_access_attribute_free(attr: PEfl_Access_Attribute); cdecl; external libelementary;

// === Konventiert am: 30-5-25 14:00:22 ===


implementation



end.
