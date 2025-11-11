program project1;
uses
fp_libusb;

procedure main;
var
  version: Plibusb_version;
begin
  version:=libusb_get_version;
  with version^ do WriteLn('Version: ',major,'.',minor,'.',micro,'.',nano);
end;

begin
main;
end.

