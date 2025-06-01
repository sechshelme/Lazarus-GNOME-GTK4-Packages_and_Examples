unit eina_inline_rectangle;

interface

uses
  fp_eina;


function eina_rectangle_is_valid(const r: PEina_Rectangle): Teina_Bool; inline;
function eina_spans_intersect(c1, l1, c2, l2: Integer): Integer; inline;
function eina_rectangle_is_empty(const r: PEina_Rectangle): Teina_Bool; inline;
procedure eina_rectangle_coords_from(r: PEina_Rectangle; x, y, w, h: Integer); inline;
function eina_rectangle_equal(const rect1, rect2: PEina_Rectangle): Teina_Bool; inline;
function eina_rectangles_intersect(const r1, r2: PEina_Rectangle): Teina_Bool; inline;
function eina_rectangle_xcoord_inside(const r: PEina_Rectangle; x: Integer): Teina_Bool; inline;
function eina_rectangle_ycoord_inside(const r: PEina_Rectangle; y: Integer): Teina_Bool; inline;
function eina_rectangle_coords_inside(const r: PEina_Rectangle; x, y: Integer): Teina_Bool; inline;
procedure eina_rectangle_union(dst: PEina_Rectangle; const src: PEina_Rectangle); inline;
function eina_rectangle_intersection(dst: PEina_Rectangle; const src: PEina_Rectangle): Teina_Bool; inline;
procedure eina_rectangle_rescale_in(const OutRect, InRect: PEina_Rectangle; res: PEina_Rectangle); inline;
procedure eina_rectangle_rescale_out(const OutRect, InRect: PEina_Rectangle; res: PEina_Rectangle); inline;
function eina_rectangle_max_x(thiz: PEina_Rectangle): Integer; inline;
function eina_rectangle_max_y(thiz: PEina_Rectangle): Integer; inline;
function eina_rectangle_x_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: Integer): Teina_Bool; inline;
function eina_rectangle_y_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: Integer): Teina_Bool; inline;
function eina_rectangle_width_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: Integer): Teina_Bool; inline;
function eina_rectangle_height_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: Integer): Teina_Bool; inline;
function eina_rectangle_subtract(thiz: PEina_Rectangle; other: PEina_Rectangle; OutRects: array of Teina_Rectangle): Teina_Bool; inline;

implementation

function eina_rectangle_is_valid(const r: PEina_Rectangle): Teina_Bool;
begin
  if Assigned(r) and (r^.w > 0) and (r^.h > 0) then
    Result := EINA_TRUE
  else
    Result := EINA_FALSE;
end;

function eina_spans_intersect(c1, l1, c2, l2: Integer): Integer;
begin
  Result := Ord(not (((c2 + l2) <= c1) or (c2 >= (c1 + l1))));
end;

function eina_rectangle_is_empty(const r: PEina_Rectangle): Teina_Bool;
begin
  Result := not eina_rectangle_is_valid(r);
end;

procedure eina_rectangle_coords_from(r: PEina_Rectangle; x, y, w, h: Integer);
begin
  if Assigned(r) then
  begin
    r^.x := x;
    r^.y := y;
    r^.w := w;
    r^.h := h;
  end;
end;

function eina_rectangle_equal(const rect1, rect2: PEina_Rectangle): Teina_Bool;
begin
  if Assigned(rect1) and Assigned(rect2) then
    Result := (rect1^.x = rect2^.x) and (rect1^.y = rect2^.y) and
              (rect1^.w = rect2^.w) and (rect1^.h = rect2^.h)
  else
    Result := EINA_FALSE;
end;

function eina_rectangles_intersect(const r1, r2: PEina_Rectangle): Teina_Bool;
begin
  Result := Teina_Bool(eina_spans_intersect(r1^.x, r1^.w, r2^.x, r2^.w) and eina_spans_intersect(r1^.y, r1^.h, r2^.y, r2^.h));
