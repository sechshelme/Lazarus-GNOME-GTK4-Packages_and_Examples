{$IFDEF read_interface}


const
  ELDBUS_PENDING_H = 1;

procedure eldbus_pending_data_set(pending: PEldbus_Pending; key: pchar; data: pointer); cdecl; external libeldbus;
function eldbus_pending_data_get(pending: PEldbus_Pending; key: pchar): pointer; cdecl; external libeldbus;
function eldbus_pending_data_del(pending: PEldbus_Pending; key: pchar): pointer; cdecl; external libeldbus;
procedure eldbus_pending_cancel(pending: PEldbus_Pending); cdecl; external libeldbus;
function eldbus_pending_destination_get(pending: PEldbus_Pending): pchar; cdecl; external libeldbus;
function eldbus_pending_path_get(pending: PEldbus_Pending): pchar; cdecl; external libeldbus;
function eldbus_pending_interface_get(pending: PEldbus_Pending): pchar; cdecl; external libeldbus;
function eldbus_pending_method_get(pending: PEldbus_Pending): pchar; cdecl; external libeldbus;
procedure eldbus_pending_free_cb_add(pending: PEldbus_Pending; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;
procedure eldbus_pending_free_cb_del(pending: PEldbus_Pending; cb: TEldbus_Free_Cb; data: pointer); cdecl; external libeldbus;

// === Konventiert am: 11-6-25 13:09:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
