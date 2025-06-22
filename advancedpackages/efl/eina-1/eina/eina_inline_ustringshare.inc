{$IFDEF read_interface}


function eina_ustringshare_replace(p_str: PPEina_Unicode; news: PEina_Unicode): TEina_Bool;
function eina_ustringshare_replace_length(p_str: PPEina_Unicode; news: PEina_Unicode; slen: cardinal): TEina_Bool;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_ustringshare_replace(p_str: PPEina_Unicode; news: PEina_Unicode): TEina_Bool;
begin
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;

  news := eina_ustringshare_ref(news);
  eina_ustringshare_del(p_str^);
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;
  p_str^ := news;
  Result := EINA_TRUE;
end;

function eina_ustringshare_replace_length(p_str: PPEina_Unicode; news: PEina_Unicode; slen: cardinal): TEina_Bool;
begin
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;

  news := eina_ustringshare_add_length(news, slen);
  eina_ustringshare_del(p_str^);
  if p_str^ = news then begin
    Exit(EINA_FALSE);
  end;
  p_str^ := news;
  Result := EINA_TRUE;
end;

{$ENDIF read_implementation}
