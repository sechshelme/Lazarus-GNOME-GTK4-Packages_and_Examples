program project1;

uses
  fp_hidapi,
  fp_hidapi_libusb;


#include <stdio.h>
#include <wchar.h>
#include <hidapi.h>

int main() {
    // Beispiel Werte aus lsusb: Logitech RX 250 Mouse
    unsigned short vendor_id = 0x046d;
    unsigned short product_id = 0xc050;

    hid_device *handle;
    wchar_t wstr[256];
    int res;

    // HIDAPI initialisieren
    if (hid_init() != 0) {
        printf("HIDAPI init fehlgeschlagen\n");
        return 1;
    }

    // Gerät öffnen mit VID und PID
    handle = hid_open(vendor_id, product_id, NULL);
    if (!handle) {
        printf("Gerät nicht gefunden oder kann nicht geöffnet werden\n");
        hid_exit();
        return 1;
    }

    // Herstellerstring lesen
    res = hid_get_manufacturer_string(handle, wstr, sizeof(wstr)/sizeof(wchar_t));
    if (res == 0) {
        wprintf(L"Hersteller: %ls\n", wstr);
    }

    // Produktstring lesen
    res = hid_get_product_string(handle, wstr, sizeof(wstr)/sizeof(wchar_t));
    if (res == 0) {
        wprintf(L"Produkt: %ls\n", wstr);
    }

    // Gerät schließen
    hid_close(handle);
    hid_exit();

    return 0;
}


begin
  WriteLn(SizeOf(WideChar));

end.

