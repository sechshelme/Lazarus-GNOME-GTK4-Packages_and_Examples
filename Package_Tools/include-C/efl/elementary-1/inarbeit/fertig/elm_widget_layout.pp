
unit elm_widget_layout;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_layout.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_layout.h
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
PEfl_Ui_Layout_Data  = ^Efl_Ui_Layout_Data;
PEina_Hash  = ^Eina_Hash;
PEina_Inarray  = ^Eina_Inarray;
PEina_List  = ^Eina_List;
PElm_Layout_Data  = ^Elm_Layout_Data;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_LAYOUT_H}
{$define ELM_WIDGET_LAYOUT_H}
{$include "elm_widget_container.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-layout-class The Elementary Layout Class
 *
 * Elementary, besides having the @ref Elm_Layout widget, exposes its
 * foundation -- the Elementary Layout Class -- in order to create
 * other widgets which are, basically, a certain layout with some more
 * logic on top.
 *
 * The idea is to make the creation of that widgets as easy as possible,
 * factorizing code on this common base. For example, a button is a
 * layout (that looks like push button) that happens to react on
 * clicks and keyboard events in a special manner, calling its user
 * back on those events. That's no surprise, then, that the @ref
 * Button implementation relies on #Elm_Layout_Smart_Class, if you go
 * to check it.
 *
 * The Layout class inherits from
 * #Elm_Container_Smart_Class. Container parts, here, map directly to
 * Edje parts from the layout's Edje group. Besides that, there's a whole
 * infrastructure around Edje files:
 * - interfacing by signals,
 * - setting/retrieving text part values,
 * - dealing with table and box parts directly,
 * - etc.
 *
 * Take a look at #Elm_Layout_Smart_Class's 'virtual' functions to
 * understand the whole interface. Finally, layout objects will do
 * <b>part aliasing</b> for you, if you set it up properly. For that,
 * take a look at #Elm_Layout_Part_Alias_Description, where it's
 * explained in detail.
  }
{*
 * Base widget smart data extended with layout instance data.
  }
{*< The object itself  }
{*< List of Elm_Layout_Sub_Object_Data structs, to hold the actual sub objects such as text, content and the children of box and table.  }
{*< The list of edje signal callbacks.  }
{*< The list of cursor names of layout parts. This is a list of Elm_Layout_Sub_Object_Cursor struct.  }
{*< signals which were generated during construction  }
{*< The list of properties connected to layout parts.  }
{*< The list of signals connected.  }
{*< The hash with parts connected to factories.  }
{*< multipliers for finger_size during group_calc  }
{*< version number specified in the widget's theme  }
{*< Layout freeze state  }
{*< This is true when all text(including textblock) parts can be accessible by accessibility.  }
{*< This flag indicates if Efl.Ui.Layout destructor was called. This is needed to avoid unnecessary calculation of subobject deletion during layout object's deletion.  }
{*< This flag indicates if Efl.Ui.Layout source is set from a file }
{*< Set to true once we are watching over a model }
{*< Set to true once we do watch for model change }
{*< Set to true if group_calc should also handle subobjs during manual calc  }
{*< if theme,changed event subscriber has been added  }
{*< if theme has not been manually set during construction  }
{*< only set if object was changed while frozen  }
type
  PEfl_Ui_Layout_Data = ^TEfl_Ui_Layout_Data;
  TEfl_Ui_Layout_Data = record
      obj : PEvas_Object;
      subs : PEina_List;
      edje_signals : PEina_List;
      parts_cursors : PEina_List;
      deferred_signals : PEina_Inarray;
      connect : record
          properties : PEina_Hash;
          signals : PEina_Hash;
          factories : PEina_Hash;
          flag0 : word;
        end;
      finger_size_multiplier_x : dword;
      finger_size_multiplier_y : dword;
      version : dword;
      frozen : TEina_Bool;
      flag0 : word;
    end;

const
  bm__Efl_Ui_Layout_Data_updating = $1;
  bp__Efl_Ui_Layout_Data_updating = 0;
  bm__Efl_Ui_Layout_Data_can_access = $1;
  bp__Efl_Ui_Layout_Data_can_access = 0;
  bm__Efl_Ui_Layout_Data_destructed_is = $2;
  bp__Efl_Ui_Layout_Data_destructed_is = 1;
  bm__Efl_Ui_Layout_Data_file_set = $4;
  bp__Efl_Ui_Layout_Data_file_set = 2;
  bm__Efl_Ui_Layout_Data_automatic_orientation_apply = $8;
  bp__Efl_Ui_Layout_Data_automatic_orientation_apply = 3;
  bm__Efl_Ui_Layout_Data_model_bound = $10;
  bp__Efl_Ui_Layout_Data_model_bound = 4;
  bm__Efl_Ui_Layout_Data_model_watch = $20;
  bp__Efl_Ui_Layout_Data_model_watch = 5;
  bm__Efl_Ui_Layout_Data_calc_subobjs = $40;
  bp__Efl_Ui_Layout_Data_calc_subobjs = 6;
  bm__Efl_Ui_Layout_Data_cb_theme_changed = $80;
  bp__Efl_Ui_Layout_Data_cb_theme_changed = 7;
  bm__Efl_Ui_Layout_Data_needs_theme_apply = $100;
  bp__Efl_Ui_Layout_Data_needs_theme_apply = 8;
  bm__Efl_Ui_Layout_Data_frozen_changed = $200;
  bp__Efl_Ui_Layout_Data_frozen_changed = 9;

function can_access(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_can_access(var a : _Efl_Ui_Layout_Data; __can_access : TEina_Bool);
function destructed_is(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_destructed_is(var a : _Efl_Ui_Layout_Data; __destructed_is : TEina_Bool);
function file_set(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_file_set(var a : _Efl_Ui_Layout_Data; __file_set : TEina_Bool);
function automatic_orientation_apply(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_automatic_orientation_apply(var a : _Efl_Ui_Layout_Data; __automatic_orientation_apply : TEina_Bool);
function model_bound(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_model_bound(var a : _Efl_Ui_Layout_Data; __model_bound : TEina_Bool);
function model_watch(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_model_watch(var a : _Efl_Ui_Layout_Data; __model_watch : TEina_Bool);
function calc_subobjs(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_calc_subobjs(var a : _Efl_Ui_Layout_Data; __calc_subobjs : TEina_Bool);
function cb_theme_changed(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_cb_theme_changed(var a : _Efl_Ui_Layout_Data; __cb_theme_changed : TEina_Bool);
function needs_theme_apply(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_needs_theme_apply(var a : _Efl_Ui_Layout_Data; __needs_theme_apply : TEina_Bool);
function frozen_changed(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
procedure set_frozen_changed(var a : _Efl_Ui_Layout_Data; __frozen_changed : TEina_Bool);
{*< This flag is set true when the layout sizing eval is already requested. This defers sizing evaluation until smart calculation to avoid unnecessary calculation.  }
{*< This is a flag to support edje restricted_calc in w axis.  }
{*< This is a flag to support edje restricted_calc in y axis.  }
{*< object is currently in group_calc  }
{*< min size was set by user (legacy only has restricted min)  }
type
  PElm_Layout_Data = ^TElm_Layout_Data;
  TElm_Layout_Data = record
      flag0 : word;
    end;

const
  bm__Elm_Layout_Data_needs_size_calc = $1;
  bp__Elm_Layout_Data_needs_size_calc = 0;
  bm__Elm_Layout_Data_restricted_calc_w = $2;
  bp__Elm_Layout_Data_restricted_calc_w = 1;
  bm__Elm_Layout_Data_restricted_calc_h = $4;
  bp__Elm_Layout_Data_restricted_calc_h = 2;
  bm__Elm_Layout_Data_in_calc = $8;
  bp__Elm_Layout_Data_in_calc = 3;
  bm__Elm_Layout_Data_user_min_sz = $10;
  bp__Elm_Layout_Data_user_min_sz = 4;

function needs_size_calc(var a : _Elm_Layout_Data) : TEina_Bool;
procedure set_needs_size_calc(var a : _Elm_Layout_Data; __needs_size_calc : TEina_Bool);
function restricted_calc_w(var a : _Elm_Layout_Data) : TEina_Bool;
procedure set_restricted_calc_w(var a : _Elm_Layout_Data; __restricted_calc_w : TEina_Bool);
function restricted_calc_h(var a : _Elm_Layout_Data) : TEina_Bool;
procedure set_restricted_calc_h(var a : _Elm_Layout_Data; __restricted_calc_h : TEina_Bool);
function in_calc(var a : _Elm_Layout_Data) : TEina_Bool;
procedure set_in_calc(var a : _Elm_Layout_Data; __in_calc : TEina_Bool);
function user_min_sz(var a : _Elm_Layout_Data) : TEina_Bool;
procedure set_user_min_sz(var a : _Elm_Layout_Data; __user_min_sz : TEina_Bool);
{*
 * @
  }

procedure _efl_ui_layout_subobjs_calc_set(obj:PEo; set:TEina_Bool);cdecl;external;
{$endif}

implementation

function can_access(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  can_access:=(a.flag0 and bm__Efl_Ui_Layout_Data_can_access) shr bp__Efl_Ui_Layout_Data_can_access;
end;

procedure set_can_access(var a : _Efl_Ui_Layout_Data; __can_access : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__can_access shl bp__Efl_Ui_Layout_Data_can_access) and bm__Efl_Ui_Layout_Data_can_access);
end;

function destructed_is(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  destructed_is:=(a.flag0 and bm__Efl_Ui_Layout_Data_destructed_is) shr bp__Efl_Ui_Layout_Data_destructed_is;
end;

procedure set_destructed_is(var a : _Efl_Ui_Layout_Data; __destructed_is : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__destructed_is shl bp__Efl_Ui_Layout_Data_destructed_is) and bm__Efl_Ui_Layout_Data_destructed_is);
end;

function file_set(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  file_set:=(a.flag0 and bm__Efl_Ui_Layout_Data_file_set) shr bp__Efl_Ui_Layout_Data_file_set;
end;

procedure set_file_set(var a : _Efl_Ui_Layout_Data; __file_set : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__file_set shl bp__Efl_Ui_Layout_Data_file_set) and bm__Efl_Ui_Layout_Data_file_set);
end;

function automatic_orientation_apply(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  automatic_orientation_apply:=(a.flag0 and bm__Efl_Ui_Layout_Data_automatic_orientation_apply) shr bp__Efl_Ui_Layout_Data_automatic_orientation_apply;
end;

procedure set_automatic_orientation_apply(var a : _Efl_Ui_Layout_Data; __automatic_orientation_apply : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__automatic_orientation_apply shl bp__Efl_Ui_Layout_Data_automatic_orientation_apply) and bm__Efl_Ui_Layout_Data_automatic_orientation_apply);
end;

function model_bound(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  model_bound:=(a.flag0 and bm__Efl_Ui_Layout_Data_model_bound) shr bp__Efl_Ui_Layout_Data_model_bound;
end;

procedure set_model_bound(var a : _Efl_Ui_Layout_Data; __model_bound : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__model_bound shl bp__Efl_Ui_Layout_Data_model_bound) and bm__Efl_Ui_Layout_Data_model_bound);
end;

function model_watch(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  model_watch:=(a.flag0 and bm__Efl_Ui_Layout_Data_model_watch) shr bp__Efl_Ui_Layout_Data_model_watch;
end;

procedure set_model_watch(var a : _Efl_Ui_Layout_Data; __model_watch : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__model_watch shl bp__Efl_Ui_Layout_Data_model_watch) and bm__Efl_Ui_Layout_Data_model_watch);
end;

function calc_subobjs(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  calc_subobjs:=(a.flag0 and bm__Efl_Ui_Layout_Data_calc_subobjs) shr bp__Efl_Ui_Layout_Data_calc_subobjs;
end;

procedure set_calc_subobjs(var a : _Efl_Ui_Layout_Data; __calc_subobjs : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__calc_subobjs shl bp__Efl_Ui_Layout_Data_calc_subobjs) and bm__Efl_Ui_Layout_Data_calc_subobjs);
end;

function cb_theme_changed(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  cb_theme_changed:=(a.flag0 and bm__Efl_Ui_Layout_Data_cb_theme_changed) shr bp__Efl_Ui_Layout_Data_cb_theme_changed;
end;

procedure set_cb_theme_changed(var a : _Efl_Ui_Layout_Data; __cb_theme_changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__cb_theme_changed shl bp__Efl_Ui_Layout_Data_cb_theme_changed) and bm__Efl_Ui_Layout_Data_cb_theme_changed);
end;

function needs_theme_apply(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  needs_theme_apply:=(a.flag0 and bm__Efl_Ui_Layout_Data_needs_theme_apply) shr bp__Efl_Ui_Layout_Data_needs_theme_apply;
end;

procedure set_needs_theme_apply(var a : _Efl_Ui_Layout_Data; __needs_theme_apply : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__needs_theme_apply shl bp__Efl_Ui_Layout_Data_needs_theme_apply) and bm__Efl_Ui_Layout_Data_needs_theme_apply);
end;

function frozen_changed(var a : _Efl_Ui_Layout_Data) : TEina_Bool;
begin
  frozen_changed:=(a.flag0 and bm__Efl_Ui_Layout_Data_frozen_changed) shr bp__Efl_Ui_Layout_Data_frozen_changed;
end;

procedure set_frozen_changed(var a : _Efl_Ui_Layout_Data; __frozen_changed : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__frozen_changed shl bp__Efl_Ui_Layout_Data_frozen_changed) and bm__Efl_Ui_Layout_Data_frozen_changed);
end;

function needs_size_calc(var a : _Elm_Layout_Data) : TEina_Bool;
begin
  needs_size_calc:=(a.flag0 and bm__Elm_Layout_Data_needs_size_calc) shr bp__Elm_Layout_Data_needs_size_calc;
end;

procedure set_needs_size_calc(var a : _Elm_Layout_Data; __needs_size_calc : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__needs_size_calc shl bp__Elm_Layout_Data_needs_size_calc) and bm__Elm_Layout_Data_needs_size_calc);
end;

function restricted_calc_w(var a : _Elm_Layout_Data) : TEina_Bool;
begin
  restricted_calc_w:=(a.flag0 and bm__Elm_Layout_Data_restricted_calc_w) shr bp__Elm_Layout_Data_restricted_calc_w;
end;

procedure set_restricted_calc_w(var a : _Elm_Layout_Data; __restricted_calc_w : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__restricted_calc_w shl bp__Elm_Layout_Data_restricted_calc_w) and bm__Elm_Layout_Data_restricted_calc_w);
end;

function restricted_calc_h(var a : _Elm_Layout_Data) : TEina_Bool;
begin
  restricted_calc_h:=(a.flag0 and bm__Elm_Layout_Data_restricted_calc_h) shr bp__Elm_Layout_Data_restricted_calc_h;
end;

procedure set_restricted_calc_h(var a : _Elm_Layout_Data; __restricted_calc_h : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__restricted_calc_h shl bp__Elm_Layout_Data_restricted_calc_h) and bm__Elm_Layout_Data_restricted_calc_h);
end;

function in_calc(var a : _Elm_Layout_Data) : TEina_Bool;
begin
  in_calc:=(a.flag0 and bm__Elm_Layout_Data_in_calc) shr bp__Elm_Layout_Data_in_calc;
end;

procedure set_in_calc(var a : _Elm_Layout_Data; __in_calc : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__in_calc shl bp__Elm_Layout_Data_in_calc) and bm__Elm_Layout_Data_in_calc);
end;

function user_min_sz(var a : _Elm_Layout_Data) : TEina_Bool;
begin
  user_min_sz:=(a.flag0 and bm__Elm_Layout_Data_user_min_sz) shr bp__Elm_Layout_Data_user_min_sz;
end;

procedure set_user_min_sz(var a : _Elm_Layout_Data; __user_min_sz : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__user_min_sz shl bp__Elm_Layout_Data_user_min_sz) and bm__Elm_Layout_Data_user_min_sz);
end;


end.
