unit elm_widget_entry;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Entry_Data = ^TElm_Entry_Data;
  TElm_Entry_Data = record
  end;

type
  TElm_Entry_Context_Menu_Item = record
    obj: PEvas_Object;
    _label: pchar;
    icon_file: pchar;
    icon_group: pchar;
    icon_type: TElm_Icon_Type;
    func: TEvas_Smart_Cb;
    data: pointer;
  end;
  PElm_Entry_Context_Menu_Item = ^TElm_Entry_Context_Menu_Item;

  TElm_Entry_Item_Provider = record
    func: function(data: pointer; entry: PEvas_Object; item: pchar): PEvas_Object; cdecl;
    data: pointer;
  end;
  PElm_Entry_Item_Provider = ^TElm_Entry_Item_Provider;

  TElm_Entry_Markup_Filter = record
    func: TElm_Entry_Filter_Cb;
    data: pointer;
    orig_data: pointer;
  end;
  PElm_Entry_Markup_Filter = ^TElm_Entry_Markup_Filter;

  PLength_Unit = ^TLength_Unit;
  TLength_Unit = longint;

const
  LENGTH_UNIT_CHAR = 0;
  LENGTH_UNIT_BYTE = 1;
  LENGTH_UNIT_LAST = 2;

  // === Konventiert am: 28-5-25 17:40:46 ===


implementation


end.
