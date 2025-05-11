unit Evas_Common;

interface

uses
  ctypes, elf, Evas_Loader;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  EVAS_VERSION_MAJOR = EFL_VERSION_MAJOR;  
  EVAS_VERSION_MINOR = EFL_VERSION_MINOR;
type
  TEvas_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
    end;
  PEvas_Version = ^TEvas_Version;
  var
    evas_version : PEvas_Version;cvar;external libevas;

const
  EVAS_CALLBACK_PRIORITY_BEFORE = -(100);  
  EVAS_CALLBACK_PRIORITY_DEFAULT = 0;
  EVAS_CALLBACK_PRIORITY_AFTER = 100;
{$ifdef EFL_BETA_API_SUPPORT}
type
  PEvas_Callback_Priority = ^TEvas_Callback_Priority;
  TEvas_Callback_Priority = TEfl_Callback_Priority;
{$else}
type
  PEvas_Callback_Priority = ^TEvas_Callback_Priority;
  TEvas_Callback_Priority = smallint;
{$endif}
type
  PEvas_Coord = ^TEvas_Coord;
  TEvas_Coord = longint;

  PEvas_Font_Size = ^TEvas_Font_Size;
  TEvas_Font_Size = longint;

  PEvas = ^TEvas;
  TEvas = TEo;

  PEfl_Canvas_Object = ^TEfl_Canvas_Object;
  TEfl_Canvas_Object = TEo;

  PEvas_Object = ^TEvas_Object;
  TEvas_Object = TEfl_Canvas_Object;

  PEfl_VG = ^TEfl_VG;
  TEfl_VG = TEo;

  PEvas_Performance = ^TEvas_Performance;
  TEvas_Performance = pointer;

  TEvas_Smart=record
        end;
  PEvas_Smart=^TEvas_Smart;

  PEvas_Angle = ^TEvas_Angle;
  TEvas_Angle = longint;

  TEvas_Coord_Rectangle = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      w : TEvas_Coord;
      h : TEvas_Coord;
    end;
  PEvas_Coord_Rectangle = ^TEvas_Coord_Rectangle;

  TEvas_Coord_Point = record
      x : TEvas_Coord;
      y : TEvas_Coord;
    end;
  PEvas_Coord_Point = ^TEvas_Coord_Point;

  TEvas_Coord_Size = record
      w : TEvas_Coord;
      h : TEvas_Coord;
    end;
  PEvas_Coord_Size = ^TEvas_Coord_Size;

  TEvas_Coord_Precision_Size = record
      w : TEvas_Coord;
      h : TEvas_Coord;
      wsub : double;
      ysub : double;
    end;
  PEvas_Coord_Precision_Size = ^TEvas_Coord_Precision_Size;

  TEvas_Coord_Precision_Point = record
      x : TEvas_Coord;
      y : TEvas_Coord;
      xsub : double;
      ysub : double;
    end;
  PEvas_Coord_Precision_Point = ^TEvas_Coord_Precision_Point;

  TEvas_Point = record
      x : longint;
      y : longint;
    end;
  PEvas_Point = ^TEvas_Point;

  TEvas_Position = record
      output : TEvas_Point;
      canvas : TEvas_Coord_Point;
    end;
  PEvas_Position = ^TEvas_Position;

  TEvas_Precision_Position = record
      output : TEvas_Point;
      canvas : TEvas_Coord_Precision_Point;
    end;
  PEvas_Precision_Position = ^TEvas_Precision_Position;

  PEvas_Device = ^TEvas_Device;
  TEvas_Device = TEo;
      type
  PEvas_Image_Content_Hint = ^TEvas_Image_Content_Hint;
  TEvas_Image_Content_Hint =  Longint;
  Const
    EVAS_IMAGE_CONTENT_HINT_NONE = 0;
    EVAS_IMAGE_CONTENT_HINT_DYNAMIC = 1;
    EVAS_IMAGE_CONTENT_HINT_STATIC = 2;
