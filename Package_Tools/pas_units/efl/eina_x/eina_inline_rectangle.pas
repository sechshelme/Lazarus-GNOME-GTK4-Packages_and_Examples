unit eina_inline_rectangle;

interface

uses
  fp_eina;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

function eina_rectangle_is_valid(r: PEina_Rectangle): TEina_Bool;
function eina_spans_intersect(c1, l1, c2, l2: integer): integer;
function eina_rectangle_is_empty(r: PEina_Rectangle): TEina_Bool;
procedure eina_rectangle_coords_from(r: PEina_Rectangle; x, y, w, h: integer);
function eina_rectangle_equal(rect1, rect2: PEina_Rectangle): TEina_Bool;
function eina_rectangles_intersect(r1, r2: PEina_Rectangle): TEina_Bool;
function eina_rectangle_xcoord_inside(r: PEina_Rectangle; x: integer): TEina_Bool;
function eina_rectangle_ycoord_inside(r: PEina_Rectangle; y: integer): TEina_Bool;
function eina_rectangle_coords_inside(r: PEina_Rectangle; x, y: integer): TEina_Bool;
procedure eina_rectangle_union(dst: PEina_Rectangle; src: PEina_Rectangle);
function eina_rectangle_intersection(dst: PEina_Rectangle; src: PEina_Rectangle): TEina_Bool;
procedure eina_rectangle_rescale_in(OutRect, InRect: PEina_Rectangle; res: PEina_Rectangle);
procedure eina_rectangle_rescale_out(OutRect, InRect: PEina_Rectangle; res: PEina_Rectangle);
function eina_rectangle_max_x(thiz: PEina_Rectangle): integer;
function eina_rectangle_max_y(thiz: PEina_Rectangle): integer;
function eina_rectangle_x_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: integer): TEina_Bool;
function eina_rectangle_y_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: integer): TEina_Bool;
function eina_rectangle_width_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: integer): TEina_Bool;
function eina_rectangle_height_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: integer): TEina_Bool;
function eina_rectangle_subtract(thiz: PEina_Rectangle; other: PEina_Rectangle; out_: PEina_Rectangle): TEina_Bool;

implementation

function eina_rectangle_is_valid(r: PEina_Rectangle): TEina_Bool;
begin
  if (r^.w > 0) and (r^.h > 0) then begin
    Result := EINA_TRUE;
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_spans_intersect(c1, l1, c2, l2: integer): integer;
begin
  Result := integer(not (((c2 + l2) <= c1) or (c2 >= (c1 + l1))));
end;

function eina_rectangle_is_empty(r: PEina_Rectangle): TEina_Bool;
begin
  Result := not eina_rectangle_is_valid(r);
end;

procedure eina_rectangle_coords_from(r: PEina_Rectangle; x, y, w, h: integer);
begin
  r^.x := x;
  r^.y := y;
  r^.w := w;
  r^.h := h;
end;

function eina_rectangle_equal(rect1, rect2: PEina_Rectangle): TEina_Bool;
begin
  Result := (rect1^.x = rect2^.x) and (rect1^.y = rect2^.y) and
    (rect1^.w = rect2^.w) and (rect1^.h = rect2^.h);
end;

function eina_rectangles_intersect(r1, r2: PEina_Rectangle): TEina_Bool;
begin
  Result := TEina_Bool(eina_spans_intersect(r1^.x, r1^.w, r2^.x, r2^.w) and eina_spans_intersect(r1^.y, r1^.h, r2^.y, r2^.h));
end;

function eina_rectangle_xcoord_inside(r: PEina_Rectangle; x: integer): TEina_Bool;
begin
  Result := (x >= r^.x) and (x < (r^.x + r^.w));
end;

function eina_rectangle_ycoord_inside(r: PEina_Rectangle; y: integer): TEina_Bool;
begin
  Result := (y >= r^.y) and (y < (r^.y + r^.h));
end;

function eina_rectangle_coords_inside(r: PEina_Rectangle; x, y: integer): TEina_Bool;
begin
  Result := eina_rectangle_xcoord_inside(r, x) and eina_rectangle_ycoord_inside(r, y);
