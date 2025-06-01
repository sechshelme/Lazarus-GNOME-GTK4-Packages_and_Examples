unit elc_naviframe_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Naviframe_Item_Pop_Cb = function(data: pointer; it: PElm_Object_Item): TEina_Bool; cdecl;

function elm_naviframe_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_naviframe_item_title_enabled_set(it: PElm_Object_Item; enabled: TEina_Bool; transition: TEina_Bool); cdecl; external libelementary;
function elm_naviframe_item_push(obj: PEvas_Object; title_label: pchar; prev_btn: PEvas_Object; next_btn: PEvas_Object; content: PEvas_Object;
  item_style: pchar): PElm_Object_Item; cdecl; external libelementary;


// === Konventiert am: 30-5-25 19:36:06 ===

function elm_naviframe_item_simple_push(obj: PEvas_Object; content: PEvas_Object): PElm_Object_Item;


implementation


function elm_naviframe_item_simple_push(obj: PEvas_Object; content: PEvas_Object): PElm_Object_Item;
begin
  Result := elm_naviframe_item_push(obj, nil, nil, nil, content, nil);
  elm_naviframe_item_title_enabled_set(Result, EINA_FALSE, EINA_FALSE);
end;

end.
