program project1;

uses
  ctypes,

  //JSCClass,           // io.
  //JSCValue,           // io. -> JSCClass
  //JSCVirtualMachine,  // io.
  //JSCException,       // io.
  //JSCContext,         // io. -> JSCValue, JSCClass, JSCException, JSCVirtualMachine
  //JSCOptions,         // io.
  //JSCVersion,         // io.
  //JSCWeakValue,       // io.
  //

  fp_glib2,
  fp_JSC;


// https://www.perplexity.ai/search/was-ist-jsc-welchec-bei-webkit-w5K_F7JCQYixjpJh3a5keA

  function main(argc: cint; argv: PPChar): cint;
  var
    ctx: PJSCContext;
    res: PJSCValue;
    value: Tgint32;
  begin
     ctx:= jsc_context_new;
     res:=jsc_context_evaluate(ctx,'2 + 3',-1);
     value:=jsc_value_to_int32(res);

     g_printf('Das Ergebnis von 2 + 3 ist:  %d'#10, value);

     g_object_unref(res);
     g_object_unref(ctx);
  end;

begin
  main(argc, argv);
end.