type
  PEvas_Alloc_Error = ^TEvas_Alloc_Error;
  TEvas_Alloc_Error =  Longint;
  Const
    EVAS_ALLOC_ERROR_NONE = 0;
    EVAS_ALLOC_ERROR_FATAL = 1;
    EVAS_ALLOC_ERROR_RECOVERED = 2;
type
  PEvas_Pixel_Import_Pixel_Format = ^TEvas_Pixel_Import_Pixel_Format;
  TEvas_Pixel_Import_Pixel_Format =  Longint;
  Const
    EVAS_PIXEL_FORMAT_NONE = 0;
    EVAS_PIXEL_FORMAT_ARGB32 = 1;
    EVAS_PIXEL_FORMAT_YUV420P_601 = 2;
type
  TEvas_Pixel_Import_Source = record
      format : TEvas_Pixel_Import_Pixel_Format;
      w : longint;
      h : longint;
      rows : ^pointer;
    end;
  PEvas_Pixel_Import_Source = ^TEvas_Pixel_Import_Source;

const
  EVAS_LAYER_MIN = -(32768);  
  EVAS_LAYER_MAX = 32767;
  EVAS_COLOR_SPACE_ARGB = 0;
  EVAS_COLOR_SPACE_AHSV = 1;
  EVAS_TEXT_INVALID = -(1);
  EVAS_TEXT_SPECIAL = -(2);
  EVAS_HINT_EXPAND = 1.0;
  EVAS_HINT_FILL = -(1.0);
  //evas_object_size_hint_fill_set = evas_object_size_hint_align_set;
  //evas_object_size_hint_fill_get = evas_object_size_hint_align_get;
  //evas_object_size_hint_expand_set = evas_object_size_hint_weight_set;
  //evas_object_size_hint_expand_get = evas_object_size_hint_weight_get;
type
  PEvas_Engine_Render_Mode = ^TEvas_Engine_Render_Mode;
  TEvas_Engine_Render_Mode =  Longint;
  Const
    EVAS_RENDER_MODE_BLOCKING = 0;
    EVAS_RENDER_MODE_NONBLOCKING = 1;
type
  TEvas_Event_Render_Post = record
      updated_area : PEina_List;
    end;
  PEvas_Event_Render_Post = ^TEvas_Event_Render_Post;

type
  PEvas_Device_Class = ^TEvas_Device_Class;
  TEvas_Device_Class =  Longint;
  Const
    EVAS_DEVICE_CLASS_NONE = 0;
    EVAS_DEVICE_CLASS_SEAT = 1;
    EVAS_DEVICE_CLASS_KEYBOARD = 2;
    EVAS_DEVICE_CLASS_MOUSE = 3;
    EVAS_DEVICE_CLASS_TOUCH = 4;
    EVAS_DEVICE_CLASS_PEN = 5;
    EVAS_DEVICE_CLASS_POINTER = 6;
    EVAS_DEVICE_CLASS_GAMEPAD = 7;
const  EVAS_DEVICE_CLASS_WAND = EVAS_DEVICE_CLASS_POINTER;
type
  PEvas_Device_Subclass = ^TEvas_Device_Subclass;
  TEvas_Device_Subclass =  Longint;
  Const
    EVAS_DEVICE_SUBCLASS_NONE = 0;
    EVAS_DEVICE_SUBCLASS_FINGER = 1;
    EVAS_DEVICE_SUBCLASS_FINGERNAIL = 2;
    EVAS_DEVICE_SUBCLASS_KNUCKLE = 3;
    EVAS_DEVICE_SUBCLASS_PALM = 4;
    EVAS_DEVICE_SUBCLASS_HAND_SIZE = 5;
    EVAS_DEVICE_SUBCLASS_HAND_FLAT = 6;
    EVAS_DEVICE_SUBCLASS_PEN_TIP = 7;
    EVAS_DEVICE_SUBCLASS_TRACKPAD = 8;
    EVAS_DEVICE_SUBCLASS_TRACKPOINT = 9;
    EVAS_DEVICE_SUBCLASS_TRACKBALL = 10;
