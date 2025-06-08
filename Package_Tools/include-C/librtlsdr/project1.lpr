program project1;

uses
  rtl_sdr;

var
  device_count: Tuint32_t;
  i: integer;
begin
  device_count := rtlsdr_get_device_count;
  WriteLn('Device Couint: ', device_count);

  for i := 0 to device_count - 1 do begin
    WriteLn(i: 3, '. ', rtlsdr_get_device_name(i));
  end;
end.