end;

function eina_rectangle_xcoord_inside(const r: PEina_Rectangle; x: Integer): Teina_Bool;
begin
  Result := Teina_Bool((x >= r^.x) and (x < (r^.x + r^.w)));
end;

function eina_rectangle_ycoord_inside(const r: PEina_Rectangle; y: Integer): Teina_Bool;
begin
  Result := Teina_Bool((y >= r^.y) and (y < (r^.y + r^.h)));
end;

function eina_rectangle_coords_inside(const r: PEina_Rectangle; x, y: Integer): Teina_Bool;
begin
  Result := Teina_Bool(eina_rectangle_xcoord_inside(r, x) and eina_rectangle_ycoord_inside(r, y));
end;

procedure eina_rectangle_union(dst: PEina_Rectangle; const src: PEina_Rectangle);
begin
  if Assigned(dst) and Assigned(src) then
  begin
    // left
    if dst^.x > src^.x then
    begin
      dst^.w := dst^.w + (dst^.x - src^.x);
      dst^.x := src^.x;
    end;
    // right
    if (dst^.x + dst^.w) < (src^.x + src^.w) then
      dst^.w := src^.x + src^.w - dst^.x;
    // top
    if dst^.y > src^.y then
    begin
      dst^.h := dst^.h + (dst^.y - src^.y);
      dst^.y := src^.y;
    end;
    // bottom
    if (dst^.y + dst^.h) < (src^.y + src^.h) then
      dst^.h := src^.y + src^.h - dst^.y;
  end;
end;

function eina_rectangle_intersection(dst: PEina_Rectangle; const src: PEina_Rectangle): Teina_Bool;
var
  temp_dst_val: Teina_Rectangle; // Use a local copy to avoid modifying dst directly until valid
begin
  Result := EINA_FALSE; // Default to false

  if Assigned(dst) and Assigned(src) then
  begin
    temp_dst_val := dst^; // Copy the content of dst to a local variable

    if eina_rectangle_is_valid(@temp_dst_val) and eina_rectangle_is_valid(src) and
       eina_rectangles_intersect(@temp_dst_val, src) then
    begin
      // left
      if temp_dst_val.x < src^.x then
      begin
        temp_dst_val.w := temp_dst_val.w + (temp_dst_val.x - src^.x);
        temp_dst_val.x := src^.x;
        if temp_dst_val.w < 0 then
          temp_dst_val.w := 0;
      end;
      // right
      if (temp_dst_val.x + temp_dst_val.w) > (src^.x + src^.w) then
        temp_dst_val.w := src^.x + src^.w - temp_dst_val.x;
      // top
      if temp_dst_val.y < src^.y then
      begin
        temp_dst_val.h := temp_dst_val.h + (temp_dst_val.y - src^.y);
        temp_dst_val.y := src^.y;
        if temp_dst_val.h < 0 then
          temp_dst_val.h := 0;
      end;
      // bottom
      if (temp_dst_val.y + temp_dst_val.h) > (src^.y + src^.h) then
        temp_dst_val.h := src^.y + src^.h - temp_dst_val.y;

      if (temp_dst_val.w = 0) or (temp_dst_val.h = 0) then
      begin
        eina_rectangle_coords_from(dst, 0, 0, 0, 0); // Set dst to empty if intersection is empty
        Result := EINA_FALSE;
      end
      else
      begin
        dst^ := temp_dst_val; // Assign the modified local copy back to dst
        Result := EINA_TRUE;
      end;
    end
    else
    begin
      eina_rectangle_coords_from(dst, 0, 0, 0, 0); // Set dst to empty if no valid intersection
      Result := EINA_FALSE;
    end;
  end;
end;

