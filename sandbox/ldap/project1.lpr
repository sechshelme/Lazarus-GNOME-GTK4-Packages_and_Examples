program project1;
uses
ldap_features,
ldap_utf8,
ldap_schema,
openldap,
fp_ldap;          //   ldap_features
procedure main;
begin
      LDAP *ld;
    int rc;

    // Zugangsdaten für den öffentlichen Test-Server (ldap.forumsys.com)
    char *ldap_uri = "ldap://ldap.forumsys.com";
    char *bind_dn  = "cn=read-only-admin,dc=example,dc=com";
    char *bind_pw  = "password";

    // Suchparameter
    char *base_dn  = "dc=example,dc=com";
    char *filter   = "(uid=tesla)"; // Wir suchen nach dem Benutzer "tesla"

    // 1. LDAP-Sitzung initialisieren
    // ---------------------------------------------------------
    rc = ldap_initialize(&ld, ldap_uri);
    if (rc != LDAP_SUCCESS) {
        fprintf(stderr, "ldap_initialize fehlgeschlagen: %s\n", ldap_err2string(rc));
        return 1;
    }

    // 2. LDAP-Version auf 3 setzen (Wichtig: Default ist oft veraltet)
    // ---------------------------------------------------------
    int version = LDAP_VERSION3;
    rc = ldap_set_option(ld, LDAP_OPT_PROTOCOL_VERSION, &version);
    if (rc != LDAP_SUCCESS) {
        fprintf(stderr, "Konnte Protokollversion nicht setzen: %s\n", ldap_err2string(rc));
        ldap_unbind_ext_s(ld, NULL, NULL);
        return 1;
    }

    // 3. Bind durchführen (Login)
    // ---------------------------------------------------------
    printf("Verbinde zu %s...\n", ldap_uri);
    struct berval cred;
    cred.bv_val = bind_pw;
    cred.bv_len = strlen(bind_pw);

    // Wir nutzen ldap_sasl_bind_s mit LDAP_SASL_SIMPLE als modernen Ersatz für ldap_simple_bind_s
    rc = ldap_sasl_bind_s(ld, bind_dn, LDAP_SASL_SIMPLE, &cred, NULL, NULL, NULL);

    if (rc != LDAP_SUCCESS) {
        fprintf(stderr, "LDAP Bind Fehler: %s\n", ldap_err2string(rc));
        ldap_unbind_ext_s(ld, NULL, NULL);
        return 1;
    }
    printf("Erfolgreich eingeloggt als: %s\n", bind_dn);

    // 4. Suche durchführen
    // ---------------------------------------------------------
    LDAPMessage *result_msg = NULL;

    rc = ldap_search_ext_s(
        ld,
        base_dn,
        LDAP_SCOPE_SUBTREE,
        filter,
        NULL, // Attribute: NULL = alle abrufen
        0,    // attrsonly: 0 = Werte und Typen
        NULL, NULL, NULL, 0,
        &result_msg
    );

    if (rc != LDAP_SUCCESS) {
        fprintf(stderr, "LDAP Suche fehlgeschlagen: %s\n", ldap_err2string(rc));
        ldap_unbind_ext_s(ld, NULL, NULL);
        return 1;
    }

    // 5. Ergebnisse verarbeiten
    // ---------------------------------------------------------
    int count = ldap_count_entries(ld, result_msg);
    printf("Anzahl gefundener Einträge: %d\n", count);

    LDAPMessage *entry;
    for (entry = ldap_first_entry(ld, result_msg);
         entry != NULL;
         entry = ldap_next_entry(ld, entry)) {

        char *dn = ldap_get_dn(ld, entry);
        if (dn) {
            printf("Gefundener DN: %s\n", dn);
            ldap_memfree(dn);
        }
    }

    // 6. Aufräumen
    // ---------------------------------------------------------
    ldap_msgfree(result_msg);       // Suchergebnis freigeben
    ldap_unbind_ext_s(ld, NULL, NULL); // Verbindung trennen und Speicher freigeben

end;

begin
  main;
end.

