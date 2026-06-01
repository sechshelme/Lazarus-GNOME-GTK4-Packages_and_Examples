program project1;

uses
  fp_glib2,
  Classes,
  SysUtils,
  fp_uri;

  procedure print_range(lab: pchar; range: TTextRange);
  begin
    if range.first <> nil then begin
      g_print('%s: %.*s'#10, lab, range.afterLast - range.first, range.first);
    end;
  end;

  procedure main;
  const
    uriString = 'blabla://blibli:1234@clus.sqci.blublu.net:1234/?retryWrites=true&w=majority';
  var
    state: TParserState;
    first, afterLast, it: pchar;
    colon: pchar;
  begin

    state.uri := g_new0(SizeOf(TUri), 1);

    g_print('URL: ', uriString);

    if uriParseUriA(@state, pchar(uriString)) <> 0 then begin
      WriteLn('Fehler beim Parsen!');
      Exit;
    end;

    print_range('Schema', state.uri^.scheme);
    print_range('Host  ', state.uri^.hostText);
    print_range('Port  ', state.uri^.portText);
    print_range('User  ', state.uri^.userInfo);

    WriteLn('------------------------------------');
    if state.uri^.userInfo.first <> nil then begin
      first := state.uri^.userInfo.first;
      afterLast := state.uri^.userInfo.afterLast;
      colon := nil;
      it := first;

      while it < afterLast do begin
        if it^ = ':' then begin
          colon := it;
          break;
        end;
        Inc(it);
      end;

      if colon <> nil then begin
        g_print('%-10s: %.*s'#10, 'User', colon - first, first);
        g_print('%-10s: %.*s'#10, 'Passwort', afterLast - (colon + 1), colon + 1);
      end else begin
        print_range('User', state.uri^.userInfo);
      end;
    end;

    uriFreeUriMembersA(state.uri);
    g_free(state.uri);
  end;

begin
  main;
end.
