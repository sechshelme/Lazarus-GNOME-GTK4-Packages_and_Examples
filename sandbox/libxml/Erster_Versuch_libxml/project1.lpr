program project1;

uses
  xmlstring,
  dict,
  encoding,
  xmlIO,
  tree,
  parser,             // {$ifdef LIBXML_SAX1_ENABLED}

  Math, xml2_common;

procedure loadSongsFromXML( path:PChar);
begin
      doc := xmlParseFile(path);
end;



begin
  xmlValidateNCName();


  loadSongsFromXML('config.xml');
end.