end;

procedure eina_rectangle_union(dst: PEina_Rectangle; src: PEina_Rectangle);
begin
  // left
  if dst^.x > src^.x then begin
    dst^.w := dst^.w + (dst^.x - src^.x);
    dst^.x := src^.x;
  end;
  // right
  if (dst^.x + dst^.w) < (src^.x + src^.w) then begin
    dst^.w := src^.x + src^.w - dst^.x;
  end;
  // top
  if dst^.y > src^.y then begin
    dst^.h := dst^.h + (dst^.y - src^.y);
    dst^.y := src^.y;
  end;
  // bottom
  if (dst^.y + dst^.h) < (src^.y + src^.h) then begin
    dst^.h := src^.y + src^.h - dst^.y;
  end;
end;

function eina_rectangle_intersection(dst: PEina_Rectangle; src: PEina_Rectangle): TEina_Bool;
begin
  if eina_rectangle_is_valid(dst) and eina_rectangle_is_valid(src) and eina_rectangles_intersect(dst, src) then begin
    // left
    if dst^.x < src^.x then begin
      dst^.w := dst^.w + dst^.x - src^.x;
      dst^.x := src^.x;
      if dst^.w < 0 then begin
        dst^.w := 0;
      end;
    end;
    // right
    if (dst^.x + dst^.w) > (src^.x + src^.w) then begin
      dst^.w := src^.x + src^.w - dst^.x;
    end;
    // top
    if dst^.y < src^.y then begin
      dst^.h := dst^.h + dst^.y - src^.y;
      dst^.y := src^.y;
      if dst^.h < 0 then begin
        dst^.h := 0;
      end;
    end;
    // bottom
    if (dst^.y + dst^.h) > (src^.y + src^.h) then begin
      dst^.h := src^.y + src^.h - dst^.y;
    end;

    if (dst^.w = 0) or (dst^.h = 0) then begin
      Exit(EINA_FALSE);
    end;
    Exit(EINA_TRUE);
  end;
  Result := EINA_FALSE;
end;

procedure eina_rectangle_rescale_in(OutRect, InRect: PEina_Rectangle;
  res: PEina_Rectangle);
begin
  res^.x := InRect^.x - OutRect^.x;
  res^.y := InRect^.y - OutRect^.y;
  res^.w := InRect^.w;
  res^.h := InRect^.h;
end;

procedure eina_rectangle_rescale_out(OutRect, InRect: PEina_Rectangle;
  res: PEina_Rectangle);
begin
  res^.x := OutRect^.x + InRect^.x;
  res^.y := OutRect^.y + InRect^.y;
  res^.w := OutRect^.w;
  res^.h := OutRect^.h;
end;

function eina_rectangle_max_x(thiz: PEina_Rectangle): integer;
begin
  Result := thiz^.x + thiz^.w;
end;

function eina_rectangle_max_y(thiz: PEina_Rectangle): integer;
begin
  Result := thiz^.y + thiz^.h;
end;

function eina_rectangle_x_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: integer): TEina_Bool;
var
  tmp1, tmp2: Teina_Rectangle;
begin
  if amount > thiz^.w then begin
    Exit(EINA_FALSE);
  end;
  eina_rectangle_coords_from(@tmp1, thiz^.x, thiz^.y, amount, thiz^.h);
  eina_rectangle_coords_from(@tmp2, thiz^.x + amount, thiz^.y, thiz^.w - amount, thiz^.h);
  if slice <> nil then begin
    slice^ := tmp1;
  end;
  if leftover <> nil then begin
    leftover^ := tmp2;
  end;
  Result := EINA_TRUE;
end;

function eina_rectangle_y_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: integer): TEina_Bool;
var
  tmp1, tmp2: Teina_Rectangle;
