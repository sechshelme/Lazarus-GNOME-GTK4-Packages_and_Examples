

// gcc main.c -o main -lpci



#include <stdio.h>
#include <pci/pci.h>

int main(void) {
    struct pci_access *pacc;
    struct pci_dev *dev;
    char namebuf[1024], *name;

    pacc = pci_alloc();
    pci_init(pacc);
    pci_scan_bus(pacc);

    for (dev = pacc->devices; dev; dev = dev->next) {
        pci_fill_info(dev, PCI_FILL_IDENT | PCI_FILL_BASES);
        printf("Bus %02x:%02x.%d\n", dev->bus, dev->dev, dev->func);
        printf("  Vendor: 0x%04x, Device: 0x%04x\n", dev->vendor_id, dev->device_id);
        name = pci_lookup_name(pacc, namebuf, sizeof(namebuf), PCI_LOOKUP_VENDOR, dev->vendor_id);
        printf("  Hersteller: %s\n", name);
        name = pci_lookup_name(pacc, namebuf, sizeof(namebuf), PCI_LOOKUP_DEVICE, dev->vendor_id, dev->device_id);
        printf("  Geräte-Name: %s\n", name);
        printf("\n");
    }
    pci_cleanup(pacc);
    return 0;
}


