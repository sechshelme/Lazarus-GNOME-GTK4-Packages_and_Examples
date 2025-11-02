program project1;

uses fp_expat;

//void startElement(void *userData, const char *name, const char **atts) {
//    for (int i = 0; i < depth; i++) printf("  "); // Einrückung je nach Tiefe
//    printf("Start-Tag: %s\n", name);
//
//    for (int i = 0; atts[i]; i += 2) {
//        const char *attrName = atts[i];
//        const char *attrValue = atts[i+1];
//        printf("              Attribut: %s = %s\n", attrName, attrValue);
//    }
//
//    depth++;
//}
//
//void endElement(void *userData, const char *name) {
//    depth--;
//    for (int i = 0; i < depth; i++) printf("  "); // Einrückung je nach Tiefe
//    printf("End-Tag: %s\n", name);
//}
//
//void characterData(void *userData, const char *s, int len) {
//    for (int i = 0; i < depth; i++) printf("  "); // Einrückung je nach Tiefe
//    printf("Text: %.*s\n", len, s);
//}

procedure main;
const  xml = '"<root><child><blublu1>Text</blublu1><Options><Version width="320" height="200"/><Version/></Options><blublu2>Text</blublu2></child></root>';
begin

  XML_Parser parser = XML_ParserCreate(NULL);
  XML_SetElementHandler(parser, startElement, endElement);
  XML_SetCharacterDataHandler(parser, characterData);

  if (XML_Parse(parser, xml, sizeof(xml) - 1, XML_TRUE) == XML_STATUS_ERROR) {
      fprintf(stderr, "Parse Error at line %lu:\n%s\n",
              XML_GetCurrentLineNumber(parser),
              XML_ErrorString(XML_GetErrorCode(parser)));
      XML_ParserFree(parser);
      return 1;
  }

  XML_ParserFree(parser);
end;

begin
  main;
end;

end.

