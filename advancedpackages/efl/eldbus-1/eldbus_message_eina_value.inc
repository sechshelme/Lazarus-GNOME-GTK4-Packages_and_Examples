{$IFDEF read_interface}


function eldbus_message_to_eina_value(msg:PEldbus_Message):PEina_Value;cdecl;external libeldbus;
function eldbus_message_iter_struct_like_to_eina_value(iter:PEldbus_Message_Iter):PEina_Value;cdecl;external libeldbus;
function eldbus_message_from_eina_value(signature:Pchar; msg:PEldbus_Message; value:PEina_Value):TEina_Bool;cdecl;external libeldbus;

// === Konventiert am: 11-6-25 13:09:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
