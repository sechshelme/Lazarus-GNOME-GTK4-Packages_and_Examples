unit efl_canvas_textblock_factory_eo;

interface

uses
  ctypes, efl, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Textblock_Factory = ^TEfl_Canvas_Textblock_Factory;
  TEfl_Canvas_Textblock_Factory = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_TEXTBLOCK_FACTORY_INTERFACE: PEfl_Class;

function efl_canvas_textblock_factory_interface_get: PEfl_Class; cdecl; external libevas;
function efl_canvas_textblock_factory_create(obj: PEo; object_: PEfl_Canvas_Object; key: pchar): PEfl_Canvas_Object; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:08:47 ===


implementation


function EFL_CANVAS_TEXTBLOCK_FACTORY_INTERFACE: PEfl_Class;
begin
  EFL_CANVAS_TEXTBLOCK_FACTORY_INTERFACE := efl_canvas_textblock_factory_interface_get;
end;


end.
