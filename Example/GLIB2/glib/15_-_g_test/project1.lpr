program project1;

uses
  ctypes,
  fp_glib2;

type
  TMyFixture=record
    value:Integer;
    s:PChar;
  end;
  PMyFixture=^TMyFixture;

  procedure setup(fixture: Tgpointer; user_data: Tgconstpointer); cdecl;
  var
    MyFixture:PMyFixture absolute fixture;
  begin
    g_printf('setup'#10);
    MyFixture^.value:=123;
    MyFixture^.s:=g_strdup('Hello World');
    g_printf(#10);
 end;

  procedure runner(fixture: Tgpointer; user_data: Tgconstpointer); cdecl;
  var
    MyFixture:PMyFixture absolute fixture;
  begin
    g_printf('runner'#10);
    g_printf('value: %d'#10, MyFixture^.value);
    g_printf('Str:   %s'#10, MyFixture^.s);
    g_printf(#10);
  end;

  procedure teardown(fixture: Tgpointer; user_data: Tgconstpointer); cdecl;
  var
    MyFixture:PMyFixture absolute fixture;
  begin
    g_printf('teardown'#10);
    g_printf(#10);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    MyFixture:TMyFixture;
  begin
    g_test_init(@argc,@argv,nil);
    g_test_add_vtable('/mytest/rest', SizeOf(TMyFixture),@MyFixture,@setup,@runner,@teardown);
    g_test_run;
  end;

begin
  main(argc, argv);
end.
