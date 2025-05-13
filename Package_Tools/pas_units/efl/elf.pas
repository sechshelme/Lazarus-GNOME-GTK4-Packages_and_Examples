unit elf;

interface

const
  {$IFDEF Linux}
  libelementary = 'libelementary';
  libevas = 'libevas';
  {$ENDIF}

  {$IFDEF mswindows}
  libelementary = 'libelementary.dll'; // ???
  libevas = 'libevas.dll';
  {$ENDIF}


  //  {$define EFL_BETA_API_SUPPORT}

  // === System

type
  Tva_list = Pointer;
  Ttime_t = uint64;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tptrdiff_t = PtrInt;

  // =====================

  // /usr/include/eina-1/eina/eina_unicode.h
type
  TEina_Unicode = widechar;

  // /usr/include/eina-1/eina/eina_rectangle.h
type
  TEina_Rectangle = record
    x, y, w, h: integer;
  end;

  TEina_Size2D = record
    w, h: longint;
  end;

  TEina_Position2D = record
    x, y: integer;
  end;

  TEina_Vector2 = record
    x, y: double;
  end;

  TEina_Vector3 = record
    x, y, z: double;
  end;

  // /usr/include/eina-1/eina/eina_file.h
type
  PEina_File = Pointer;
  PPEina_File = ^PEina_File;

  // /usr/include/eina-1/eina/eina_stringshare.h
type
  TEina_Stringshare = char;
  PEina_Stringshare = ^TEina_Stringshare;

  // /usr/include/eina-1/eina/eina_rectangle.h
type
  TEina_Rect = record // Muss aufgelöst werden
  end;
  PEina_Rect = ^TEina_Rect;

  // /usr/include/eina-1/eina/eina_matrix.h
type
  TEina_Matrix3 = record
    xx: double;
    xy: double;
    xz: double;
    yx: double;
    yy: double;
    yz: double;
    zx: double;
    zy: double;
    zz: double;
  end;
  PEina_Matrix3 = ^TEina_Matrix3;

  // /usr/include/eina-1/eina/eina_iterator.h
type
  PEina_Iterator = Pointer;   // Muss aufgelöst werden

  // /usr/include/eina-1/eina/eina_list.h
type
  PEina_List = Pointer;

  // /usr/include/eina-1/Efl_Config.h
const
  EFL_VERSION_MAJOR = 1;
  EFL_VERSION_MINOR = 27;
  EFL_VERSION_MICRO = 0;
  EFL_BUILD_ID = 'none';

  // /usr/include/eina-1/eina/eina_promise.h
type
  PEina_Future = Pointer;

  // /usr/include/eina-1/eina/eina_types.h
type
  TEina_Free_Cb = Pointer; // callproc

  TEina_Bool = Boolean8;
  PEina_Bool = ^TEina_Bool;

const
  EINA_FALSE = TEina_Bool(0);
  EINA_TRUE = TEina_Bool(1);

  // /usr/include/eina-1/eina/eina_accessor.h
type
  TEina_Accessor = record
    // Muss aufgelöst werden
  end;
  PEina_Accessor = ^TEina_Accessor;


  // /usr/include/ecore-1/Ecore_Common.h
type
  TEcore_Cb = Pointer; // CallProc;

  // /usr/include/ecore-evas-1/Ecore_Evas_Types.h
type
  PEcore_Evas = Pointer;
  PEcore_Wl2_Window = Pointer;
  PEcore_Win32_Window = Pointer;
  TEcore_X_Window = uint32;
  PEcore_Cocoa_Window = Pointer;
  TEcore_Window = PtrUInt;

  // /usr/include/eo-1/Eo.h
type
  TEo = record
  end;
  PEo = ^TEo;

  TEfl_Class = TEo;
  PEfl_Class = ^TEfl_Class;

  TEfl_Object = TEo;
  PEfl_Object = ^TEfl_Object;

type
  TEfl_Callback_Priority = int16;

  // /usr/include/eo-1/efl_object.eo.h
type
  TEfl_Event_Description = record
    // Muss aufgelöst werden
  end;
  PEfl_Event_Description = ^TEfl_Event_Description;


  // /usr/include/efl-1/interfaces/efl_text_types.eot.h
