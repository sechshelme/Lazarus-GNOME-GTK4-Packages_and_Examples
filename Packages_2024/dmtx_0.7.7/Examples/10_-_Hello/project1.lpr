program project1;

uses
  fp_dmtx;

  procedure main;
  const
    text = 'Hello World !';
  var
    enc: PDmtxEncode;
    img: PDmtxImage;
    height, width: longint;
    x, y: integer;
    pxl: pbyte;
    brightness: byte;
  begin
    enc := dmtxEncodeCreate;
    if enc = nil then begin
      WriteLn('Encoding failed!');
      Exit;
    end;

    dmtxEncodeSetProp(enc, DmtxPropModuleSize, 1);
    dmtxEncodeSetProp(enc, DmtxPropMarginSize, 1);
    dmtxEncodeDataMatrix(enc, Length(text), text);

    img := enc^.image;
    width := dmtxImageGetProp(img, DmtxPropWidth);
    height := dmtxImageGetProp(img, DmtxPropHeight);

    WriteLn('DataMatrix ', width, 'x', height);

    Write(#27'[1;37m'#10);
    for x := 0 to width + 1 do begin
      Write('██');
    end;
    WriteLn;

    for  y := 0 to height - 1 do begin
      Write('██');
      for x := 0 to width - 1 do begin
        pxl := @img^.pxl[(y * width + x) * 3];
        brightness := (pxl[0] + pxl[1] + pxl[2]) div 3;

        if brightness < 128 then begin
          Write('  ');
        end else begin
          Write('██');
        end;
      end;
      WriteLn('██');
    end;

    for x := 0 to width + 1 do begin
      Write('██');
    end;
    WriteLn(#27'[0m'#10#10#10);


    dmtxEncodeDestroy(@enc);
  end;

begin
  main;
end.
