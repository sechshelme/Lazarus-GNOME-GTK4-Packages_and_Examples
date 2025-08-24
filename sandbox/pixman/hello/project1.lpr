program project1;

uses
  fp_pixman;

  procedure main;
  const
    width = 4;
    height = 2;
  var
    pixels: array[0..width * height - 1] of uint32;
    image: Ppixman_image;

    color: Tpixman_color = (
    red: $ffff;
    green: $0000;
    blue: $0000;
    alpha: $8000);
    rect: Tpixman_rectangle16 = (
    x: 0;
    y: 0;
    width: width;
    height: height);
    y, x: integer;
  begin
    // Pixman-Image im Format a8r8g8b8 erstellen
    image := pixman_image_create_bits(PIXMAN_a8r8g8b8, width, height, pixels, width * 4);

    // Ganzes Bild mit der Farbe füllen
    pixman_image_fill_rectangles(PIXMAN_OP_SRC, image, @color, 1, @rect);

    // Pixeldaten ausgeben
    WriteLn('Pixeldaten (ARGB):');
    for  y := 0 to height - 1 do begin
      for  x := 0 to width - 1 do begin
        Write(pixels[y * width + x]: 16);
      end;
      WriteLn;

    end;
    pixman_image_unref(image);
  end;

begin
  main;
end.
