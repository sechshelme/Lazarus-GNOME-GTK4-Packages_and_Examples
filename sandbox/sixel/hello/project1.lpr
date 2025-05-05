program project1;

uses
  sixel;

  procedure main;
  var
    i: integer;
  begin
    // Sixel-Bildgröße: 90x20 Pixel
    Write(#27, 'Pq"1;1;90;20');

    // Farben definieren:
    // #1: Rot (100% Rot, 0% Grün, 0% Blau)
    // #2: Blau (0% Rot, 0% Grün, 100% Blau)
    // #3: Gelb (100% Rot, 100% Grün, 0% Blau)
    Write('#1;2;100;0;0');    // Rot
    Write('#2;2;0;0;100');    // Blau
    Write('#3;2;100;100;0');  // Gelb

    // 20 Zeilen: jeweils 30 Pixel Rot, 30 Pixel Blau, 30 Pixel Gelb
    for i := 1 to 20 do begin
      Write('#1!30~#2!30~#3!30~');
    end;

    Write(#27, '\');
  end;

  procedure main2;
  const
    SIZE=7;
  var
    output_: Psixel_output_t=nil;
    dither: Psixel_dither_t=nil;
    pixels: array[0..SIZE*SIZE*3-1] of byte;
    i: integer;
  begin
    for i := 0 to Length(pixels) - 1 do begin
      pixels[i] := Random($FF);
    end;

    sixel_output_new(@output_, nil, nil, nil);
    sixel_dither_new(@dither, 16, nil);

    sixel_encode(pbyte(pixels), SIZE, SIZE, 3, dither, output_);

    sixel_output_unref(output_);
    sixel_dither_unref(dither);
    main;
  end;

begin
  main;
  main2;
  main;
end.
