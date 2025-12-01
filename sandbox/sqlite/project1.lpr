program project1;
uses
fp_sqlite3,
//fp_sqlite3ext,


ctypes;


//static int callback(void *NotUsed, int argc, char **argv, char **azColName)
//{
//    (void)NotUsed; /* unused */
//
//    for (int i = 0; i < argc; i++) {
//        printf("%s = %s\n",
//               azColName[i],
//               argv[i] ? argv[i] : "NULL");
//    }
//    printf("\n");
//    return 0;
//}


procedure main;
begin
  int main(void)
{
    sqlite3 *db = NULL;
    char *zErrMsg = NULL;
    int rc;

    /* Datenbank öffnen/erzeugen */
    rc = sqlite3_open("test.db", &db);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "Kann Datenbank nicht öffnen: %s\n",
                sqlite3_errmsg(db));
        sqlite3_close(db);
        return EXIT_FAILURE;
    }

    /* Tabelle erzeugen */
    const char *sql_create =
        "CREATE TABLE IF NOT EXISTS person ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT NOT NULL,"
        "age  INTEGER"
        ");";

    rc = sqlite3_exec(db, sql_create, NULL, NULL, &zErrMsg);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "SQL-Fehler (CREATE): %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        sqlite3_close(db);
        return EXIT_FAILURE;
    }

    /* Datensatz einfügen */
    const char *sql_insert =
        "INSERT INTO person (name, age) "
        "VALUES ('Alice', 30);";

    rc = sqlite3_exec(db, sql_insert, NULL, NULL, &zErrMsg);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "SQL-Fehler (INSERT): %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        sqlite3_close(db);
        return EXIT_FAILURE;
    }

    /* Daten auswählen und über callback ausgeben */
    const char *sql_select =
        "SELECT id, name, age FROM person;";

    rc = sqlite3_exec(db, sql_select, callback, NULL, &zErrMsg);
    if (rc != SQLITE_OK) {
        fprintf(stderr, "SQL-Fehler (SELECT): %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        sqlite3_close(db);
        return EXIT_FAILURE;
    }

    sqlite3_close(db);
    return EXIT_SUCCESS;
}

end;
begin
    sqlite3_compileoption_used(nil);

    main;
end.

