unit efl;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF Linux}
  libelementary = 'libelementary';
  libevas = 'libevas';
  libeina = 'libeina';
  libeo = 'libeo';
  {$ENDIF}

  {$IFDEF mswindows}
  libelementary = 'libelementary-1.dll';
  libevas = 'libevas-1.dll';
  libeina = 'libeina-1.dll';
  libeo = 'libeo-1,dd';
  {$ENDIF}

  //  {$define EFL_BETA_API_SUPPORT}

  // === System

type
  Tva_list = Pointer;
  Ttime_t = uint64;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tssize_t = SizeInt;
  Pssize_t = ^Tssize_t;

  Tptrdiff_t = PtrInt;

  Tuintptr_t = PtrUInt;

  Twchar_t = widechar;

  PFILE = Pointer;

type
  Ttm = record
    tm_sec: longint;
    tm_min: longint;
    tm_hour: longint;
    tm_mday: longint;
    tm_mon: longint;
    tm_year: longint;
    tm_wday: longint;
    tm_yday: longint;
    tm_isdst: longint;
    tm_gmtoff: int64;
    tm_zone: pchar;
  end;
  Ptm = ^Ttm;

  // =====================

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


  // /usr/include/efl-1/Efl.h
type
  PEfl_Text_Cursor_Handle = Pointer;

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

type
  // /usr/include/efl-1/interfaces/efl_interpolator.eo.h
  PEfl_Interpolator = Pointer;


type
  // /usr/include/eina-1/eina/eina_inline_lock_posix.x
  TEina_Lock = Pointer;
  PEina_Lock = ^TEina_Lock;

  // /usr/include/eina-1/eina/eina_inline_lock_posix.x
  TEina_Spinlock = TEina_Lock;
  PEina_Spinlock = ^TEina_Spinlock;


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
