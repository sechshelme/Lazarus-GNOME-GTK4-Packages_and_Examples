unit eldbus_message_eina_value;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, Eldbus;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function eldbus_message_to_eina_value(msg:PEldbus_Message):PEina_Value;cdecl;external libeldbus;
function eldbus_message_iter_struct_like_to_eina_value(iter:PEldbus_Message_Iter):PEina_Value;cdecl;external libeldbus;
function eldbus_message_from_eina_value(signature:Pchar; msg:PEldbus_Message; value:PEina_Value):TEina_Bool;cdecl;external libeldbus;

// === Konventiert am: 11-6-25 13:09:29 ===


implementation



end.
