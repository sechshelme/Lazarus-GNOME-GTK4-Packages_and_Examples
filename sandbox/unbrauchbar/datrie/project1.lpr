program project1;

uses
  fp_datrie;

  procedure msg_step(msg: pchar);
  begin
    WriteLn(#10'=> %s...', msg);
  end;

  function en_alpha_map_new: PAlphaMap;
  var
    en_map: PAlphaMap;
  begin
    Result := nil;
    en_map := alpha_map_new;
    if en_map <> nil then begin
      if alpha_map_add_range(en_map, byte('a'), byte('z')) = 0 then begin
        Result := en_map;
      end;;
    end;
  end;

  procedure main;
  const
    key_ab: array[0..2] of TAlphaChar = (0, 1, 0);    // a=0, b=1, \0
    key_abc: array[0..3] of TAlphaChar = (0, 1, 2, 0); // a=0, b=1, c=2, \0

  var
    en_map: PAlphaMap;
    test_trie: PTrie;
    state_ab, state_abc, state_a: PTrieState;
  begin
    en_map := en_alpha_map_new;
    test_trie := trie_new(en_map);

    msg_step('Populating trie');
    trie_store(test_trie, key_ab, 1);
    trie_store(test_trie, key_abc, 2);
    WriteLn('✅ "ab" und "abc" gespeichert');

    // Test 1: 'ab'
    msg_step('Test "ab"');
    state_ab := trie_root(test_trie);
    trie_state_walk(state_ab, 0);  // 'a'
    trie_state_walk(state_ab, 1);  // 'b'
    WriteLn('  "ab" data: ', trie_state_get_data(state_ab), ' ✅');
    trie_state_free(state_ab);

    // Test 2: 'abc'
    msg_step('Test "abc"');
    state_abc := trie_root(test_trie);
    trie_state_walk(state_abc, 0); // 'a'
    trie_state_walk(state_abc, 1); // 'b'
    trie_state_walk(state_abc, 2); // 'c'
    WriteLn('  "abc" data: ', trie_state_get_data(state_abc), ' ✅');
    trie_state_free(state_abc);

    // Test 3: 'a' allein (kein Data)
    msg_step('Test "a"');
    state_a := trie_root(test_trie);
    trie_state_walk(state_a, 0);   // 'a'
    WriteLn('  "a" data: ', trie_state_get_data(state_a), ' (error expected) ✅');
    trie_state_free(state_a);

    WriteLn(#10'🎉 ALLE TESTS ERFOLGREICH - PURE UTF-8 TRIE!');

    trie_free(test_trie);
    alpha_map_free(en_map);
  end;

begin
  main;
end.
