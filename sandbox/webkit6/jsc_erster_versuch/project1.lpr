program project1;

uses
  ctypes,

  JSCClass,           // io.
  JSCValue,           // io. -> JSCClass
  JSCVirtualMachine,  // io.
  JSCException,       // io.
  JSCContext,         // io. -> JSCValue, JSCClass, JSCException, JSCVirtualMachine


  fp_glib2;



  function main(argc: cint; argv: PPChar): cint;
  var
    ctx: JSCContext.PJSCContext;
  begin
     ctx:= jsc_context_new;
  end;

begin
  main(argc, argv);
end.
