unit elm_glview_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, elm_glview_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_glview_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_glview_version_add(parent: PEvas_Object; version: TEvas_GL_Context_Version): PEvas_Object; cdecl; external libelementary;
procedure elm_glview_changed_set(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_glview_size_get(obj: PEvas_Object; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_glview_size_set(obj: PEvas_Object; w: longint; h: longint); cdecl; external libelementary;
procedure elm_glview_init_func_set(obj: PEvas_Object; func: TElm_GLView_Func_Cb); cdecl; external libelementary;
procedure elm_glview_del_func_set(obj: PEvas_Object; func: TElm_GLView_Func_Cb); cdecl; external libelementary;
procedure elm_glview_resize_func_set(obj: PEvas_Object; func: TElm_GLView_Func_Cb); cdecl; external libelementary;
procedure elm_glview_render_func_set(obj: PEvas_Object; func: TElm_GLView_Func_Cb); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:22:37 ===


implementation



end.
