

// gcc main.c -o main -lpciaccess


#include <stdio.h>
#include <pciaccess.h>

int main(void) {
    struct pci_device_iterator *iter;
    struct pci_device *dev;
    int err;

    // Initialisiere libpciaccess
    err = pci_system_init();
    if (err != 0) {
        fprintf(stderr, "pci_system_init() failed: %d\n", err);
        return 1;
    }

    // Iteriere über alle PCI-Geräte
    iter = pci_id_match_iterator_create(NULL);
    while ((dev = pci_device_next(iter)) != NULL) {
        printf("PCI-Gerät: Bus %02x, Gerät %02x, Funktion %x\n",
               dev->bus, dev->dev, dev->func);
        printf("  Vendor-ID: 0x%04x, Device-ID: 0x%04x\n",
               dev->vendor_id, dev->device_id);
        printf("\n");
    }
    pci_iterator_destroy(iter);

    // Aufräumen
    pci_system_cleanup();
    return 0;
}

