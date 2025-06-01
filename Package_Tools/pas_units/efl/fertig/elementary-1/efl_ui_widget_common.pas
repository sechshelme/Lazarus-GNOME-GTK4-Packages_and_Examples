unit efl_ui_widget_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function efl_ui_widget_tree_iterator(obj: PEfl_Ui_Widget): PEina_Iterator; cdecl; external libelementary;
function efl_ui_widget_tree_widget_iterator(obj: PEfl_Ui_Widget): PEina_Iterator; cdecl; external libelementary;
function efl_ui_widget_parent_iterator(obj: PEfl_Ui_Widget): PEina_Iterator; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:32:39 ===


implementation



end.
