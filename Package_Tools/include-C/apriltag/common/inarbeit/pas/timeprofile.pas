unit timeprofile;

interface

uses
  fp_apriltag, zarray, time_util;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Ptimeprofile_entry = ^Ttimeprofile_entry;
  Ttimeprofile_entry = record
    name: array[0..31] of char;
    utime: Tint64_t;
  end;

  Ptimeprofile_t = ^Ttimeprofile_T;
  Ttimeprofile_t = record
    utime: Tint64_t;
    stamps: Pzarray_t;
  end;

function timeprofile_create: Ptimeprofile_t;
procedure timeprofile_destroy(tp: Ptimeprofile_t);
procedure timeprofile_clear(tp: Ptimeprofile_t);
procedure timeprofile_stamp(tp: Ptimeprofile_t; name: pansichar);
procedure timeprofile_display(tp: Ptimeprofile_t);
function timeprofile_total_utime(tp: Ptimeprofile_t): uint64;

// === Konventiert am: 12-9-26 17:28:42 ===


implementation

function timeprofile_create: Ptimeprofile_t;
var
  tp: Ptimeprofile_t;
begin
  tp := Ptimeprofile_t(calloc(1, SizeOf(Ttimeprofile_t)));
  tp^.stamps := zarray_create(SizeOf(Ttimeprofile_entry));
  tp^.utime := utime_now;
  Result := tp;
end;

procedure timeprofile_destroy(tp: Ptimeprofile_t);
begin
  zarray_destroy(tp^.stamps);
  free(tp);
end;

procedure timeprofile_clear(tp: Ptimeprofile_t);
begin
  zarray_clear(tp^.stamps);
  tp^.utime := utime_now;
end;

procedure timeprofile_stamp(tp: Ptimeprofile_t; name: pansichar);
var
  tpe: Ttimeprofile_entry;
begin
  strncpy(@tpe.name[0], name, SizeOf(tpe.name));
  tpe.name[SizeOf(tpe.name) - 1] := #0;
  tpe.utime := utime_now;
  zarray_add(tp^.stamps, @tpe);
end;

procedure timeprofile_display(tp: Ptimeprofile_t);
var
  lastutime: int64;
  i: integer;
  stamp: Ptimeprofile_entry;
  cumtime: double;
  parttime: double;
begin
  lastutime := tp^.utime;

  for i := 0 to zarray_size(tp^.stamps) - 1 do begin
    zarray_get_volatile(tp^.stamps, i, @stamp);

    cumtime := (stamp^.utime - tp^.utime) / 1000000.0;
    parttime := (stamp^.utime - lastutime) / 1000000.0;

    printf('%2d %32s %15f ms %15f ms'#10, i, stamp^.name, parttime * 1000, cumtime * 1000);

    lastutime := stamp^.utime;
  end;
end;

function timeprofile_total_utime(tp: Ptimeprofile_t): uint64;
var
  first: Ptimeprofile_entry;
  last: Ptimeprofile_entry;
begin
  if zarray_size(tp^.stamps) = 0 then  begin
    Exit(0);
  end;

  zarray_get_volatile(tp^.stamps, 0, @first);
  zarray_get_volatile(tp^.stamps, zarray_size(tp^.stamps) - 1, @last);

  Result := last^.utime - first^.utime;
end;


end.
