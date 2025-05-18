unit eina_value_util;

interface

uses
  ctypes, efl, eina_value;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function eina_value_util_struct_desc_new: PEina_Value_Struct_Desc; cdecl; external libeina;
function eina_value_util_time_string_new(timestr: pchar): PEina_Value; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:32:05 ===


implementation



end.
