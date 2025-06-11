unit eldbus_message_helper;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, Eldbus;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEldbus_Dict_Cb_Get = procedure(data: pointer; key: pointer; var_: PEldbus_Message_Iter); cdecl;

procedure eldbus_message_iter_dict_iterate(dict: PEldbus_Message_Iter; signature: pchar; cb: TEldbus_Dict_Cb_Get; data: pointer); cdecl; external libeldbus;

// === Konventiert am: 11-6-25 13:09:31 ===


implementation



end.