procedure eina_rectangle_rescale_in(const OutRect, InRect: PEina_Rectangle; res: PEina_Rectangle);
begin
  if Assigned(OutRect) and Assigned(InRect) and Assigned(res) then
  begin
    res^.x := InRect^.x - OutRect^.x;
    res^.y := InRect^.y - OutRect^.y;
    res^.w := InRect^.w;
    res^.h := InRect^.h;
  end;
end;

procedure eina_rectangle_rescale_out(const OutRect, InRect: PEina_Rectangle; res: PEina_Rectangle);
begin
  if Assigned(OutRect) and Assigned(InRect) and Assigned(res) then
  begin
    res^.x := OutRect^.x + InRect^.x;
    res^.y := OutRect^.y + InRect^.y;
    res^.w := OutRect^.w;
    res^.h := OutRect^.h;
  end;
end;

function eina_rectangle_max_x(thiz: PEina_Rectangle): Integer;
begin
  if Assigned(thiz) then
    Result := thiz^.x + thiz^.w
  else
    Result := 0; // Or handle error appropriately
end;

function eina_rectangle_max_y(thiz: PEina_Rectangle): Integer;
begin
  if Assigned(thiz) then
    Result := thiz^.y + thiz^.h
  else
    Result := 0; // Or handle error appropriately
end;

function eina_rectangle_x_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: Integer): Teina_Bool;
var
  tmp1, tmp2: Teina_Rectangle;
begin
  Result := EINA_FALSE; // Default to false

  if Assigned(thiz) then
  begin
    if amount > thiz^.w then
      Exit;

    eina_rectangle_coords_from(@tmp1, thiz^.x, thiz^.y, amount, thiz^.h);
    eina_rectangle_coords_from(@tmp2, thiz^.x + amount, thiz^.y, thiz^.w - amount, thiz^.h);

    if Assigned(slice) then
      slice^ := tmp1;
    if Assigned(leftover) then
      leftover^ := tmp2;

    Result := EINA_TRUE;
  end;
end;

function eina_rectangle_y_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: Integer): Teina_Bool;
var
  tmp1, tmp2: Teina_Rectangle;
begin
  Result := EINA_FALSE; // Default to false

  if Assigned(thiz) then
  begin
    if amount > thiz^.h then
      Exit;

    eina_rectangle_coords_from(@tmp1, thiz^.x, thiz^.y, thiz^.w, amount);
    eina_rectangle_coords_from(@tmp2, thiz^.x, thiz^.y + amount, thiz^.w, thiz^.h - amount);

    if Assigned(slice) then
      slice^ := tmp1;
    if Assigned(leftover) then
      leftover^ := tmp2;

    Result := EINA_TRUE;
  end;
end;

function eina_rectangle_width_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: Integer): Teina_Bool;
var
  tmp1, tmp2: Teina_Rectangle;
begin
  Result := EINA_FALSE; // Default to false

  if Assigned(thiz) then
  begin
    if thiz^.w - amount < 0 then
      Exit;

    eina_rectangle_coords_from(@tmp1, thiz^.x + (thiz^.w - amount), thiz^.y, amount, thiz^.h);
    eina_rectangle_coords_from(@tmp2, thiz^.x, thiz^.y, thiz^.w - amount, thiz^.h);

    if Assigned(slice) then
      slice^ := tmp1;
    if Assigned(leftover) then
      leftover^ := tmp2;

    Result := EINA_TRUE;
  end;
end;

function eina_rectangle_height_cut(thiz: PEina_Rectangle; slice, leftover: PEina_Rectangle; amount: Integer): Teina_Bool;
var
  tmp1, tmp2: Teina_Rectangle;
begin
  Result := EINA_FALSE; // Default to false

  if Assigned(thiz) then
  begin
    if thiz^.h - amount < 0 then
      Exit;

    eina_rectangle_coords_from(@tmp1, thiz^.x, thiz^.y + (thiz^.h - amount), thiz^.w, amount);
    eina_rectangle_coords_from(@tmp2, thiz^.x, thiz^.y, thiz^.w, thiz^.h - amount);

    if Assigned(slice) then
      slice^ := tmp1;
    if Assigned(leftover) then
      leftover^ := tmp2;

    Result := EINA_TRUE;
  end;
