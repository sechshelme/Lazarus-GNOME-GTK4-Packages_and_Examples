program project1;

uses
  fp_libudev;

  procedure main;
  var
    udev: Pudev;
    enumerate: Pudev_enumerate;
    dev_list_entry: Pudev_list_entry;
    path, vendor, product, serial: pchar;
    dev: Pudev_device;
  begin
    udev := udev_new;
    if udev = nil then begin
      WriteLn('Cannot create udev context.');
      Halt(1);
    end;

    enumerate := udev_enumerate_new(udev);
    udev_enumerate_add_match_subsystem(enumerate, 'usb');
    udev_enumerate_scan_devices(enumerate);

    dev_list_entry := udev_enumerate_get_list_entry(enumerate);

    while dev_list_entry <> nil do begin
      path := udev_list_entry_get_name(dev_list_entry);
      dev := udev_device_new_from_syspath(udev, path);

      vendor := udev_device_get_property_value(dev, 'ID_VENDOR_ID');
      product := udev_device_get_property_value(dev, 'ID_MODEL_ID');
      serial := udev_device_get_property_value(dev, 'ID_SERIAL_SHORT');

      WriteLn('USB Device: ', path);
      WriteLn(' Vendor ID: ', vendor);
      WriteLn(' Product ID: ', product);
      WriteLn(' Serial: ', serial);
      WriteLn();

      udev_device_unref(dev);

      dev_list_entry := udev_list_entry_get_next(dev_list_entry);
    end;

    udev_enumerate_unref(enumerate);
    udev_unref(udev);
  end;

begin
  main;
end.
