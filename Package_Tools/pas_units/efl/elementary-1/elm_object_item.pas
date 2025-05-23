unit elm_object_item;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, elm_widget_item_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // ausgelagert
  //type
  //  PElm_Object_Item = ^TElm_Object_Item;
  //  TElm_Object_Item = TEo;

  //  TElm_Object_Item_Signal_Cb = procedure(data: pointer; it: PElm_Object_Item; emission: pchar; source: pchar); cdecl;

function elm_object_item_data_get(it: PElm_Object_Item): pointer; cdecl; external libelementary;
procedure elm_object_item_data_set(it: PElm_Object_Item; data: pointer); cdecl; external libelementary;
procedure elm_object_item_del(obj: PElm_Object_Item); cdecl; external libelementary;

procedure elm_object_item_content_set(it: PElm_Widget_Item; content: PEfl_Canvas_Object);
function elm_object_item_content_get(it: PElm_Widget_Item): PEfl_Canvas_Object;
function elm_object_item_content_unset(it: PElm_Widget_Item): PEfl_Canvas_Object;
procedure elm_object_item_text_set(it: PElm_Widget_Item; _label: pchar);
function elm_object_item_text_get(it: PElm_Widget_Item): pchar;
procedure elm_object_item_domain_translatable_text_set(it: PElm_Widget_Item; domain, text: pchar);
procedure elm_object_item_translatable_text_set(it: PElm_Widget_Item; text: pchar);
procedure elm_object_item_translatable_part_text_set(it: PElm_Widget_Item; part, text: pchar);
function elm_object_item_translatable_text_get(it: PElm_Widget_Item): pchar;
procedure elm_object_item_part_text_translatable_set(it: PElm_Widget_Item; part: pchar; translatable: TEina_Bool);
procedure elm_object_item_domain_text_translatable_set(it: PElm_Widget_Item; domain: pchar; translatable: TEina_Bool);
procedure elm_object_item_text_translatable_set(it: PElm_Widget_Item; translatable: TEina_Bool);

// === Konventiert am: 23-5-25 17:47:16 ===


implementation

procedure elm_object_item_content_set(it: PElm_Widget_Item; content: PEfl_Canvas_Object);
begin
  elm_object_item_part_content_set(it, nil, content);
end;

function elm_object_item_content_get(it: PElm_Widget_Item): PEfl_Canvas_Object;
begin
  elm_object_item_content_get := elm_object_item_part_content_get(it, nil);
end;

function elm_object_item_content_unset(it: PElm_Widget_Item): PEfl_Canvas_Object;
begin
  elm_object_item_content_unset := elm_object_item_part_content_unset(it, nil);
end;

procedure elm_object_item_text_set(it: PElm_Widget_Item; _label: pchar);
begin
  elm_object_item_part_text_set(it, nil, _label);
end;

function elm_object_item_text_get(it: PElm_Widget_Item): pchar;
begin
  elm_object_item_text_get := elm_object_item_part_text_get(it, nil);
end;

procedure elm_object_item_domain_translatable_text_set(it: PElm_Widget_Item; domain, text: pchar);
begin
  elm_object_item_domain_translatable_part_text_set(it, nil, domain, text);
end;

procedure elm_object_item_translatable_text_set(it: PElm_Widget_Item; text: pchar);
begin
  elm_object_item_domain_translatable_part_text_set(it, nil, nil, text);
end;

procedure elm_object_item_translatable_part_text_set(it: PElm_Widget_Item; part, text: pchar);
begin
  elm_object_item_domain_translatable_part_text_set(it, part, nil, text);
end;

function elm_object_item_translatable_text_get(it: PElm_Widget_Item): pchar;
begin
  elm_object_item_translatable_text_get := elm_object_item_translatable_part_text_get(it, nil);
end;

procedure elm_object_item_part_text_translatable_set(it: PElm_Widget_Item; part: pchar; translatable: TEina_Bool);
begin
  elm_object_item_domain_part_text_translatable_set(it, part, nil, translatable);
end;

procedure elm_object_item_domain_text_translatable_set(it: PElm_Widget_Item; domain: pchar; translatable: TEina_Bool);
begin
  elm_object_item_domain_part_text_translatable_set(it, nil, domain, translatable);
end;

procedure elm_object_item_text_translatable_set(it: PElm_Widget_Item;
  translatable: TEina_Bool);
begin
  elm_object_item_domain_part_text_translatable_set(it, nil, nil, translatable);
end;


end.
