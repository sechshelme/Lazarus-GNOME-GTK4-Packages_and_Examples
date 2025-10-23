
{$IFDEF read_interface}

procedure _gdk_pixbuf_marshal_VOID__INT_INT(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer;
  marshal_data: Tgpointer); cdecl; external libgdk_pixbuf2;
procedure _gdk_pixbuf_marshal_VOID__INT_INT_INT_INT(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer;
  marshal_data: Tgpointer); cdecl; external libgdk_pixbuf2;

procedure _gdk_pixbuf_marshal_VOID__VOID(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer; marshal_data: Tgpointer);
procedure g_cclosure_marshal_VOID__POINTER(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer; marshal_data: Tgpointer);


// === Konventiert am: 8-11-24 17:07:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure _gdk_pixbuf_marshal_VOID__VOID(closure: PGClosure; return_value: PGValue; n_param_values: Tguint; param_values: PGValue; invocation_hint: Tgpointer; marshal_data: Tgpointer);
begin
  g_cclosure_marshal_VOID__VOID(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data);
end;

procedure g_cclosure_marshal_VOID__POINTER(closure: PGClosure;  return_value: PGValue; n_param_values: Tguint; param_values: PGValue;  invocation_hint: Tgpointer; marshal_data: Tgpointer);
begin
  g_cclosure_marshal_VOID__POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data);
end;


{$ENDIF read_implementation}
