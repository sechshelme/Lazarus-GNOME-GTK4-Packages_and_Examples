

// https://www.perplexity.ai/search/wie-offne-ich-eine-solche-xml-FJBas6hbSDiDBvaBdQKXaw

// gcc -o main main.c `pkg-config --cflags --libs libxml-2.0`

#include <stdio.h>
#include <libxml/parser.h>
#include <libxml/xpath.h>
#include <libxml/xmlwriter.h>
#include <libxml/xmlreader.h>
#include <libxml/schemasInternals.h>
#include <libxml/xpathInternals.h>
#include <libxml/chvalid.h>
#include <libxml/debugXML.h>
#include <libxml/catalog.h>
#include <libxml/schematron.h>
#include <libxml/nanoftp.h>
#include <libxml/HTMLtree.h>
#include <libxml/xmlsave.h>
#include <libxml/pattern.h>

void loadSongsFromXML(const char* path) {
    xmlDocPtr doc;
    xmlXPathContextPtr context;
    xmlXPathObjectPtr result;
    xmlNodeSetPtr nodeset;
    int i;

    // XML-Datei laden
    doc = xmlParseFile(path);
    if (doc == NULL) {
        fprintf(stderr, "Fehler beim Öffnen der XML-Datei\n");
        return;
    }

    // XPath-Kontext erstellen
    context = xmlXPathNewContext(doc);
    if (context == NULL) {
        fprintf(stderr, "Fehler beim Erstellen des XPath-Kontexts\n");
        xmlFreeDoc(doc);
        return;
    }

    // XPath-Ausdruck auswerten
    result = xmlXPathEvalExpression((xmlChar*)"//songs/items/@song", context);
    if (result == NULL) {
        fprintf(stderr, "Fehler bei der XPath-Auswertung\n");
        xmlXPathFreeContext(context);
        xmlFreeDoc(doc);
        return;
    }

    nodeset = result->nodesetval;
    if (nodeset) {
        for (i = 0; i < nodeset->nodeNr; i++) {
            xmlNodePtr node = nodeset->nodeTab[i];
            xmlChar* song = xmlNodeGetContent(node);
            if (song) {
                printf("Song: %s\n", song);
                // Hier würden Sie den Song zu Ihrer Liste hinzufügen
                // z.B.: addToList((char*)song);
                xmlFree(song);
            }
        }
    }

    // Aufräumen
    xmlXPathFreeObject(result);
    xmlXPathFreeContext(context);
    xmlFreeDoc(doc);
    xmlCleanupParser();
}

int main() {
    loadSongsFromXML("config.xml");
    return 0    ;


  int * p = xmlMalloc(1000);
  xmlFree(p);



}



