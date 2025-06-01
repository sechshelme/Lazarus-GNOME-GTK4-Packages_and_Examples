
unit elm_widget_glview;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_glview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_glview.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PElm_Glview_Data  = ^Elm_Glview_Data;
PEvas_GL  = ^Evas_GL;
PEvas_GL_Config  = ^Evas_GL_Config;
PEvas_GL_Context  = ^Evas_GL_Context;
PEvas_GL_Surface  = ^Evas_GL_Surface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_GLVIEW_H}
{$define ELM_WIDGET_GLVIEW_H}
{$include "Elementary.h"}
{$include "elm_glview_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-glview-class The Elementary Glview Class
 *
 * Elementary, besides having the @ref Glview widget, exposes its
 * foundation -- the Elementary Glview Class -- in order to create other
 * widgets which are a glview with some more logic on top.
  }
{*
 * Base widget smart data extended with glview instance data.
  }
type
  PElm_Glview_Data = ^TElm_Glview_Data;
  TElm_Glview_Data = record
      mode : TElm_GLView_Mode;
      scale_policy : TElm_GLView_Resize_Policy;
      render_policy : TElm_GLView_Render_Policy;
      gles_version : TEvas_GL_Context_Version;
      evasgl : PEvas_GL;
      config : PEvas_GL_Config;
      surface : PEvas_GL_Surface;
      context : PEvas_GL_Context;
      w : TEvas_Coord;
      h : TEvas_Coord;
      init_func : TElm_GLView_Func_Cb;
      del_func : TElm_GLView_Func_Cb;
      resize_func : TElm_GLView_Func_Cb;
      render_func : TElm_GLView_Func_Cb;
      flag0 : word;
    end;


const
  bm_TElm_Glview_Data_render_idle_enterer = $1;
  bp_TElm_Glview_Data_render_idle_enterer = 0;
  bm_TElm_Glview_Data_initialized = $2;
  bp_TElm_Glview_Data_initialized = 1;
  bm_TElm_Glview_Data_resized = $4;
  bp_TElm_Glview_Data_resized = 2;
  bm_TElm_Glview_Data_warned_about_dr = $8;
  bp_TElm_Glview_Data_warned_about_dr = 3;

function render_idle_enterer(var a : TElm_Glview_Data) : TEina_Bool;
procedure set_render_idle_enterer(var a : TElm_Glview_Data; __render_idle_enterer : TEina_Bool);
function initialized(var a : TElm_Glview_Data) : TEina_Bool;
procedure set_initialized(var a : TElm_Glview_Data; __initialized : TEina_Bool);
function resized(var a : TElm_Glview_Data) : TEina_Bool;
procedure set_resized(var a : TElm_Glview_Data; __resized : TEina_Bool);
function warned_about_dr(var a : TElm_Glview_Data) : TEina_Bool;
procedure set_warned_about_dr(var a : TElm_Glview_Data; __warned_about_dr : TEina_Bool);
{*
 * @
  }

implementation

function render_idle_enterer(var a : TElm_Glview_Data) : TEina_Bool;
begin
  render_idle_enterer:=(a.flag0 and bm_TElm_Glview_Data_render_idle_enterer) shr bp_TElm_Glview_Data_render_idle_enterer;
end;

procedure set_render_idle_enterer(var a : TElm_Glview_Data; __render_idle_enterer : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__render_idle_enterer shl bp_TElm_Glview_Data_render_idle_enterer) and bm_TElm_Glview_Data_render_idle_enterer);
end;

function initialized(var a : TElm_Glview_Data) : TEina_Bool;
begin
  initialized:=(a.flag0 and bm_TElm_Glview_Data_initialized) shr bp_TElm_Glview_Data_initialized;
end;

procedure set_initialized(var a : TElm_Glview_Data; __initialized : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__initialized shl bp_TElm_Glview_Data_initialized) and bm_TElm_Glview_Data_initialized);
end;

function resized(var a : TElm_Glview_Data) : TEina_Bool;
begin
  resized:=(a.flag0 and bm_TElm_Glview_Data_resized) shr bp_TElm_Glview_Data_resized;
end;

procedure set_resized(var a : TElm_Glview_Data; __resized : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__resized shl bp_TElm_Glview_Data_resized) and bm_TElm_Glview_Data_resized);
end;

function warned_about_dr(var a : TElm_Glview_Data) : TEina_Bool;
begin
  warned_about_dr:=(a.flag0 and bm_TElm_Glview_Data_warned_about_dr) shr bp_TElm_Glview_Data_warned_about_dr;
end;

procedure set_warned_about_dr(var a : TElm_Glview_Data; __warned_about_dr : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__warned_about_dr shl bp_TElm_Glview_Data_warned_about_dr) and bm_TElm_Glview_Data_warned_about_dr);
end;


end.
