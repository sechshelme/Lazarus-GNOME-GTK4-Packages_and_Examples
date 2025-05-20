unit efl_io_writer_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Io_Writer = ^TEfl_Io_Writer;
  TEfl_Io_Writer = TEo;

function EFL_IO_WRITER_INTERFACE: PEfl_Class;

function efl_io_writer_interface_get: PEfl_Class; cdecl; external libefl;
function efl_io_writer_write(obj: PEo; slice: PEina_Slice; remaining: PEina_Slice): TEina_Error; cdecl; external libefl;
procedure efl_io_writer_can_write_set(obj: PEo; can_write: TEina_Bool); cdecl; external libefl;
function efl_io_writer_can_write_get(obj: PEo): TEina_Bool; cdecl; external libefl;

var
  _EFL_IO_WRITER_EVENT_CAN_WRITE_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_IO_WRITER_EVENT_CAN_WRITE_CHANGED: PEfl_Event_Description;


// === Konventiert am: 20-5-25 13:05:41 ===


implementation


function EFL_IO_WRITER_INTERFACE: PEfl_Class;
begin
  EFL_IO_WRITER_INTERFACE := efl_io_writer_interface_get;
end;

function EFL_IO_WRITER_EVENT_CAN_WRITE_CHANGED: PEfl_Event_Description;
begin
  EFL_IO_WRITER_EVENT_CAN_WRITE_CHANGED := @(_EFL_IO_WRITER_EVENT_CAN_WRITE_CHANGED);
end;


end.
