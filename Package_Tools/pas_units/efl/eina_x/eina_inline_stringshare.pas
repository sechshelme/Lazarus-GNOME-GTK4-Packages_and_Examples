unit eina_inline_stringshare;

interface

uses
  fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function eina_stringshare_refplace(p_str: PPEina_Stringshare; news: PEina_Stringshare): TEina_Bool;
function eina_stringshare_replace(p_str: PPEina_Stringshare; news: pchar): TEina_Bool;
function eina_stringshare_replace_length(p_str: PPEina_Stringshare; news: pchar; slen: cardinal): TEina_Bool;
function eina_stringshare_slice_get(str: PEina_Stringshare): TEina_Slice;


implementation

function eina_stringshare_refplace(p_str: PPEina_Stringshare; news: PEina_Stringshare): TEina_Bool;
begin
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;

  news := eina_stringshare_ref(news);
  eina_stringshare_del(p_str^);
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;
  p_str^ := news;
  Result := EINA_TRUE;
end;

function eina_stringshare_replace(p_str: PPEina_Stringshare; news: pchar): TEina_Bool;
begin
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;

  news := eina_stringshare_add(news);
  eina_stringshare_del(p_str^);
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;
  p_str^ := news;
  Result := EINA_TRUE;
end;

function eina_stringshare_replace_length(p_str: PPEina_Stringshare; news: pchar; slen: cardinal): TEina_Bool;
begin
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;

  news := eina_stringshare_add_length(news, slen);
  eina_stringshare_del(p_str^);
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;
  p_str^ := news;
  Result := EINA_TRUE;
end;

function eina_stringshare_slice_get(str: PEina_Stringshare): TEina_Slice;
begin
  Result.len := eina_stringshare_strlen(str);
  Result.mem := str;
end;

end.
