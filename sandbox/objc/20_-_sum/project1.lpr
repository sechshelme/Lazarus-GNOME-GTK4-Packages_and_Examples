program project1;

uses
  fp_objc;

  procedure set_value_cb(self: Tid; cmd: TSEL; newValue: integer); cdecl;
  var
    cls: TClass;
    ivar: TIvar;
    name: string;
    val1: Pointer;
  begin
    name := sel_getName(cmd);
    cls := object_getClass(self);
    case name of
      'setVal1:': begin
        ivar := class_getInstanceVariable(cls, 'Int1');
      end;
      'setVal2:': begin
        ivar := class_getInstanceVariable(cls, 'Int2');
      end;
      else begin
        WriteLn('Unbekannt: ', name);
      end;
    end;

    val1 := pbyte(self) + ivar_getOffset(ivar);
    PInteger(val1)^ := newValue;
  end;

  function get_value_cb(self: Tid; _cmd: TSEL): integer;
  var
    cls: TClass;
    ivar1, ivar2: TIvar;
    val1, val2: Pointer;
  begin
    cls := object_getClass(self);
    ivar1 := class_getInstanceVariable(cls, 'Int1');
    ivar2 := class_getInstanceVariable(cls, 'Int2');

    val1 := pbyte(self) + ivar_getOffset(ivar1);
    val2 := pbyte(self) + ivar_getOffset(ivar2);

    Result := PInteger(val1)^ + PInteger(val2)^;
  end;

type
  TSetterIMP = procedure(self: Tid; _cmd: TSEL; value: integer); cdecl;
  TGetterIMP = function(self: Tid; _cmd: TSEL): integer; cdecl;

  procedure print_class_info(cls: TClass);
  var
    ivars: PIvar;
    Count: DWord = 0;
    i: integer;
    methods: PMethod;
    sel: TSEL;
  begin
    WriteLn(' --- Inspektion der Klasse: ', class_getName(cls));

    ivars := class_copyIvarList(cls, @Count);
    for  i := 0 to Count - 1 do begin
      WriteLn('  Variable [', i, ']: ', ivar_getName(ivars[i]), ' (Typ: ', ivar_getTypeEncoding(ivars[i]), ', Offset: ', ivar_getOffset(ivars[i]), ')');
    end;
    objc_free(ivars);

    methods := class_copyMethodList(cls, @Count);
    for  i := 0 to Count - 1 do begin
      sel := method_getName(methods[i]);
      WriteLn('  Methode  [', i, ']: ', sel_getName(sel), ' (Typ: ', method_getTypeEncoding(methods[i]), ')');
    end;
    objc_free(methods);

    WriteLn(#10);
  end;

  procedure main;
  var
    baseCls, newCls: TClass;
    myObj: Tid;
    setVal1, setVal2: TSetterIMP;
    getSum: TGetterIMP;
    res: integer;
    setVal1_ID, setVal2_ID, getVal_ID: TSEL;
  begin
    baseCls := objc_getClass('Object');
    newCls := objc_allocateClassPair(baseCls, 'MyClass', 0);

    class_addIvar(newCls, 'Int1', sizeof(integer), 0, 'i');
    class_addIvar(newCls, 'Int2', sizeof(integer), 0, 'i');

    setVal1_ID := sel_getUid('setVal1:');
    setVal2_ID := sel_getUid('setVal2:');
    getVal_ID := sel_getUid('getVal:');

    class_addMethod(newCls, setVal1_ID, TIMP(@set_value_cb), 'v@:i');
    class_addMethod(newCls, setVal2_ID, TIMP(@set_value_cb), 'v@:i');
    class_addMethod(newCls, getVal_ID, TIMP(@get_value_cb), 'i@:');

    objc_registerClassPair(newCls);
    myObj := class_createInstance(newCls, 0);

    setVal1 := TSetterIMP(class_getMethodImplementation(newCls, setVal1_ID));
    setVal1(myObj, setVal1_ID, 100);

    setVal2 := TSetterIMP(class_getMethodImplementation(newCls, setVal2_ID));
    setVal2(myObj, setVal2_ID, 200);

    getSum := TGetterIMP(class_getMethodImplementation(newCls, getVal_ID));
    res := integer(getSum(myObj, getVal_ID));

    Write('Ergebnis der Summe: ', res, #10#10);

    print_class_info(newCls);
    print_class_info(baseCls);

    object_dispose(myObj);
    objc_disposeClassPair(newCls);
  end;

begin
  main;
end.
