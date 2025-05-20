unit efl_file_save_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_File_Save = ^TEfl_File_Save;
  TEfl_File_Save = TEo;

type
  TEfl_File_Save_Info = record
    quality: dword;
    compression: dword;
    encoding: pchar;
  end;
  PEfl_File_Save_Info = ^TEfl_File_Save_Info;

function EFL_FILE_SAVE_INTERFACE: PEfl_Class;

function efl_file_save_interface_get: PEfl_Class; cdecl; external libefl;
function efl_file_save(obj: PEo; file_: pchar; key: pchar; info: PEfl_File_Save_Info): TEina_Bool; cdecl; external libefl;

// === Konventiert am: 20-5-25 13:30:26 ===


implementation


function EFL_FILE_SAVE_INTERFACE: PEfl_Class;
begin
  EFL_FILE_SAVE_INTERFACE := efl_file_save_interface_get;
end;


end.
