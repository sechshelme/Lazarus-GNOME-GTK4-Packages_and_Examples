{$IFDEF read_interface}


const
  ELDBUS_MESSAGE_H = 1;

function eldbus_message_ref(msg: PEldbus_Message): PEldbus_Message; cdecl; external libeldbus;
procedure eldbus_message_unref(msg: PEldbus_Message); cdecl; external libeldbus;
function eldbus_message_path_get(msg: PEldbus_Message): pchar; cdecl; external libeldbus;
function eldbus_message_interface_get(msg: PEldbus_Message): pchar; cdecl; external libeldbus;
function eldbus_message_member_get(msg: PEldbus_Message): pchar; cdecl; external libeldbus;
function eldbus_message_destination_get(msg: PEldbus_Message): pchar; cdecl; external libeldbus;
function eldbus_message_sender_get(msg: PEldbus_Message): pchar; cdecl; external libeldbus;
function eldbus_message_signature_get(msg: PEldbus_Message): pchar; cdecl; external libeldbus;
function eldbus_message_method_call_new(dest: pchar; path: pchar; iface: pchar; method: pchar): PEldbus_Message; cdecl; external libeldbus;
function eldbus_message_signal_new(path: pchar; iface: pchar; name: pchar): PEldbus_Message; cdecl; external libeldbus;
function eldbus_message_error_new(msg: PEldbus_Message; error_name: pchar; error_msg: pchar): PEldbus_Message; cdecl; external libeldbus;
function eldbus_message_method_return_new(msg: PEldbus_Message): PEldbus_Message; cdecl; external libeldbus;
function eldbus_message_error_get(msg: PEldbus_Message; name: PPchar; text: PPchar): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_arguments_get(msg: PEldbus_Message; signature: pchar; args: array of const): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_arguments_get(msg: PEldbus_Message; signature: pchar): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_arguments_vget(msg: PEldbus_Message; signature: pchar; ap: Tva_list): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_arguments_append(msg: PEldbus_Message; signature: pchar; args: array of const): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_arguments_append(msg: PEldbus_Message; signature: pchar): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_arguments_vappend(msg: PEldbus_Message; signature: pchar; ap: Tva_list): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_container_new(iter: PEldbus_Message_Iter; _type: longint; contained_signature: pchar): PEldbus_Message_Iter; cdecl; external libeldbus;
function eldbus_message_iter_basic_append(iter: PEldbus_Message_Iter; _type: longint; args: array of const): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_basic_append(iter: PEldbus_Message_Iter; _type: longint): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_arguments_append(iter: PEldbus_Message_Iter; signature: pchar; args: array of const): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_arguments_append(iter: PEldbus_Message_Iter; signature: pchar): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_arguments_vappend(iter: PEldbus_Message_Iter; signature: pchar; ap: Tva_list): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_fixed_array_append(iter: PEldbus_Message_Iter; _type: longint; arr: pointer; size: dword): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_container_close(iter: PEldbus_Message_Iter; sub: PEldbus_Message_Iter): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_get(msg: PEldbus_Message): PEldbus_Message_Iter; cdecl; external libeldbus;
procedure eldbus_message_iter_basic_get(iter: PEldbus_Message_Iter; value: pointer); cdecl; external libeldbus;
function eldbus_message_iter_signature_get(iter: PEldbus_Message_Iter): pchar; cdecl; external libeldbus;
function eldbus_message_iter_next(iter: PEldbus_Message_Iter): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_get_and_next(iter: PEldbus_Message_Iter; signature: char; args: array of const): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_get_and_next(iter: PEldbus_Message_Iter; signature: char): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_fixed_array_get(iter: PEldbus_Message_Iter; signature: longint; value: pointer; n_elements: Plongint): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_arguments_get(iter: PEldbus_Message_Iter; signature: pchar; args: array of const): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_arguments_get(iter: PEldbus_Message_Iter; signature: pchar): TEina_Bool; cdecl; external libeldbus;
function eldbus_message_iter_arguments_vget(iter: PEldbus_Message_Iter; signature: pchar; ap: Tva_list): TEina_Bool; cdecl; external libeldbus;
procedure eldbus_message_iter_del(iter: PEldbus_Message_Iter); cdecl; external libeldbus;

// === Konventiert am: 9-6-25 19:50:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
