program project1;

uses
  fp_mxml;

  procedure write_xml(filename: pchar);
  var
    xml, data, node: Pmxml_node;
    fp: PFILE;
  begin
    xml := mxmlNewXML('1.0');
    data := mxmlNewElement(xml, 'data');

    node := mxmlNewElement(data, 'node');
    mxmlNewText(node, 0, 'wert123');

    node := mxmlNewElement(data, 'node');
    mxmlNewText(node, 0, 'wert321');

    fp := fopen(filename, 'w');
    if fp = nil then begin
      WriteLn('Datei konnte nicht geöffnet werden');
      mxmlDelete(xml);
      Exit;;
    end;

    mxmlSaveFile(xml, fp, MXML_NO_CALLBACK);
    fclose(fp);
    mxmlDelete(xml);
  end;


  procedure read_xml(filename: pchar);
  var
    fp: PFILE;
    xml, data, node, text_node: Pmxml_node;
    text: pchar;
  begin
    fp := fopen(filename, 'r');
    if fp = nil then begin
      WriteLn('Datei konnte nicht geöffnet werden');
      Exit;
    end;

    xml := mxmlLoadFile(nil, fp, MXML_NO_CALLBACK);
    fclose(fp);

    if xml = nil then begin
      WriteLn('XML konnte nicht geladen werden');
      Exit;
    end;

    data := mxmlFindElement(xml, xml, 'data', nil, nil, MXML_DESCEND);
    if data = nil then begin
      WriteLn('Kein <data>-Element gefunden');
      mxmlDelete(xml);
      Exit;
    end;

    WriteLn('Inhalte im <data>-Element:');

    node := mxmlFindElement(data, xml, 'node', nil, nil, MXML_DESCEND);
    while node <> nil do begin
      text_node := mxmlGetFirstChild(node);
      if (text_node <> nil) and (mxmlGetType(text_node) = MXML_TEXT) then begin
        text := mxmlGetText(text_node, nil);
        if text <> nil then begin
          WriteLn(' - ', text);
        end;
      end;
      node := mxmlFindElement(node, xml, 'node', nil, nil, MXML_NO_DESCEND);
    end;

    mxmlDelete(xml);
  end;




  procedure main;
  const
    path = 'test.xml';
  begin
    write_xml(path);
    read_xml(path);
  end;

begin
  main;
end.
