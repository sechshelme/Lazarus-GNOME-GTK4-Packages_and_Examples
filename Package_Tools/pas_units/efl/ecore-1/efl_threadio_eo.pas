unit efl_threadio_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_ThreadIO = ^TEfl_ThreadIO;
  TEfl_ThreadIO = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEflThreadIOCall = procedure(data: pointer; event: PEfl_Event); cdecl;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEflThreadIOCallSync = ^TEflThreadIOCallSync;
  TEflThreadIOCallSync = function(data: pointer; event: PEfl_Event): pointer; cdecl;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_THREADIO_MIXIN: PEfl_Class;

function efl_threadio_mixin_get: PEfl_Class; cdecl; external libecore;
procedure efl_threadio_indata_set(obj: PEo; data: pointer); cdecl; external libecore;
function efl_threadio_indata_get(obj: PEo): pointer; cdecl; external libecore;
procedure efl_threadio_outdata_set(obj: PEo; data: pointer); cdecl; external libecore;
function efl_threadio_outdata_get(obj: PEo): pointer; cdecl; external libecore;
procedure efl_threadio_call(obj: PEo; func_data: pointer; func: TEflThreadIOCall; func_free_cb: TEina_Free_Cb); cdecl; external libecore;
function efl_threadio_call_sync(obj: PEo; func_data: pointer; func: TEflThreadIOCallSync; func_free_cb: TEina_Free_Cb): pointer; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 15:44:09 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_THREADIO_MIXIN: PEfl_Class;
begin
  EFL_THREADIO_MIXIN := efl_threadio_mixin_get;
end;
{$endif}


end.
