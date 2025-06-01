unit elm_layout_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_layout_icon_get(_ly: PEvas_Object): PEvas_Object;
function elm_layout_end_get(_ly: PEvas_Object): PEvas_Object;


// === Konventiert am: 1-6-25 13:41:36 ===


implementation


function elm_layout_icon_get(_ly: PEvas_Object): PEvas_Object;
begin
  elm_layout_icon_get := elm_layout_content_get(_ly, 'elm.swallow.icon');
end;

function elm_layout_end_get(_ly: PEvas_Object): PEvas_Object;
begin
  elm_layout_end_get := elm_layout_content_get(_ly, 'elm.swallow.end');
end;


end.
