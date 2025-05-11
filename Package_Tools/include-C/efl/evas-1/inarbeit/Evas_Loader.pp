
unit Evas_Loader;
interface

{
  Automatically converted by H2Pas 1.0.0 from Evas_Loader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Evas_Loader.h
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
Pchar  = ^char;
PEina_File  = ^Eina_File;
PEina_Stringshare  = ^Eina_Stringshare;
PEvas_Colorspace  = ^Evas_Colorspace;
PEvas_Image_Animated  = ^Evas_Image_Animated;
PEvas_Image_Animated_Loop_Hint  = ^Evas_Image_Animated_Loop_Hint;
PEvas_Image_Load_Func  = ^Evas_Image_Load_Func;
PEvas_Image_Load_Opts  = ^Evas_Image_Load_Opts;
PEvas_Image_Property  = ^Evas_Image_Property;
PEvas_Image_Scale_Hint  = ^Evas_Image_Scale_Hint;
PEvas_Load_Error  = ^Evas_Load_Error;
PEvas_Module  = ^Evas_Module;
PEvas_Module_Api  = ^Evas_Module_Api;
PEvas_Module_Type  = ^Evas_Module_Type;
Plongint  = ^longint;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EVAS - EFL Scene Graph
 * Copyright (C) 2013 Enlightenment Developers:
 *           Cedric Bail <cedric.bail@free.fr>
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *    1. Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *    2. Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{*
 * What does it means for you ?
 *    Evas Loader is dynamically linked to Evas at run time. You can use anything
 * you want here as long as the license of the module you add to your system matches
 * the application you are using it in. Be aware that if you make a module that uses
 * a GPL library, it may turn the license of your binary to GPL. Evas doesn't ship
 * with any GPL modules.
  }
{$ifndef _EVAS_LOADER_H}
{$define _EVAS_LOADER_H}
{$include "Eina.h"}
{$include "Emile.h"}
{$include <.h>}
{ C++ extern C conditionnal removed }
{ the module api version  }

const
  EVAS_MODULE_API_VERSION = 3;  
{ the module types  }
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
;
type
{ the module api structure, all modules should define this struct  }
(* Const before type ignored *)
(* Const before type ignored *)
  PEvas_Module_Api = ^TEvas_Module_Api;
  TEvas_Module_Api = record
      version : longint;
      name : Pchar;
      author : Pchar;
      func : record
          open : function (para1:PEvas_Module):longint;cdecl;
          close : procedure (para1:PEvas_Module);cdecl;
        end;
    end;

{ the module structure  }
(* Const before type ignored *)
{ these are the functions exported by the module  }
{ some internal data for the module i.e the id for engines  }
{ how many refs  }
{ the cycle count when it was last used  }
  PEvas_Module = ^TEvas_Module;
  TEvas_Module = record
      definition : PEvas_Module_Api;
      functions : pointer;
      id_engine : longint;
      ref : longint;
      last_used : longint;
      lock : TEina_Lock;
      flag0 : word;
    end;


const
  bm_TEvas_Module_loaded = $1;
  bp_TEvas_Module_loaded = 0;

function loaded(var a : TEvas_Module) : byte;
procedure set_loaded(var a : TEvas_Module; __loaded : byte);
{*
 * @addtogroup Evas_Image
 * @
  }
type
{ skip open of file and header load and }
{ defer this until a preload is done }
{ to allow for real async/threaded load }
  PEvas_Image_Load_Opts = ^TEvas_Image_Load_Opts;
  TEvas_Image_Load_Opts = record
      emile : TEmile_Image_Load_Opts;
      skip_head : TEina_Bool;
    end;


  PEvas_Image_Animated = ^TEvas_Image_Animated;
  TEvas_Image_Animated = TEmile_Image_Animated;
{ Stretch region are directly encoded the way Evas excpect them internally }
{ 8bits is used for each step. The lower bits indicate how long the stretch region }
{ span. Masking with 0x80 will be true if the region is stretchable. If false, it }
{ will be fixed size. }
{ Where inside the image are we supposed to overlay data }
{ need_data is set to True when to get accurate property, data need to be loaded }
  PEvas_Image_Property = ^TEvas_Image_Property;
  TEvas_Image_Property = record
      info : TEmile_Image_Property;
      stretch : record
          horizontal : record
              region : Puint8_t;
            end;
          vertical : record
              region : Puint8_t;
            end;
        end;
      content : TEina_Rectangle;
      need_data : TEina_Bool;
    end;

{*
 * @brief Possible outcomes of a load operation
  }
{*< No error on load  }
{*< A non-specific error occurred  }
{*< File (or file path) does not exist  }
{*< Permission denied to an existing file (or path)  }
{*< Allocation of resources failure prevented load  }
{*< File corrupt (but was detected as a known format)  }
{*< File is not a known format  }
{*< File loading has been cancelled  }

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
;
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
{*< How an image's data is to be treated by Evas, with regard to scaling cache  }

const
  EVAS_IMAGE_SCALE_HINT_NONE = EMILE_IMAGE_SCALE_HINT_NONE;  
  EVAS_IMAGE_SCALE_HINT_DYNAMIC = EMILE_IMAGE_SCALE_HINT_DYNAMIC;  
  EVAS_IMAGE_SCALE_HINT_STATIC = EMILE_IMAGE_SCALE_HINT_STATIC;  
{*
 * Colorspaces for pixel data supported by Evas
 * @ingroup Evas_Object_Image
  }
type
  PEvas_Colorspace = ^TEvas_Colorspace;
  TEvas_Colorspace = TEmile_Colorspace;
{*< Colorspaces for pixel data supported by Evas  }

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
{ ETC1/2 support }
  EVAS_COLORSPACE_ETC1 = EMILE_COLORSPACE_ETC1;  
  EVAS_COLORSPACE_RGB8_ETC2 = EMILE_COLORSPACE_RGB8_ETC2;  
  EVAS_COLORSPACE_RGBA8_ETC2_EAC = EMILE_COLORSPACE_RGBA8_ETC2_EAC;  
  EVAS_COLORSPACE_ETC1_ALPHA = EMILE_COLORSPACE_ETC1_ALPHA;  
{ S3TC support }
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
      frame_duration : function (loader_data:pointer; start:longint; frame_num:longint):Tdouble;cdecl;
      threadable : TEina_Bool;
      do_region : TEina_Bool;
    end;

(* Const before type ignored *)

function evas_module_register(module:PEvas_Module_Api; _type:TEvas_Module_Type):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function evas_module_unregister(module:PEvas_Module_Api; _type:TEvas_Module_Type):TEina_Bool;cdecl;external;
function evas_module_task_cancelled:TEina_Bool;cdecl;external;
{*< @since 1.19  }
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

function loaded(var a : TEvas_Module) : byte;
begin
  loaded:=(a.flag0 and bm_TEvas_Module_loaded) shr bp_TEvas_Module_loaded;
end;

procedure set_loaded(var a : TEvas_Module; __loaded : byte);
begin
  a.flag0:=a.flag0 or ((__loaded shl bp_TEvas_Module_loaded) and bm_TEvas_Module_loaded);
end;


end.
