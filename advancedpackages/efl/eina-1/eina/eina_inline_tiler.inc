{$IFDEF read_interface}


type
  TEina_Tile_Grid_Slicer = record
    col1, col2, row1, row2: cardinal;
    tile_w, tile_h: integer;
    x_rel, y_rel: integer;
    w1_rel, h1_rel: integer;
    w2_rel, h2_rel: integer;
    info: TEina_Tile_Grid_Info;
    first: boolean;
  end;

  PEina_Tile_Grid_Slicer = ^TEina_Tile_Grid_Slicer;

function eina_tile_grid_slicer_next(slc: PEina_Tile_Grid_Slicer; rect: PPEina_Tile_Grid_Info): TEina_Bool;
function eina_tile_grid_slicer_setup(slc: PEina_Tile_Grid_Slicer; x, y, w, h, tile_w, tile_h: integer): TEina_Bool;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_tile_grid_slicer_next(slc: PEina_Tile_Grid_Slicer; rect: PPEina_Tile_Grid_Info): TEina_Bool;
begin
  if slc = nil then begin
    printf('safety check failed: VAL = nil'#10);
    Exit(EINA_FALSE);
  end;

  if slc^.first then begin
    slc^.first := False;
    rect^ := @slc^.info;
    Result := True;
    Exit(EINA_TRUE);
  end;

  Inc(slc^.info.col);

  if slc^.info.col > slc^.col2 then begin
    Inc(slc^.info.row);
    if slc^.info.row > slc^.row2 then begin
      Exit(EINA_FALSE);
    end else if slc^.info.row < slc^.row2 then begin
      slc^.info.rect.h := slc^.tile_h;
    end else begin
      slc^.info.rect.h := slc^.h2_rel;
    end;

    slc^.info.rect.y := 0;
    slc^.info.col := slc^.col1;
    slc^.info.rect.x := slc^.x_rel;
    slc^.info.rect.w := slc^.w1_rel;
  end else begin
    slc^.info.rect.x := 0;
    if slc^.info.col < slc^.col2 then begin
      slc^.info.rect.w := slc^.tile_w;
    end else begin
      slc^.info.rect.w := slc^.w2_rel;
    end;
  end;

  if (slc^.info.rect.w = slc^.tile_w) and (slc^.info.rect.h = slc^.tile_h) then begin
    slc^.info.full := True;
  end else begin
    slc^.info.full := False;
  end;

  rect^ := @slc^.info;

  Result := True;
end;

function eina_tile_grid_slicer_setup(slc: PEina_Tile_Grid_Slicer; x, y, w, h, tile_w, tile_h: integer): TEina_Bool;
var
  tx1, tx2, ty1, ty2: integer;
begin
  if slc = nil then begin
    printf('safety check failed: VAL = nil'#10);
    Exit(EINA_FALSE);
  end;

  tx1 := x;
  ty1 := y;
  tx2 := x + w - 1;
  ty2 := y + h - 1;

  if (x < 0) or (y < 0) or (w <= 0) or (h <= 0) or (tile_w <= 0) or (tile_h <= 0) then begin
    slc^.first := False;
    slc^.col1 := 0;
    slc^.row1 := 0;
    slc^.col2 := 0;
    slc^.row2 := 0;
    slc^.info.col := slc^.col1;
    slc^.info.row := slc^.row1;
    Exit(EINA_TRUE);
  end;

  slc^.col1 := tx1 div tile_w;
  slc^.row1 := ty1 div tile_h;
  slc^.col2 := (tx2 - 0) div tile_w;
  slc^.row2 := (ty2 - 0) div tile_h;
  slc^.x_rel := tx1 mod tile_w;
  slc^.y_rel := ty1 mod tile_h;
  slc^.w1_rel := tile_w - slc^.x_rel;
  slc^.h1_rel := tile_h - slc^.y_rel;
  slc^.w2_rel := tx2 mod tile_w + 1;
  slc^.h2_rel := ty2 mod tile_h + 1;

  slc^.tile_w := tile_w;
  slc^.tile_h := tile_h;

  slc^.first := True;
  slc^.info.col := slc^.col1;
  slc^.info.row := slc^.row1;
  slc^.info.rect.x := slc^.x_rel;
  slc^.info.rect.y := slc^.y_rel;

  if slc^.info.col = slc^.col2 then begin
    slc^.w1_rel := slc^.w2_rel - slc^.x_rel;
  end;

  if slc^.info.row = slc^.row2 then begin
    slc^.h1_rel := slc^.h2_rel - slc^.y_rel;
  end;

  slc^.info.rect.w := slc^.w1_rel;
  slc^.info.rect.h := slc^.h1_rel;

  if (slc^.info.rect.w = slc^.tile_w) and (slc^.info.rect.h = slc^.tile_h) then begin
    slc^.info.full := EINA_TRUE;
  end else begin
    slc^.info.full := EINA_FALSE;
  end;

  Result := True;
end;

{$ENDIF read_implementation}
