{$IFDEF read_interface}


  // === Konventiert am: 12-9-26 17:22:25 ===

procedure postscript_image(f: PFILE; im: Pimage_u8_t);

{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure postscript_image(f: PFILE; im: Pimage_u8_t);
var
  x, y: integer;
  v: byte;
begin
  fprintf(f, '/picstr %d string def'#10, im^.width);
  fprintf(f, '%d %d 8 [1 0 0 1 0 0]'#10, im^.width, im^.height);
  fprintf(f, 'currentfile picstr readhexstring pop'#10'image'#10);

  for y := 0 to im^.height - 1 do begin
    for x := 0 to im^.width - 1 do begin
      v := im^.buf[y * im^.stride + x];
      fprintf(f, '%02x', v);

      if (x mod 32) = 31 then  begin fprintf(f, #10); end;
    end;
  end;

  fprintf(f, #10);
end;


{$ENDIF read_implementation}
