unit Evas_Loader;

interface

uses
  ctypes, elf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  EVAS_MODULE_API_VERSION = 3;  
type
  PEvas_Module_Type = ^TEvas_Module_Type;
  TEvas_Module_Type =  Longint;
  Const
    EVAS_MODULE_TYPE_ENGINE = 0;
    EVAS_MODULE_TYPE_IMAGE_LOADER = 1;
    EVAS_MODULE_TYPE_IMAGE_SAVER = 2;
    EVAS_MODULE_TYPE_OBJECT = 3;
    EVAS_MODULE_TYPE_VG_LOADER = 4;
    EVAS_MODULE_TYPE_VG_SAVER = 5;

type
  PEvas_Module = ^TEvas_Module;
  TEvas_Module_Api = record
      version : longint;
      name : Pchar;
      author : Pchar;
      func : record
          open : function (para1:PEvas_Module):longint;cdecl;
          close : procedure (para1:PEvas_Module);cdecl;
        end;
    end;
  PEvas_Module_Api = ^TEvas_Module_Api;

  TEvas_Module =bitpacked record
      definition : PEvas_Module_Api;
      functions : pointer;
      id_engine : longint;
      ref : longint;
      last_used : longint;
      lock : TEina_Lock;
      loaded : 0..1;
    end;

type
  TEvas_Image_Load_Opts = record
      emile : TEmile_Image_Load_Opts;
      skip_head : TEina_Bool;
    end;
  PEvas_Image_Load_Opts = ^TEvas_Image_Load_Opts;


  PEvas_Image_Animated = ^TEvas_Image_Animated;
  TEvas_Image_Animated = TEmile_Image_Animated;

  TEvas_Image_Property = record
      info : TEmile_Image_Property;
      stretch : record
          horizontal : record
              region : Puint8;
            end;
          vertical : record
              region : Puint8;
            end;
        end;
      content : TEina_Rectangle;
      need_data : TEina_Bool;
    end;
  PEvas_Image_Property = ^TEvas_Image_Property;

  PEvas_Load_Error = ^TEvas_Load_Error;
  TEvas_Load_Error =  Longint;
  Const
    EVAS_LOAD_ERROR_NONE = 0;
    EVAS_LOAD_ERROR_GENERIC = 1;
    EVAS_LOAD_ERROR_DOES_NOT_EXIST = 2;
    EVAS_LOAD_ERROR_PERMISSION_DENIED = 3;
    EVAS_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED = 4;
    EVAS_LOAD_ERROR_CORRUPT_FILE = 5;
    EVAS_LOAD_ERROR_UNKNOWN_FORMAT = 6;
    EVAS_LOAD_ERROR_CANCELLED = 7;

type
  PEvas_Image_Animated_Loop_Hint = ^TEvas_Image_Animated_Loop_Hint;
  TEvas_Image_Animated_Loop_Hint = TEmile_Image_Animated_Loop_Hint;

const
  EVAS_IMAGE_ANIMATED_HINT_NONE = EMILE_IMAGE_ANIMATED_HINT_NONE;  
  EVAS_IMAGE_ANIMATED_HINT_LOOP = EMILE_IMAGE_ANIMATED_HINT_LOOP;  
  EVAS_IMAGE_ANIMATED_HINT_PINGPONG = EMILE_IMAGE_ANIMATED_HINT_PINGPONG;  
type
  PEvas_Image_Scale_Hint = ^TEvas_Image_Scale_Hint;
  TEvas_Image_Scale_Hint = TEmile_Image_Scale_Hint;

const
  EVAS_IMAGE_SCALE_HINT_NONE = EMILE_IMAGE_SCALE_HINT_NONE;  
  EVAS_IMAGE_SCALE_HINT_DYNAMIC = EMILE_IMAGE_SCALE_HINT_DYNAMIC;  
  EVAS_IMAGE_SCALE_HINT_STATIC = EMILE_IMAGE_SCALE_HINT_STATIC;  
type
  PEvas_Colorspace = ^TEvas_Colorspace;
  TEvas_Colorspace = TEmile_Colorspace;

