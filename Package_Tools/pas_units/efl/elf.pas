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


  // /usr/include/eina-1/eina/eina_types.h
type
  TEina_Bool = Boolean8;

const
  EINA_FALSE = TEina_Bool(0);
  EINA_TRUE = TEina_Bool(1);


  // /usr/include/evas-1/Evas_Common.h
type
  TEvas_Callback_Type = longint;

  TEvas_Object = record
  end;
  PEvas_Object = ^TEvas_Object;

  PEvas = Pointer;
  PEo = Pointer;

const
  EVAS_LAYER_MIN = -32768;
  EVAS_LAYER_MAX = 32767;

type
  TEvas_Object_Box_Layout = Pointer; // CallProc;
  TEcore_Cb = Pointer; // CallProc;


  // /usr/include/ecore-evas-1/Ecore_Evas_Types.h
type
  PEcore_Evas = Pointer;
  PEcore_Wl2_Window = Pointer;
  PEcore_Win32_Window = Pointer;
  TEcore_X_Window = uint32;
  PEcore_Cocoa_Window = Pointer;
  TEcore_Window = PtrUInt;


  // /usr/include/evas-1/Evas_Legacy.h
  TEvas_Modifier_Mask = uint64;

  // /usr/include/eina-1/Efl_Config.h
const
  EFL_VERSION_MAJOR = 1;
  EFL_VERSION_MINOR = 27;
  EFL_VERSION_MICRO = 0;
  EFL_BUILD_ID = 'none';

  // /usr/include/eo-1/Eo.h
type
  TEo = record
  end;
  // /usr/include/eina-1/eina/eina_list.h
  PEina_List = Pointer;

  // /usr/include/efl-1/interfaces/efl_text_types.eot.h
  TEfl_Text_Bidirectional_Type=LongInt;

  // /usr/include/efl-1/interfaces/efl_text_types.eot.h
const
  EFL_TEXT_BIDIRECTIONAL_TYPE_NATURAL = 0;  // Natural/Neutral, identisch
  EFL_TEXT_BIDIRECTIONAL_TYPE_NEUTRAL = 0;  // Alias für NATURAL
  EFL_TEXT_BIDIRECTIONAL_TYPE_LTR     = 1;  // Left to right
  EFL_TEXT_BIDIRECTIONAL_TYPE_RTL     = 2;  // Right to left
  EFL_TEXT_BIDIRECTIONAL_TYPE_INHERIT = 3;   // Inherit

// /usr/include/eina-1/eina/eina_unicode.h
  type
    TEina_Unicode=WideChar;




implementation

end.
