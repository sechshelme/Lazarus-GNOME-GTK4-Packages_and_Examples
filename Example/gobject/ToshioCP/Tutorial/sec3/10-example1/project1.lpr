program project1;

uses
  ctypes,
  Math,
  glib280;

  // https://github.com/ToshioCP/Gobject-tutorial/blob/main/gfm/sec3.md

type
  TDouble = record
    parent: TGObject;
    Value: cdouble;
  end;

  TDoubleClass = record
    parent_class: TGObjectClass;
  end;

  procedure t_double_class_init(_class: TDoubleClass); cdecl;
  begin
  end;

  procedure t_double_init(self: TDouble); cdecl;
  begin
  end;

  function t_double_get_type: TGType; cdecl;
  const
    type_: TGType = 0;
  var
    info: TGTypeInfo;
  begin
    if type_ = 0 then begin
      info.class_size := SizeOf(TDoubleClass);
      info.base_init := nil;
      info.base_finalize := nil;
      info.class_init := TGClassInitFunc(@t_double_class_init);
      info.class_finalize := nil;
      info.class_data := nil;
      info.instance_size := SizeOf(TDouble);
      info.n_preallocs := 0;
      info.instance_init := TGInstanceInitFunc(@t_double_init);
      info.value_table := nil;
      type_ := g_type_register_static(G_TYPE_OBJECT, 'TDouble', @info, 0);
    end;
    Result := type_;
  end;

  function T_TYPE_DOUBLE: TGType;
  begin
    Result := t_double_get_type;
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    dtype: TGType;
    d: Tgpointer;
  begin
    dtype := T_TYPE_DOUBLE;
    if dtype <> 0 then begin
      g_print('Registration io, Der Typ ist %lx.'#10, dtype);
    end else begin
      g_print('Registration error'#10);
    end;

    d := g_object_new(T_TYPE_DOUBLE, nil);
    if d <> nil then begin
      g_print('Instanzing io. Adresse ist %p.'#10, d);
    end else begin
      g_print('Instanzing error');
    end;
    g_object_unref(d);

    Result := 0;
  end;

begin
  SetExceptionMask([exDenormalized, exInvalidOp, exOverflow, exPrecision, exUnderflow, exZeroDivide]);
  main(argc, argv);
end.
