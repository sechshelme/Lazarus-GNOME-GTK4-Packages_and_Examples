{$IFDEF read_interface}


type
  PEfl_Io_Positioner = ^TEfl_Io_Positioner;
  TEfl_Io_Positioner = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Io_Positioner_Whence = ^TEfl_Io_Positioner_Whence;
  TEfl_Io_Positioner_Whence = longint;

const
  EFL_IO_POSITIONER_WHENCE_START = 0;
  EFL_IO_POSITIONER_WHENCE_CURRENT = 1;
  EFL_IO_POSITIONER_WHENCE_END = 2;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_POSITIONER_MIXIN: PEfl_Class;

function efl_io_positioner_mixin_get: PEfl_Class; cdecl; external libefl;
function efl_io_positioner_seek(obj: PEo; offset: int64; whence: TEfl_Io_Positioner_Whence): TEina_Error; cdecl; external libefl;
function efl_io_positioner_position_set(obj: PEo; position: uint64): TEina_Bool; cdecl; external libefl;
function efl_io_positioner_position_get(obj: PEo): uint64; cdecl; external libefl;

var
  _EFL_IO_POSITIONER_EVENT_POSITION_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_IO_POSITIONER_EVENT_POSITION_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 20-5-25 13:30:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_POSITIONER_MIXIN: PEfl_Class;
begin
  EFL_IO_POSITIONER_MIXIN := efl_io_positioner_mixin_get;
end;

function EFL_IO_POSITIONER_EVENT_POSITION_CHANGED: PEfl_Event_Description;
begin
  EFL_IO_POSITIONER_EVENT_POSITION_CHANGED := @(_EFL_IO_POSITIONER_EVENT_POSITION_CHANGED);
end;
{$endif}


{$ENDIF read_implementation}
