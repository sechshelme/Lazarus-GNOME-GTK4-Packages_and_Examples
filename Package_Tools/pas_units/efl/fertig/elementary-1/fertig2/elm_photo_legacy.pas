unit elm_photo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_photo_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_photo_file_set(obj: PEo; file_: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_photo_editable_set(obj: PEvas_Object; set_: TEina_Bool); cdecl; external libelementary;
function elm_photo_editable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_photo_fill_inside_set(obj: PEvas_Object; fill: TEina_Bool); cdecl; external libelementary;
function elm_photo_fill_inside_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_photo_aspect_fixed_set(obj: PEvas_Object; fixed: TEina_Bool); cdecl; external libelementary;
function elm_photo_aspect_fixed_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_photo_size_set(obj: PEvas_Object; size: longint); cdecl; external libelementary;
function elm_photo_size_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_photo_thumb_set(obj: PEvas_Object; file_: pchar; group: pchar); cdecl; external libelementary;

// === Konventiert am: 30-5-25 17:54:54 ===


implementation



end.