type
  PEvas_Button_Flags = ^TEvas_Button_Flags;
  TEvas_Button_Flags =  Longint;
  Const
    EVAS_BUTTON_NONE = 0;
    EVAS_BUTTON_DOUBLE_CLICK = 1 shl 0;
    EVAS_BUTTON_TRIPLE_CLICK = 1 shl 1;
type
  PEvas_Event_Flags = ^TEvas_Event_Flags;
  TEvas_Event_Flags =  Longint;
  Const
    EVAS_EVENT_FLAG_NONE = 0;
    EVAS_EVENT_FLAG_ON_HOLD = 1 shl 0;
    EVAS_EVENT_FLAG_ON_SCROLL = 1 shl 1;
type
  PEvas_Aspect_Control = ^TEvas_Aspect_Control;
  TEvas_Aspect_Control =  Longint;
  Const
    EVAS_ASPECT_CONTROL_NONE = 0;
    EVAS_ASPECT_CONTROL_NEITHER = 1;
    EVAS_ASPECT_CONTROL_HORIZONTAL = 2;
    EVAS_ASPECT_CONTROL_VERTICAL = 3;
    EVAS_ASPECT_CONTROL_BOTH = 4;
type
  PEvas_BiDi_Direction = ^TEvas_BiDi_Direction;
  TEvas_BiDi_Direction = TEfl_Text_Bidirectional_Type;

const
  EVAS_BIDI_DIRECTION_NEUTRAL = EFL_TEXT_BIDIRECTIONAL_TYPE_NEUTRAL;  
  EVAS_BIDI_DIRECTION_NATURAL = EFL_TEXT_BIDIRECTIONAL_TYPE_NATURAL;  
  EVAS_BIDI_DIRECTION_LTR = EFL_TEXT_BIDIRECTIONAL_TYPE_LTR;  
  EVAS_BIDI_DIRECTION_RTL = EFL_TEXT_BIDIRECTIONAL_TYPE_RTL;  
  EVAS_BIDI_DIRECTION_INHERIT = EFL_TEXT_BIDIRECTIONAL_TYPE_INHERIT;  
type
  PEvas_Font_Data_Cache = ^TEvas_Font_Data_Cache;
  TEvas_Font_Data_Cache =  Longint;
  Const
    EVAS_FONT_DATA_CACHE_TEXTURE = $01;
type
  PEvas_Object_Pointer_Mode = ^TEvas_Object_Pointer_Mode;
  TEvas_Object_Pointer_Mode =  Longint;
  Const
    EVAS_OBJECT_POINTER_MODE_AUTOGRAB = 0;
    EVAS_OBJECT_POINTER_MODE_NOGRAB = 1;
    EVAS_OBJECT_POINTER_MODE_NOGRAB_NO_REPEAT_UPDOWN = 2;
