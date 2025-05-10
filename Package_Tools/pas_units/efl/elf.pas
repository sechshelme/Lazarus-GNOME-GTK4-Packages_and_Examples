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
    TEina_Bool=Boolean8;


// /usr/include/evas-1/Evas_Common.h
type
  TEvas_Callback_Type=LongInt;
  PEvas_Object=Pointer;
  const
    EVAS_LAYER_MIN     =              -32768 ;
     EVAS_LAYER_MAX     =              32767  ;




implementation

end.

