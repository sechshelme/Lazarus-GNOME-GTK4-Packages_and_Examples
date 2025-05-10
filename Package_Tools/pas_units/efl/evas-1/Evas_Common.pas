unit Evas_Common;

interface

uses
  ctypes, elf;

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

  //struct _Evas_Textgrid_Cell
  //{
  //   Eina_Unicode   codepoint;         /**< the UNICODE value of the character */
  //   unsigned char  fg;                /**< the index of the palette for the foreground color */
  //   unsigned char  bg;                /**< the index of the palette for the background color */
  //   unsigned short bold          : 1; /**< whether the character is bold */
  //   unsigned short italic        : 1; /**< whether the character is oblique */
  //   unsigned short underline     : 1; /**< whether the character is underlined */
  //   unsigned short strikethrough : 1; /**< whether the character is strikethrough'ed */
  //   unsigned short fg_extended   : 1; /**< whether the extended palette is used for the foreground color */
  //   unsigned short bg_extended   : 1; /**< whether the extended palette is used for the background color */
  //   unsigned short double_width  : 1; /**< if the codepoint is merged with the following cell to the right visually (cells must be in pairs with 2nd cell being a duplicate in all ways except codepoint is 0) */
  //};

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
{*
 * @struct _Evas_Smart_Class
 *
 * A smart object's @b base class definition
 *
 * @ingroup Evas_Smart_Group
  }
{*< the name string of the class  }
{*< code to be run when adding object to a canvas  }
{*< code to be run when removing object from a canvas  }
{*< code to be run when moving object on a canvas. @a x and @a y will be new coordinates one applied to the object. use evas_object_geometry_get() if you need the old values, during this call. after that, the old values will be lost.  }
{*< code to be run when resizing object on a canvas. @a w and @a h will be new dimensions one applied to the object. use evas_object_geometry_get() if you need the old values, during this call. after that, the old values will be lost.  }
{*< code to be run when showing object on a canvas  }
{*< code to be run when hiding object on a canvas  }
{*< code to be run when setting color of object on a canvas. @a r, @a g, @a b and @a a will be new color components one applied to the object. use evas_object_color_get() if you need the old values, during this call. after that, the old values will be lost.  }
{*< code to be run when setting clipper of object on a canvas. @a clip will be new clipper one applied to the object. use evas_object_clip_get() if you need the old one, during this call. after that, the old (object pointer) value will be lost.  }
{*< code to be run when unsetting clipper of object on a canvas. if you need the pointer to a previous set clipper, during this call, use evas_object_clip_get(). after that, the old (object pointer) value will be lost.  }
{*< code to be run when object has rendering updates on a canvas  }
{*< code to be run when a child member is added to object  }
{*< code to be run when a child member is removed from object  }
{*< this class inherits from this parent  }
{*< callbacks at this level, @c NULL terminated  }
{*< #Evas_Smart_Interface pointers array, @c NULL terminated. These will be the interfaces supported at this level for an object (parents may have others) @since 1.7  }
type
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

{*
 * @struct _Evas_Smart_Interface
 *
 * A smart object's @b base interface definition
 *
 * Every Evas interface must have a name field, pointing to a global,
 * constant string variable. This string pointer will be the only way
 * of retrieving back a given interface from a smart object. Two
 * function pointers must be defined, too, which will be called at
 * object creation and deletion times.
 *
 * See also some @ref Example_Evas_Smart_Interfaces "examples" on
 * smart interfaces.
 *
 * @since 1.7
 *
 * @ingroup Evas_Smart_Group
  }
{*< Name of the given interface  }
{*< Size, in bytes, of the interface's private dada blob. This will be allocated and freed automatically for you. Get it with evas_object_smart_interface_data_get().  }
{*< Function to be called at object creation time. This will take place @b before the object's smart @c add() function.  }
{*< Function to be called at object deletion time. This will take place @b after the object's smart @c del() function.  }
  PEvas_Smart_Interface = ^TEvas_Smart_Interface;
  TEvas_Smart_Interface = record
      name : Pchar;
      private_size : dword;
      add : function (obj:PEvas_Object):TEina_Bool;cdecl;
      del : procedure (obj:PEvas_Object);cdecl;
    end;

{*
 * @struct _Evas_Smart_Cb_Description
 *
 * Describes a callback issued by a smart object
 * (evas_object_smart_callback_call()), as defined in its smart object
 * class. This is particularly useful to explain to end users and
 * their code (i.e., introspection) what the parameter @c event_info
 * will point to.
 *
 * @ingroup Evas_Smart_Group
  }
{*< callback name ("changed", for example)  }
{*
    * @brief Hint on the type of @c event_info parameter's contents on
    * a #Evas_Smart_Cb callback.
    *
    * The type string uses the pattern similar to
    * http://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-signatures,
    * but extended to optionally include variable names within
    * brackets preceding types. Example:
    *
    * @li Structure with two integers:
    *     @c "(ii)"
    *
    * @li Structure called 'x' with two integers named 'a' and 'b':
    *     @c "[x]([a]i[b]i)"
    *
    * @li Array of integers:
    *     @c "ai"
    *
    * @li Array called 'x' of struct with two integers:
    *     @c "[x]a(ii)"
    *
    * @note This type string is used as a hint and is @b not validated
    *       or enforced in any way. Implementors should make the best
    *       use of it to help bindings, documentation and other users
    *       of introspection features.
     }
  PEvas_Smart_Cb_Description = ^TEvas_Smart_Cb_Description;
  TEvas_Smart_Cb_Description = record
      name : Pchar;
      _type : Pchar;
    end;

{*
 * @def EVAS_SMART_CLASS_INIT_NULL
 * Initialize to zero a whole Evas_Smart_Class structure.
 *
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * @ingroup Evas_Smart_Group
  }
{ xxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_NULL    NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL }
{*
 * @def EVAS_SMART_CLASS_INIT_VERSION
 * Initialize to zero a whole Evas_Smart_Class structure and set version.
 *
 * Similar to EVAS_SMART_CLASS_INIT_NULL, but will set version field to
 * latest EVAS_SMART_CLASS_VERSION.
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * @ingroup Evas_Smart_Group
  }
{ xxxxxxxxxxxxxxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_VERSION NULL, EVAS_SMART_CLASS_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL }
{*
 * @def EVAS_SMART_CLASS_INIT_NAME_VERSION
 * Initialize to zero a whole Evas_Smart_Class structure and set name
 * and version.
 *
 * Similar to EVAS_SMART_CLASS_INIT_NULL, but will set version field to
 * latest EVAS_SMART_CLASS_VERSION and name to the specified value.
 *
 * It will keep a reference to name field as a "const char *", that is,
 * name must be available while the structure is used (hint: static or global!)
 * and will not be modified.
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * @ingroup Evas_Smart_Group
  }
{ xxxxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_NAME_VERSION(name)                                     name, EVAS_SMART_CLASS_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL }
{*
 * @def EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * Initialize to zero a whole Evas_Smart_Class structure and set name,
 * version and parent class.
 *
 * Similar to EVAS_SMART_CLASS_INIT_NULL, but will set version field to
 * latest EVAS_SMART_CLASS_VERSION, name to the specified value and
 * parent class.
 *
 * It will keep a reference to name field as a "const char *", that is,
 * name must be available while the structure is used (hint: static or global!)
 * and will not be modified. Similarly, parent reference will be kept.
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * @ingroup Evas_Smart_Group
  }
{xxxxxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT(name, parent)                      name, EVAS_SMART_CLASS_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, parent, NULL, NULL }
{*
 * @def EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS
 * Initialize to zero a whole Evas_Smart_Class structure and set name,
 * version, parent class and callbacks definition.
 *
 * Similar to EVAS_SMART_CLASS_INIT_NULL, but will set version field to
 * latest EVAS_SMART_CLASS_VERSION, name to the specified value, parent
 * class and callbacks at this level.
 *
 * It will keep a reference to name field as a "const char *", that is,
 * name must be available while the structure is used (hint: static or global!)
 * and will not be modified. Similarly, parent and callbacks reference
 * will be kept.
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT
 * @ingroup Evas_Smart_Group
  }
{ xxxxxxxxxxxxxxxxx }
{#define EVAS_SMART_CLASS_INIT_NAME_VERSION_PARENT_CALLBACKS(name, parent, callbacks) name, EVAS_SMART_CLASS_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, parent, callbacks, NULL }
{*
 * @def EVAS_SMART_SUBCLASS_NEW
 *
 * Convenience macro to subclass a given Evas smart class.
 *
 * @param smart_name The name used for the smart class. e.g:
 * @c "Evas_Object_Box".
 * @param prefix Prefix used for all variables and functions defined
 * and referenced by this macro.
 * @param api_type Type of the structure used as API for the smart
 * class. Either #Evas_Smart_Class or something derived from it.
 * @param parent_type Type of the parent class API.
 * @param parent_func Function that gets the parent class. e.g:
 * evas_object_box_smart_class_get().
 * @param cb_desc Array of callback descriptions for this smart class.
 *
 * This macro saves some typing when writing a smart class derived
 * from another one. In order for this to work, the user @b must provide some
 * functions adhering to the following guidelines:
 *  - @<prefix@>_smart_set_user(): the @b internal @c _smart_set
 *    function (defined by this macro) will call this one, provided by
 *    the user, after inheriting everything from the parent, which
 *    should <b>take care of setting the right member functions for
 *    the class</b>, both overrides and extensions, if any.
 *  - If this new class should be subclassable as well, a @b public
 *    @c _smart_set() function is desirable to fill in the class used as
 *    parent by the children. It's up to the user to provide this
 *    interface, which will most likely call @<prefix@>_smart_set() to
 *    get the job done.
 *
 * After the macro's usage, the following will be defined for use:
 *  - @<prefix@>_parent_sc: A pointer to the @b parent smart
 *    class. When calling parent functions from overloaded ones, use
 *    this global variable.
 *  - @<prefix@>_smart_class_new(): this function returns the
 *    #Evas_Smart needed to create smart objects with this class,
 *    which should be passed to evas_object_smart_add().
 *
 * @warning @p smart_name has to be a pointer to a globally available
 * string! The smart class created here will just have a pointer set
 * to that, and all object instances will depend on it for smart class
 * name lookup.
 *
 * @ingroup Evas_Smart_Group
  }
{*
 * @def EVAS_SMART_SUBCLASS_IFACE_NEW
 *
 * @since 1.7
 *
 * Convenience macro to subclass a given Evas smart class. This is the
 * same as #EVAS_SMART_SUBCLASS_NEW, but now <b>declaring smart
 * interfaces</b> besides the smart callbacks.
 *
 * @param smart_name The name used for the smart class. e.g:
 *                   @c "Evas_Object_Box".
 * @param prefix Prefix used for all variables and functions defined
 *               and referenced by this macro.
 * @param api_type Type of the structure used as API for the smart
 *                 class. Either #Evas_Smart_Class or something
 *                 derived from it.
 * @param parent_type Type of the parent class API.
 * @param parent_func Function that gets the parent class. e.g:
 *                    evas_object_box_smart_class_get().
 * @param cb_desc Array of smart callback descriptions for this smart
 *                class.
 * @param ifaces Array of Evas smart interafaces for this smart
 *               class.
 *
 * This macro saves some typing when writing a smart class derived
 * from another one. In order for this to work, the user @b must provide some
 * functions adhering to the following guidelines:
 *  - @<prefix@>_smart_set_user(): the @b internal @c _smart_set
 *    function (defined by this macro) will call this one, provided by
 *    the user, after inheriting everything from the parent, which
 *    should <b>take care of setting the right member functions for
 *    the class</b>, both overrides and extensions, if any.
 *  - If this new class should be subclassable as well, a @b public
 *    @c _smart_set() function is desirable to fill in the class used as
 *    parent by the children. It's up to the user to provide this
 *    interface, which will most likely call @<prefix@>_smart_set() to
 *    get the job done.
 *
 * After the macro's usage, the following will be defined for use:
 *  - @<prefix@>_parent_sc: A pointer to the @b parent smart
 *    class. When calling parent functions from overloaded ones, use
 *    this global variable.
 *  - @<prefix@>_smart_class_new(): this function returns the
 *    #Evas_Smart needed to create smart objects with this class,
 *    which should be passed to evas_object_smart_add().
 *
 * @warning @p smart_name has to be a pointer to a globally available
 * string! The smart class created here will just have a pointer set
 * to that, and all object instances will depend on it for smart class
 * name lookup.
 *
 * @ingroup Evas_Smart_Group
  }
{*
 * Free an #Evas_Smart struct
 *
 * @param s the #Evas_Smart struct to free
 *
 * @warning If this smart handle was created using
 * evas_smart_class_new(), the associated #Evas_Smart_Class will not
 * be freed.
 *
 * @note If you're using the #EVAS_SMART_SUBCLASS_NEW schema to create your
 * smart object, note that an #Evas_Smart handle will be shared amongst all
 * instances of the given smart class, through a static variable.
 * Evas will internally count references on #Evas_Smart handles and free them
 * when they are not referenced anymore. Thus, this function is of no use
 * for Evas users, most probably.
  }

procedure evas_smart_free(s:PEvas_Smart);cdecl;external libevas;
{*
 * Creates a new #Evas_Smart from a given #Evas_Smart_Class struct
 *
 * @param sc the smart class definition
 * @return a new #Evas_Smart pointer
 *
 * #Evas_Smart handles are necessary to create new @b instances of
 * smart objects belonging to the class described by @p sc. That
 * handle will contain, besides the smart class interface definition,
 * all its smart callbacks infrastructure set, too.
 *
 * @note If you are willing to subclass a given smart class to
 * construct yours, consider using the #EVAS_SMART_SUBCLASS_NEW macro,
 * which will make use of this function automatically for you.
  }
function evas_smart_class_new(sc:PEvas_Smart_Class):PEvas_Smart;cdecl;external libevas;
{*
 * Get the #Evas_Smart_Class handle of an #Evas_Smart struct
 *
 * @param s a valid #Evas_Smart pointer
 * @return the #Evas_Smart_Class in it
  }
function evas_smart_class_get(s:PEvas_Smart):PEvas_Smart_Class;cdecl;external libevas;
{*
 * @brief Get the data pointer set on an #Evas_Smart struct
 *
 * @param s a valid #Evas_Smart handle
 *
 * This data pointer is set as the data field in the #Evas_Smart_Class
 * passed in to evas_smart_class_new().
  }
function evas_smart_data_get(s:PEvas_Smart):pointer;cdecl;external libevas;
{*
 * Get the smart callbacks known by this #Evas_Smart handle's smart
 * class hierarchy.
 *
 * @param s A valid #Evas_Smart handle.
 * @param[out] count Returns the number of elements in the returned
 * array.
 *
 * @return The array with callback descriptions known by this smart
 *         class, with its size returned in @a count parameter. It
 *         should not be modified in any way. If no callbacks are
 *         known, @c NULL is returned. The array is sorted by event
 *         names and elements refer to the original values given to
 *         evas_smart_class_new()'s Evas_Smart_Class::callbacks
 *         (pointer to them).
 *
 * This is likely different from
 * evas_object_smart_callbacks_descriptions_get() as it will contain
 * the callbacks of @b all this class hierarchy sorted, while the
 * direct smart class member refers only to that specific class and
 * should not include parent's.
 *
 * If no callbacks are known, this function returns @c NULL.
 *
 * The array elements and thus their contents will be @b references to
 * original values given to evas_smart_class_new() as
 * Evas_Smart_Class::callbacks.
 *
 * The array is sorted by Evas_Smart_Cb_Description::name. The last
 * array element is a @c NULL pointer and is not accounted for in @a
 * count. Loop iterations can check any of these size indicators.
 *
 * @note objects may provide per-instance callbacks, use
 *       evas_object_smart_callbacks_descriptions_get() to get those
 *       as well.
 * @see evas_object_smart_callbacks_descriptions_get()
  }
function evas_smart_callbacks_descriptions_get(s:PEvas_Smart; count:Pdword):^PEvas_Smart_Cb_Description;cdecl;external libevas;
{*
 * Find a callback description for the callback named @a name.
 *
 * @param s The #Evas_Smart where to search for class registered smart
 * event callbacks.
 * @param name Name of the desired callback, which must @b not be @c
 *        NULL. The search has a special case for @a name being the
 *        same pointer as registered with #Evas_Smart_Cb_Description.
 *        One can use it to avoid excessive use of strcmp().
 * @return A reference to the description if found, or @c NULL, otherwise
 *
 * @see evas_smart_callbacks_descriptions_get()
  }
function evas_smart_callback_description_find(s:PEvas_Smart; name:Pchar):PEvas_Smart_Cb_Description;cdecl;external libevas;
{*
 * Sets one class to inherit from the other.
 *
 * Copy all function pointers, set @c parent to @a parent_sc and copy
 * everything after sizeof(Evas_Smart_Class) present in @a parent_sc,
 * using @a parent_sc_size as reference.
 *
 * This is recommended instead of a single memcpy() since it will take
 * care to not modify @a sc name, version, callbacks and possible
 * other members.
 *
 * @param sc child class.
 * @param parent_sc parent class, will provide attributes.
 * @param parent_sc_size size of parent_sc structure, child should be at least
 *        this size. Everything after @c Evas_Smart_Class size is copied
 *        using regular memcpy().
  }
function evas_smart_class_inherit_full(sc:PEvas_Smart_Class; parent_sc:PEvas_Smart_Class; parent_sc_size:dword):TEina_Bool;cdecl;external libevas;
{*
 * Get the number of uses of the smart instance
 *
 * @param s The Evas_Smart to get the usage count of
 * @return The number of uses of the smart instance
 *
 * This function tells you how many more uses of the smart instance are in
 * existence. This should be used before freeing/clearing any of the
 * Evas_Smart_Class that was used to create the smart instance. The smart
 * instance will refer to data in the Evas_Smart_Class used to create it and
 * thus you cannot remove the original data until all users of it are gone.
 * When the usage count goes to 0, you can evas_smart_free() the smart
 * instance @p s and remove from memory any of the Evas_Smart_Class that
 * was used to create the smart instance, if you desire. Removing it from
 * memory without doing this will cause problems (crashes, undefined
 * behavior, etc.), so either never remove the original
 * Evas_Smart_Class data from memory (have it be a constant structure and
 * data), or use this API call and be very careful.
  }
function evas_smart_usage_get(s:PEvas_Smart):longint;cdecl;external libevas;
{*
 * @def evas_smart_class_inherit
 * Easy to use version of evas_smart_class_inherit_full().
 *
 * This version will use sizeof(parent_sc), copying everything.
 *
 * @param sc child class, will have methods copied from @a parent_sc
 * @param parent_sc parent class, will provide contents to be copied.
 * @return 1 on success, 0 on failure.
 * @ingroup Evas_Smart_Group
  }
{#define evas_smart_class_inherit(sc, parent_sc) evas_smart_class_inherit_full(sc, (Evas_Smart_Class *)parent_sc, sizeof(*parent_sc)) }
{*
 * @
  }
{*
 * @defgroup Evas_Smart_Object_Group Smart Object Functions
 * @ingroup Evas
 *
 * Functions dealing with Evas smart objects (instances).
 *
 * Smart objects are groupings of primitive Evas objects that behave
 * as a cohesive group. For instance, a file manager icon may be a
 * smart object composed of an image object, a text label and two
 * rectangles that appear behind the image and text when the icon is
 * selected. As a smart object, the normal Evas object API could be
 * used on the icon object.
 *
 * Besides that, generally smart objects implement a <b>specific
 * API</b>, so that users interact with its own custom features. The
 * API takes form of explicit exported functions one may call and
 * <b>smart callbacks</b>.
 *
 * @section Evas_Smart_Object_Group_Callbacks Smart events and callbacks
 *
 * Smart objects can elect events (smart events, from now on) occurring
 * inside of them to be reported back to their users via callback
 * functions (smart callbacks). This way, you can extend Evas' own
 * object events. They are defined by an <b>event string</b> that
 * identifies them uniquely. There's also a function prototype
 * definition for the callback functions: #Evas_Smart_Cb.
 *
 * When defining an #Evas_Smart_Class, smart object implementors are
 * strongly encouraged to properly set the Evas_Smart_Class::callbacks
 * callbacks description array, so that the users of the smart object
 * can have introspection on its events API <b>at run time</b>.
 *
 * See some @ref Example_Evas_Smart_Objects "examples" of this group
 * of functions.
 *
 * @see @ref Evas_Smart_Group for class definitions.
  }
{*
 * @addtogroup Evas_Smart_Object_Group
 * @
  }
{*
 * Registers an object type and its associated class. LEGACY MECHANISM SUPPORT.
 *
 * This function is invoked in the class constructor of smart classes. It will
 * add the type and the class into a hash table that will then be used to check
 * the type of an object.
 * This function has been implemented to support legacy mechanism that checks
 * objects types by name.
 * USE IT ONLY FOR LEGACY SUPPORT.
 * Otherwise, it is HIGHLY recommended to use efl_isa.
 *
 * @param type The type (name string) to add.
 * @param klass The class to associate to the type.
 *
 * @see efl_isa
 *
 * @ingroup Evas_Smart_Object_Group
  }
procedure evas_smart_legacy_type_register(_type:Pchar; klass:PEfl_Class);cdecl;external libevas;
{*
 * @
  }
{*
 * @defgroup Evas_Smart_Object_Clipped Clipped Smart Object
 *
 * Clipped smart object is a base to construct other smart objects
 * based on the concept of having an internal clipper that is applied
 * to all children objects. This clipper will control the visibility,
 * clipping and color of sibling objects (remember that the clipping
 * is recursive, and clipper color modulates the color of its
 * clippees). By default, this base will also move children relative
 * to the parent, and delete them when parent is deleted. In other
 * words, it is the base for simple object grouping.
 *
 * See some @ref Example_Evas_Smart_Objects "examples" of this group
 * of functions.
 *
 * @see evas_object_smart_clipped_smart_set()
 *
 * @ingroup Evas_Smart_Object_Group
 *
 * @
  }
{*
 * Every subclass should provide this at the beginning of their own
 * data set with evas_object_smart_data_set().
  }
type
  PEvas_Object_Smart_Clipped_Data = ^TEvas_Object_Smart_Clipped_Data;
  TEvas_Object_Smart_Clipped_Data = record
      clipper : PEvas_Object;
      evas : PEvas;
    end;

{*
 * Set a given smart class' callbacks so it implements the <b>clipped smart
 * object"</b>'s interface.
 *
 * @param sc The smart class handle to operate on
 *
 * This call will assign all the required methods of the @p sc
 * #Evas_Smart_Class instance to the implementations set for clipped
 * smart objects. If one wants to "subclass" it, call this function
 * and then override desired values. If one wants to call any original
 * method, save it somewhere. Example:
 *
 * @code
 * static Evas_Smart_Class parent_sc = EVAS_SMART_CLASS_INIT_NULL;
 *
 * static void my_class_smart_add(Evas_Object *o)
 * 
 *    parent_sc.add(o);
 *    evas_object_color_set(evas_object_smart_clipped_clipper_get(o),
 *                          255, 0, 0, 255);
 * 
 *
 * Evas_Smart_Class *my_class_new(void)
 * 
 *    static Evas_Smart_Class sc = EVAS_SMART_CLASS_INIT_NAME_VERSION("MyClass");
 *    if (!parent_sc.name)
 *      
 *         evas_object_smart_clipped_smart_set(&sc);
 *         parent_sc = sc;
 *         sc.add = my_class_smart_add;
 *      
 *    return &sc;
 * 
 * @endcode
 *
 * Default behavior for each of #Evas_Smart_Class functions on a
 * clipped smart object are:
 * - @c add: creates a hidden clipper with "infinite" size, to clip
 *    any incoming members;
 * - @c del: delete all children objects;
 * - @c move: move all objects relative relatively;
 * - @c resize: <b>not defined</b>;
 * - @c show: if there are children objects, show clipper;
 * - @c hide: hides clipper;
 * - @c color_set: set the color of clipper;
 * - @c clip_set: set clipper of clipper;
 * - @c clip_unset: unset the clipper of clipper;
 *
 * @note There are other means of assigning parent smart classes to
 * child ones, like the #EVAS_SMART_SUBCLASS_NEW macro or the
 * evas_smart_class_inherit_full() function.
  }

procedure evas_object_smart_clipped_smart_set(sc:PEvas_Smart_Class);cdecl;external libevas;
{*
 * Get a pointer to the <b>clipped smart object's</b> class, to use
 * for proper inheritance
 *
 * @see #Evas_Smart_Object_Clipped for more information on this smart
 * class
  }
function evas_object_smart_clipped_class_get:PEvas_Smart_Class;cdecl;external libevas;
{*
 * @
  }
{*
 * @defgroup Evas_Object_Box_Group Box Smart Object
 *
 * A box is a convenience smart object that packs children inside it
 * in @b sequence, using a layouting function specified by the
 * user. There are a couple of pre-made layouting functions <b>built-in
 * in Evas</b>, all of them using children size hints to define their
 * size and alignment inside their cell space.
 *
 * Examples on this smart object's usage:
 * - @ref Example_Evas_Box
 * - @ref Example_Evas_Size_Hints
 *
 * @see @ref Evas_Object_Group_Size_Hints
 *
 * @ingroup Evas_Smart_Object_Group
 *
 * @
  }
{*
 * @typedef Evas_Object_Box_Api
 *
 * Smart class extension, providing extra box object requirements.
 *
 * @ingroup Evas_Object_Box_Group
  }
type
{*
 * @typedef Evas_Object_Box_Data
 *
 * Smart object instance data, providing box object requirements.
 *
 * @ingroup Evas_Object_Box_Group
  }
{*
 * @typedef Evas_Object_Box_Option
 *
 * The base structure for a box option. Box options are a way of
 * extending box items properties, which will be taken into account
 * for layouting decisions. The box layouting functions provided by
 * Evas will only rely on objects' canonical size hints to layout
 * them, so the basic box option has @b no (custom) property set.
 *
 * Users creating their own layouts, but not depending on extra child
 * items' properties, would be fine just using
 * evas_object_box_layout_set(). But if one desires a layout depending
 * on extra child properties, he/she has to @b subclass the box smart
 * object. Thus, by using evas_object_box_smart_class_get() and
 * evas_object_box_smart_set(), the @c option_new() and @c
 * option_free() smart class functions should be properly
 * redefined/extended.
 *
 * Object properties are bound to an integer identifier and must have
 * a name string. Their values are open to any data. See the API on
 * option properties for more details.
 *
 * @ingroup Evas_Object_Box_Group
  }
{*
 * @typedef Evas_Object_Box_Layout
 *
 * Function signature for an Evas box object layouting routine. By
 * @a o it will be passed the box object in question, by @a priv it will
 * be passed the box's internal data and, by @a user_data, it will be
 * passed any custom data one could have set to a given box layouting
 * function, with evas_object_box_layout_set().
 *
 * @ingroup Evas_Object_Box_Group
  }

  TEvas_Object_Box_Layout = procedure (o:PEvas_Object; priv:PEvas_Object_Box_Data; user_data:pointer);cdecl;
{*
 * @def EVAS_OBJECT_BOX_API_VERSION
 *
 * Current version for Evas box object smart class, a value that goes
 * to _Evas_Object_Box_Api::version.
 *
 * @ingroup Evas_Object_Box_Group
  }

const
  EVAS_OBJECT_BOX_API_VERSION = 1;  
{*
 * @struct _Evas_Object_Box_Api
 *
 * This structure should be used by any smart class inheriting from
 * the box's one, to provide custom box behavior that could not be
 * achieved only by providing a layout function, with
 * evas_object_box_layout_set().
 *
 * @extends Evas_Smart_Class
 * @ingroup Evas_Object_Box_Group
  }
{*< Base smart class struct, need for all smart objects  }
{*< Version of this smart class definition  }
{*< Smart function to append child elements in boxes  }
{*< Smart function to prepend child elements in boxes  }
{*< Smart function to insert a child element before another in boxes  }
{*< Smart function to insert a child element after another in boxes  }
{*< Smart function to insert a child element at a given position on boxes  }
{*< Smart function to remove a child element from boxes  }
{*< Smart function to remove a child element from boxes, by its position  }
{*< Smart function to set a custom property on a box child  }
{*< Smart function to retrieve a custom property from a box child  }
{*< Smart function to get the name of a custom property of box children  }
{*< Smart function to get the numerical ID of a custom property of box children  }
{*< Smart function to create a new box option struct  }
{*< Smart function to delete a box option struct  }
type
  PEvas_Object_Box_Api = ^TEvas_Object_Box_Api;
  TEvas_Object_Box_Api = record
      base : TEvas_Smart_Class;cdecl;
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

{*
 * @def EVAS_OBJECT_BOX_API_INIT
 *
 * Initializer for a whole #Evas_Object_Box_Api structure, with
 * @c NULL values on its specific fields.
 *
 * @param smart_class_init initializer to use for the "base" field
 * (#Evas_Smart_Class).
 *
 * @see EVAS_SMART_CLASS_INIT_NULL
 * @see EVAS_SMART_CLASS_INIT_VERSION
 * @see EVAS_SMART_CLASS_INIT_NAME_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT_NULL
 * @see EVAS_OBJECT_BOX_API_INIT_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT_NAME_VERSION
 * @ingroup Evas_Object_Box_Group
  }
{ xxxxxxxxxxxxx }
{#define EVAS_OBJECT_BOX_API_INIT(smart_class_init) smart_class_init, EVAS_OBJECT_BOX_API_VERSION, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL }
{*
 * @def EVAS_OBJECT_BOX_API_INIT_NULL
 *
 * Initialize to zero out a whole #Evas_Object_Box_Api structure.
 *
 * @see EVAS_OBJECT_BOX_API_INIT_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT_NAME_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT
 * @ingroup Evas_Object_Box_Group
  }

{ was #define dname def_expr }
function EVAS_OBJECT_BOX_API_INIT_NULL : longint; { return type might be wrong }

{*
 * @def EVAS_OBJECT_BOX_API_INIT_VERSION
 *
 * Initialize to zero out a whole #Evas_Object_Box_Api structure and
 * set a specific version on it.
 *
 * This is similar to #EVAS_OBJECT_BOX_API_INIT_NULL, but it will set
 * the version field of #Evas_Smart_Class (base field) to the latest
 * #EVAS_SMART_CLASS_VERSION.
 *
 * @see EVAS_OBJECT_BOX_API_INIT_NULL
 * @see EVAS_OBJECT_BOX_API_INIT_NAME_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT
 * @ingroup Evas_Object_Box_Group
  }
{ was #define dname def_expr }
function EVAS_OBJECT_BOX_API_INIT_VERSION : longint; { return type might be wrong }

{*
 * @def EVAS_OBJECT_BOX_API_INIT_NAME_VERSION
 *
 * Initialize to zero out a whole #Evas_Object_Box_Api structure and
 * set its name and version.
 *
 * This is similar to #EVAS_OBJECT_BOX_API_INIT_NULL, but it will also
 * set the version field of #Evas_Smart_Class (base field) to the
 * latest #EVAS_SMART_CLASS_VERSION and name it to the specific value.
 *
 * It will keep a reference to the name field as a <c>"const char *"</c>,
 * i.e., the name must be available while the structure is
 * used (hint: static or global variable!) and must not be modified.
 *
 * @see EVAS_OBJECT_BOX_API_INIT_NULL
 * @see EVAS_OBJECT_BOX_API_INIT_VERSION
 * @see EVAS_OBJECT_BOX_API_INIT
 * @ingroup Evas_Object_Box_Group
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVAS_OBJECT_BOX_API_INIT_NAME_VERSION(name : longint) : longint;

{*
 * @struct _Evas_Object_Box_Data
 *
 * This structure augments clipped smart object's instance data,
 * providing extra members required by generic box implementation. If
 * a subclass inherits from #Evas_Object_Box_Api, then it may augment
 * #Evas_Object_Box_Data to fit its own needs.
 *
 * @extends Evas_Object_Smart_Clipped_Data
 * @ingroup Evas_Object_Box_Group
  }
type
  PEvas_Object_Box_Data = ^TEvas_Object_Box_Data;
  TEvas_Object_Box_Data = record
      base : TEvas_Object_Smart_Clipped_Data;
      api : PEvas_Object_Box_Api;
      align : record
          h : Tdouble;
          v : Tdouble;
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
      flag0 : word;
    end;


const
  bm_TEvas_Object_Box_Data_layouting = $1;
  bp_TEvas_Object_Box_Data_layouting = 0;
  bm_TEvas_Object_Box_Data_children_changed = $2;
  bp_TEvas_Object_Box_Data_children_changed = 1;

function layouting(var a : TEvas_Object_Box_Data) : TEina_Bool;
procedure set_layouting(var a : TEvas_Object_Box_Data; __layouting : TEina_Bool);
function children_changed(var a : TEvas_Object_Box_Data) : TEina_Bool;
procedure set_children_changed(var a : TEvas_Object_Box_Data; __children_changed : TEina_Bool);
{*< Pointer to the box child object, itself  }
type
  PEvas_Object_Box_Option = ^TEvas_Object_Box_Option;
  TEvas_Object_Box_Option = record
      obj : PEvas_Object;
      flag0 : word;
      alloc_size : TEvas_Coord;
    end;


const
  bm_TEvas_Object_Box_Option_max_reached = $1;
  bp_TEvas_Object_Box_Option_max_reached = 0;
  bm_TEvas_Object_Box_Option_min_reached = $2;
  bp_TEvas_Object_Box_Option_min_reached = 1;

function max_reached(var a : TEvas_Object_Box_Option) : TEina_Bool;
procedure set_max_reached(var a : TEvas_Object_Box_Option; __max_reached : TEina_Bool);
function min_reached(var a : TEvas_Object_Box_Option) : TEina_Bool;
procedure set_min_reached(var a : TEvas_Object_Box_Option; __min_reached : TEina_Bool);
{*< #Evas_Object_Box_Option struct fields  }
{*
 * Set the default box @a api struct (Evas_Object_Box_Api)
 * with the default values. May be used to extend that API.
 *
 * @param api The box API struct to set back, most probably with
 * overridden fields (on class extensions scenarios)
  }

procedure evas_object_box_smart_set(api:PEvas_Object_Box_Api);cdecl;external libevas;
{*
 * Get the Evas box smart class, for inheritance purposes.
 *
 * @return the (canonical) Evas box smart class.
 *
 * The returned value is @b not to be modified, just use it as your
 * parent class.
  }
function evas_object_box_smart_class_get:PEvas_Object_Box_Api;cdecl;external libevas;
{*
 * @
  }
{*
 * @defgroup Evas_Object_Table_Group Table Smart Object.
 *
 * Convenience smart object that packs children using a tabular
 * layout using children size hints to define their size and
 * alignment inside their cell space.
 *
 * @ref tutorial_table shows how to use this Evas_Object.
 *
 * @see @ref Evas_Object_Group_Size_Hints
 *
 * @ingroup Evas_Smart_Object_Group
 *
  }
{*
 * @defgroup Evas_Object_Grid_Group Grid Smart Object.
 *
 * Convenience smart object that packs children under a regular grid
 * layout, using their virtual grid location and size to determine
 * children's positions inside the grid object's area.
 *
 * @ingroup Evas_Smart_Object_Group
 * @since 1.1
  }
{*
 * @defgroup Evas_Cserve Shared Image Cache Server
 * @ingroup Evas
 *
 * Evas has an (optional) module that provides client-server
 * infrastructure to <b>share bitmaps across multiple processes</b>,
 * saving data and processing power.
 *
 * Be warned that it @b doesn't work when <b>threaded image
 * preloading</b> is enabled for Evas, though.
  }
type
{*
 * Statistics about the server that shares cached bitmaps.
 * @ingroup Evas_Cserve
  }
{*< current amount of saved memory, in bytes  }
{*< current amount of wasted memory, in bytes  }
{*< peak amount of saved memory, in bytes  }
{*< peak amount of wasted memory, in bytes  }
{*< time, in seconds, saved in header loads by sharing cached loads instead  }
{*< time, in seconds, saved in data loads by sharing cached loads instead  }
  PEvas_Cserve_Stats = ^TEvas_Cserve_Stats;
  TEvas_Cserve_Stats = record
      saved_memory : longint;
      wasted_memory : longint;
      saved_memory_peak : longint;
      wasted_memory_peak : longint;
      saved_time_image_header_load : Tdouble;
      saved_time_image_data_load : Tdouble;
    end;

{*
 * A handle of a cache of images shared by a server.
 * @ingroup Evas_Cserve
  }
  PEvas_Cserve_Image_Cache = ^TEvas_Cserve_Image_Cache;
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

{*
 * A handle to an image shared by a server.
 * @ingroup Evas_Cserve
  }
  PEvas_Cserve_Image = ^TEvas_Cserve_Image;
  TEvas_Cserve_Image = record
      file : Pchar;
      key : Pchar;
      w : longint;
      h : longint;
      file_mod_time : Ttime_t;
      file_checked_time : Ttime_t;
      cached_time : Ttime_t;
      refcount : longint;
      data_refcount : longint;
      memory_footprint : longint;
      head_load_time : Tdouble;
      data_load_time : Tdouble;
      flag0 : word;
    end;


const
  bm_TEvas_Cserve_Image_alpha = $1;
  bp_TEvas_Cserve_Image_alpha = 0;
  bm_TEvas_Cserve_Image_data_loaded = $2;
  bp_TEvas_Cserve_Image_data_loaded = 1;
  bm_TEvas_Cserve_Image_active = $4;
  bp_TEvas_Cserve_Image_active = 2;
  bm_TEvas_Cserve_Image_dead = $8;
  bp_TEvas_Cserve_Image_dead = 3;
  bm_TEvas_Cserve_Image_useless = $10;
  bp_TEvas_Cserve_Image_useless = 4;

function alpha(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_alpha(var a : TEvas_Cserve_Image; __alpha : TEina_Bool);
function data_loaded(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_data_loaded(var a : TEvas_Cserve_Image; __data_loaded : TEina_Bool);
function active(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_active(var a : TEvas_Cserve_Image; __active : TEina_Bool);
function dead(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_dead(var a : TEvas_Cserve_Image; __dead : TEina_Bool);
function useless(var a : TEvas_Cserve_Image) : TEina_Bool;
procedure set_useless(var a : TEvas_Cserve_Image; __useless : TEina_Bool);
{*
 * Configuration that controls the server that shares cached bitmaps.
 * @ingroup Evas_Cserve
  }
type
  PEvas_Cserve_Config = ^TEvas_Cserve_Config;
  TEvas_Cserve_Config = record
      cache_max_usage : longint;
      cache_item_timeout : longint;
      cache_item_timeout_check : longint;
    end;

{*
 * Retrieves if the system wants to share bitmaps using the server.
 * @return @c EINA_TRUE if it wants, @c EINA_FALSE otherwise.
 * @ingroup Evas_Cserve
  }

function evas_cserve_want_get:TEina_Bool;cdecl;external libevas;
{*
 * Retrieves if the system is connected to the server used to share
 * bitmaps.
 *
 * @return @c EINA_TRUE if it's connected, @c EINA_FALSE otherwise.
 * @ingroup Evas_Cserve
  }
function evas_cserve_connected_get:TEina_Bool;cdecl;external libevas;
{*
 * Retrieves statistics from a running bitmap sharing server.
 * @param stats pointer to structure to fill with statistics about the
 *        bitmap cache server.
 *
 * @return @c EINA_TRUE if @p stats were filled with data,
 *         @c EINA_FALSE otherwise (when @p stats is untouched)
 * @ingroup Evas_Cserve
  }
function evas_cserve_stats_get(stats:PEvas_Cserve_Stats):TEina_Bool;cdecl;external libevas;
{*
 * Completely discard/clean a given images cache, thus re-setting it.
 *
 * @param cache A handle to the given images cache.
  }
procedure evas_cserve_image_cache_contents_clean(cache:PEvas_Cserve_Image_Cache);cdecl;external libevas;
{*
 * Retrieves the current configuration of the Evas image caching
 * server.
 *
 * @param config where to store current image caching server's
 * configuration.
 *
 * @return @c EINA_TRUE if @p config was filled with data,
 *         @c EINA_FALSE otherwise (when @p config is untouched)
 *
 * The fields of @p config will be altered to reflect the current
 * configuration's values.
 *
 * @see evas_cserve_config_set()
 *
 * @ingroup Evas_Cserve
  }
function evas_cserve_config_get(config:PEvas_Cserve_Config):TEina_Bool;cdecl;external libevas;
{*
 * Changes the configurations of the Evas image caching server.
 *
 * @param config A bitmap cache configuration handle with fields set
 * to desired configuration values.
 * @return @c EINA_TRUE if @p config was successfully applied,
 *         @c EINA_FALSE otherwise.
 *
 * @see evas_cserve_config_get()
 *
 * @ingroup Evas_Cserve
  }
function evas_cserve_config_set(config:PEvas_Cserve_Config):TEina_Bool;cdecl;external libevas;
{*
 * Force the system to disconnect from the bitmap caching server.
 *
 * @ingroup Evas_Cserve
  }
procedure evas_cserve_disconnect;cdecl;external libevas;
{*
 * @defgroup Evas_Utils General Utilities
 * @ingroup Evas
 *
 * Some functions that are handy but are not specific of canvas or
 * objects.
  }
{*
 * Converts the given Evas image load error code into a string
 * describing it in human-readable text.
 *
 * @param error the error code, a value in ::Evas_Load_Error.
 * @return Always returns a valid string. If the given @p error is not
 *         supported, <code>"Unknown error"</code> is returned.
 *
 * Mostly evas_object_image_file_set() would be the function setting
 * that error value afterwards, but also evas_object_image_load(),
 * evas_object_image_save(), evas_object_image_data_get(),
 * evas_object_image_data_convert(), evas_object_image_pixels_import()
 * and evas_object_image_is_inside(). This function is meant to be
 * used in conjunction with evas_object_image_load_error_get(), as in:
 *
 * Example code:
 * @dontinclude evas-images.c
 * @skip img1 =
 * @until ecore_main_loop_begin(
 *
 * Here, being @c valid_path the path to a valid image and @c
 * bogus_path a path to a file that does not exist, the two outputs
 * of evas_load_error_str() would be (if no other errors occur):
 * <code>"No error on load"</code> and <code>"File (or file path) does
 * not exist"</code>, respectively. See the full @ref
 * Example_Evas_Images "example".
 *
 * @ingroup Evas_Utils
  }
function evas_load_error_str(error:TEvas_Load_Error):Pchar;cdecl;external libevas;
{ Evas utility routines for color space conversions  }
{ hsv color space has h in the range 0.0 to 360.0, and s,v in the range 0.0 to 1.0  }
{ rgb color space has r,g,b in the range 0 to 255  }
{*
 * Convert a given color from HSV to RGB format.
 *
 * @param h The Hue component of the color.
 * @param s The Saturation component of the color.
 * @param v The Value component of the color.
 * @param r The Red component of the color.
 * @param g The Green component of the color.
 * @param b The Blue component of the color.
 *
 * This function converts a given color in HSV color format to RGB
 * color format.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_color_hsv_to_rgb(h:single; s:single; v:single; r:Plongint; g:Plongint; 
            b:Plongint);cdecl;external libevas;
{*
 * Convert a given color from RGB to HSV format.
 *
 * @param r The Red component of the color.
 * @param g The Green component of the color.
 * @param b The Blue component of the color.
 * @param h The Hue component of the color.
 * @param s The Saturation component of the color.
 * @param v The Value component of the color.
 *
 * This function converts a given color in RGB color format to HSV
 * color format.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_color_rgb_to_hsv(r:longint; g:longint; b:longint; h:Psingle; s:Psingle; 
            v:Psingle);cdecl;external libevas;
{ argb color space has a,r,g,b in the range 0 to 255  }
{*
 * Pre-multiplies a rgb triplet by an alpha factor.
 *
 * @param a The alpha factor.
 * @param r The Red component of the color.
 * @param g The Green component of the color.
 * @param b The Blue component of the color.
 *
 * This function pre-multiplies a given rgb triplet by an alpha
 * factor. Alpha factor is used to define transparency.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_color_argb_premul(a:longint; r:Plongint; g:Plongint; b:Plongint);cdecl;external libevas;
{*
 * Undo pre-multiplication of a rgb triplet by an alpha factor.
 *
 * @param a The alpha factor.
 * @param r The Red component of the color.
 * @param g The Green component of the color.
 * @param b The Blue component of the color.
 *
 * This function undoes pre-multiplication a given rbg triplet by an
 * alpha factor. Alpha factor is used to define transparency.
 *
 * @see evas_color_argb_premul().
 *
 * @ingroup Evas_Utils
 * }
procedure evas_color_argb_unpremul(a:longint; r:Plongint; g:Plongint; b:Plongint);cdecl;external libevas;
{*
 * Pre-multiplies data by an alpha factor.
 *
 * @param data The data value.
 * @param len  The length value.
 *
 * This function pre-multiplies a given data by an alpha
 * factor. Alpha factor is used to define transparency.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_data_argb_premul(data:Pdword; len:dword);cdecl;external libevas;
{*
 * Undo pre-multiplication data by an alpha factor.
 *
 * @param data The data value.
 * @param len  The length value.
 *
 * This function undoes pre-multiplication of a given data by an alpha
 * factor. Alpha factor is used to define transparency.
 *
 * @ingroup Evas_Utils
 * }
procedure evas_data_argb_unpremul(data:Pdword; len:dword);cdecl;external libevas;
{ string and font handling  }
{*
 * Gets the next character in the string
 *
 * Given the UTF-8 string in @p str, and starting byte position in @p pos,
 * this function will place in @p decoded the decoded code point at @p pos
 * and return the byte index for the next character in the string.
 *
 * The only boundary check done is that @p pos must be >= 0. Other than that,
 * no checks are performed, so passing an index value that's not within the
 * length of the string will result in undefined behavior.
 *
 * @param str The UTF-8 string
 * @param pos The byte index where to start
 * @param decoded Address where to store the decoded code point. Optional.
 *
 * @return The byte index of the next character
 *
 * @ingroup Evas_Utils
  }
function evas_string_char_next_get(str:Pchar; pos:longint; decoded:Plongint):longint;cdecl;external libevas;
{*
 * Gets the previous character in the string
 *
 * Given the UTF-8 string in @p str, and starting byte position in @p pos,
 * this function will place in @p decoded the decoded code point at @p pos
 * and return the byte index for the previous character in the string.
 *
 * The only boundary check done is that @p pos must be >= 1. Other than that,
 * no checks are performed, so passing an index value that's not within the
 * length of the string will result in undefined behavior.
 *
 * @param str The UTF-8 string
 * @param pos The byte index where to start
 * @param decoded Address where to store the decoded code point. Optional.
 *
 * @return The byte index of the previous character
 *
 * @ingroup Evas_Utils
  }
function evas_string_char_prev_get(str:Pchar; pos:longint; decoded:Plongint):longint;cdecl;external libevas;
{*
 * Get the length in characters of the string.
 *
 * @param  str The string to get the length of.
 * @return The length in characters (not bytes)
 *
 * @ingroup Evas_Utils
  }
function evas_string_char_len_get(str:Pchar):longint;cdecl;external libevas;
{*
 * Get language direction.
 *
 * @ingroup Evas_Utils
 * @since 1.20
  }
function evas_language_direction_get:TEvas_BiDi_Direction;cdecl;external libevas;
{*
 * Reinitialize language from the environment.
 *
 * The locale can change while a process is running. This call tells evas to
 * reload the locale from the environment like it does on start.
 *
 * @ingroup Evas_Utils
 * @since 1.18
  }
procedure evas_language_reinit;cdecl;external libevas;
{*
 * @defgroup Evas_Keys Key Input Functions
 *
 * Functions that feed key events to the canvas.
 *
 * As explained in @ref intro_not_evas, Evas is @b not aware of input
 * systems at all. Then, the user, if using it crudely (evas_new()),
 * will have to feed it with input events, so that it can react
 * somehow. If, however, the user creates a canvas by means of the
 * Ecore_Evas wrapper, it will automatically bind the chosen display
 * engine's input events to the canvas, for you.
 *
 * This group presents the functions dealing with the feeding of key
 * events to the canvas. On most of them, one has to reference a given
 * key by a name (<code>keyname</code> argument). Those are
 * <b>platform dependent</b> symbolic names for the keys. Sometimes
 * you'll get the right <code>keyname</code> by simply using an ASCII
 * value of the key name, but it won't be like that always.
 *
 * Typical platforms are Linux frame buffer (Ecore_FB) and X server
 * (Ecore_X) when using Evas with Ecore and Ecore_Evas. Please refer
 * to your display engine's documentation when using evas through an
 * Ecore helper wrapper when you need the <code>keyname</code>s.
 *
 * Example:
 * @dontinclude evas-events.c
 * @skip mods = evas_key_modifier_get(evas);
 * @until 
 *
 * All the other @c evas_key functions behave on the same manner. See
 * the full @ref Example_Evas_Events "example".
 *
 * @ingroup Evas_Canvas
  }
{*
 * @addtogroup Evas_Font_Group
 *
 * @
  }
{*
 * @defgroup Evas_Font_Path_Group Font Path Functions
 *
 * Functions that edit the paths being used to load fonts.
 *
 * @
  }
{*
 * Removes all font paths loaded into memory by evas_font_path_app_* APIs
 * for the application.
 * @since 1.9
  }
procedure evas_font_path_global_clear;cdecl;external libevas;
{*
 * Appends a font path to the list of font paths used by the application.
 * @param   path The new font path.
 * @since 1.9
  }
procedure evas_font_path_global_append(path:Pchar);cdecl;external libevas;
{*
 * Prepends a font path to the list of font paths used by the application.
 * @param   path The new font path.
 * @since 1.9
  }
procedure evas_font_path_global_prepend(path:Pchar);cdecl;external libevas;
{*
 * Retrieves the list of font paths used by the application.
 * @return  The list of font paths used.
 * @since 1.9
  }
function evas_font_path_global_list:PEina_List;cdecl;external libevas;
{*
 * @
  }
{*
 * Reinitialize FontConfig. If FontConfig has to be reinitialized
 * according to changes of system environments (e.g. Changing font config files), it will be useful.
 *
 * @since 1.14
  }
procedure evas_font_reinit;cdecl;external libevas;
{*
 * @
  }
{*
 * Set the limit in bytes for memory allocated by font glyphs in evas.
 * @param[in] options for caching.
 * @param[in] bytes cache size in bytes, pass negative value to ignore the limit.
 *
 * @since 1.24
  }
procedure evas_font_data_cache_set(options:TEvas_Font_Data_Cache; byte:longint);cdecl;external libevas;
{*
 * @
  }
{*
 * Get the limit in bytes for memory allocated by font glyphs in evas.
 * @param[in] options for caching.
 * @return Returns font allocated memory cache limit, if value is negative this means no limit.
 * @since 1.24
  }
function evas_font_data_cache_get(options:TEvas_Font_Data_Cache):longint;cdecl;external libevas;
{*
 * @
  }
{ The below type are necessary for legacy API and need to be manually kept in sync with .eo file. }
{$ifndef _EFL_INPUT_DEVICE_EO_CLASS_TYPE}
{$define _EFL_INPUT_DEVICE_EO_CLASS_TYPE}
type
  PEfl_Input_Device = ^TEfl_Input_Device;
  TEfl_Input_Device = TEo;
{$endif}
{$ifndef _EFL_INPUT_DEVICE_EO_TYPES}
{$define _EFL_INPUT_DEVICE_EO_TYPES}
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
;
{$endif}
{$ifndef _EFL_GFX_ENTITY_EO_H_}
{$define _EFL_GFX_ENTITY_EO_H_}
{$ifndef _EFL_GFX_ENTITY_EO_CLASS_TYPE}
{$define _EFL_GFX_ENTITY_EO_CLASS_TYPE}
type
  PEfl_Gfx_Entity = ^TEfl_Gfx_Entity;
  TEfl_Gfx_Entity = TEo;
{$endif}
{$endif}

// === Konventiert am: 10-5-25 19:42:43 ===


implementation


function bold(var a : TEvas_Textgrid_Cell) : word;
begin
  bold:=(a.flag0 and bm_TEvas_Textgrid_Cell_bold) shr bp_TEvas_Textgrid_Cell_bold;
end;

procedure set_bold(var a : TEvas_Textgrid_Cell; __bold : word);
begin
  a.flag0:=a.flag0 or ((__bold shl bp_TEvas_Textgrid_Cell_bold) and bm_TEvas_Textgrid_Cell_bold);
end;

function italic(var a : TEvas_Textgrid_Cell) : word;
begin
  italic:=(a.flag0 and bm_TEvas_Textgrid_Cell_italic) shr bp_TEvas_Textgrid_Cell_italic;
end;

procedure set_italic(var a : TEvas_Textgrid_Cell; __italic : word);
begin
  a.flag0:=a.flag0 or ((__italic shl bp_TEvas_Textgrid_Cell_italic) and bm_TEvas_Textgrid_Cell_italic);
end;

function underline(var a : TEvas_Textgrid_Cell) : word;
begin
  underline:=(a.flag0 and bm_TEvas_Textgrid_Cell_underline) shr bp_TEvas_Textgrid_Cell_underline;
end;

procedure set_underline(var a : TEvas_Textgrid_Cell; __underline : word);
begin
  a.flag0:=a.flag0 or ((__underline shl bp_TEvas_Textgrid_Cell_underline) and bm_TEvas_Textgrid_Cell_underline);
end;

function strikethrough(var a : TEvas_Textgrid_Cell) : word;
begin
  strikethrough:=(a.flag0 and bm_TEvas_Textgrid_Cell_strikethrough) shr bp_TEvas_Textgrid_Cell_strikethrough;
end;

procedure set_strikethrough(var a : TEvas_Textgrid_Cell; __strikethrough : word);
begin
  a.flag0:=a.flag0 or ((__strikethrough shl bp_TEvas_Textgrid_Cell_strikethrough) and bm_TEvas_Textgrid_Cell_strikethrough);
end;

function fg_extended(var a : TEvas_Textgrid_Cell) : word;
begin
  fg_extended:=(a.flag0 and bm_TEvas_Textgrid_Cell_fg_extended) shr bp_TEvas_Textgrid_Cell_fg_extended;
end;

procedure set_fg_extended(var a : TEvas_Textgrid_Cell; __fg_extended : word);
begin
  a.flag0:=a.flag0 or ((__fg_extended shl bp_TEvas_Textgrid_Cell_fg_extended) and bm_TEvas_Textgrid_Cell_fg_extended);
end;

function bg_extended(var a : TEvas_Textgrid_Cell) : word;
begin
  bg_extended:=(a.flag0 and bm_TEvas_Textgrid_Cell_bg_extended) shr bp_TEvas_Textgrid_Cell_bg_extended;
end;

procedure set_bg_extended(var a : TEvas_Textgrid_Cell; __bg_extended : word);
begin
  a.flag0:=a.flag0 or ((__bg_extended shl bp_TEvas_Textgrid_Cell_bg_extended) and bm_TEvas_Textgrid_Cell_bg_extended);
end;

function double_width(var a : TEvas_Textgrid_Cell) : word;
begin
  double_width:=(a.flag0 and bm_TEvas_Textgrid_Cell_double_width) shr bp_TEvas_Textgrid_Cell_double_width;
end;

procedure set_double_width(var a : TEvas_Textgrid_Cell; __double_width : word);
begin
  a.flag0:=a.flag0 or ((__double_width shl bp_TEvas_Textgrid_Cell_double_width) and bm_TEvas_Textgrid_Cell_double_width);
end;

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