type
  PEvas_Callback_Type = ^TEvas_Callback_Type;
  TEvas_Callback_Type =  Longint;
  Const
    EVAS_CALLBACK_MOUSE_IN = 0;
    EVAS_CALLBACK_MOUSE_OUT = 1;
    EVAS_CALLBACK_MOUSE_DOWN = 2;
    EVAS_CALLBACK_MOUSE_UP = 3;
    EVAS_CALLBACK_MOUSE_MOVE = 4;
    EVAS_CALLBACK_MOUSE_WHEEL = 5;
    EVAS_CALLBACK_MULTI_DOWN = 6;
    EVAS_CALLBACK_MULTI_UP = 7;
    EVAS_CALLBACK_MULTI_MOVE = 8;
    EVAS_CALLBACK_FREE = 9;
    EVAS_CALLBACK_KEY_DOWN = 10;
    EVAS_CALLBACK_KEY_UP = 11;
    EVAS_CALLBACK_FOCUS_IN = 12;
    EVAS_CALLBACK_FOCUS_OUT = 13;
    EVAS_CALLBACK_SHOW = 14;
    EVAS_CALLBACK_HIDE = 15;
    EVAS_CALLBACK_MOVE = 16;
    EVAS_CALLBACK_RESIZE = 17;
    EVAS_CALLBACK_RESTACK = 18;
    EVAS_CALLBACK_DEL = 19;
    EVAS_CALLBACK_HOLD = 20;
    EVAS_CALLBACK_CHANGED_SIZE_HINTS = 21;
    EVAS_CALLBACK_IMAGE_PRELOADED = 22;
    EVAS_CALLBACK_CANVAS_FOCUS_IN = 23;
    EVAS_CALLBACK_CANVAS_FOCUS_OUT = 24;
    EVAS_CALLBACK_RENDER_FLUSH_PRE = 25;
    EVAS_CALLBACK_RENDER_FLUSH_POST = 26;
    EVAS_CALLBACK_CANVAS_OBJECT_FOCUS_IN = 27;
    EVAS_CALLBACK_CANVAS_OBJECT_FOCUS_OUT = 28;
    EVAS_CALLBACK_IMAGE_UNLOADED = 29;
    EVAS_CALLBACK_RENDER_PRE = 30;
    EVAS_CALLBACK_RENDER_POST = 31;
    EVAS_CALLBACK_IMAGE_RESIZE = 32;
    EVAS_CALLBACK_DEVICE_CHANGED = 33;
    EVAS_CALLBACK_AXIS_UPDATE = 34;
    EVAS_CALLBACK_CANVAS_VIEWPORT_RESIZE = 35;
    EVAS_CALLBACK_LAST = 36;

type
  TEvas_Smart_Cb = procedure (data:pointer; obj:PEvas_Object; event_info:pointer);cdecl;
  TEvas_Event_Cb = procedure (data:pointer; e:PEvas; event_info:pointer);cdecl;
  TEvas_Object_Event_Post_Cb = function (data:pointer; e:PEvas):TEina_Bool;cdecl;
  TEvas_Object_Event_Cb = procedure (data:pointer; e:PEvas; obj:PEvas_Object; event_info:pointer);cdecl;
  TEvas_Async_Events_Put_Cb = procedure (target:pointer; _type:TEvas_Callback_Type; event_info:pointer);cdecl;

function evas_cserve_path_get:Pchar;cdecl;external libevas;deprecated;
function evas_init:longint;cdecl;external libevas;
function evas_shutdown:longint;cdecl;external libevas;
function evas_alloc_error:TEvas_Alloc_Error;cdecl;external libevas;
function evas_async_events_fd_get:longint;cdecl;external libevas;
function evas_async_events_process:longint;cdecl;external libevas;
function evas_async_events_put(target:pointer; _type:TEvas_Callback_Type; event_info:pointer; func:TEvas_Async_Events_Put_Cb):TEina_Bool;cdecl;external libevas;
function evas_render_method_lookup(name:Pchar):longint;cdecl;external libevas;
function evas_render_method_list:PEina_List;cdecl;external libevas;
procedure evas_render_method_list_free(list:PEina_List);cdecl;external libevas;
procedure evas_render_updates_free(updates:PEina_List);cdecl;external libevas;
function evas_device_add(e:PEvas):PEvas_Device;cdecl;external libevas;
function evas_device_add_full(e:PEvas; name:Pchar; desc:Pchar; parent_dev:PEvas_Device; emulation_dev:PEvas_Device;
           clas:TEvas_Device_Class; sub_class:TEvas_Device_Subclass):PEvas_Device;cdecl;external libevas;