begin
  if amount > thiz^.h then begin
    Exit(EINA_FALSE);
  end;
  eina_rectangle_coords_from(@tmp1, thiz^.x, thiz^.y, thiz^.w, amount);
  eina_rectangle_coords_from(@tmp2, thiz^.x, thiz^.y + amount, thiz^.w, thiz^.h - amount);

  if slice <> nil then begin
    slice^ := tmp1;
  end;
  if leftover <> nil then begin
    leftover^ := tmp2;
  end;
  Result := EINA_TRUE;
end;

function eina_rectangle_width_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: integer): TEina_Bool;
var
  tmp1, tmp2: Teina_Rectangle;
begin
  if thiz^.w - amount < 0 then begin
    Exit(EINA_FALSE);
  end;
  eina_rectangle_coords_from(@tmp1, thiz^.x + (thiz^.w - amount), thiz^.y, amount, thiz^.h);
  eina_rectangle_coords_from(@tmp2, thiz^.x, thiz^.y, thiz^.w - amount, thiz^.h);
  if slice <> nil then begin
    slice^ := tmp1;
  end;
  if leftover <> nil then begin
    leftover^ := tmp2;
  end;
  Result := EINA_TRUE;
end;

function eina_rectangle_height_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: integer): TEina_Bool;
var
  tmp1, tmp2: Teina_Rectangle;
begin
  if thiz^.h - amount < 0 then begin
    Exit(EINA_FALSE);
  end;
  eina_rectangle_coords_from(@tmp1, thiz^.x, thiz^.y + (thiz^.h - amount), thiz^.w, amount);
  eina_rectangle_coords_from(@tmp2, thiz^.x, thiz^.y, thiz^.w, thiz^.h - amount);
  if slice <> nil then begin
    slice^ := tmp1;
  end;
  if leftover <> nil then begin
    leftover^ := tmp2;
  end;
  Result := EINA_TRUE;
end;

function eina_rectangle_subtract(thiz: PEina_Rectangle; other: PEina_Rectangle; out_: PEina_Rectangle): TEina_Bool;
var
  intersection, tmp: TEina_Rectangle;
  leftover: TEina_Rectangle = (x: 0; y: 0; w: 0; h: 0);
  cut: integer;
begin
  if eina_rectangle_is_valid(thiz) then begin
    eina_rectangle_coords_from(@out_[0], 0, 0, 0, 0);
    eina_rectangle_coords_from(@out_[1], 0, 0, 0, 0);
    eina_rectangle_coords_from(@out_[2], 0, 0, 0, 0);
    eina_rectangle_coords_from(@out_[3], 0, 0, 0, 0);
    intersection := thiz^;

    if not eina_rectangle_intersection(@intersection, other) then begin
      out_[0] := thiz^;
      Exit(EINA_TRUE);
    end;

    // cut in height
    cut := thiz^.h - (intersection.y - thiz^.y);
    if cut > thiz^.h then begin
      cut := thiz^.h;
    end;
    eina_rectangle_height_cut(thiz, @leftover, @out_[0], cut);

    // cut in y
    tmp := leftover;
    if eina_rectangle_intersection(@tmp, @intersection) then begin
      cut := leftover.h - (eina_rectangle_max_y(@leftover) - eina_rectangle_max_y(@tmp));
      if cut > leftover.h then begin
        cut := leftover.h;
      end;
      eina_rectangle_y_cut(@leftover, @leftover, @out_[1], cut);
    end;

    // cut in width
    tmp := leftover;
    if eina_rectangle_intersection(@tmp, @intersection) then begin
      cut := leftover.w - (tmp.x - leftover.x);
      if cut > leftover.w then begin
        cut := leftover.w;
      end;
      eina_rectangle_width_cut(@leftover, @leftover, @out_[2], cut);
    end;

    // cut in x
    tmp := leftover;
    if eina_rectangle_intersection(@tmp, @intersection) then begin
      cut := leftover.w - (eina_rectangle_max_x(@leftover) - eina_rectangle_max_x(@tmp));
      if cut > leftover.w then begin
        cut := leftover.w;
      end;
      eina_rectangle_x_cut(@leftover, @leftover, @out_[3], cut);
    end;
    Exit(EINA_TRUE);
  end;
  Result := EINA_FALSE;
end;

end.
