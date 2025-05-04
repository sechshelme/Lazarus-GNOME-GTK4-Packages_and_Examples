program project1;

uses
  ctypes,
  fp_glib2;


  function main(argc: cint; argv: PPChar): cint;
  var
    quark, another_quark: TGQuark;
    s: Pgchar;
  begin
    quark := g_quark_from_string('my_quark');

    s := g_quark_to_string(quark);
    g_printf('GQuark: %u'#10, quark);
    g_printf('String: %s'#10, s);

    another_quark := g_quark_try_string('my_quark');
    if quark = another_quark then begin
      g_printf('both quarks are the same'#10);
    end;

    g_printf('from Quark: %3u'#10, g_quark_from_string('quark1'));
    g_printf('try Quark:  %3u'#10, g_quark_try_string('quark2'));
  end;

begin
  main(argc, argv);
end.