type
  TEfl_Text_Bidirectional_Type = longint;

const
  EFL_TEXT_BIDIRECTIONAL_TYPE_NATURAL = 0;  // Natural/Neutral, identisch
  EFL_TEXT_BIDIRECTIONAL_TYPE_NEUTRAL = 0;  // Alias für NATURAL
  EFL_TEXT_BIDIRECTIONAL_TYPE_LTR = 1;  // Left to right
  EFL_TEXT_BIDIRECTIONAL_TYPE_RTL = 2;  // Right to left
  EFL_TEXT_BIDIRECTIONAL_TYPE_INHERIT = 3;   // Inherit

  // /usr/include/efl-1/interfaces/efl_gfx_types.eot.h
type
  TEfl_Gfx_Vg_Composite_Method = longint; // enum
  TEfl_Gfx_Render_Op = longint; // enum

  // /usr/include/efl-1/interfaces/efl_gfx_entity.eo.h
type
  PEfl_Gfx_Entity = Pointer;

  // /usr/include/emile-1/emile_image.h
type
  TEmile_Image_Animated_Loop_Hint = longint; // enum

const  // enum
  EMILE_IMAGE_ANIMATED_HINT_NONE = 0;
  EMILE_IMAGE_ANIMATED_HINT_LOOP = 1;
  EMILE_IMAGE_ANIMATED_HINT_PINGPONG = 2;

type
  TEmile_Image_Scale_Hint = longint; // enum

const                               // enum
  EMILE_IMAGE_SCALE_HINT_NONE = 0;
  EMILE_IMAGE_SCALE_HINT_DYNAMIC = 1;
  EMILE_IMAGE_SCALE_HINT_STATIC = 2;

type
  PEmile_Colorspace = ^TEmile_Colorspace;
  TEmile_Colorspace = longint;

const
  EMILE_COLORSPACE_ARGB8888 = 0;
  EMILE_COLORSPACE_YCBCR422P601_PL = 1;
  EMILE_COLORSPACE_YCBCR422P709_PL = 2;
  EMILE_COLORSPACE_RGB565_A5P = 3;
  EMILE_COLORSPACE_GRY8 = 4;
  EMILE_COLORSPACE_YCBCR422601_PL = 5;
  EMILE_COLORSPACE_YCBCR420NV12601_PL = 6;
  EMILE_COLORSPACE_YCBCR420TM12601_PL = 7;
  EMILE_COLORSPACE_AGRY88 = 8;
  EMILE_COLORSPACE_ETC1 = 9;
  EMILE_COLORSPACE_RGB8_ETC2 = 10;
  EMILE_COLORSPACE_RGBA8_ETC2_EAC = 11;
  EMILE_COLORSPACE_ETC1_ALPHA = 12;
  EMILE_COLORSPACE_RGB_S3TC_DXT1 = 13;
  EMILE_COLORSPACE_RGBA_S3TC_DXT1 = 14;
  EMILE_COLORSPACE_RGBA_S3TC_DXT2 = 15;
  EMILE_COLORSPACE_RGBA_S3TC_DXT3 = 16;
  EMILE_COLORSPACE_RGBA_S3TC_DXT4 = 17;
  EMILE_COLORSPACE_RGBA_S3TC_DXT5 = 18;


type
  TEmile_Image_Load_Opts = record
    // Muss aufgelöst werden
  end;

  TEmile_Image_Animated = record
    // Muss aufgelöst werden
  end;

  TEmile_Image_Property = record
    // Muss aufgelöst werden
  end;

  // /usr/include/edje-1/Edje_Common.h
type
  TEdje_Signal_Cb = Pointer; // callproc

  TEdje_Entry_Change_Info = record
    // Muss aufgelöst werden
  end;
  PEdje_Entry_Change_Info = ^TEdje_Entry_Change_Info;


  // Unauffindbar
  TEina_Lock = Pointer;


implementation

{$IF defined(CPUX86) or defined(CPUX64)}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
//{$ENDIF}
{$ENDIF}

begin
  //  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  //{$IFDEF Linux}
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
