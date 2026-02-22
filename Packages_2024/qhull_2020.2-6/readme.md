In den record hat es viele Padding, welche gebraucht werden.
C und Pascal scheint da nicht kompatibel zu sein.
So das er kompatibel zu C sind.
Je nachdem ob qh2 auf dem Stack ode Heap ist, verändet sich das Verhalten.


# Test für struct / record Differenzen

## C 
```c
// Linux:
// gcc main.c -o main -lqhull_r -lm

// Windows:
// x86_64-w64-mingw32-gcc main.c -o main.exe -I. -L. -lqhull_r -lm 



#include <stdio.h>
#include <libqhull_r/qhull_ra.h>
#include <libqhull_r/libqhull_r.h>

int main() {
    qhT qh2; // Auf dem Stack wie in Pascal
    size_t pos0 = (size_t)&qh2;

    printf("size jmp_buf:  %ld\n", sizeof( jmp_buf));
    printf("size facetT:   %ld\n", sizeof( facetT));
    printf("size qhT:      %ld\n", sizeof( qhT));
    printf("size qhmemT:   %ld\n", sizeof( qhmemT));
    printf("size qhstatT:  %ld\n", sizeof( qhstatT));
    printf("size TqhT.qhull:  %ld\n", sizeof( qh2.qhull));

    printf("\n");

    printf("offset qhmem:      %zu\n", (size_t)&qh2.qhmem - pos0);
    printf("offset qhstat:     %zu\n", (size_t)&qh2.qhstat - pos0);
    printf("offset qhull:      %zu\n", (size_t)&qh2.qhull - pos0);
    printf("offset errexit:    %zu\n", (size_t)&qh2.errexit - pos0);
    printf("offset fin:        %zu\n", (size_t)&qh2.fin    - pos0);
    printf("offset qhmem:      %zu\n", (size_t)&qh2.qhmem    - pos0);
    printf("offset qhstat:     %zu\n", (size_t)&qh2.qhstat    - pos0);
    printf("offset facet_list: %zu\n", (size_t)&qh2.facet_list - pos0);
```

## Pascal
```pascal
var
    qh: PqhT;
    pos0: PtrUInt;
begin
    WriteLn('size jmp_buf:  ', sizeof(Tjmp_buf));
    WriteLn('size facetT:   ', sizeof(TfacetT));
    WriteLn('size qhT:      ', sizeof(TqhT));
    WriteLn('size qhmemT:   ', sizeof(TqhmemT));
    WriteLn('size qhstatT:  ', sizeof(TqhstatT));
    WriteLn('size TqhT.qhull:  ', sizeof(TqhT.qhull));

    pos0 := PtrUInt(qh);
    WriteLn('offset qhT.qhmem:       ', PtrUInt(@qh^.qhmem) - pos0);
    WriteLn('offset qhT.qhstat:      ', PtrUInt(@qh^.qhstat) - pos0);
    WriteLn('Offset qhull :          ', PtrUInt(@qh^.qhull) - pos0);
    WriteLn('Offset errexit :        ', PtrUInt(@qh^.errexit) - pos0);
    WriteLn('Offset fin:             ', PtrUInt(@qh^.fin) - pos0);
    WriteLn('Offset qhmem:           ', PtrUInt(@qh^.qhmem) - pos0);
    WriteLn('Offset qhstat:          ', PtrUInt(@qh^.qhstat) - pos0);
    WriteLn('Offset facet_list:      ', PtrUInt(@qh^.facet_list) - pos0);
...
```
