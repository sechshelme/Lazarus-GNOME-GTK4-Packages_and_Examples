unit eina_inline_stringshare;

{
  EINA - EFL data type library
  Copyright (C) 2002-2008 Gustavo Sverzut Barbieri

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.
}

interface

uses
  fp_eina;

//type
//  Eina_Bool = Boolean;
//  Eina_Stringshare = PAnsiChar;
//  PEina_Stringshare = ^Eina_Stringshare;
//
//  Eina_Slice = record
//    len: Cardinal;
//    mem: Pointer;
//  end;

function eina_stringshare_refplace(p_str: PPEina_Stringshare; news: PEina_Stringshare): TEina_Bool;
function eina_stringshare_replace(p_str: PPEina_Stringshare; const news: PChar): TEina_Bool;
function eina_stringshare_replace_length(p_str: PPEina_Stringshare; const news: PChar; slen: Cardinal): TEina_Bool;
function eina_stringshare_slice_get(str: PEina_Stringshare): TEina_Slice;

//{ Die folgenden Funktionen müssen extern bereitgestellt werden: }
//function eina_stringshare_add(const s: PAnsiChar): Eina_Stringshare; external;
//function eina_stringshare_add_length(const s: PAnsiChar; len: Cardinal): Eina_Stringshare; external;
//function eina_stringshare_ref(s: Eina_Stringshare): Eina_Stringshare; external;
//procedure eina_stringshare_del(s: Eina_Stringshare); external;
//function eina_stringshare_strlen(s: Eina_Stringshare): Cardinal; external;

implementation

function eina_stringshare_refplace(p_str: PPEina_Stringshare;
  news: PEina_Stringshare): TEina_Bool;
begin
  if p_str^ = news then
  begin
    Result := False;
    Exit;
  end;

  news := eina_stringshare_ref(news);
  eina_stringshare_del(p_str^);
  if p_str^ = news then
  begin
    Result := False;
    Exit;
  end;
  p_str^ := news;
  Result := True;
end;

function eina_stringshare_replace(p_str: PPEina_Stringshare; const news: PChar
  ): TEina_Bool;
var
  temp: PEina_Stringshare;
begin
  if p_str^ = news then
  begin
    Result := False;
    Exit;
  end;

  temp := eina_stringshare_add(news);
  eina_stringshare_del(p_str^);
  if p_str^ = temp then
  begin
    Result := False;
    Exit;
  end;
  p_str^ := temp;
  Result := True;
end;

function eina_stringshare_replace_length(p_str: PPEina_Stringshare;
  const news: PChar; slen: Cardinal): TEina_Bool;
var
  temp: PEina_Stringshare;
begin
  if p_str^ = news then
  begin
    Result := False;
    Exit;
  end;

  temp := eina_stringshare_add_length(news, slen);
  eina_stringshare_del(p_str^);
  if p_str^ = temp then
  begin
    Result := False;
    Exit;
  end;
  p_str^ := temp;
  Result := True;
end;

function eina_stringshare_slice_get(str: PEina_Stringshare): TEina_Slice;
begin
  Result.len := eina_stringshare_strlen(str);
  Result.mem := str;
end;

end.

