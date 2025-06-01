{$IFDEF read_interface}


type
  PElm_View_List = ^TElm_View_List;
  TElm_View_List = TEo;

function ELM_VIEW_LIST_CLASS: PEfl_Class;

function elm_view_list_class_get: PEfl_Class; cdecl; external libelementary;
procedure elm_view_list_genlist_set(obj: PEo; genlist: PEfl_Canvas_Object; item_type: TElm_Genlist_Item_Type; item_style: pchar); cdecl; external libelementary;
procedure elm_view_list_evas_object_get(obj: PEo; widget: PPEfl_Canvas_Object); cdecl; external libelementary;
procedure elm_view_list_property_connect(obj: PEo; _property: pchar; part: pchar); cdecl; external libelementary;
procedure elm_view_list_model_set(obj: PEo; model: PEfl_Model); cdecl; external libelementary;
function elm_view_list_model_get(obj: PEo): PEfl_Model; cdecl; external libelementary;

var
  _ELM_VIEW_LIST_EVENT_MODEL_SELECTED: TEfl_Event_Description; cvar;external libelementary;

function ELM_VIEW_LIST_EVENT_MODEL_SELECTED: PEfl_Event_Description;


// === Konventiert am: 1-6-25 15:28:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELM_VIEW_LIST_CLASS: PEfl_Class;
begin
  ELM_VIEW_LIST_CLASS := elm_view_list_class_get;
end;

function ELM_VIEW_LIST_EVENT_MODEL_SELECTED: PEfl_Event_Description;
begin
  ELM_VIEW_LIST_EVENT_MODEL_SELECTED := @(_ELM_VIEW_LIST_EVENT_MODEL_SELECTED);
end;


{$ENDIF read_implementation}
