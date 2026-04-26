program project1;

uses
//  almostdeprecated,         // dep
  arithmetic,
  //basic,
  //buf,
  colour,
  //connection,
  //conversion,
  //convolution,
  create,
  //dbuf,
  //dispatch,
  //draw,
  //enumtypes,
  error,
  //foreign,
  //format,
  //freqfilt,
  //gate,
  //generate,
  //header,
  //histogram,
  image,
  //interpolate,
  //intl,
  //mask,
  //memory,
  //morphology,
  //mosaicing,
  //object_,                 // ????? ____
  //operation,
  //private,
  //rect,
  //region,
  //resample,
  //sbuf,
  //semaphore,
  //thread,
  //threadpool,
  //transform,
  //type_,                    // ????? ____
  //util,
  //vector,
  //version,
  //video,
  vips,



  fp_vips;

procedure main;
var
  in_,inverted, base_srgb,text_mask: PVipsImage;
begin
  if vips_init(argv[0])<>0then vips_error_exit(nil);

  in_ := vips_image_new_from_file('in.jpg', nil);
  if in_=nil then vips_error_exit(nil);

  vips_invert(in_, @inverted, nil);
  // Hier erzwingen wir sRGB für den Hintergrund
  vips_colourspace(inverted, @base_srgb, VIPS_INTERPRETATION_sRGB, nil);

  // 2. Textmaske erzeugen
  vips_text(@text_mask, 'Hallo Welt!', 'width', 100, 'dpi', 200, nil);
  vips_linear1(text_mask, &alpha_mask, 0.5, 0, nil); // 50% Transparenz

  // 3. Schwarzes RGBA-Textbild bauen
  vips_black(&black_screen, alpha_mask->Xsize, alpha_mask->Ysize, "bands", 3, nil);
  vips_bandjoin2(black_screen, alpha_mask, &text_rgba, nil);

  // 4. DER FIX: Wir kopieren das Bild und erzwingen den Farbraum-Typ "sRGB"
  // Das transformiert 'multiband' sauber in 'srgb', so dass composite2 nicht mehr meckert
  if (vips_copy(text_rgba, &text_final, "interpretation", VIPS_INTERPRETATION_sRGB, nil))
      vips_error_exit(nil);

  // 5. Mischen (Beide Bilder sind nun garantiert sRGB)
  if (vips_composite2(base_srgb, text_final, &out, VIPS_BLEND_MODE_OVER, "x", 110, "y", 90, nil))
      vips_error_exit(nil);

  // 6. Speichern
  vips_image_write_to_file(out, "out.jpg", nil);

  // Aufräumen
  g_object_unref(in); g_object_unref(inverted); g_object_unref(base_srgb);
  g_object_unref(text_mask); g_object_unref(alpha_mask); g_object_unref(black_screen);
  g_object_unref(text_rgba); g_object_unref(text_final); g_object_unref(out);

  vips_shutdown();
end;

begin
  main;
end.

