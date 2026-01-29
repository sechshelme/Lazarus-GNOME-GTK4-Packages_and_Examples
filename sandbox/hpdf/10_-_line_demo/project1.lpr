program project1;

uses
  fp_hpdf;

  procedure error_handler(error_no: THPDF_STATUS; detail_no: THPDF_STATUS; user_data: pointer); cdecl;
  begin
    WriteLn('ERROR: error_no=', error_no, ' detail_no=', detail_no);
    Halt;
  end;


  procedure draw_line(page: THPDF_Page; x, y: single; label_: pchar);
  begin
    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, x, y - 10);
    HPDF_Page_ShowText(page, label_);
    HPDF_Page_EndText(page);

    HPDF_Page_MoveTo(page, x, y - 15);
    HPDF_Page_LineTo(page, x + 220, y - 15);
    HPDF_Page_Stroke(page);
  end;

  procedure draw_line2(page: THPDF_Page; x, y: single; label_: pchar);
  begin
    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, x, y);
    HPDF_Page_ShowText(page, label_);
    HPDF_Page_EndText(page);

    HPDF_Page_MoveTo(page, x + 30, y - 25);
    HPDF_Page_LineTo(page, x + 160, y - 25);
    HPDF_Page_Stroke(page);
  end;

  procedure draw_rect(page: THPDF_Page; x, y: single; label_: pchar);
  begin
    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, x, y - 10);
    HPDF_Page_ShowText(page, label_);
    HPDF_Page_EndText(page);

    HPDF_Page_Rectangle(page, x, y - 40, 220, 25);
  end;

  procedure main;
  const
    page_title = 'Linet Demo';
    fname = '/tmp/test.pdf';

    DASH_MODE1: array[0..0] of THPDF_UINT16 = (3);
    DASH_MODE2: array[0..1] of THPDF_UINT16 = (3, 7);
    DASH_MODE3: array[0..3] of THPDF_UINT16 = (8, 7, 2, 7);

  var
    x, y, x1, y1, x2, y2, x3, y3, tw: double;
    pdf: THPDF_Doc;
    font: THPDF_Font;
    page: THPDF_Page;

  begin
    pdf := HPDF_New(@error_handler, nil);
    if pdf = nil then begin
      WriteLn('error: cannot create PdfDoc object');
      Exit;
    end;

    font := HPDF_GetFont(pdf, 'Helvetica', nil);

    page := HPDF_AddPage(pdf);

    HPDF_Page_SetLineWidth(page, 1);
    HPDF_Page_Rectangle(page, 50, 50, HPDF_Page_GetWidth(page) - 100, HPDF_Page_GetHeight(page) - 110);
    HPDF_Page_Stroke(page);

    HPDF_Page_SetFontAndSize(page, font, 24);
    tw := HPDF_Page_TextWidth(page, page_title);
    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, (HPDF_Page_GetWidth(page) - tw) / 2, HPDF_Page_GetHeight(page) - 50);
    HPDF_Page_ShowText(page, page_title);
    HPDF_Page_EndText(page);

    HPDF_Page_SetFontAndSize(page, font, 10);

    HPDF_Page_SetLineWidth(page, 0);
    draw_line(page, 60, 770, 'line width = 0');

    HPDF_Page_SetLineWidth(page, 1.0);
    draw_line(page, 60, 740, 'line width = 1.0');

    HPDF_Page_SetLineWidth(page, 2.0);
    draw_line(page, 60, 710, 'line width = 2.0');

    HPDF_Page_SetLineWidth(page, 1.0);

    HPDF_Page_SetDash(page, @DASH_MODE1, 1, 1.0);
    draw_line(page, 60, 680, 'dash_ptn=[3], phase=1 -- ' +
      '2 on, 3 off, 3 on...');

    HPDF_Page_SetDash(page, @DASH_MODE2, 2, 2.0);
    draw_line(page, 60, 650, 'dash_ptn=[7, 3], phase=2 -- ' +
      '5 on 3 off, 7 on,...');

    HPDF_Page_SetDash(page, @DASH_MODE3, 4, 0.0);
    draw_line(page, 60, 620, 'dash_ptn=[8, 7, 2, 7], phase=0');

    HPDF_Page_SetDash(page, nil, 0, 0.0);

    HPDF_Page_SetLineWidth(page, 30);
    HPDF_Page_SetRGBStroke(page, 0.0, 0.5, 0.0);

    HPDF_Page_SetLineCap(page, HPDF_BUTT_END);
    draw_line2(page, 60, 570, 'PDF_BUTT_END');

    HPDF_Page_SetLineCap(page, HPDF_ROUND_END);
    draw_line2(page, 60, 505, 'PDF_ROUND_END');

    HPDF_Page_SetLineCap(page, HPDF_PROJECTING_SQUARE_END);
    draw_line2(page, 60, 440, 'PDF_PROJECTING_SCUARE_END');

    HPDF_Page_SetLineWidth(page, 30);
    HPDF_Page_SetRGBStroke(page, 0.0, 0.0, 0.5);

    HPDF_Page_SetLineJoin(page, HPDF_MITER_JOIN);
    HPDF_Page_MoveTo(page, 120, 300);
    HPDF_Page_LineTo(page, 160, 340);
    HPDF_Page_LineTo(page, 200, 300);
    HPDF_Page_Stroke(page);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, 60, 360);
    HPDF_Page_ShowText(page, 'PDF_MITER_JOIN');
    HPDF_Page_EndText(page);

    HPDF_Page_SetLineJoin(page, HPDF_ROUND_JOIN);
    HPDF_Page_MoveTo(page, 120, 195);
    HPDF_Page_LineTo(page, 160, 235);
    HPDF_Page_LineTo(page, 200, 195);
    HPDF_Page_Stroke(page);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, 60, 255);
    HPDF_Page_ShowText(page, 'PDF_ROUND_JOIN');
    HPDF_Page_EndText(page);

    HPDF_Page_SetLineJoin(page, HPDF_BEVEL_JOIN);
    HPDF_Page_MoveTo(page, 120, 90);
    HPDF_Page_LineTo(page, 160, 130);
    HPDF_Page_LineTo(page, 200, 90);
    HPDF_Page_Stroke(page);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, 60, 150);
    HPDF_Page_ShowText(page, 'PDF_BEVEL_JOIN');
    HPDF_Page_EndText(page);

    HPDF_Page_SetLineWidth(page, 2);
    HPDF_Page_SetRGBStroke(page, 0, 0, 0);
    HPDF_Page_SetRGBFill(page, 0.75, 0.0, 0.0);

    draw_rect(page, 300, 770, 'Stroke');
    HPDF_Page_Stroke(page);

    draw_rect(page, 300, 720, 'Fill');
    HPDF_Page_Fill(page);

    draw_rect(page, 300, 670, 'Fill then Stroke');
    HPDF_Page_FillStroke(page);

    HPDF_Page_GSave(page);
    draw_rect(page, 300, 620, 'Clip Rectangle');
    HPDF_Page_Clip(page);
    HPDF_Page_Stroke(page);
    HPDF_Page_SetFontAndSize(page, font, 13);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, 290, 600);
    HPDF_Page_SetTextLeading(page, 12);
    HPDF_Page_ShowText(page,
      'Clip Clip Clip Clip Clip Clipi Clip Clip Clip');
    HPDF_Page_ShowTextNextLine(page,
      'Clip Clip Clip Clip Clip Clip Clip Clip Clip');
    HPDF_Page_ShowTextNextLine(page,
      'Clip Clip Clip Clip Clip Clip Clip Clip Clip');
    HPDF_Page_EndText(page);
    HPDF_Page_GRestore(page);

    x := 330;
    y := 440;
    x1 := 430;
    y1 := 530;
    x2 := 480;
    y2 := 470;
    x3 := 480;
    y3 := 90;

    HPDF_Page_SetRGBFill(page, 0, 0, 0);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, 300, 540);
    HPDF_Page_ShowText(page, 'CurveTo2(x1, y1, x2. y2)');
    HPDF_Page_EndText(page);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, x + 5, y - 5);
    HPDF_Page_ShowText(page, 'Current point');
    HPDF_Page_MoveTextPos(page, x1 - x, y1 - y);
    HPDF_Page_ShowText(page, '(x1, y1)');
    HPDF_Page_MoveTextPos(page, x2 - x1, y2 - y1);
    HPDF_Page_ShowText(page, '(x2, y2)');
    HPDF_Page_EndText(page);

    HPDF_Page_SetDash(page, @DASH_MODE1, 1, 0.0);

    HPDF_Page_SetLineWidth(page, 0.5);
    HPDF_Page_MoveTo(page, x1, y1);
    HPDF_Page_LineTo(page, x2, y2);
    HPDF_Page_Stroke(page);

    HPDF_Page_SetDash(page, nil, 0, 0.0);

    HPDF_Page_SetLineWidth(page, 1.5);

    HPDF_Page_MoveTo(page, x, y);
    HPDF_Page_CurveTo2(page, x1, y1, x2, y2);
    HPDF_Page_Stroke(page);

    y -= 150;
    y1 -= 150;
    y2 -= 150;

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, 300, 390);
    HPDF_Page_ShowText(page, 'CurveTo3(x1, y1, x2. y2)');
    HPDF_Page_EndText(page);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, x + 5, y - 5);
    HPDF_Page_ShowText(page, 'Current point');
    HPDF_Page_MoveTextPos(page, x1 - x, y1 - y);
    HPDF_Page_ShowText(page, '(x1, y1)');
    HPDF_Page_MoveTextPos(page, x2 - x1, y2 - y1);
    HPDF_Page_ShowText(page, '(x2, y2)');
    HPDF_Page_EndText(page);

    HPDF_Page_SetDash(page, @DASH_MODE1, 1, 0.0);

    HPDF_Page_SetLineWidth(page, 0.5);
    HPDF_Page_MoveTo(page, x, y);
    HPDF_Page_LineTo(page, x1, y1);
    HPDF_Page_Stroke(page);

    HPDF_Page_SetDash(page, nil, 0, 0.0);

    HPDF_Page_SetLineWidth(page, 1.5);
    HPDF_Page_MoveTo(page, x, y);
    HPDF_Page_CurveTo3(page, x1, y1, x2, y2);
    HPDF_Page_Stroke(page);

    y -= 150;
    y1 -= 160;
    y2 -= 130;
    x2 += 10;

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, 300, 240);
    HPDF_Page_ShowText(page, 'CurveTo(x1, y1, x2. y2, x3, y3)');
    HPDF_Page_EndText(page);

    HPDF_Page_BeginText(page);
    HPDF_Page_MoveTextPos(page, x + 5, y - 5);
    HPDF_Page_ShowText(page, 'Current point');
    HPDF_Page_MoveTextPos(page, x1 - x, y1 - y);
    HPDF_Page_ShowText(page, '(x1, y1)');
    HPDF_Page_MoveTextPos(page, x2 - x1, y2 - y1);
    HPDF_Page_ShowText(page, '(x2, y2)');
    HPDF_Page_MoveTextPos(page, x3 - x2, y3 - y2);
    HPDF_Page_ShowText(page, '(x3, y3)');
    HPDF_Page_EndText(page);

    HPDF_Page_SetDash(page, @DASH_MODE1, 1, 0.0);

    HPDF_Page_SetLineWidth(page, 0.5);
    HPDF_Page_MoveTo(page, x, y);
    HPDF_Page_LineTo(page, x1, y1);
    HPDF_Page_Stroke(page);
    HPDF_Page_MoveTo(page, x2, y2);
    HPDF_Page_LineTo(page, x3, y3);
    HPDF_Page_Stroke(page);

    HPDF_Page_SetDash(page, nil, 0, 0.0);

    HPDF_Page_SetLineWidth(page, 1.5);
    HPDF_Page_MoveTo(page, x, y);
    HPDF_Page_CurveTo(page, x1, y1, x2, y2, x3, y3);
    HPDF_Page_Stroke(page);

    HPDF_SaveToFile(pdf, fname);

    HPDF_Free(pdf);
  end;

begin
  main;
end.
