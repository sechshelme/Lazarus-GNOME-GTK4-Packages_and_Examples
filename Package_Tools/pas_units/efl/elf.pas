unit elf;

interface

const
  {$IFDEF Linux}
  libelementary = 'libelementary';
  {$ENDIF}

  {$IFDEF mswindows}
  libelementary = 'libelementary.dll'; // ???
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




implementation

end.
