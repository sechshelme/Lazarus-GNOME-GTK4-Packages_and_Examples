{$IFDEF read_interface}


type
  TElm_Prefs_Page_Node = record
    version: dword;
    prefs: PEvas_Object;
    parent: PEvas_Object;
    w_obj: PEvas_Object;
    w_impl: PElm_Prefs_Page_Iface;
    name: pchar;
    title: pchar;
    sub_title: pchar;
    widget: pchar;
    style: pchar;
    icon: pchar;
    items: PEina_List;
    autosave: TEina_Bool;
  end;
  PElm_Prefs_Page_Node = ^TElm_Prefs_Page_Node;

  TElm_Prefs_Item_Node = record
    _type: TElm_Prefs_Item_Type;
    prefs: PEvas_Object;
    page: PElm_Prefs_Page_Node;
    subpage: PElm_Prefs_Page_Node;
    w_obj: PEvas_Object;
    w_impl: PElm_Prefs_Item_Iface;
    available: TEina_Bool;
    name: pchar;
    _label: pchar;
    icon: pchar;
    style: pchar;
    widget: pchar;
    spec: TElm_Prefs_Item_Spec;
    persistent: TEina_Bool;
    editable: TEina_Bool;
    visible: TEina_Bool;
  end;
  PElm_Prefs_Item_Node = ^TElm_Prefs_Item_Node;


var
  elm_prefs_item_widgets_map: PEina_Hash; cvar;external libelementary;
  elm_prefs_item_type_widgets_map: PEina_Hash; cvar;external libelementary;
  elm_prefs_item_default_widget: PElm_Prefs_Item_Iface; cvar;external libelementary;

  // === Konventiert am: 30-5-25 13:11:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
