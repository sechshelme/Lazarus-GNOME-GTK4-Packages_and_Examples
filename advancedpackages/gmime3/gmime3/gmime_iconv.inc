{$IFDEF read_interface}


function g_mime_iconv_open(to_:Pchar; from:Pchar):Ticonv_t;cdecl;external libgmime3;
function g_mime_iconv_close(cd:Ticonv_t):longint;cdecl;external libgmime3;
function g_mime_iconv(cd,inbuf,inleft,outbuf,outleft : longint) : longint; unimplemented;


// === Konventiert am: 18-9-25 15:29:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function g_mime_iconv(cd,inbuf,inleft,outbuf,outleft : longint) : longint;
begin
//  g_mime_iconv:=iconv(cd,inbuf,inleft,outbuf,outleft);
end;


{$ENDIF read_implementation}
