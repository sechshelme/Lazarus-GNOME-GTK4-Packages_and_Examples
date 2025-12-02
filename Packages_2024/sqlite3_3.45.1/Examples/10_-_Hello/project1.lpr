program project1;

uses
  fp_sqlite3;

  function callback(para1: pointer; para2: longint; para3: PPchar; para4: PPchar): longint; cdecl;
  var
    i: integer;
  begin
    for  i := 0 to para2 - 1 do begin
      WriteLn(para4[i], ' =  ', para3[i]);
    end;
    WriteLn();
    Result := 0;
  end;

  procedure main;
  var
    rc: longint;
    db: Psqlite3 = nil;
    zErrMsg: pchar = nil;
  const
    sql_create =
      'CREATE TABLE IF NOT EXISTS person (id INTEGER PRIMARY KEY, name TEXT NOT NULL, age INTEGER, size  REAL);';

    sql_insert =
      'INSERT INTO person (name, age, size) VALUES (''Alice'', 30, 1.75);';

    sql_select =
      'SELECT id, name, age, size FROM person;';

  begin
    rc := sqlite3_open('test.db', @db);
    if rc <> SQLITE_OK then begin
      WriteLn('Kann Datenbank nicht öffnen: ', sqlite3_errmsg(db));
      sqlite3_close(db);
      Exit;
    end;

    rc := sqlite3_exec(db, sql_create, nil, nil, @zErrMsg);
    if rc <> SQLITE_OK then begin
      WriteLn('SQL-Fehler (CREATE): ', zErrMsg);
      sqlite3_free(zErrMsg);
      sqlite3_close(db);
      Exit;
    end;

    rc := sqlite3_exec(db, sql_insert, nil, nil, @zErrMsg);
    if rc <> SQLITE_OK then begin
      WriteLn('SQL-Fehler (INSERT): ', zErrMsg);
      sqlite3_free(zErrMsg);
      sqlite3_close(db);
      Exit;
    end;

    rc := sqlite3_exec(db, sql_select, @callback, nil, @zErrMsg);
    if rc <> SQLITE_OK then begin
      WriteLn('SQL-Fehler (SELECT): ', zErrMsg);
      sqlite3_free(zErrMsg);
      sqlite3_close(db);
      Exit;
    end;

    sqlite3_close(db);
  end;

begin
  main;
end.
