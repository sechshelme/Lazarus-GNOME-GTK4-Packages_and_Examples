unit elm_icon_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Icon_Lookup_Order = ^TElm_Icon_Lookup_Order;
  TElm_Icon_Lookup_Order = longint;

const
  ELM_ICON_LOOKUP_FDO_THEME = 0;
  ELM_ICON_LOOKUP_THEME_FDO = 1;
  ELM_ICON_LOOKUP_FDO = 2;
  ELM_ICON_LOOKUP_THEME = 3;

function elm_icon_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_icon_thumb_set(obj: PEvas_Object; file_: pchar; group: pchar); cdecl; external libelementary;
procedure elm_icon_order_lookup_set(obj: PEvas_Object; order: TElm_Icon_Lookup_Order); cdecl; external libelementary; deprecated;
function elm_icon_order_lookup_get(obj: PEvas_Object): TElm_Icon_Lookup_Order; cdecl; external libelementary; deprecated;
function elm_icon_standard_set(obj: PEvas_Object; name: pchar): TEina_Bool; cdecl; external libelementary;
function elm_icon_standard_get(obj: PEvas_Object): pchar; cdecl; external libelementary;

// === Konventiert am: 26-5-25 15:45:36 ===


implementation



end.
