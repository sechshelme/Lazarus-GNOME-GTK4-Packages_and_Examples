program project1;

uses
  fp_objc;


  procedure set_value1_callback(self: Tid; _cmd: TSEL; newValue: integer); cdecl;
  var
    cls: TClass;
    ivar: TIvar;
    targetPtr: PInteger;
  begin
    cls := object_getClass(self);
    ivar := class_getInstanceVariable(cls, 'myInt1');
    targetPtr := PInteger(PChar(self) + ivar_getOffset(ivar));
    targetPtr^ := newValue;
  end;

  procedure set_value2_callback(self: Tid; _cmd: TSEL; newValue: integer); cdecl;
  var
    cls: TClass;
    ivar: TIvar;
    targetPtr: PInteger;
  begin
    cls := object_getClass(self);
    ivar := class_getInstanceVariable(cls, 'myInt2');
    targetPtr := PInteger(pbyte(self) + ivar_getOffset(ivar));
    targetPtr^ := newValue;
  end;

  function calculate_sum_callback(self: Tid; _cmd: TSEL): integer;
  var
    cls: TClass;
    ivar1, ivar2: TIvar;
    val1, val2: PInteger;
  begin
    cls := object_getClass(self);
    ivar1 := class_getInstanceVariable(cls, 'myInt1');
    ivar2 := class_getInstanceVariable(cls, 'myInt2');

    val1 := PInteger(pbyte(self) + ivar_getOffset(ivar1));
    val2 := PInteger(pbyte(self) + ivar_getOffset(ivar2));
    Result := val1^ + val2^;
  end;

type
  TSetterIMP = procedure(self: Tid; _cmd: TSEL; value: integer); cdecl;
  TGetterIMP = function(self: Tid; _cmd: TSEL): integer; cdecl;

  procedure main;
  var
    baseCls, newCls: TClass;
    myObj: Tid;
    setVal1, setVal2: TSetterIMP;
    getSum: TGetterIMP;
    res: integer;
  begin
    baseCls := objc_getClass('Object');
    newCls := objc_allocateClassPair(baseCls, 'CalculatorClass', 0);

    // 1. ZWEI Variablen hinzufügen
    class_addIvar(newCls, 'myInt1', sizeof(integer), 4, 'i');
    class_addIvar(newCls, 'myInt2', sizeof(integer), 4, 'i');

    // 2. Methoden registrieren
    class_addMethod(newCls, sel_getUid('setVal1:'), TIMP(@set_value1_callback), 'v@:i');
    class_addMethod(newCls, sel_getUid('setVal2:'), TIMP(@set_value2_callback), 'v@:i');
    class_addMethod(newCls, sel_getUid('sum'), TIMP(@calculate_sum_callback), 'i@:');

    objc_registerClassPair(newCls);
    myObj := class_createInstance(newCls, 0);

    // 3. Werte über die "Brücke" setzen
    setVal1 := TSetterIMP(class_getMethodImplementation(newCls, sel_getUid('setVal1:')));
    setVal1(myObj, sel_getUid('setVal1:'), 100);

    setVal2 := TSetterIMP(class_getMethodImplementation(newCls, sel_getUid('setVal2:')));
    setVal2(myObj, sel_getUid('setVal2:'), 200);

    // 4. Summe abrufen
    getSum := TGetterIMP(class_getMethodImplementation(newCls, sel_getUid('sum')));
    res := integer(getSum(myObj, sel_getUid('sum')));

    Write('Ergebnis der Summe: ', res);

    //print_class_info(newCls);
    //print_class_info(baseCls);

    // Cleanup
    object_dispose(myObj);
    objc_disposeClassPair(newCls);
  end;

begin
  main;
end.
