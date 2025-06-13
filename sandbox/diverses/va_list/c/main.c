#include <stdio.h>
#include <stdarg.h>
#include <stdint.h>

void print_va_list_raw(const char *fmt, ...) {
    va_list args;
    va_start(args, fmt);

    size_t sz = sizeof(args);
    unsigned char *p = (unsigned char*)&args;

    printf("Als uint8_t:\n");
    for (size_t i = 0; i < sz; ++i)
        printf("%02x ", ((uint8_t*)p)[i]);
    printf("\n");

    printf("Als uint16_t:\n");
    for (size_t i = 0; i + 1 < sz; i += 2)
        printf("%04x ", ((uint16_t*)p)[i/2]);
    printf("\n");

    printf("Als uint32_t:\n");
    for (size_t i = 0; i + 3 < sz; i += 4)
        printf("%08x ", ((uint32_t*)p)[i/4]);
    printf("\n");

    printf("Als uint64_t:\n");
    for (size_t i = 0; i + 7 < sz; i += 8)
        printf("%016lx ", ((uint64_t*)p)[i/8]);
    printf("\n");

    va_end(args);


    va_start(args, fmt);

    // Hole den reg_save_area-Zeiger
    void **va_ptr = (void**)&args;
    void *reg_save_area = va_ptr[2]; // Drittes Feld in va_list-Struktur

    printf("reg_save_area: %p\n", reg_save_area);

    // Lese die ersten 3 int-Werte aus reg_save_area
    int *int_args = (int *)reg_save_area;
    printf("Direkt aus reg_save_area: %d %d %d\n", int_args[0], int_args[1], int_args[2]);


uint64_t *regs = (uint64_t*)reg_save_area;
printf("reg_save_area (als uint64_t):\n");
for (int i = 0; i < 6; ++i) {
    printf("%ld - ", regs[i]);
}
printf("\n");



    va_end(args);
}

int main() {
    print_va_list_raw("%d %d %d\n", 1111, 2222, 3333, 4444, 5555);
    return 0;
}

