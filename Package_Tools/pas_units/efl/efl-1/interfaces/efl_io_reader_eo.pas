unit efl_io_reader_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Io_Reader = ^TEfl_Io_Reader;
  TEfl_Io_Reader = TEo;

function EFL_IO_READER_INTERFACE: PEfl_Class;

function efl_io_reader_interface_get: PEfl_Class; cdecl; external libefl;
function efl_io_reader_read(obj: PEo; rw_slice: PEina_Rw_Slice): TEina_Error; cdecl; external libefl;
procedure efl_io_reader_can_read_set(obj: PEo; can_read: TEina_Bool); cdecl; external libefl;
function efl_io_reader_can_read_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_io_reader_eos_set(obj: PEo; is_eos: TEina_Bool); cdecl; external libefl;
function efl_io_reader_eos_get(obj: PEo): TEina_Bool; cdecl; external libefl;

var
  _EFL_IO_READER_EVENT_CAN_READ_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_IO_READER_EVENT_EOS: TEfl_Event_Description; cvar;external libefl;

function EFL_IO_READER_EVENT_CAN_READ_CHANGED: PEfl_Event_Description;
function EFL_IO_READER_EVENT_EOS: PEfl_Event_Description;


// === Konventiert am: 20-5-25 13:05:37 ===


implementation


function EFL_IO_READER_INTERFACE: PEfl_Class;
begin
  EFL_IO_READER_INTERFACE := efl_io_reader_interface_get;
end;

function EFL_IO_READER_EVENT_CAN_READ_CHANGED: PEfl_Event_Description;
begin
  EFL_IO_READER_EVENT_CAN_READ_CHANGED := @(_EFL_IO_READER_EVENT_CAN_READ_CHANGED);
end;

function EFL_IO_READER_EVENT_EOS: PEfl_Event_Description;
begin
  EFL_IO_READER_EVENT_EOS := @(_EFL_IO_READER_EVENT_EOS);
end;


end.