const
  EVAS_COLORSPACE_ARGB8888 = EMILE_COLORSPACE_ARGB8888;  
  EVAS_COLORSPACE_YCBCR422P601_PL = EMILE_COLORSPACE_YCBCR422P601_PL;  
  EVAS_COLORSPACE_YCBCR422P709_PL = EMILE_COLORSPACE_YCBCR422P709_PL;  
  EVAS_COLORSPACE_RGB565_A5P = EMILE_COLORSPACE_RGB565_A5P;  
  EVAS_COLORSPACE_GRY8 = EMILE_COLORSPACE_GRY8;  
  EVAS_COLORSPACE_YCBCR422601_PL = EMILE_COLORSPACE_YCBCR422601_PL;  
  EVAS_COLORSPACE_YCBCR420NV12601_PL = EMILE_COLORSPACE_YCBCR420NV12601_PL;  
  EVAS_COLORSPACE_YCBCR420TM12601_PL = EMILE_COLORSPACE_YCBCR420TM12601_PL;  
  EVAS_COLORSPACE_AGRY88 = EMILE_COLORSPACE_AGRY88;  
  EVAS_COLORSPACE_ETC1 = EMILE_COLORSPACE_ETC1;
  EVAS_COLORSPACE_RGB8_ETC2 = EMILE_COLORSPACE_RGB8_ETC2;  
  EVAS_COLORSPACE_RGBA8_ETC2_EAC = EMILE_COLORSPACE_RGBA8_ETC2_EAC;  
  EVAS_COLORSPACE_ETC1_ALPHA = EMILE_COLORSPACE_ETC1_ALPHA;  
  EVAS_COLORSPACE_RGB_S3TC_DXT1 = EMILE_COLORSPACE_RGB_S3TC_DXT1;
  EVAS_COLORSPACE_RGBA_S3TC_DXT1 = EMILE_COLORSPACE_RGBA_S3TC_DXT1;  
  EVAS_COLORSPACE_RGBA_S3TC_DXT2 = EMILE_COLORSPACE_RGBA_S3TC_DXT2;  
  EVAS_COLORSPACE_RGBA_S3TC_DXT3 = EMILE_COLORSPACE_RGBA_S3TC_DXT3;  
  EVAS_COLORSPACE_RGBA_S3TC_DXT4 = EMILE_COLORSPACE_RGBA_S3TC_DXT4;  
  EVAS_COLORSPACE_RGBA_S3TC_DXT5 = EMILE_COLORSPACE_RGBA_S3TC_DXT5;  
  EVAS_IMAGE_LOAD_VERSION = 2;  
type
  PEvas_Image_Load_Func = ^TEvas_Image_Load_Func;
  TEvas_Image_Load_Func = record
      version : longint;
      file_open : function (f:PEina_File; key:PEina_Stringshare; opts:PEvas_Image_Load_Opts; animated:PEvas_Image_Animated; error:Plongint):pointer;cdecl;
      file_close : procedure (loader_data:pointer);cdecl;
      file_head : function (loader_data:pointer; prop:PEvas_Image_Property; error:Plongint):TEina_Bool;cdecl;
      file_head_with_data : function (loader_data:pointer; prop:PEvas_Image_Property; pixels:pointer; error:Plongint):TEina_Bool;cdecl;
      file_data : function (loader_data:pointer; prop:PEvas_Image_Property; pixels:pointer; error:Plongint):TEina_Bool;cdecl;
      frame_duration : function (loader_data:pointer; start:longint; frame_num:longint):double;cdecl;
      threadable : TEina_Bool;
      do_region : TEina_Bool;
    end;


function evas_module_register(module:PEvas_Module_Api; _type:TEvas_Module_Type):TEina_Bool;cdecl;external libevas;
function evas_module_unregister(module:PEvas_Module_Api; _type:TEvas_Module_Type):TEina_Bool;cdecl;external libevas;
function evas_module_task_cancelled:TEina_Bool;cdecl;external libevas;

// === Konventiert am: 11-5-25 13:41:46 ===


implementation


end.
