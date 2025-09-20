unit gmime_iconv;

interface

uses
  fp_glib2, fp_gmime3;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function g_mime_iconv_open(to_:Pchar; from:Pchar):Ticonv_t;cdecl;external libgmime3;
function g_mime_iconv_close(cd:Ticonv_t):longint;cdecl;external libgmime3;
function g_mime_iconv(cd,inbuf,inleft,outbuf,outleft : longint) : longint;


// === Konventiert am: 18-9-25 15:29:17 ===


implementation


function g_mime_iconv(cd,inbuf,inleft,outbuf,outleft : longint) : longint;
begin
//  g_mime_iconv:=iconv(cd,inbuf,inleft,outbuf,outleft);
end;


end.