end;

function eina_rectangle_subtract(thiz: PEina_Rectangle; other: PEina_Rectangle; OutRects: array of Teina_Rectangle): Teina_Bool;
var
  intersection: Teina_Rectangle;
  leftover_val: Teina_Rectangle; // Use a value type for leftover
  tmp_val: Teina_Rectangle; // Use a value type for tmp
  cut: Integer;
begin
  Result := EINA_FALSE; // Default to false

  if Assigned(thiz) and Assigned(other) then
  begin
    if Length(OutRects) < 4 then
    begin
        Result := EINA_FALSE;
        Exit;
    end;

    eina_rectangle_coords_from(@OutRects[0], 0, 0, 0, 0);
    eina_rectangle_coords_from(@OutRects[1], 0, 0, 0, 0);
    eina_rectangle_coords_from(@OutRects[2], 0, 0, 0, 0);
    eina_rectangle_coords_from(@OutRects[3], 0, 0, 0, 0);

    intersection := thiz^; // Copy thiz to intersection
    if not eina_rectangle_intersection(@intersection, other) then
    begin
      OutRects[0] := thiz^;
      Result := EINA_TRUE;
      Exit;
    end;

    leftover_val := thiz^; // Start with the original 'thiz' for leftover calculations

    // cut in height (bottom part of 'thiz' not covered by intersection)
    cut := leftover_val.h - (intersection.y - leftover_val.y);
    if cut > leftover_val.h then cut := leftover_val.h;
    if eina_rectangle_height_cut(@leftover_val, @OutRects[0], @leftover_val, cut) then
    begin
      // If the cut was successful, OutRects[0] holds the bottom piece,
      // and 'leftover_val' now holds the remaining top part of 'thiz'.
    end;

    // cut in y (top part of 'leftover_val' not covered by intersection)
    tmp_val := leftover_val; // Work with a copy of current leftover
    if eina_rectangle_intersection(@tmp_val, @intersection) then
    begin
      cut := tmp_val.h - (eina_rectangle_max_y(@leftover_val) - eina_rectangle_max_y(@tmp_val));
      if cut > tmp_val.h then cut := tmp_val.h;
      if eina_rectangle_y_cut(@leftover_val, @leftover_val, @OutRects[1], cut) then
      begin
        // If successful, OutRects[1] holds the top piece from 'leftover_val',
        // and 'leftover_val' now holds the middle part.
      end;
    end;

    // cut in width (right part of 'leftover_val' not covered by intersection)
    tmp_val := leftover_val;
    if eina_rectangle_intersection(@tmp_val, @intersection) then
    begin
      cut := tmp_val.w - (tmp_val.x - leftover_val.x);
      if cut > tmp_val.w then cut := tmp_val.w;
      if eina_rectangle_width_cut(@leftover_val, @leftover_val, @OutRects[2], cut) then
      begin
        // If successful, OutRects[2] holds the right piece from 'leftover_val',
        // and 'leftover_val' holds the remaining left part.
      end;
    end;

    // cut in x (left part of 'leftover_val' not covered by intersection)
    tmp_val := leftover_val;
    if eina_rectangle_intersection(@tmp_val, @intersection) then
    begin
      cut := tmp_val.w - (eina_rectangle_max_x(@leftover_val) - eina_rectangle_max_x(@tmp_val));
      if cut > tmp_val.w then cut := tmp_val.w;
      if eina_rectangle_x_cut(@leftover_val, @leftover_val, @OutRects[3], cut) then
      begin
        // If successful, OutRects[3] holds the left piece from 'leftover_val',
        // and 'leftover_val' now technically represents the central hole or what's left.
      end;
    end;
    Result := EINA_TRUE;
  end;
end;

end.
