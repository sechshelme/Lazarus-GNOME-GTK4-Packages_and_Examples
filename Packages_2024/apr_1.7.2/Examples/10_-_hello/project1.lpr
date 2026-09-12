program project1;

uses
  fp_apr;

  procedure main;
  var
    main_pool, work_pool: Papr_pool_t;
    temp: PChar;
    i: Integer;
  begin
    apr_initialize;

    apr_pool_create(@main_pool, nil);
    apr_pool_create(@work_pool, main_pool);

    for  i := 1 to 3 do begin
        temp := apr_psprintf(work_pool, 'Temporäre Daten für Durchgang %d', i);
        WriteLn('Loop ',i:3,': ', temp);

        apr_pool_clear(work_pool);
        WriteLn('   (Arbeits-Pool wurde geleert)');
    end;

    apr_pool_destroy(main_pool);
    apr_terminate;
  end;


begin
  main;
end.
