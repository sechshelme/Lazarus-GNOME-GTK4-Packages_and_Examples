program project1;

uses
  fp_glib2;



procedure test_add(para1: pointer); cdecl;
begin
  WriteLn('---');
  g_assert(True);
  WriteLn('---');
  g_assert(False);
  WriteLn('---');
end;

procedure assetr1;
begin
  g_test_init(@argc, @argv, '--verbose',  nil);

  g_test_add_func('/mytest/add',@test_add);
  g_test_run;
  end;

  procedure assert2;
  var
    i, e: integer;
  begin
    val({$I %LINE%}, i, e);
    g_assert(False);
    WriteLn('------------');

    g_assertion_message_expr(G_LOG_DOMAIN, {$I %FILE%}, i, 'error', 'gFALSE');
  end;

begin
  assetr1;
  assert2;
  WriteLn('ende');
end.
