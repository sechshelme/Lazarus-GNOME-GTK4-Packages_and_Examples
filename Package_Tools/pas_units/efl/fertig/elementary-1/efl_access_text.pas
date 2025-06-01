unit efl_access_text;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure elm_atspi_text_text_attribute_free(attr: PEfl_Access_Text_Attribute); cdecl; external libelementary;
procedure elm_atspi_text_text_range_free(range: PEfl_Access_Text_Range); cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:24:22 ===


implementation



end.