procedure evas_device_del(dev:PEvas_Device);cdecl;external libevas;
procedure evas_device_push(e:PEvas; dev:PEvas_Device);cdecl;external libevas;
procedure evas_device_pop(e:PEvas);cdecl;external libevas;
function evas_device_list(e:PEvas; dev:PEvas_Device):PEina_List;cdecl;external libevas;
function evas_device_get(e:PEvas; name:Pchar):PEvas_Device;cdecl;external libevas;
function evas_device_get_by_seat_id(eo_e:PEvas; id:dword):PEvas_Device;cdecl;external libevas;
procedure evas_device_name_set(dev:PEvas_Device; name:Pchar);cdecl;external libevas;
function evas_device_name_get(dev:PEvas_Device):Pchar;cdecl;external libevas;
procedure evas_device_seat_id_set(dev:PEvas_Device; id:dword);cdecl;external libevas;
function evas_device_seat_id_get(dev:PEvas_Device):dword;cdecl;external libevas;
procedure evas_device_description_set(dev:PEvas_Device; desc:Pchar);cdecl;external libevas;
function evas_device_description_get(dev:PEvas_Device):Pchar;cdecl;external libevas;
procedure evas_device_parent_set(dev:PEvas_Device; parent:PEvas_Device);cdecl;external libevas; deprecated;
function evas_device_parent_get(dev:PEvas_Device):PEvas_Device;cdecl;external libevas;
procedure evas_device_class_set(dev:PEvas_Device; clas:TEvas_Device_Class);cdecl;external libevas;deprecated;
function evas_device_class_get(dev:PEvas_Device):TEvas_Device_Class;cdecl;external libevas;
procedure evas_device_subclass_set(dev:PEvas_Device; clas:TEvas_Device_Subclass);cdecl;external libevas;
function evas_device_subclass_get(dev:PEvas_Device):TEvas_Device_Subclass;cdecl;external libevas;
procedure evas_device_emulation_source_set(dev:PEvas_Device; src:PEvas_Device);cdecl;external libevas;
function evas_device_emulation_source_get(dev:PEvas_Device):PEvas_Device;cdecl;external libevas;
type
  TEvas_Object_Image_Pixels_Get_Cb = procedure (data:pointer; o:PEvas_Object);cdecl;
function evas_object_image_extension_can_load_get(file_:Pchar):TEina_Bool;cdecl;external libevas;
function evas_object_image_extension_can_load_fast_get(file_:Pchar):TEina_Bool;cdecl;external libevas;
const
  EVAS_TEXT_STYLE_MASK_BASIC = $f;  
  EVAS_TEXT_STYLE_MASK_SHADOW_DIRECTION = $7 shl 4;

type
  TEvas_Textgrid_Cell = bitpacked record
    codepoint : TEina_Unicode;
    fg        : Byte;
    bg        : Byte;
    bold          : 0..1;
    italic        : 0..1;
    underline     : 0..1;
    strikethrough : 0..1;
    fg_extended   : 0..1;
    bg_extended   : 0..1;
    double_width  : 0..1;
  end;
  PEvas_Textgrid_Cell = ^TEvas_Textgrid_Cell;

const
  EVAS_SMART_CLASS_VERSION = 4;  
