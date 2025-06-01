
unit elm_widget_route;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_route.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_route.h
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
PEina_List  = ^Eina_List;
PElm_Route_Data  = ^Elm_Route_Data;
PEMap_Route  = ^EMap_Route;
PEMap_Route_Node  = ^EMap_Route_Node;
PEvas_Object  = ^Evas_Object;
PSegment  = ^Segment;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_ROUTE_H}
{$define ELM_WIDGET_ROUTE_H}
{$include "elm_route_eo.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-route-class The Elementary Route Class
 *
 * Elementary, besides having the @ref Route widget, exposes its
 * foundation -- the Elementary Route Class -- in order to create other
 * widgets which are a route with some more logic on top.
  }
{*
 * Base widget smart data extended with route instance data.
  }
type
{$ifdef ELM_EMAP}
{$endif}
{list of *Segment }
type
  PElm_Route_Data = ^TElm_Route_Data;
  TElm_Route_Data = record
      emap : PEMap_Route;
      lon_min : Tdouble;
      lon_max : Tdouble;
      lat_min : Tdouble;
      lat_max : Tdouble;
      segments : PEina_List;
      flag0 : word;
    end;


const
  bm_TElm_Route_Data_must_calc_segments = $1;
  bp_TElm_Route_Data_must_calc_segments = 0;

function must_calc_segments(var a : TElm_Route_Data) : TEina_Bool;
procedure set_must_calc_segments(var a : TElm_Route_Data; __must_calc_segments : TEina_Bool);
{$ifdef ELM_EMAP}
{$endif}
type
  PSegment = ^TSegment;
  TSegment = record
      obj : PEvas_Object;
      node_start : PEMap_Route_Node;
      node_end : PEMap_Route_Node;
      start_x : Tdouble;
      start_y : Tdouble;
      end_x : Tdouble;
      end_y : Tdouble;
      flag0 : word;
    end;


const
  bm_TSegment_must_calc = $1;
  bp_TSegment_must_calc = 0;

function must_calc(var a : TSegment) : TEina_Bool;
procedure set_must_calc(var a : TSegment; __must_calc : TEina_Bool);
{*
 * @
  }

implementation

function must_calc_segments(var a : TElm_Route_Data) : TEina_Bool;
begin
  must_calc_segments:=(a.flag0 and bm_TElm_Route_Data_must_calc_segments) shr bp_TElm_Route_Data_must_calc_segments;
end;

procedure set_must_calc_segments(var a : TElm_Route_Data; __must_calc_segments : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__must_calc_segments shl bp_TElm_Route_Data_must_calc_segments) and bm_TElm_Route_Data_must_calc_segments);
end;

function must_calc(var a : TSegment) : TEina_Bool;
begin
  must_calc:=(a.flag0 and bm_TSegment_must_calc) shr bp_TSegment_must_calc;
end;

procedure set_must_calc(var a : TSegment; __must_calc : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__must_calc shl bp_TSegment_must_calc) and bm_TSegment_must_calc);
end;


end.
