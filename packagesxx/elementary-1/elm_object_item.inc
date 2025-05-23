{$IFDEF read_interface}


type
  PElm_Object_Item = ^TElm_Object_Item;
  TElm_Object_Item = TEo;

  TElm_Object_Item_Signal_Cb = procedure (data:pointer; it:PElm_Object_Item; emission:Pchar; source:Pchar);cdecl;

  function elm_object_item_content_set(it,content : longint) : longint;
function elm_object_item_content_get(it : longint) : longint;
function elm_object_item_content_unset(it : longint) : longint;
function elm_object_item_text_set(it,_label : longint) : longint;
function elm_object_item_text_get(it : longint) : longint;
function elm_object_item_domain_translatable_text_set(it,domain,text : longint) : longint;
function elm_object_item_translatable_text_set(it,text : longint) : longint;
function elm_object_item_translatable_part_text_set(it,part,text : longint) : longint;
function elm_object_item_translatable_text_get(it : longint) : longint;
function elm_object_item_part_text_translatable_set(it,part,translatable : longint) : longint;
function elm_object_item_domain_text_translatable_set(it,domain,translatable : longint) : longint;
function elm_object_item_text_translatable_set(it,translatable : longint) : longint;

function elm_object_item_data_get(it:PElm_Object_Item):pointer;cdecl;external libelementary;
procedure elm_object_item_data_set(it:PElm_Object_Item; data:pointer);cdecl;external libelementary;
procedure elm_object_item_del(obj:PElm_Object_Item);cdecl;external libelementary;

// === Konventiert am: 23-5-25 17:47:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

// Circular Problem !!!

function elm_object_item_content_set(it,content : longint) : longint;
begin
//  elm_object_item_content_set:=elm_object_item_part_content_set(it,nil,content);
end;
function elm_object_item_content_get(it : longint) : longint;
begin
//  elm_object_item_content_get:=elm_object_item_part_content_get(it,nil);
end;
function elm_object_item_content_unset(it : longint) : longint;
begin
//  elm_object_item_content_unset:=elm_object_item_part_content_unset(it,nil);
end;
function elm_object_item_text_set(it,_label : longint) : longint;
begin
//  elm_object_item_text_set:=elm_object_item_part_text_set(it,nil,_label);
end;
function elm_object_item_text_get(it : longint) : longint;
begin
//  elm_object_item_text_get:=elm_object_item_part_text_get(it,nil);
end;
function elm_object_item_domain_translatable_text_set(it,domain,text : longint) : longint;
begin
//  elm_object_item_domain_translatable_text_set:=elm_object_item_domain_translatable_part_text_set(it,nil,domain,text);
end;
function elm_object_item_translatable_text_set(it,text : longint) : longint;
begin
//  elm_object_item_translatable_text_set:=elm_object_item_domain_translatable_part_text_set(it,nil,nil,text);
end;
function elm_object_item_translatable_part_text_set(it,part,text : longint) : longint;
begin
//  elm_object_item_translatable_part_text_set:=elm_object_item_domain_translatable_part_text_set(it,part,nil,text);
end;
function elm_object_item_translatable_text_get(it : longint) : longint;
begin
//  elm_object_item_translatable_text_get:=elm_object_item_translatable_part_text_get(it,nil);
end;
function elm_object_item_part_text_translatable_set(it,part,translatable : longint) : longint;
begin
//  elm_object_item_part_text_translatable_set:=elm_object_item_domain_part_text_translatable_set(it,part,nil,translatable);
end;
function elm_object_item_domain_text_translatable_set(it,domain,translatable : longint) : longint;
begin
//  elm_object_item_domain_text_translatable_set:=elm_object_item_domain_part_text_translatable_set(it,nil,domain,translatable);
end;
function elm_object_item_text_translatable_set(it,translatable : longint) : longint;
begin
//  elm_object_item_text_translatable_set:=elm_object_item_domain_part_text_translatable_set(it,nil,nil,translatable);
end;


{$ENDIF read_implementation}
