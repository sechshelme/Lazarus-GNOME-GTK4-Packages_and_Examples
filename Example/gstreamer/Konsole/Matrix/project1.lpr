
program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_gst_base,
  fp_gst_codecparsers,
  fp_gst;

//type
//Tguint8arr64 = array[0..63] of Tguint8;

{$j-}
const
  zigzag_matrix: Tguint8arr64 = (
    8, 16, 19, 22, 26, 27, 29, 34,
    16, 16, 22, 24, 27, 29, 34, 37,
    19, 22, 26, 27, 29, 34, 34, 38,
    22, 22, 26, 27, 29, 34, 37, 40,
    22, 26, 27, 29, 32, 35, 40, 48,
    26, 27, 29, 32, 35, 40, 48, 58,
    26, 27, 29, 34, 38, 46, 56, 69,
    27, 29, 35, 38, 46, 56, 69, 83
    );
var
  raster_matrix: Tguint8arr64;


  //procedure gst_mpeg_video_quant_matrix_get_raster_from_zigzag(out_quant: PInt8; quant: PInt8); cdecl; external libgstcodecparsers;

//procedure gst_mpeg_video_quant_matrix_get_raster_from_zigzag(const out_quant; out quant); cdecl; external libgstcodecparsers;
//procedure gst_mpeg_video_quant_matrix_get_raster_from_zigzag(var out_quant; out quant); cdecl; external libgstcodecparsers;
//procedure gst_mpeg_video_quant_matrix_get_raster_from_zigzag(var out_quant:Tguint8arr64; const quant:Tguint8arr64); cdecl; external libgstcodecparsers;
//  procedure gst_mpeg_video_quant_matrix_get_raster_from_zigzag(var out_quant; const quant); cdecl; external libgstcodecparsers;


  procedure main(argc: cint; argv: PPChar);
  var
    i: integer=0;
  begin
    gst_init(@argc, @argv);

    gst_mpeg_video_quant_matrix_get_raster_from_zigzag(raster_matrix, zigzag_matrix);
//    gst_mpeg_video_quant_matrix_get_raster_from_zigzag(i, i);

    g_printf('ZigZag-Matrix: '#10);
    for  i := 0 to 63 do begin
      g_printf('%3d ', zigzag_matrix[i]);
      if (i + 1) mod 8 = 0 then begin
        g_printf(#10);
      end;
    end;
    g_print(#10#10#10);

    g_printf('Raster-Matrix:'#10);
    for  i := 0 to 63 do begin
      g_printf('%3d ', raster_matrix[i]);
      if (i + 1) mod 8 = 0 then begin
        g_printf(#10);
      end;
    end;
  end;

begin
  main(argc, argv);
end.