type
  TEvas_Smart_Cb_Description = record
      name : Pchar;
      _type : Pchar;
    end;
  PEvas_Smart_Cb_Description = ^TEvas_Smart_Cb_Description;
  PPEvas_Smart_Cb_Description = ^PEvas_Smart_Cb_Description;

  PEvas_Smart_Class = ^TEvas_Smart_Class;
  TEvas_Smart_Class = record
      name : Pchar;
      version : longint;
      add : procedure (o:PEvas_Object);cdecl;
      del : procedure (o:PEvas_Object);cdecl;
      move : procedure (o:PEvas_Object; x:TEvas_Coord; y:TEvas_Coord);cdecl;
      resize : procedure (o:PEvas_Object; w:TEvas_Coord; h:TEvas_Coord);cdecl;
      show : procedure (o:PEvas_Object);cdecl;
      hide : procedure (o:PEvas_Object);cdecl;
      color_set : procedure (o:PEvas_Object; r:longint; g:longint; b:longint; a:longint);cdecl;
      clip_set : procedure (o:PEvas_Object; clip:PEvas_Object);cdecl;
      clip_unset : procedure (o:PEvas_Object);cdecl;
      calculate : procedure (o:PEvas_Object);cdecl;
      member_add : procedure (o:PEvas_Object; child:PEvas_Object);cdecl;
      member_del : procedure (o:PEvas_Object; child:PEvas_Object);cdecl;
      parent : PEvas_Smart_Class;
      callbacks : PEvas_Smart_Cb_Description;
      interfaces : ^PEvas_Smart_Interface;
      data : pointer;
    end;

  TEvas_Smart_Interface = record
      name : Pchar;
      private_size : dword;
      add : function (obj:PEvas_Object):TEina_Bool;cdecl;
      del : procedure (obj:PEvas_Object);cdecl;
    end;
  PEvas_Smart_Interface = ^TEvas_Smart_Interface;


procedure evas_smart_free(s:PEvas_Smart);cdecl;external libevas;
function evas_smart_class_new(sc:PEvas_Smart_Class):PEvas_Smart;cdecl;external libevas;
function evas_smart_class_get(s:PEvas_Smart):PEvas_Smart_Class;cdecl;external libevas;
function evas_smart_data_get(s:PEvas_Smart):pointer;cdecl;external libevas;
function evas_smart_callbacks_descriptions_get(s:PEvas_Smart; count:Pdword):PPEvas_Smart_Cb_Description;cdecl;external libevas;
function evas_smart_callback_description_find(s:PEvas_Smart; name:Pchar):PEvas_Smart_Cb_Description;cdecl;external libevas;
function evas_smart_class_inherit_full(sc:PEvas_Smart_Class; parent_sc:PEvas_Smart_Class; parent_sc_size:dword):TEina_Bool;cdecl;external libevas;
function evas_smart_usage_get(s:PEvas_Smart):longint;cdecl;external libevas;
procedure evas_smart_legacy_type_register(_type:Pchar; klass:PEfl_Class);cdecl;external libevas;
type
  TEvas_Object_Smart_Clipped_Data = record
      clipper : PEvas_Object;
      evas : PEvas;
    end;
  PEvas_Object_Smart_Clipped_Data = ^TEvas_Object_Smart_Clipped_Data;

procedure evas_object_smart_clipped_smart_set(sc:PEvas_Smart_Class);cdecl;external libevas;
function evas_object_smart_clipped_class_get:PEvas_Smart_Class;cdecl;external libevas;
const
  EVAS_OBJECT_BOX_API_VERSION = 1;
type
  TEvas_Object_Box_Option =bitpacked record
      obj : PEvas_Object;
      max_reached : 0..1;
       min_reached : 0..1;
      alloc_size : TEvas_Coord;
    end;
  PEvas_Object_Box_Option = ^TEvas_Object_Box_Option;

  PEvas_Object_Box_Data = ^TEvas_Object_Box_Data;

  TEvas_Object_Box_Layout = procedure (o:PEvas_Object; priv:PEvas_Object_Box_Data; user_data:pointer);cdecl;

  TEvas_Object_Box_Api = record
      base : TEvas_Smart_Class;
      version : longint;
      append : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      prepend : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      insert_before : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object; reference:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      insert_after : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object; reference:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      insert_at : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object; pos:dword):PEvas_Object_Box_Option;cdecl;
      remove : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object):PEvas_Object;cdecl;
      remove_at : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; pos:dword):PEvas_Object;cdecl;
      property_set : function (o:PEvas_Object; opt:PEvas_Object_Box_Option; _property:longint; args:Tva_list):TEina_Bool;cdecl;
      property_get : function (o:PEvas_Object; opt:PEvas_Object_Box_Option; _property:longint; args:Tva_list):TEina_Bool;cdecl;
      property_name_get : function (o:PEvas_Object; _property:longint):Pchar;cdecl;
      property_id_get : function (o:PEvas_Object; name:Pchar):longint;cdecl;
      option_new : function (o:PEvas_Object; priv:PEvas_Object_Box_Data; child:PEvas_Object):PEvas_Object_Box_Option;cdecl;
      option_free : procedure (o:PEvas_Object; priv:PEvas_Object_Box_Data; opt:PEvas_Object_Box_Option);cdecl;
    end;
  PEvas_Object_Box_Api = ^TEvas_Object_Box_Api;

  TEvas_Object_Box_Data =bitpacked record
      base : TEvas_Object_Smart_Clipped_Data;
      api : PEvas_Object_Box_Api;
      align : record
          h : double;
          v : double;
        end;
      pad : record
          h : TEvas_Coord;
          v : TEvas_Coord;
        end;
      children : PEina_List;
      layout : record
          cb : TEvas_Object_Box_Layout;
          data : pointer;
          free_data : procedure (data:pointer);cdecl;
        end;
                  layouting : 0..1;
                 children_changed : 0..1;
   end;


