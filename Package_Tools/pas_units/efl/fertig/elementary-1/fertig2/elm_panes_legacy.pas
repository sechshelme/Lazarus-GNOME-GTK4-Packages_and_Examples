unit elm_panes_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Panes = ^TElm_Panes;
  TElm_Panes = TEo;

function elm_panes_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_panes_horizontal_set(obj: PEvas_Object; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_panes_horizontal_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_panes_content_left_min_size_set(obj: PEvas_Object; size: longint); cdecl; external libelementary;
function elm_panes_content_left_min_size_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_panes_content_right_min_size_set(obj: PEvas_Object; size: longint); cdecl; external libelementary;
function elm_panes_content_right_min_size_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_panes_content_right_size_set(obj: PEvas_Object; size: double); cdecl; external libelementary;
function elm_panes_content_right_size_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_panes_content_left_size_set(obj: PEvas_Object; size: double); cdecl; external libelementary;
function elm_panes_content_left_size_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_panes_content_left_min_relative_size_set(obj: PEvas_Object; size: double); cdecl; external libelementary;
function elm_panes_content_left_min_relative_size_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_panes_content_right_min_relative_size_set(obj: PEvas_Object; size: double); cdecl; external libelementary;
function elm_panes_content_right_min_relative_size_get(obj: PEvas_Object): double; cdecl; external libelementary;

// === Konventiert am: 28-5-25 17:59:09 ===


implementation



end.
