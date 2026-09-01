program project1;
uses
  fp_sodium;

  procedure main;
  const
    inText: pchar = 'Dies ist eine geheime Nachricht von Alice.';
  var
    bob_publickey, bob_secretkey: array[0..crypto_box_PUBLICKEYBYTES_ - 1] of byte;
    alice_publickey, alice_secretkey: array[0..crypto_box_SECRETKEYBYTES_ - 1] of byte;

    inTextlen, verschluesselt_len: Tsize_t;

    nonce: array[0..crypto_box_NONCEBYTES_ - 1] of byte;

    encrypted: array of char = nil;
    hex_ausgabe: array of char = nil;
    decrypted: array of char = nil;

    i: integer;

  begin
    if sodium_init < 0 then begin
      WriteLn('Fehler: Libsodium konnte nicht initialisiert werden!'#10);
      Exit;;
    end;

    crypto_box_keypair(@bob_publickey, @bob_secretkey);
    crypto_box_keypair(@alice_publickey, @alice_secretkey);

    inTextlen := Length(inText);

    randombytes_buf(@nonce, SizeOf(nonce));

    verschluesselt_len := crypto_box_MACBYTES + inTextlen;
    SetLength(encrypted, verschluesselt_len);

    if crypto_box_easy(pbyte(encrypted), pbyte(inText), inTextlen, @nonce, @bob_publickey, @alice_secretkey) <> 0 then  begin
      Writeln('Fehler bei der Verschlüsselung!');
      SetLength(encrypted, 0);
      ExitCode := 1;
      Exit;
    end;

    Writeln('Nachricht erfolgreich verschlüsselt.');
    SetLength(hex_ausgabe, (verschluesselt_len * 2) + 1);

    sodium_bin2hex(pchar(hex_ausgabe), (verschluesselt_len * 2) + 1, pbyte(encrypted), verschluesselt_len);
    Writeln('Verschlüsselte Bytes (Hex): ', pchar(hex_ausgabe));
    Writeln;

    SetLength(hex_ausgabe, 0);

    Writeln('Verschlüsselte Bytes (Roh-Array):');
    for i := 0 to verschluesselt_len - 1 do begin
      Write(byte(encrypted[i]): 4);
      if ((i + 1) mod 10 = 0) then begin
        Writeln;
      end;
    end;
    Writeln(#10);

    SetLength(decrypted, inTextlen + 1);

    if crypto_box_open_easy(pbyte(decrypted), pbyte(encrypted), verschluesselt_len, @nonce, @alice_publickey, @bob_secretkey) <> 0 then  begin
      Writeln('Fehler: Nachricht ist manipuliert oder ungültig!');
      SetLength(encrypted, 0);
      SetLength(decrypted, 0);
      ExitCode := 1;
      Exit;
    end;

    decrypted[inTextlen] := #0;

    Writeln('Erfolgreich entschlüsselt!');
    Writeln('Inhalt: ', pchar(decrypted));

    SetLength(encrypted, 0);
    SetLength(decrypted, 0);
  end;

begin
  main;
end.