procedure evas_object_box_smart_set(api:PEvas_Object_Box_Api);cdecl;external libevas;
function evas_object_box_smart_class_get:PEvas_Object_Box_Api;cdecl;external libevas;
type
  TEvas_Cserve_Stats = record
      saved_memory : longint;
      wasted_memory : longint;
      saved_memory_peak : longint;
      wasted_memory_peak : longint;
      saved_time_image_header_load : double;
      saved_time_image_data_load : double;
    end;
  PEvas_Cserve_Stats = ^TEvas_Cserve_Stats;

  TEvas_Cserve_Image_Cache = record
      active : record
          mem_total : longint;
          count : longint;
        end;
      cached : record
          mem_total : longint;
          count : longint;
        end;
      images : PEina_List;
    end;
  PEvas_Cserve_Image_Cache = ^TEvas_Cserve_Image_Cache;

  TEvas_Cserve_Image =bitpacked record
      file_ : Pchar;
      key : Pchar;
      w : longint;
      h : longint;
      file_mod_time : Ttime_t;
      file_checked_time : Ttime_t;
      cached_time : Ttime_t;
      refcount : longint;
      data_refcount : longint;
      memory_footprint : longint;
      head_load_time : double;
      data_load_time : double;
     alpha : 0..1;
     data_loaded : 0..1;
     active : 0..1;
     dead : 0..1;
     useless : 0..1;
  end;
  PEvas_Cserve_Image = ^TEvas_Cserve_Image;

type
  TEvas_Cserve_Config = record
      cache_max_usage : longint;
      cache_item_timeout : longint;
      cache_item_timeout_check : longint;
    end;
  PEvas_Cserve_Config = ^TEvas_Cserve_Config;

