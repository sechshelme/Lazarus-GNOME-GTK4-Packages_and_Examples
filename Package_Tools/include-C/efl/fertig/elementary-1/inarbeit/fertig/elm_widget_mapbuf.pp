
unit elm_widget_mapbuf;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_mapbuf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_mapbuf.h
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
PEcore_Idler  = ^Ecore_Idler;
PElm_Mapbuf_Data  = ^Elm_Mapbuf_Data;
PEvas_Map  = ^Evas_Map;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_MAPBUF_H}
{$define ELM_WIDGET_MAPBUF_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-mapbuf-class The Elementary Mapbuf Class
 *
 * Elementary, besides having the @ref Mapbuf widget, exposes its
 * foundation -- the Elementary Mapbuf Class -- in order to create other
 * widgets which are a mapbuf with some more logic on top.
  }
{*
 * Base widget smart data extended with mapbuf instance data.
  }
type
  PElm_Mapbuf_Data = ^TElm_Mapbuf_Data;
  TElm_Mapbuf_Data = record
      self : PEvas_Object;
      content : PEvas_Object;
      idler : PEcore_Idler;
      map : PEvas_Map;
      colors : array[0..3] of record
          r : longint;
          g : longint;
          b : longint;
          a : longint;
        end;
      flag0 : word;
    end;


const
  bm_TElm_Mapbuf_Data_enabled = $1;
  bp_TElm_Mapbuf_Data_enabled = 0;
  bm_TElm_Mapbuf_Data_smooth_saved = $2;
  bp_TElm_Mapbuf_Data_smooth_saved = 1;
  bm_TElm_Mapbuf_Data_smooth = $4;
  bp_TElm_Mapbuf_Data_smooth = 2;
  bm_TElm_Mapbuf_Data_alpha = $8;
  bp_TElm_Mapbuf_Data_alpha = 3;
  bm_TElm_Mapbuf_Data_automode = $10;
  bp_TElm_Mapbuf_Data_automode = 4;

function enabled(var a : TElm_Mapbuf_Data) : TEina_Bool;
procedure set_enabled(var a : TElm_Mapbuf_Data; __enabled : TEina_Bool);
function smooth_saved(var a : TElm_Mapbuf_Data) : TEina_Bool;
procedure set_smooth_saved(var a : TElm_Mapbuf_Data; __smooth_saved : TEina_Bool);
function smooth(var a : TElm_Mapbuf_Data) : TEina_Bool;
procedure set_smooth(var a : TElm_Mapbuf_Data; __smooth : TEina_Bool);
function alpha(var a : TElm_Mapbuf_Data) : TEina_Bool;
procedure set_alpha(var a : TElm_Mapbuf_Data; __alpha : TEina_Bool);
function automode(var a : TElm_Mapbuf_Data) : TEina_Bool;
procedure set_automode(var a : TElm_Mapbuf_Data; __automode : TEina_Bool);
{*
 * @
  }

implementation

function enabled(var a : TElm_Mapbuf_Data) : TEina_Bool;
begin
  enabled:=(a.flag0 and bm_TElm_Mapbuf_Data_enabled) shr bp_TElm_Mapbuf_Data_enabled;
end;

procedure set_enabled(var a : TElm_Mapbuf_Data; __enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__enabled shl bp_TElm_Mapbuf_Data_enabled) and bm_TElm_Mapbuf_Data_enabled);
end;

function smooth_saved(var a : TElm_Mapbuf_Data) : TEina_Bool;
begin
  smooth_saved:=(a.flag0 and bm_TElm_Mapbuf_Data_smooth_saved) shr bp_TElm_Mapbuf_Data_smooth_saved;
end;

procedure set_smooth_saved(var a : TElm_Mapbuf_Data; __smooth_saved : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__smooth_saved shl bp_TElm_Mapbuf_Data_smooth_saved) and bm_TElm_Mapbuf_Data_smooth_saved);
end;

function smooth(var a : TElm_Mapbuf_Data) : TEina_Bool;
begin
  smooth:=(a.flag0 and bm_TElm_Mapbuf_Data_smooth) shr bp_TElm_Mapbuf_Data_smooth;
end;

procedure set_smooth(var a : TElm_Mapbuf_Data; __smooth : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__smooth shl bp_TElm_Mapbuf_Data_smooth) and bm_TElm_Mapbuf_Data_smooth);
end;

function alpha(var a : TElm_Mapbuf_Data) : TEina_Bool;
begin
  alpha:=(a.flag0 and bm_TElm_Mapbuf_Data_alpha) shr bp_TElm_Mapbuf_Data_alpha;
end;

procedure set_alpha(var a : TElm_Mapbuf_Data; __alpha : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__alpha shl bp_TElm_Mapbuf_Data_alpha) and bm_TElm_Mapbuf_Data_alpha);
end;

function automode(var a : TElm_Mapbuf_Data) : TEina_Bool;
begin
  automode:=(a.flag0 and bm_TElm_Mapbuf_Data_automode) shr bp_TElm_Mapbuf_Data_automode;
end;

procedure set_automode(var a : TElm_Mapbuf_Data; __automode : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__automode shl bp_TElm_Mapbuf_Data_automode) and bm_TElm_Mapbuf_Data_automode);
end;


end.
