program project1;

uses
  ctypes,
  fp_GLIBTools,
  fp_glib2;

type
  THuman = record
    Name: Pgchar;
    age: Tgint;
    size: Tgdouble;
  end;
  PHuman = ^THuman;

const
  key = 'key';

  procedure destroyData(Data: Tgpointer); cdecl;
  var
    human: PHuman absolute Data;
  begin
    g_free(human^.Name);
    g_free(human);
  end;

  procedure setData(obj: PGObject);
  var
    human: PHuman;
  begin
    human := g_malloc(SizeOf(THuman));
    human^.Name := g_strdup('Hansulrich');
    human^.age := 53;
    human^.size := 1.86;
    g_object_set_data_full(obj, key, human, @destroyData);
  end;

  procedure getData(obj: PGObject);
  var
    human: PHuman;
  begin
    human := g_object_get_data(obj, key);

    g_printf('Name: %s   Age: %d   Size: %3.2f'#10, human^.Name, human^.age, human^.size);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    obj: PGObject;
  begin
    obj := g_object_new(G_TYPE_OBJECT, nil);

    setData(obj);
    getData(obj);

    g_object_unref(obj);
  end;

begin
  main(argc, argv);
end.
