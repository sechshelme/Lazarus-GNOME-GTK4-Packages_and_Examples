unit elm_cursor;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_object_cursor_set(obj: PEo; cursor: pchar): TEina_Bool; cdecl; external libelementary;
function elm_object_cursor_get(obj: PEo): pchar; cdecl; external libelementary;
function elm_object_cursor_style_set(obj: PEo; style: pchar): TEina_Bool; cdecl; external libelementary;
function elm_object_cursor_style_get(obj: PEo): pchar; cdecl; external libelementary;
function elm_object_cursor_theme_search_enabled_set(obj: PEo; allow: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_object_cursor_theme_search_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_object_cursor_unset(obj: PEvas_Object); cdecl; external libelementary;

// === Konventiert am: 30-5-25 14:00:32 ===


implementation



end.
