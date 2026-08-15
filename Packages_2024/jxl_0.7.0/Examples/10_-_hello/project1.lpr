program project1;

uses
  fp_jxl;

  procedure SaveJxlOutput(enc: PJxlEncoder; FileName: PChar);
  var
    F: file;
    Buffer: array[0..4095] of Tuint8_t;
    NextOut: Puint8_t;
    AvailOut: Tsize_t;
    ProcessResult: TJxlEncoderStatus;
    BytesToWrite: integer;
  begin
    AssignFile(F, FileName);
    Rewrite(F, 1);
    NextOut := @Buffer;
    AvailOut := SizeOf(Buffer);
    ProcessResult := JXL_ENC_NEED_MORE_OUTPUT;
    while ProcessResult = JXL_ENC_NEED_MORE_OUTPUT do begin
      ProcessResult := JxlEncoderProcessOutput(enc, @NextOut, @AvailOut);
      if AvailOut < SizeOf(Buffer) then  begin
        BytesToWrite := SizeOf(Buffer) - AvailOut;
        BlockWrite(F, Buffer, BytesToWrite);
        NextOut := @Buffer;
        AvailOut := SizeOf(Buffer);
      end;
    end;
    Close(F);
  end;


  procedure main;
  const
    width = 256;
    height = 256;
    filename = '/tmp/test.jxl';
  var
    pixels: pbyte;
    y, x: integer;
    enc: PJxlEncoder;
    runner: Pointer;
    basic_info: TJxlBasicInfo;
    pixel_format: TJxlPixelFormat = (num_channels: 1; data_type: JXL_TYPE_UINT8; endianness: JXL_NATIVE_ENDIAN; align: 0);
    color_encoding: TJxlColorEncoding;
    settings: PJxlEncoderFrameSettings;
  begin
    pixels := GetMem(width * height);
    for y := 0 to height - 1 do begin
      for x := 0 to width - 1 do begin
        pixels[y * width + x] := x;
      end;
    end;

    enc := JxlEncoderCreate(nil);
    runner := JxlThreadParallelRunnerCreate(nil, JxlThreadParallelRunnerDefaultNumWorkerThreads);

    JxlEncoderSetParallelRunner(enc, @JxlThreadParallelRunner, runner);

    JxlEncoderInitBasicInfo(@basic_info);
    basic_info.xsize := width;
    basic_info.ysize := height;
    basic_info.bits_per_sample := 8;
    basic_info.num_color_channels := 1;
    basic_info.alpha_bits := 0;

    if JxlEncoderSetBasicInfo(enc, @basic_info) <> JXL_ENC_SUCCESS then begin
      WriteLn('Fehler beim Setzen der BasicInfo');
      Exit;;
    end;

    JxlColorEncodingSetToSRGB(@color_encoding, JXL_TRUE);
    JxlEncoderSetColorEncoding(enc, @color_encoding);

    settings := JxlEncoderFrameSettingsCreate(enc, nil);
    if JxlEncoderAddImageFrame(settings, @pixel_format, pixels, width * height) <> JXL_ENC_SUCCESS then begin
      WriteLn('Fehler beim Hinzufügen des Frames');
      Exit;;
    end;
    JxlEncoderCloseInput(enc);

    SaveJxlOutput(enc, filename);

    JxlThreadParallelRunnerDestroy(runner);
    JxlEncoderDestroy(enc);
    Freemem(pixels);

    WriteLn('Datei erfolgreich erstellt!');
  end;

begin
  main;
end.
