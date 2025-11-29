program project1;

uses
  fp_libusb;

  procedure PrintVersion;
  var
    version: Plibusb_version;
  begin
    version := libusb_get_version;
    with version^ do begin
      WriteLn('Version: ', major, '.', minor, '.', micro, '.', nano, #10);
    end;
  end;

  procedure main;
  begin
    PrintVersion;
  end;

begin
  main;
end.
