program project1;

uses
  xml2_common,

  xmlstring,          // io.
  list,               // io.
  dict,               // io. -> xmlstring
  hash,               // io. -> xmlstring, dict
  tree,               // -> xmlstring, dict     ( Pointer wegen unit circular )
  encoding,           // io. -> tree
  xmlerror,           // io. -> tree
  xmlIO,              // io. -> xmlstring, encoding, tree
  xmlregexp,          // io. -> xmlstring, dict, tree
  xmlautomata,        // io. -> xmlstring, xmlregexp
  valid,              // io. -> tree, list, xmlstring, xmlautomata
  parser,             // io. -> xmlstring, tree, valid, dict, hash, xmlerror, encoding, xmlIO

  xpath,

  Math;

procedure loadSongsFromXML( path:PChar);
var
  doc: TxmlDocPtr;
begin
      doc := xmlParseFile(path);
      if doc=nil then WriteLn('Fehler beim öffnen der doc');

      context := xmlXPathNewContext(doc);
end;



begin
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);


  loadSongsFromXML('config.xml');
//  xmlValidateNCName(nil, 0);


end.
