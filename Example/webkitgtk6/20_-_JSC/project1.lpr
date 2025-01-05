program project1;

uses
  ctypes,
  fp_glib2,
  fp_JSC;


  // https://www.perplexity.ai/search/was-ist-jsc-welchec-bei-webkit-w5K_F7JCQYixjpJh3a5keA

  function main(argc: cint; argv: PPChar): cint;
  var
    ctx: PJSCContext;
    res: PJSCValue;
    Value: Tgint32;
    s: pchar;
  begin
    ctx := jsc_context_new;
    res := jsc_context_evaluate(ctx, 'var x = 2; var y = 3; x + y;', -1);
    Value := jsc_value_to_int32(res);

    g_printf('Das Ergebnis von 2 + 3 ist:  %d'#10, Value);

    g_object_unref(res);
    g_object_unref(ctx);
  end;

begin
  main(argc, argv);
end.
