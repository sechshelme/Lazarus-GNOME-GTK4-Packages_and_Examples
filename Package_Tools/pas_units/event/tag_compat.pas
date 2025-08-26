unit tag_compat;

interface

uses
  fp_event, util, tag;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure encode_int(evbuf:Pevbuffer; number: Tev_uint32_t);
procedure encode_int64(evbuf:Pevbuffer; number: Tev_uint32_t);


// === Konventiert am: 26-8-25 19:38:05 ===


implementation


procedure encode_int(evbuf: Pevbuffer; number: Tev_uint32_t);
begin
  evtag_encode_int(evbuf, number);
end;

procedure encode_int64(evbuf: Pevbuffer; number: Tev_uint32_t);
begin
  evtag_encode_int64(evbuf, number);
end;


end.
