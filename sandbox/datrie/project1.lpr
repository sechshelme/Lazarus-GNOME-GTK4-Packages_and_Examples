program project1;

uses
  glib2,
  fp_datrie;

  procedure msg_step(msg: pchar);
  begin
    WriteLn(#10'=> %s...', msg);
  end;

  function en_alpha_map_new: PAlphaMap;
  var
    en_map: PAlphaMap;
  begin
    en_map := alpha_map_new;
    if en_map <> nil then begin
      if alpha_map_add_range(en_map, $61, $007a) = 0 then begin
        Result := en_map;
      end else begin
        alpha_map_free(en_map);
      end;;
    end;;

  end;

  function en_trie_new: PTrie;
  var
    en_map: PAlphaMap;
    en_trie: PTrie;
  begin
    en_map := alpha_map_new;
    if en_map <> nil then begin
      en_trie := trie_new(en_map);
      if en_trie <> nil then begin
        Result := en_trie;
      end else begin
        alpha_map_free(en_map);
      end;;
    end;;

  end;

  function ut8toutf32(s: pchar): Pgunichar;
  begin
    Result := g_utf8_to_ucs4(s, -1, nil, nil, nil);
  end;

  procedure main;
  var
    test_trie: PTrie;
    is_failed: boolean;
    trie_state: PTrieState;
    data: TTrieData;
  begin
    msg_step('Preparing trie');
    test_trie := en_trie_new;
    if test_trie = nil then begin
      WriteLn('Fail to create test trie');
      //        goto err_trie_not_created;
      Exit;
    end;

    msg_step('Populating trie with test set');
    if not trie_store(test_trie, ut8toutf32('ab'), 1) then begin
      WriteLn('Failed to add key ''ab'', data 1.');
      //        goto err_trie_created;
    end;

    if not trie_store(test_trie, ut8toutf32('abc'), 2) then begin
      WriteLn('Failed to add key ''abc'', data 2.');
      //        goto err_trie_created;
    end;

    is_failed := False;

    msg_step('Preparing root state');
    trie_state := trie_root(test_trie);
    if trie_state = nil then begin
      WriteLn('Failed to get trie root state');
      //        goto err_trie_created;
    end;

    msg_step('Try walking from root with ''a');
    if not trie_state_walk(trie_state, uint32('a')) then begin
      WriteLn('Failed to walk from root with ''a''.');
      is_failed := True;
    end;

    data := trie_state_get_data(trie_state);
    if data <> TRIE_DATA_ERROR then begin
      WriteLn('Retrieved data at ''a'' is ', data, ' not ', TRIE_DATA_ERROR, '.');
      is_failed := True;
    end;

    msg_step('Try walking further with ''b');
    if not trie_state_walk(trie_state, uint32('b')) then begin
      WriteLn('Failed to continue walking with ''b''.');
      is_failed := True;
    end;

    data := trie_state_get_data(trie_state);
    if data <> 1 then begin
      WriteLn('Retrieved data for key ''ab'' is ', data, ', not 1.');
      is_failed := True;
    end;

    msg_step('Try walking further with ''c''');
    if not trie_state_walk(trie_state, uint32('c')) then begin
      WriteLn('Failed to continue walking with ''c''.');
      is_failed := True;
    end;

    data := trie_state_get_data(trie_state);
    if data <> 2 then begin
      WriteLn('Retrieved data for key ''abc'' is ', data, ', not 2.');
      is_failed := True;
    end;

    trie_state_free(trie_state);

    if is_failed then begin
      WriteLn('Errors found in terminal state data retrieval.');
      //        goto err_trie_created;
    end;

    trie_free(test_trie);
    //    return 0;
    //
    //err_trie_created:
    //    trie_free (test_trie);
    //err_trie_not_created:

  end;

begin
  main;
end.
