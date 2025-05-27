unit elm_prefs_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_prefs_data;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_prefs_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;

type
  TElm_Prefs_Item_Spec_Void = record
    dummy: char;
  end;
  PElm_Prefs_Item_Spec_Void = ^TElm_Prefs_Item_Spec_Void;

  TElm_Prefs_Item_Spec_Bool = record
    def: TEina_Bool;
  end;
  PElm_Prefs_Item_Spec_Bool = ^TElm_Prefs_Item_Spec_Bool;

  TElm_Prefs_Item_Spec_Int = record
    def: longint;
    min: longint;
    max: longint;
  end;
  PElm_Prefs_Item_Spec_Int = ^TElm_Prefs_Item_Spec_Int;

  TElm_Prefs_Item_Spec_Float = record
    def: single;
    min: single;
    max: single;
  end;
  PElm_Prefs_Item_Spec_Float = ^TElm_Prefs_Item_Spec_Float;

  TElm_Prefs_Item_Spec_String = record
    def: pchar;
    placeholder: pchar;
    accept: pchar;
    deny: pchar;
    length: record
      min: longint;
      max: longint;
      end;
  end;
  PElm_Prefs_Item_Spec_String = ^TElm_Prefs_Item_Spec_String;

  TElm_Prefs_Item_Spec_Date = record
    def: record
      d: byte;
      m: byte;
      y: word;
      end;
    min: record
      d: byte;
      m: byte;
      y: word;
      end;
    max: record
      d: byte;
      m: byte;
      y: word;
      end;
  end;
  PElm_Prefs_Item_Spec_Date = ^TElm_Prefs_Item_Spec_Date;

  TElm_Prefs_Item_Spec_Page = record
    source: pchar;
  end;
  PElm_Prefs_Item_Spec_Page = ^TElm_Prefs_Item_Spec_Page;

  TElm_Prefs_Item_Spec = record
    case longint of
      0: (v: TElm_Prefs_Item_Spec_Void);
      1: (b: TElm_Prefs_Item_Spec_Bool);
      2: (i: TElm_Prefs_Item_Spec_Int);
      3: (f: TElm_Prefs_Item_Spec_Float);
      4: (s: TElm_Prefs_Item_Spec_String);
      5: (d: TElm_Prefs_Item_Spec_Date);
      6: (p: TElm_Prefs_Item_Spec_Page);
  end;
  PElm_Prefs_Item_Spec = ^TElm_Prefs_Item_Spec;

  TElm_Prefs_Item_Changed_Cb = procedure(it_obj: PEvas_Object); cdecl;

const
  ELM_PREFS_ITEM_IFACE_ABI_VERSION = 1;

type
  PElm_Prefs_Item_Iface = ^TElm_Prefs_Item_Iface;

  TElm_Prefs_Item_Iface = record
    abi_version: dword;
    types: PElm_Prefs_Item_Type;
    add: function(iface: PElm_Prefs_Item_Iface; prefs: PEvas_Object; _type: TElm_Prefs_Item_Type; spec: TElm_Prefs_Item_Spec; it_changed_cb: TElm_Prefs_Item_Changed_Cb): PEvas_Object; cdecl;
    value_set: function(obj: PEvas_Object; value: PEina_Value): TEina_Bool; cdecl;
    value_get: function(obj: PEvas_Object; value: PEina_Value): TEina_Bool; cdecl;
    value_validate: function(obj: PEvas_Object): TEina_Bool; cdecl;
    label_set: function(obj: PEvas_Object; _label: pchar): TEina_Bool; cdecl;
    icon_set: function(obj: PEvas_Object; icon: pchar): TEina_Bool; cdecl;
    editable_set: function(obj: PEvas_Object; val: TEina_Bool): TEina_Bool; cdecl;
    editable_get: function(obj: PEvas_Object): TEina_Bool; cdecl;
    expand_want: function(obj: PEvas_Object): TEina_Bool; cdecl;
  end;

  TElm_Prefs_Item_Iface_Info = record
    widget_name: pchar;
    info: PElm_Prefs_Item_Iface;
  end;
  PElm_Prefs_Item_Iface_Info = ^TElm_Prefs_Item_Iface_Info;

procedure elm_prefs_item_iface_register(arr: PElm_Prefs_Item_Iface_Info); cdecl; external libelementary;
procedure elm_prefs_item_iface_unregister(arr: PElm_Prefs_Item_Iface_Info); cdecl; external libelementary;
function elm_prefs_item_widget_common_add(prefs: PEvas_Object; obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

const
  ELM_PREFS_PAGE_IFACE_ABI_VERSION = 1;

type
  PElm_Prefs_Page_Iface = ^TElm_Prefs_Page_Iface;
  TElm_Prefs_Page_Iface = record
    abi_version: dword;
    add: function(iface: PElm_Prefs_Page_Iface; prefs: PEvas_Object): PEvas_Object; cdecl;
    title_set: function(obj: PEvas_Object; title: pchar): TEina_Bool; cdecl;
    sub_title_set: function(obj: PEvas_Object; sub_title: pchar): TEina_Bool; cdecl;
    icon_set: function(obj: PEvas_Object; icon: pchar): TEina_Bool; cdecl;
    item_pack: function(obj: PEvas_Object; it: PEvas_Object; _type: TElm_Prefs_Item_Type; iface: PElm_Prefs_Item_Iface): TEina_Bool; cdecl;
    item_unpack: function(obj: PEvas_Object; it: PEvas_Object): TEina_Bool; cdecl;
    item_pack_before: function(obj: PEvas_Object; it: PEvas_Object; it_before: PEvas_Object; _type: TElm_Prefs_Item_Type; iface: PElm_Prefs_Item_Iface): TEina_Bool; cdecl;
    item_pack_after: function(obj: PEvas_Object; it: PEvas_Object; it_after: PEvas_Object; _type: TElm_Prefs_Item_Type; iface: PElm_Prefs_Item_Iface): TEina_Bool; cdecl;
  end;

  TElm_Prefs_Page_Iface_Info = record
    widget_name: pchar;
    info: PElm_Prefs_Page_Iface;
  end;
  PElm_Prefs_Page_Iface_Info = ^TElm_Prefs_Page_Iface_Info;

procedure elm_prefs_page_iface_register(arr: PElm_Prefs_Page_Iface_Info); cdecl; external libelementary;
procedure elm_prefs_page_iface_unregister(arr: PElm_Prefs_Page_Iface_Info); cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:44:30 ===


implementation



end.
