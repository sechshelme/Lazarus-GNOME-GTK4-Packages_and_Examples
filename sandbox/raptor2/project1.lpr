program project1;
uses
fp_raptor2;

procedure main;
begin
end;

begin
  main;
end.



// --- Triples Handler Funktion ---
static void triple_handler(void* user_data, raptor_statement* statement) {
    (void)user_data;

    printf("--- TRIPEL GEFUNDEN ---\n");

    // KORREKTUR: Verwende raptor_statement_print_as_ntriples
    raptor_statement_print_as_ntriples(statement, stdout);
    printf("\n");
}

int main(int argc, char** argv) {
    raptor_world* world = NULL;
    raptor_parser* parser = NULL;

    const char* rdf_content =
        "<?xml version=\"1.0\"?>\n"
        "<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"\n"
        "         xmlns:ex=\"http://example.org/terms/\">\n"
        "  <rdf:Description rdf:about=\"http://example.org/book/123\">\n"
        "    <ex:title>C-Beispiel mit Raptor2</ex:title>\n"
        "    <ex:author>Gemini AI</ex:author>\n"
        "  </rdf:Description>\n"
        "</rdf:RDF>";

    // 1. World initialisieren
    world = raptor_new_world();
    if (!world) {
        fprintf(stderr, "Fehler: Konnte raptor world nicht initialisieren.\n");
        return EXIT_FAILURE;
    }

    // 2. Parser erstellen
    parser = raptor_new_parser(world, "rdfxml");
    if (!parser) {
        fprintf(stderr, "Fehler: Konnte RDF/XML-Parser nicht erstellen.\n");
        raptor_free_world(world);
        return EXIT_FAILURE;
    }

    // 3. Den Triples-Handler setzen
    raptor_parser_set_statement_handler(parser, NULL, triple_handler);

    // 4. Den String parsen (mit Start und Chunk)
    printf("Starte das Parsen des RDF/XML-Strings...\n\n");

    raptor_uri* base_uri = raptor_new_uri(world, (const unsigned char*)"http://example.org/base");
    int result = 0;

    // A. Parsing starten
    result = raptor_parser_parse_start(parser, base_uri);
    if (result != 0) {
        fprintf(stderr, "Fehler: Start des Parsens fehlgeschlagen (Fehlercode %d).\n", result);
        raptor_free_uri(base_uri);
        raptor_free_parser(parser);
        raptor_free_world(world);
        return EXIT_FAILURE;
    }

    // B. Den String-Inhalt als "Chunk" parsen (KORREKTUR für parse_string)
    result = raptor_parser_parse_chunk(
        parser,
        (const unsigned char*)rdf_content,
        strlen(rdf_content),
        1 // is_end = 1, da dies der letzte Chunk ist.
    );

    if (result != 0) {
        fprintf(stderr, "Fehler: Parsen des Chunks fehlgeschlagen (Fehlercode %d).\n", result);
    } else {
        printf("\nParsen erfolgreich abgeschlossen.\n");
    }

    // 5. Aufräumen
    raptor_free_uri(base_uri);
    raptor_free_parser(parser);
    raptor_free_world(world);

    return (result == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}

