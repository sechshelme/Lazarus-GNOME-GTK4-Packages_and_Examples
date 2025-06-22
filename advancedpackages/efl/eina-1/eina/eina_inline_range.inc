{$IFDEF read_interface}

function eina_range_end(range: PEina_Range): Tsize_t;
function eina_range_intersect(range, range2: PEina_Range): TEina_Range;
function eina_range_union(range, range2: PEina_Range): TEina_Range;
function eina_range_contains(range: PEina_Range; value: Tsize_t): TEina_Bool;
function eina_range_equal(range, range2: PEina_Range): TEina_Bool;
function eina_range_from_to(min_, max_: Tsize_t): TEina_Range;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_range_end(range: PEina_Range): Tsize_t;
begin
  if range <> nil then begin
    Result := range^.start + range^.length;
  end else begin
    Result := 0;
  end;
end;

function eina_range_intersect(range, range2: PEina_Range): TEina_Range;
var
  min_, max_: Tsize_t;
begin
  Result.start := 0;
  Result.length := 0;
  if (range = nil) or (range2 = nil) then begin
    Exit;
  end;
  min_ := Max(range^.start, range2^.start);
  max_ := Min(range^.start + range^.length, range2^.start + range2^.length);
  if max_ > min_ then begin
    Result := eina_range_from_to(min_, max_);
  end;
end;

function eina_range_union(range, range2: PEina_Range): TEina_Range;
var
  min_, max_: Tsize_t;
begin
  if (range = nil) or (range2 = nil) then begin
    Result.start := 0;
    Result.length := 0;
    Exit;
  end;
  min_ := Min(range^.start, range2^.start);
  max_ := Max(range^.start + range^.length, range2^.start + range2^.length);
  Result := eina_range_from_to(min_, max_);
end;

function eina_range_contains(range: PEina_Range; value: Tsize_t): TEina_Bool;
begin
  if range = nil then begin
    Exit(EINA_FALSE);
  end;
  Result := (value >= range^.start) and (value < (range^.start + range^.length));
end;

function eina_range_equal(range, range2: PEina_Range): TEina_Bool;
begin
  if (range = nil) or (range2 = nil) then begin
    Exit(EINA_FALSE);
  end;
  Result := (range^.start = range2^.start) and (range^.length = range2^.length);
end;

function eina_range_from_to(min_, max_: Tsize_t): TEina_Range;
begin
  if min_ < max_ then begin
    Result.start := min_;
    Result.length := max_ - min_;
  end else begin
    Result.start := max_;
    Result.length := min_ - max_;
  end;
end;

{$ENDIF read_implementation}
