program project1;

uses
  fp_lber,
  fp_ldap;


  // ldapsearch -x -H ldap://ldap.forumsys.com:389 -b "dc=example,dc=com" -D "uid=einstein,dc=example,dc=com" -w password "(uid=einstein)"

  procedure main;
  const
    ldap_uri = 'ldap://ldap.forumsys.com';
    bind_dn = 'cn=read-only-admin,dc=example,dc=com';
    bind_pw = 'password';
    base_dn = 'dc=example,dc=com';
    filter = '(|(uid=tesla)(uid=einstein))';
//    filter=nil;
  var
    rc, count: longint;
    ld: PLDAP;
    version: integer;
    cred: Tberval;
    result_msg: PLDAPMessage = nil;
    entry: PLDAPMessage;
    dn, attr: pchar;
    ber: PBerElement = nil;
    vals: PPberval;
    i: integer;

  begin
    rc := ldap_initialize(@ld, ldap_uri);
    if rc <> LDAP_SUCCESS then begin
      WriteLn('ldap_initialize fehlgeschlagen: ', ldap_err2string(rc));
      Exit;
    end;

    version := LDAP_VERSION3;
    rc := ldap_set_option(ld, LDAP_OPT_PROTOCOL_VERSION, @version);
    if rc <> LDAP_SUCCESS then begin
      WriteLn('Konnte Protokollversion nicht setzen: ', ldap_err2string(rc));
      ldap_unbind_ext_s(ld, nil, nil);
      Exit;
    end;
    WriteLn('Verbinde zu ', ldap_uri, '...');

    cred.bv_val := bind_pw;
    cred.bv_len := Length(bind_pw);
    rc := ldap_sasl_bind_s(ld, bind_dn, LDAP_SASL_SIMPLE, @cred, nil, nil, nil);
    if rc <> LDAP_SUCCESS then begin
      WriteLn('LDAP Bind Fehler: ', ldap_err2string(rc));
      ldap_unbind_ext_s(ld, nil, nil);
      Exit;
    end;
    WriteLn('Erfolgreich eingeloggt als: ', bind_dn);

    rc := ldap_search_ext_s(ld, base_dn, LDAP_SCOPE_SUBTREE, filter, nil, 0, nil, nil, nil, 0, @result_msg);
    if rc <> LDAP_SUCCESS then begin
      WriteLn('LDAP Suche fehlgeschlagen: ', ldap_err2string(rc));
      ldap_unbind_ext_s(ld, nil, nil);
      Exit;
    end;

    count := ldap_count_entries(ld, result_msg);
    WriteLn('Anzahl gefundener Einträge: ', count);

    entry := ldap_first_entry(ld, result_msg);
    while entry <> nil do begin
      dn := ldap_get_dn(ld, entry);
      if dn <> nil then begin
        WriteLn('Gefundener DN: ', dn);
        ldap_memfree(dn);
      end;

      attr := ldap_first_attribute(ld, entry, @ber);
      while attr <> nil do begin

        vals := ldap_get_values_len(ld, entry, attr);
        if vals <> nil then begin

          i := 0;
          while vals[i] <> nil do begin
            WriteLn('  ', attr, ': ', copy(vals[i]^.bv_val, 1, vals[i]^.bv_len));
            inc(i);
          end;

          ldap_value_free_len(vals);
        end;

        ldap_memfree(attr);
        attr := ldap_next_attribute(ld, entry, ber);
      end;

      if ber <> nil then  begin
        //  ber_free(ber, 0);
        ber := nil;
      end;

      WriteLn();
      entry := ldap_next_entry(ld, entry);
    end;

    ldap_msgfree(result_msg);
    ldap_unbind_ext_s(ld, nil, nil);
  end;

begin
  main;
end.
