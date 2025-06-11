{$IFDEF read_interface}


type
  TEldbus_Dict_Cb_Get = procedure(data: pointer; key: pointer; var_: PEldbus_Message_Iter); cdecl;

procedure eldbus_message_iter_dict_iterate(dict: PEldbus_Message_Iter; signature: pchar; cb: TEldbus_Dict_Cb_Get; data: pointer); cdecl; external libeldbus;

// === Konventiert am: 11-6-25 13:09:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
