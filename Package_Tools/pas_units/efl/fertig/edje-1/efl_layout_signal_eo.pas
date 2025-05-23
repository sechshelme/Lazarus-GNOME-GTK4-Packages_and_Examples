unit efl_layout_signal_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Layout_Signal = ^TEfl_Layout_Signal;
  TEfl_Layout_Signal = TEo;

type
  TEflLayoutSignalCb = procedure(data: pointer; obj: PEfl_Layout_Signal; emission: pchar; source: pchar); cdecl;

function EFL_LAYOUT_SIGNAL_INTERFACE: PEfl_Class;

function efl_layout_signal_interface_get: PEfl_Class; cdecl; external libedje;
procedure efl_layout_signal_message_send(obj: PEo; id: longint; msg: TEina_Value); cdecl; external libedje;
function efl_layout_signal_callback_add(obj: PEo; emission: pchar; source: pchar; func_data: pointer; func: TEflLayoutSignalCb;
  func_free_cb: TEina_Free_Cb): TEina_Bool; cdecl; external libedje;
function efl_layout_signal_callback_del(obj: PEo; emission: pchar; source: pchar; func_data: pointer; func: TEflLayoutSignalCb;
  func_free_cb: TEina_Free_Cb): TEina_Bool; cdecl; external libedje;
procedure efl_layout_signal_emit(obj: PEo; emission: pchar; source: pchar); cdecl; external libedje;
procedure efl_layout_signal_process(obj: PEo; recurse: TEina_Bool); cdecl; external libedje;

// === Konventiert am: 22-5-25 19:41:20 ===


implementation


function EFL_LAYOUT_SIGNAL_INTERFACE: PEfl_Class;
begin
  EFL_LAYOUT_SIGNAL_INTERFACE := efl_layout_signal_interface_get;
end;


end.
