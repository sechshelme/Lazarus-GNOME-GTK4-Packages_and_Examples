unit evas_ector_software_buffer_eo;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEvas_Ector_Software_Buffer = ^TEvas_Ector_Software_Buffer;
  TEvas_Ector_Software_Buffer = TEo;

function EVAS_ECTOR_SOFTWARE_BUFFER_CLASS: PEfl_Class;

function evas_ector_software_buffer_class_get: PEfl_Class; cdecl; external libevas;

// === Konventiert am: 12-5-25 19:12:37 ===


implementation


function EVAS_ECTOR_SOFTWARE_BUFFER_CLASS: PEfl_Class;
begin
  EVAS_ECTOR_SOFTWARE_BUFFER_CLASS := evas_ector_software_buffer_class_get;
end;


end.
