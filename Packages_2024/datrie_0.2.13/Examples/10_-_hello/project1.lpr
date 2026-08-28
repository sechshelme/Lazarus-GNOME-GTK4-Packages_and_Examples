program project1;

uses
  SysUtils,
  fp_datrie;

  function copy_to_alpha_char(const s: string): PAlphaChar;
  var
    i, len: SizeInt;
  begin
    len := Length(s);
    Result := GetMem((len + 1) * SizeOf(TAlphaChar));
    if Result <> nil then begin
      for i := 0 to len - 1 do begin
        Result[i] := TAlphaChar(s[i]);
      end;
      Result[len] := TAlphaChar(0);
    end;
  end;

  procedure main;
  var
    alpha_map: PAlphaMap;
    trie: PTrie;
    wort: TAnsiStringArray;
    trie_wort, search_key: PAlphaChar;
    i: integer;
    gefundene_position: TTrieData;

  const
    buch_text = 'ein apfel faellt selten weit vom stamm aber eine banane schmeckt süss, darum esse ich die banane viel lieber';
    suche = 'banane';

  begin
    alpha_map := alpha_map_new;
    alpha_map_add_range(alpha_map, 32, 126);
    trie := trie_new(alpha_map);
    alpha_map_free(alpha_map);

    wort := buch_text.Split(' ');

    for i := 1 to Length(wort) do begin
      trie_wort := copy_to_alpha_char(wort[i]);
      trie_store(trie, trie_wort, i);
      Freemem(trie_wort);
    end;

    search_key := copy_to_alpha_char(suche);

    if trie_retrieve(trie, search_key, @gefundene_position) then begin
      WriteLn('Gefunden! Das Wort ', suche, ' steht im Buch an Position ', gefundene_position);
    end else begin
      WriteLn('Das Wort ', suche, ' kommt im Buch-Text nicht vor.');
    end;

    Freemem(search_key);
    trie_free(trie);
  end;

begin
  main;
end.
