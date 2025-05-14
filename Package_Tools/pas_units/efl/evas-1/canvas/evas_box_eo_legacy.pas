unit evas_box_eo_legacy;

interface

uses
  ctypes, efl, Evas_Common;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  PEvas_Box = ^TEvas_Box;
  TEvas_Box = TEo;

procedure evas_object_box_align_set(obj:PEvas_Box; horizontal:double; vertical:double);cdecl;external libevas;
procedure evas_object_box_align_get(obj:PEvas_Box; horizontal:Pdouble; vertical:Pdouble);cdecl;external libevas;
procedure evas_object_box_padding_set(obj:PEvas_Box; horizontal:longint; vertical:longint);cdecl;external libevas;
procedure evas_object_box_padding_get(obj:PEvas_Box; horizontal:Plongint; vertical:Plongint);cdecl;external libevas;
procedure evas_object_box_layout_set(obj:PEvas_Box; cb:TEvas_Object_Box_Layout; data:pointer; free_data:TEina_Free_Cb);cdecl;external libevas;
procedure evas_object_box_layout_horizontal(obj:PEvas_Box; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external libevas;
procedure evas_object_box_layout_vertical(obj:PEvas_Box; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external libevas;
procedure evas_object_box_layout_homogeneous_max_size_horizontal(obj:PEvas_Box; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external libevas;
procedure evas_object_box_layout_flow_vertical(obj:PEvas_Box; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external libevas;
function evas_object_box_insert_after(obj:PEvas_Box; child:PEfl_Canvas_Object; reference:PEfl_Canvas_Object):PEvas_Object_Box_Option;cdecl;external libevas;
function evas_object_box_remove_all(obj:PEvas_Box; clear:TEina_Bool):TEina_Bool;cdecl;external libevas;
function evas_object_box_iterator_new(obj:PEvas_Box):PEina_Iterator;cdecl;external libevas;
function evas_object_box_add_to(obj:PEvas_Box):PEfl_Canvas_Object;cdecl;external libevas;
function evas_object_box_append(obj:PEvas_Box; child:PEfl_Canvas_Object):PEvas_Object_Box_Option;cdecl;external libevas;
function evas_object_box_option_property_id_get(obj:PEvas_Box; name:Pchar):longint;cdecl;external libevas;
function evas_object_box_prepend(obj:PEvas_Box; child:PEfl_Canvas_Object):PEvas_Object_Box_Option;cdecl;external libevas;
function evas_object_box_accessor_new(obj:PEvas_Box):PEina_Accessor;cdecl;external libevas;
function evas_object_box_remove_at(obj:PEvas_Box; pos:dword):TEina_Bool;cdecl;external libevas;
function evas_object_box_insert_before(obj:PEvas_Box; child:PEfl_Canvas_Object; reference:PEfl_Canvas_Object):PEvas_Object_Box_Option;cdecl;external libevas;
function evas_object_box_option_property_name_get(obj:PEvas_Box; _property:longint):Pchar;cdecl;external libevas;
procedure evas_object_box_layout_homogeneous_horizontal(obj:PEvas_Box; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external libevas;
procedure evas_object_box_layout_homogeneous_max_size_vertical(obj:PEvas_Box; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external libevas;
function evas_object_box_insert_at(obj:PEvas_Box; child:PEfl_Canvas_Object; pos:dword):PEvas_Object_Box_Option;cdecl;external libevas;
function evas_object_box_remove(obj:PEvas_Box; child:PEfl_Canvas_Object):TEina_Bool;cdecl;external libevas;
procedure evas_object_box_layout_stack(obj:PEvas_Box; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external libevas;
procedure evas_object_box_layout_homogeneous_vertical(obj:PEvas_Box; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external libevas;
procedure evas_object_box_layout_flow_horizontal(obj:PEvas_Box; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external libevas;

// === Konventiert am: 13-5-25 15:13:51 ===


implementation



end.
