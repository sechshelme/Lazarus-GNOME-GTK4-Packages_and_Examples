program project1;

uses
  hpdf_version,
  hpdf_types,
  hpdf,
  hpdf_consts,
  hpdf_utils,
  hpdf_error,
  hpdf_list,
  hpdf_encrypt,
  hpdf_objects,
  hpdf_namedict,
  hpdf_catalog,
  hpdf_doc,
  hpdf_u3d,
  hpdf_3dmeasure,
  hpdf_annotation,
  hpdf_conf,
  hpdf_destination,
  hpdf_encoder,
  hpdf_encryptdict,
  hpdf_exdata,
  hpdf_ext_gstate,
  hpdf_font,
  hpdf_fontdef,
  hpdf_gstate,
  hpdf_image,
  hpdf_info,
  hpdf_mmgr,
  hpdf_outline,
  hpdf_page_label,
  hpdf_pages,
  hpdf_pdfa,
  hpdf_streams,



  fp_hpdf;

const
  font_list: array of pchar = (
    'Courier',
    'Courier-Bold',
    'Courier-Oblique',
    'Courier-BoldOblique',
    'Helvetica',
    'Helvetica-Bold',
    'Helvetica-Oblique',
    'Helvetica-BoldOblique',
    'Times-Roman',
    'Times-Bold',
    'Times-Italic',
    'Times-BoldItalic',
    'Symbol',
    'ZapfDingbats',
    nil);

  procedure error_handler(error_no: THPDF_STATUS; detail_no: THPDF_STATUS; user_data: pointer); cdecl;
  begin
    WriteLn('ERROR: error_no=', error_no, ' detail_no=', detail_no);
    Halt;
  end;

  procedure main;
  const
    page_title = 'Font Demo';
    fname = 'test.pdf';
  var
    pdf: THPDF_Doc;
    page: THPDF_Page;
    height, width, tw: THPDF_REAL;
    def_font, font: THPDF_Font;
    i: THPDF_UINT;
    samp_text: pchar;

  begin
    pdf := HPDF_New(@error_handler, nil);
    if pdf = nil then begin
      WriteLn('error: cannot create PdfDoc object');
      Exit;
    end;

    page := HPDF_AddPage(pdf);

    height := HPDF_Page_GetHeight(page);
    width := HPDF_Page_GetWidth(page);

    HPDF_Page_SetLineWidth(page, 1);
    HPDF_Page_Rectangle(page, 50, 50, width - 100, height - 110);
    HPDF_Page_Stroke(page);

    def_font := HPDF_GetFont(pdf, 'Helvetica', nil);
    HPDF_Page_SetFontAndSize(page, def_font, 24);

    tw := HPDF_Page_TextWidth(page, page_title);
    HPDF_Page_BeginText(page);
    HPDF_Page_TextOut(page, (width - tw) / 2, height - 50, page_title);
    HPDF_Page_EndText(page);

    HPDF_Page_BeginText(page);
    HPDF_Page_SetFontAndSize(page, def_font, 16);
    HPDF_Page_TextOut(page, 60, height - 80, '<Standerd Type1 fonts samples>');
    HPDF_Page_EndText(page);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, 60, height - 105);

    i := 0;
    while font_list[i] <> nil do begin
      samp_text := 'abcdefgABCDEFG12345!#$%&+-@?';
      font := HPDF_GetFont(pdf, font_list[i], nil);

      HPDF_Page_SetFontAndSize(page, def_font, 9);
      HPDF_Page_ShowText(page, font_list[i]);
      HPDF_Page_MoveTextPos(page, 0, -18);

      HPDF_Page_SetFontAndSize(page, font, 20);
      HPDF_Page_ShowText(page, samp_text);
      HPDF_Page_MoveTextPos(page, 0, -20);

      Inc(i);
    end;

    HPDF_Page_EndText(page);
    HPDF_SaveToFile(pdf, fname);
    HPDF_Free(pdf);
  end;

begin
  main;
end.
