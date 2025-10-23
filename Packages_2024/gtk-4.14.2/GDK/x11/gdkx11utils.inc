
{$IFDEF read_interface}

function GDK_XID_TO_POINTER(xid: Tguint): Tgpointer;
function GDK_POINTER_TO_XID(p: Pointer): Tguint;


// === Konventiert am: 3-8-24 17:51:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GDK_XID_TO_POINTER(xid: Tguint): Tgpointer;
begin
  Result := GUINT_TO_POINTER(xid);
end;

function GDK_POINTER_TO_XID(p: Pointer): Tguint;
begin
  GDK_POINTER_TO_XID := GPOINTER_TO_UINT(p);
end;


{$ENDIF read_implementation}
