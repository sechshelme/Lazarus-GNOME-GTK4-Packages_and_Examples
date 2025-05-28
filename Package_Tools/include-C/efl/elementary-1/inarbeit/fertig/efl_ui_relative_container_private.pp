
unit efl_ui_relative_container_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_relative_container_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_relative_container_private.h
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
PEfl_Object  = ^Efl_Object;
PEfl_Ui_Relative_Container_Calc  = ^Efl_Ui_Relative_Container_Calc;
PEfl_Ui_Relative_Container_Calc_State  = ^Efl_Ui_Relative_Container_Calc_State;
PEfl_Ui_Relative_Container_Child  = ^Efl_Ui_Relative_Container_Child;
PEfl_Ui_Relative_Container_Content_Iterator  = ^Efl_Ui_Relative_Container_Content_Iterator;
PEfl_Ui_Relative_Container_Data  = ^Efl_Ui_Relative_Container_Data;
PEfl_Ui_Relative_Container_Relation  = ^Efl_Ui_Relative_Container_Relation;
PEina_Hash  = ^Eina_Hash;
PEina_Iterator  = ^Eina_Iterator;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_RELATIVE_CONTAINER_PRIVATE_H}
{$define EFL_UI_RELATIVE_CONTAINER_PRIVATE_H}
{$ifdef HAVE_CONFIG_H}
{$include "elementary_config.h"}
{$endif}
{$define EFL_PACK_LAYOUT_PROTECTED}
{$include <Elementary.h>}
{$include "elm_priv.h"}
type
  PEfl_Ui_Relative_Container_Calc_State = ^TEfl_Ui_Relative_Container_Calc_State;
  TEfl_Ui_Relative_Container_Calc_State =  Longint;
  Const
    RELATIVE_CALC_NONE = 0;
    RELATIVE_CALC_DONE = 1;
    RELATIVE_CALC_ON = 2;
;
type
{  m0 is static min size which is added to the other children min size.
    * only if both (target, relative)[0] and (target, relative)[1] are same,
    * it has non-zero value. it is calculated as (min * (align / relative)) if
    * align is greater than relative, (min * ((1 - align) / (1 - relative))) otherwise.
    *  mi, mj are transformed relative based on layout min size. they are
    * calculated as (target.mi + (relative * (target.mj - target.mi))). for example,
    * there are two children of relative_container that has different target base.
    *  |              | obj1  | obj2 |
    *  |      min     | 100   | 100  |
    *  |left.target   | layout| obj1 |
    *  |left.relative | 0.0   | 0.5  |
    *  |right.target  | layout| obj1 |
    *  |right.relative| 0.5   | 1.0  |
    *  |      mi      | 0.0   | 0.25 |
    *  |      mj      | 0.5   | 0.5  |
    *
    * obj1.mi = layout.mi(0.0) + (obj1.relative(0.0) * (LAyout.mj(1.0) - layout.mi(0.0))) = 0.0
    * obj1.mj = layout.mi(0.0) + (obj1.relative(0.5) * (layout.mj(1.0) - layout.mi(0.0))) = 0.5
    * obj2.mi = obj1.mi(0.0) + (obj2.relative(0.5) * (obj1.mj(0.5) - obj1.mi(0.0))) = 0.25
    * obj2.mj = obj1.mi(0.0) + (obj2.relative(1.0) * (obj1.mj(0.5) - obj1.mi(0.0))) = 0.5
    *  layout min size is calculated as maximum of (child_min + m0) / (mj - mi).
    * in the example, obj1 require layout min size as
    * ((child_min(100) + m0(0)) / (mj(0.5) - mi(0.0))) = 200. obj2 require
    * layout min size as ((100 + 0) / (0.5 - 0.25)) = 400. as a result, layout
    * min size is max(200, 400) = 400.
     }
  PEfl_Ui_Relative_Container_Calc = ^TEfl_Ui_Relative_Container_Calc;
  TEfl_Ui_Relative_Container_Calc = record
      __in_list : TEina_Inlist;
      max : array[0..1] of longint;
      min : array[0..1] of longint;
      aspect : array[0..1] of longint;
      margin : array[0..3] of longint;
      aspect_type : TEfl_Gfx_Hint_Aspect;
      fill : array[0..1] of TEina_Bool;
      weight : array[0..1] of Tdouble;
      align : array[0..1] of Tdouble;
      comp_factor : Tdouble;
      m0 : array[0..1] of Tdouble;
      mi : array[0..1] of Tdouble;
      mj : array[0..1] of Tdouble;
      space : array[0..1] of record
          position : longint;
          length : Tdouble;
        end;
      want : array[0..1] of record
          position : longint;
          length : Tdouble;
        end;
      state : array[0..1] of TEfl_Ui_Relative_Container_Calc_State;
      chain_state : array[0..1] of TEfl_Ui_Relative_Container_Calc_State;
      to : array[0..3] of PEfl_Ui_Relative_Container_Child;
    end;

  PEfl_Ui_Relative_Container_Data = ^TEfl_Ui_Relative_Container_Data;
  TEfl_Ui_Relative_Container_Data = record
      obj : PEo;
      clipper : PEo;
      children : PEina_Hash;
      base : PEfl_Ui_Relative_Container_Child;
    end;

  PEfl_Ui_Relative_Container_Relation = ^TEfl_Ui_Relative_Container_Relation;
  TEfl_Ui_Relative_Container_Relation = record
      to : PEfl_Object;
      relative_position : Tdouble;
    end;

  PEfl_Ui_Relative_Container_Child = ^TEfl_Ui_Relative_Container_Child;
  TEfl_Ui_Relative_Container_Child = record
      obj : PEo;
      layout : PEo;
      rel : array[0..3] of TEfl_Ui_Relative_Container_Relation;
      calc : TEfl_Ui_Relative_Container_Calc;
    end;

  PEfl_Ui_Relative_Container_Content_Iterator = ^TEfl_Ui_Relative_Container_Content_Iterator;
  TEfl_Ui_Relative_Container_Content_Iterator = record
      iterator : TEina_Iterator;
      real_iterator : PEina_Iterator;
      relative_container : PEo;
    end;


implementation


end.