function evas_cserve_want_get:TEina_Bool;cdecl;external libevas;
function evas_cserve_connected_get:TEina_Bool;cdecl;external libevas;
function evas_cserve_stats_get(stats:PEvas_Cserve_Stats):TEina_Bool;cdecl;external libevas;
procedure evas_cserve_image_cache_contents_clean(cache:PEvas_Cserve_Image_Cache);cdecl;external libevas;
function evas_cserve_config_get(config:PEvas_Cserve_Config):TEina_Bool;cdecl;external libevas;
function evas_cserve_config_set(config:PEvas_Cserve_Config):TEina_Bool;cdecl;external libevas;
procedure evas_cserve_disconnect;cdecl;external libevas;
function evas_load_error_str(error:TEvas_Load_Error):Pchar;cdecl;external libevas;
procedure evas_color_hsv_to_rgb(h:single; s:single; v:single; r:Plongint; g:Plongint;            b:Plongint);cdecl;external libevas;
procedure evas_color_rgb_to_hsv(r:longint; g:longint; b:longint; h:Psingle; s:Psingle;            v:Psingle);cdecl;external libevas;
procedure evas_color_argb_premul(a:longint; r:Plongint; g:Plongint; b:Plongint);cdecl;external libevas;
procedure evas_color_argb_unpremul(a:longint; r:Plongint; g:Plongint; b:Plongint);cdecl;external libevas;
procedure evas_data_argb_premul(data:Pdword; len:dword);cdecl;external libevas;
procedure evas_data_argb_unpremul(data:Pdword; len:dword);cdecl;external libevas;
function evas_string_char_next_get(str:Pchar; pos:longint; decoded:Plongint):longint;cdecl;external libevas;
function evas_string_char_prev_get(str:Pchar; pos:longint; decoded:Plongint):longint;cdecl;external libevas;
function evas_string_char_len_get(str:Pchar):longint;cdecl;external libevas;
function evas_language_direction_get:TEvas_BiDi_Direction;cdecl;external libevas;
procedure evas_language_reinit;cdecl;external libevas;
procedure evas_font_path_global_clear;cdecl;external libevas;
procedure evas_font_path_global_append(path:Pchar);cdecl;external libevas;
procedure evas_font_path_global_prepend(path:Pchar);cdecl;external libevas;
function evas_font_path_global_list:PEina_List;cdecl;external libevas;
procedure evas_font_reinit;cdecl;external libevas;
procedure evas_font_data_cache_set(options:TEvas_Font_Data_Cache; byte:longint);cdecl;external libevas;
function evas_font_data_cache_get(options:TEvas_Font_Data_Cache):longint;cdecl;external libevas;
type
  PEfl_Input_Device = ^TEfl_Input_Device;
  TEfl_Input_Device = TEo;
type
  PEfl_Input_Device_Type = ^TEfl_Input_Device_Type;
  TEfl_Input_Device_Type =  Longint;
  Const
    EFL_INPUT_DEVICE_TYPE_NONE = 0;
    EFL_INPUT_DEVICE_TYPE_SEAT = 1;
    EFL_INPUT_DEVICE_TYPE_KEYBOARD = 2;
    EFL_INPUT_DEVICE_TYPE_MOUSE = 3;
    EFL_INPUT_DEVICE_TYPE_TOUCH = 4;
    EFL_INPUT_DEVICE_TYPE_PEN = 5;
    EFL_INPUT_DEVICE_TYPE_WAND = 6;
    EFL_INPUT_DEVICE_TYPE_GAMEPAD = 7;
type
  PEfl_Gfx_Entity = ^TEfl_Gfx_Entity;
  TEfl_Gfx_Entity = TEo;

function EVAS_OBJECT_BOX_API_INIT_NULL : longint;
function EVAS_OBJECT_BOX_API_INIT_VERSION : longint;
function EVAS_OBJECT_BOX_API_INIT_NAME_VERSION(name : longint) : longint;



// === Konventiert am: 10-5-25 19:42:43 ===


implementation



{ was #define dname def_expr }
function EVAS_OBJECT_BOX_API_INIT_NULL : longint; { return type might be wrong }
  begin
    EVAS_OBJECT_BOX_API_INIT_NULL:=EVAS_OBJECT_BOX_API_INIT(EVAS_SMART_CLASS_INIT_NULL);
  end;

{ was #define dname def_expr }
function EVAS_OBJECT_BOX_API_INIT_VERSION : longint; { return type might be wrong }
  begin
    EVAS_OBJECT_BOX_API_INIT_VERSION:=EVAS_OBJECT_BOX_API_INIT(EVAS_SMART_CLASS_INIT_VERSION);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVAS_OBJECT_BOX_API_INIT_NAME_VERSION(name : longint) : longint;
begin
  EVAS_OBJECT_BOX_API_INIT_NAME_VERSION:=EVAS_OBJECT_BOX_API_INIT(EVAS_SMART_CLASS_INIT_NAME_VERSION(name));
end;



end.
