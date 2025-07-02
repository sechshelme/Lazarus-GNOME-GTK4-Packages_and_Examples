program project1;

uses
  efl,
  fp_edje,
  fp_evas,
  fp_ecore,
  fp_ecore_evas;

const
  edjeFile = 'simple.edj';


  function main(argc: integer; argv: PPChar): integer;
  var
    ecore_evas: PEcore_Evas;
    evas: PEvas;
    edje_obj: PEvas_Object;
  begin
    if ecore_evas_init = 0 then begin
      WriteLn('Evas Init error');
      Exit;
    end;

    if edje_init = 0 then begin
      WriteLn('Edje Init error');
      ecore_evas_shutdown;
      Exit;
    end;

    ecore_evas := ecore_evas_new(nil, 0, 0, 400, 400, nil);
    if ecore_evas = nil then begin
      WriteLn('Could not create window');
      edje_shutdown;
      ecore_evas_shutdown;
      Exit;
    end;

    ecore_evas_show(ecore_evas);

    evas := ecore_evas_get(ecore_evas);
    edje_obj := edje_object_add(evas);

    if not edje_object_file_set(edje_obj, edjeFile, 'main') then begin
      WriteLn('Could not load edje file or part');
      evas_object_del(edje_obj);
      ecore_evas_free(ecore_evas);
      edje_shutdown;
      ecore_evas_shutdown;
      Exit;
    end;

    evas_object_resize(edje_obj, 400, 400);
    evas_object_move(edje_obj, 0, 0);

    evas_object_show(edje_obj);

    ecore_main_loop_begin();

    evas_object_del(edje_obj);
    ecore_evas_free(ecore_evas);
    edje_shutdown;
    ecore_evas_shutdown;

    Result:=0;
  end;

begin
  main(argc, argv);
end.
