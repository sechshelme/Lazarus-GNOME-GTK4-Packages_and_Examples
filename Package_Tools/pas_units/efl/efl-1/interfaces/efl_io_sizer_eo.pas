unit efl_io_sizer_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Io_Sizer = ^TEfl_Io_Sizer;
  TEfl_Io_Sizer = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_SIZER_MIXIN: PEfl_Class;

function efl_io_sizer_mixin_get: PEfl_Class; cdecl; external libefl;
function efl_io_sizer_resize(obj: PEo; size: uint64): TEina_Error; cdecl; external libefl;
function efl_io_sizer_size_set(obj: PEo; size: uint64): TEina_Bool; cdecl; external libefl;
function efl_io_sizer_size_get(obj: PEo): uint64; cdecl; external libefl;

var
  _EFL_IO_SIZER_EVENT_SIZE_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_IO_SIZER_EVENT_SIZE_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 20-5-25 14:51:15 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_SIZER_MIXIN: PEfl_Class;
begin
  EFL_IO_SIZER_MIXIN := efl_io_sizer_mixin_get;
end;

function EFL_IO_SIZER_EVENT_SIZE_CHANGED: PEfl_Event_Description;
begin
  EFL_IO_SIZER_EVENT_SIZE_CHANGED := @(_EFL_IO_SIZER_EVENT_SIZE_CHANGED);
end;
{$endif}


end.
