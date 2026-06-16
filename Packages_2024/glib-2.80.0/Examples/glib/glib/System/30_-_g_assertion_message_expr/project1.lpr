program project1;

uses
  fp_glib2;


procedure test_add(para1: pointer); cdecl;
begin
  g_printf('---'#10);
  g_assert(True);
  g_printf('---'#10);
  g_assert(False);
  g_printf('---'#10);
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
    g_printf('------------'#10);

    g_assertion_message_expr(G_LOG_DOMAIN, {$I %FILE%}, i, 'error', 'gFALSE');
  end;

procedure main;
begin
  assetr1;
  assert2;
  g_printf('ende'#10);
end;

begin
     main;
end.
