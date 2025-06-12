{$IFDEF read_interface}


type
  PEfl_Io_Model = ^TEfl_Io_Model;
  TEfl_Io_Model = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEflIoFilter = function(data: pointer; model: PEfl_Io_Model; entry: PEina_File_Direct_Info): longint; cdecl;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_MODEL_CLASS: PEfl_Class;

function efl_io_model_class_get: PEfl_Class; cdecl; external libeio;
procedure efl_io_model_children_filter_set(obj: PEo; filter_data: pointer; filter: TEflIoFilter; filter_free_cb: TEina_Free_Cb); cdecl; external libeio;
procedure efl_io_model_path_set(obj: PEo; path: pchar); cdecl; external libeio;
function efl_io_model_path_get(obj: PEo): pchar; cdecl; external libeio;
{$endif}

// === Konventiert am: 12-6-25 16:09:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_MODEL_CLASS: PEfl_Class;
begin
  EFL_IO_MODEL_CLASS := efl_io_model_class_get;
end;
{$endif}


{$ENDIF read_implementation}
