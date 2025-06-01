
unit elm_widget_box;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_box.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_box.h
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
PEcore_Animator  = ^Ecore_Animator;
PEina_List  = ^Eina_List;
PElm_Box_Data  = ^Elm_Box_Data;
PElm_Box_Transition  = ^Elm_Box_Transition;
PEvas_Object  = ^Evas_Object;
PTransition_Animation_Data  = ^Transition_Animation_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_BOX_H}
{$define ELM_WIDGET_BOX_H}
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
 * @section elm-box-class The Elementary Box Class
 *
 * Elementary, besides having the @ref Box widget, exposes its
 * foundation -- the Elementary Box Class -- in order to create
 * other widgets which are a box with some more logic on top.
  }
{*
 * Base widget smart data extended with box instance data.
  }
type
  PElm_Box_Data = ^TElm_Box_Data;
  TElm_Box_Data = record
      flag0 : word;
    end;


const
  bm_TElm_Box_Data_homogeneous = $1;
  bp_TElm_Box_Data_homogeneous = 0;
  bm_TElm_Box_Data_delete_me = $2;
  bp_TElm_Box_Data_delete_me = 1;
  bm_TElm_Box_Data_horizontal = $4;
  bp_TElm_Box_Data_horizontal = 2;
  bm_TElm_Box_Data_recalc = $8;
  bp_TElm_Box_Data_recalc = 3;

function homogeneous(var a : TElm_Box_Data) : TEina_Bool;
procedure set_homogeneous(var a : TElm_Box_Data; __homogeneous : TEina_Bool);
function delete_me(var a : TElm_Box_Data) : TEina_Bool;
procedure set_delete_me(var a : TElm_Box_Data; __delete_me : TEina_Bool);
function horizontal(var a : TElm_Box_Data) : TEina_Bool;
procedure set_horizontal(var a : TElm_Box_Data; __horizontal : TEina_Bool);
function recalc(var a : TElm_Box_Data) : TEina_Bool;
procedure set_recalc(var a : TElm_Box_Data; __recalc : TEina_Bool);
type
  PElm_Box_Transition = ^TElm_Box_Transition;
  TElm_Box_Transition = record
      initial_time : Tdouble;
      duration : Tdouble;
      animator : PEcore_Animator;
      start : record
          layout : TEvas_Object_Box_Layout;
          data : pointer;
          free_data : procedure (data:pointer);cdecl;
        end;
      end : record
          layout : TEvas_Object_Box_Layout;
          data : pointer;
          free_data : procedure (data:pointer);cdecl;
        end;
      transition_end_cb : procedure (data:pointer);cdecl;
      transition_end_data : pointer;
      transition_end_free_data : procedure (data:pointer);cdecl;
      objs : PEina_List;
      box : PEvas_Object;
      flag0 : word;
    end;


const
  bm_TElm_Box_Transition_animation_ended = $1;
  bp_TElm_Box_Transition_animation_ended = 0;
  bm_TElm_Box_Transition_recalculate = $2;
  bp_TElm_Box_Transition_recalculate = 1;

function animation_ended(var a : TElm_Box_Transition) : TEina_Bool;
procedure set_animation_ended(var a : TElm_Box_Transition; __animation_ended : TEina_Bool);
function recalculate(var a : TElm_Box_Transition) : TEina_Bool;
procedure set_recalculate(var a : TElm_Box_Transition; __recalculate : TEina_Bool);
type
  PTransition_Animation_Data = ^TTransition_Animation_Data;
  TTransition_Animation_Data = record
      obj : PEvas_Object;
      start : record
          x : TEvas_Coord;
          y : TEvas_Coord;
          w : TEvas_Coord;
          h : TEvas_Coord;
        end;
      end : record
          x : TEvas_Coord;
          y : TEvas_Coord;
          w : TEvas_Coord;
          h : TEvas_Coord;
        end;
    end;

{*
 * @
  }

implementation

function homogeneous(var a : TElm_Box_Data) : TEina_Bool;
begin
  homogeneous:=(a.flag0 and bm_TElm_Box_Data_homogeneous) shr bp_TElm_Box_Data_homogeneous;
end;

procedure set_homogeneous(var a : TElm_Box_Data; __homogeneous : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__homogeneous shl bp_TElm_Box_Data_homogeneous) and bm_TElm_Box_Data_homogeneous);
end;

function delete_me(var a : TElm_Box_Data) : TEina_Bool;
begin
  delete_me:=(a.flag0 and bm_TElm_Box_Data_delete_me) shr bp_TElm_Box_Data_delete_me;
end;

procedure set_delete_me(var a : TElm_Box_Data; __delete_me : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__delete_me shl bp_TElm_Box_Data_delete_me) and bm_TElm_Box_Data_delete_me);
end;

function horizontal(var a : TElm_Box_Data) : TEina_Bool;
begin
  horizontal:=(a.flag0 and bm_TElm_Box_Data_horizontal) shr bp_TElm_Box_Data_horizontal;
end;

procedure set_horizontal(var a : TElm_Box_Data; __horizontal : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__horizontal shl bp_TElm_Box_Data_horizontal) and bm_TElm_Box_Data_horizontal);
end;

function recalc(var a : TElm_Box_Data) : TEina_Bool;
begin
  recalc:=(a.flag0 and bm_TElm_Box_Data_recalc) shr bp_TElm_Box_Data_recalc;
end;

procedure set_recalc(var a : TElm_Box_Data; __recalc : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__recalc shl bp_TElm_Box_Data_recalc) and bm_TElm_Box_Data_recalc);
end;

function animation_ended(var a : TElm_Box_Transition) : TEina_Bool;
begin
  animation_ended:=(a.flag0 and bm_TElm_Box_Transition_animation_ended) shr bp_TElm_Box_Transition_animation_ended;
end;

procedure set_animation_ended(var a : TElm_Box_Transition; __animation_ended : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__animation_ended shl bp_TElm_Box_Transition_animation_ended) and bm_TElm_Box_Transition_animation_ended);
end;

function recalculate(var a : TElm_Box_Transition) : TEina_Bool;
begin
  recalculate:=(a.flag0 and bm_TElm_Box_Transition_recalculate) shr bp_TElm_Box_Transition_recalculate;
end;

procedure set_recalculate(var a : TElm_Box_Transition; __recalculate : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__recalculate shl bp_TElm_Box_Transition_recalculate) and bm_TElm_Box_Transition_recalculate);
end;


end.
