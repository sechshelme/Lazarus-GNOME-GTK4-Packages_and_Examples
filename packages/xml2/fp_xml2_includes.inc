

{$include xml/xml2_common.inc}         // io.
{$include xml/xmlversion.inc}         // io.
{$include xml/xmlstring.inc}          // io.
{$include xml/list.inc}               // io.
{$include xml/dict.inc}               // io. -> xmlstring
{$include xml/hash.inc}               // io. -> xmlstring, dict
{$include xml/tree.inc}               // -> xmlstring, dict     ( Pointer wegen unit circular in: xmlIO, parser)
{$include xml/entities.inc}           // io. -> xmlstring, tree
{$include xml/encoding.inc}           // io. -> tree
{$include xml/xmlIO.inc}              // io. -> xmlstring, encoding, tree
{$include xml/xmlerror.inc}           // io. -> tree
{$include xml/xmlregexp.inc}          // io. -> xmlstring, dict, tree
{$include xml/xmlautomata.inc}        // io. -> xmlstring, xmlregexp
{$include xml/valid.inc}              // io. -> tree, list, xmlstring, xmlautomata
{$include xml/parser.inc}             // io. -> xmlstring, tree, valid, dict, hash, xmlerror, encoding, xmlIO, entities
{$include xml/xpath.inc}              // io. -> xmlstring, xmlerror, tree, hash, dict
{$include xml/chvalid.inc}            // io.
{$include xml/xmlmemory.inc}          // io.
{$include xml/globals.inc}            // io. -> tree, encoding, parser, xmlerror, xmlmemory, xmlIO
{$include xml/xmlwriter.inc}          // io. -> xmlstring, tree, xmlIO, parser
{$include xml/HTMLparser.inc}         // io. -> xmlstring, xmlIO, tree, parser, encoding
{$include xml/parserInternals.inc}    // io. -> xmlstring, tree, encoding, HTMLparser, chvalid, entities, parser
{$include xml/schemasInternals.inc}   // io. -> xmlstring, xmlregexp, tree, hash, dict
{$include xml/xpathInternals.inc}     // io. -> xmlstring, xpath, tree
{$include xml/xmlschemas.inc}         // io. -> xmlerror, tree, encoding, schemasInternals, xmlIO, parser
{$include xml/relaxng.inc}            // io. -> xmlstring, xmlerror, tree
{$include xml/xmlreader.inc}          // io. -> xmlstring, xmlschemas, xmlIO, xmlerror, tree, relaxng, schemasInternals
{$include xml/xlink.inc}              // io. -> xmlstring, tree
{$include xml/xmlunicode.inc}         // io.
{$include xml/catalog.inc}            // io. -> xmlstring, tree
{$include xml/debugXML.inc}           // io. -> xmlstring, tree, xpath
{$include xml/SAX.inc}                // io. -> xmlstring, tree, parser, entities
{$include xml/SAX2.inc}               // io. -> xmlstring, tree, parser, entities
{$include xml/nanoftp.inc}            // io.
{$include xml/schematron.inc}         // io. -> xmlerror, tree
{$include xml/xmlschemastypes.inc}    // io. -> xmlstring, xmlschemas, tree, schemasInternals
{$include xml/c14n.inc}               // io. -> xmlstring, tree, xpath, xmlIO
{$include xml/DOCBparser.inc}         // io. -> xmlstring, encoding, tree, parser
{$include xml/HTMLtree.inc}           // io. -> xmlstring, tree, HTMLparser, xmlIO
{$include xml/xpointer.inc}           // io. -> xmlstring, xpath, tree
{$include xml/pattern.inc}            // io. -> xmlstring, dict, tree
{$include xml/uri.inc}                // io. -> xmlstring
{$include xml/xinclude.inc}           // io. -> xmlstring, tree
{$include xml/xmlsave.inc}            // io. -> xmlIO, tree, encoding
{$include xml/nanohttp.inc}           // io.
{$include xml/threads.inc}            // io. -> globals
{$include xml/xmlmodule.inc}          // io.





