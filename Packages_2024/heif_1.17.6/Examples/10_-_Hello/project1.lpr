program project1;

uses
  fp_heif;

  procedure main;
  var
    ctx: Pheif_context;
    err: Theif_error;
    handle: Pheif_image_handle;
    width, height, bpp, stride: longint;
    img: Pheif_image;
    data: Puint8_t;
    y, x: integer;
    line_start: Puint8_t;
    br: Tuint8_t;
  const
    SIZE = 10;
  begin
    ctx := heif_context_alloc;
    err := heif_context_read_from_file(ctx, '/home/tux/Bilder/blume.avif', nil);

    if err.code <> heif_error_Ok then begin
      WriteLn('Fehler beim Lesen: ', err.message, '/', err.code);
      heif_context_free(ctx);
      Exit;
    end;

    heif_context_get_primary_image_handle(ctx, @handle);

    width := heif_image_handle_get_width(handle);
    height := heif_image_handle_get_height(handle);
    bpp := heif_image_handle_get_luma_bits_per_pixel(handle);

    WriteLn('Bild: ', width, 'x', height, 'x', bpp);
    WriteLn('Dateigröße: ', (width * height * bpp / 8.0) / 1024.0: 4: 2, ',KB');

    heif_decode_image(handle, @img, heif_colorspace_RGB,
      heif_chroma_interleaved_RGB, nil);

    data := heif_image_get_plane_readonly(img, heif_channel_interleaved, @stride);
    WriteLn('Datenstride: ', stride, 'Byte');

    for y := 0 to height - 1 do begin
      line_start := data + (y * stride);

      for x := 0 to (width - 1) do begin
        if (x mod (SIZE div 2) = 0) and (y mod SIZE = 0) then begin
          br := line_start[x * 3];
          Write(char(br div 8 + 32));
        end;
      end;

      if y mod SIZE = 0 then begin
        WriteLn;
      end;
    end;

    heif_image_release(img);
    heif_image_handle_release(handle);
    heif_context_free(ctx);
  end;

begin
  main;
end.
