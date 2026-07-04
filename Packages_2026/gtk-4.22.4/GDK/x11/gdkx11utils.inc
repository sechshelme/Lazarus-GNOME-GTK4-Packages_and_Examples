
{$IFDEF read_interface}

function GDK_XID_TO_POINTER(xid: PtrUInt): Tgpointer; inline;
function GDK_POINTER_TO_XID(p: Tgpointer): PtrUInt; inline;


// === Konventiert am: 3-8-24 17:51:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GDK_XID_TO_POINTER(xid: PtrUInt): Tgpointer; inline;
begin
  Result := Tgpointer(xid);
end;

function GDK_POINTER_TO_XID(p: Tgpointer): PtrUInt; inline;
begin
  Result := PtrUInt(p);
end;


{$ENDIF read_implementation}
