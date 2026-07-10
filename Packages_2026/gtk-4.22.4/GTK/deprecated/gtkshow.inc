

{$IFDEF read_function}
procedure gtk_show_uri_full(parent: PGtkWindow; uri: pchar; timestamp: Tguint32; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4; deprecated;
function gtk_show_uri_full_finish(parent: PGtkWindow; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_show_uri(parent: PGtkWindow; uri: pchar; timestamp: Tguint32); cdecl; external libgtk4; deprecated;
{$ENDIF read_function}

// === Konventiert am: 9-7-26 19:49:31 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
