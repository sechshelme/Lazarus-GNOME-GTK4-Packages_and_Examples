program project1;

uses
  Classes, SysUtils, fp_uri;

// Diese Funktion bügelt die Idiotie der Library aus
function RangeToString(range: TTextRange): String;
var
  len: Integer;
begin
  Result := '';
  if (range.first <> nil) and (range.afterLast <> nil) then
  begin
    len := range.afterLast - range.first;
    if len > 0 then
      SetString(Result, range.first, len);
  end;
end;

procedure print_range(lab: String; range: TTextRange);
begin
  if range.first <> nil then
    WriteLn(lab, ': ', RangeToString(range));
end;

procedure main;
const
  uriString = 'blabla://blibli:1234@clus.sqci.blublu.net:1234/?retryWrites=true&w=majority';
var
  uri: TUri;
  state: TParserState;
  first, afterLast, it: PChar;
  colon: PChar;
  user, pass: String;
begin
  WriteLn('URL: ', uriString);

  state.uri := @uri;

  // 1. URI parsen
  if uriParseUriA(@state, PChar(uriString)) <> 0 then begin
    WriteLn('Fehler beim Parsen!');
    Exit;
  end;

  // 2. Einzelteile ausgeben
  print_range('Schema', uri.scheme);
  print_range('Host  ', uri.hostText);
  print_range('Port  ', uri.portText);
  print_range('User  ', uri.userInfo);

  WriteLn('------------------------------------');

  if uri.userInfo.first <> nil then begin
    first := PChar(uri.userInfo.first);
    afterLast := PChar(uri.userInfo.afterLast);
    colon := nil;
    it := first;

    // DIE FIX-SCHLEIFE:
    while it < afterLast do begin
      if it^ = ':' then begin
        colon := it;
        break;
      end;
      Inc(it); // <--- DAS hier verhindert das Ctrl+C Desaster!
    end;

    if colon <> nil then begin
      SetString(user, first, colon - first);
      SetString(pass, colon + 1, afterLast - (colon + 1));
      WriteLn('User      : ', user);
      WriteLn('Passwort  : ', pass);
    end else begin
      WriteLn('User      : ', RangeToString(uri.userInfo));
    end;
  end;

  uriFreeUriMembersA(@uri);
end;

begin
  main;
end.

