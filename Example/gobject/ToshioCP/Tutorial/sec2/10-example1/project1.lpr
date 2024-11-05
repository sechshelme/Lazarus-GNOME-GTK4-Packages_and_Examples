program project1;

uses
  ctypes,
  Math,
  glib280;

// https://github.com/ToshioCP/Gobject-tutorial/blob/main/gfm/sec2.md

  function main(argc: cint; argv: PPChar): cint;
  var
    instance1, instance2: PGObject;
    class1, class2: PGObjectClass;
  begin
    instance1 := g_object_new(G_TYPE_OBJECT, nil);
    instance2 := g_object_new(G_TYPE_OBJECT, nil);
    g_print('The address of instance1 is %p'#10, instance1);
    g_print('The address of instance1 is %p'#10, instance2);

    class1 := G_OBJECT_GET_CLASS(instance1);
    class2 := G_OBJECT_GET_CLASS(instance2);

    g_print('The address of the class of instance1 is %p'#10, class1);
    g_print('The address of the class of instance1 is %p'#10, class2);

    g_object_unref(instance1);
    g_object_unref(instance2);

    Exit(0);
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
end.
