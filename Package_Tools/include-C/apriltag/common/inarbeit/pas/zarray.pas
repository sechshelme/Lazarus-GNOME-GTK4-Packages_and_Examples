unit zarray;

interface

uses
  fp_apriltag;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2013-2016, The Regents of The University of Michigan.
All rights reserved.
This software was developed in the APRIL Robotics Lab under the
direction of Edwin Olson, ebolson@umich.edu. This software may be
available under alternative licensing terms; contact the address above.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the Regents of The University of Michigan.
 }
(** unsupported pragma#pragma once*)
{$include <stddef.h>}
{$include <assert.h>}
{$include <stdlib.h>}
{$include <string.h>}
{ C++ extern C conditionnal removed }
{*
 * Defines a structure which acts as a resize-able array ala Java's ArrayList.
  }
type
  Tzarray = Tzarray_t;
{ size of each element }
{ how many elements? }
{ we've allocated storage for how many elements? }
  Pzarray = ^Tzarray;
  Tzarray = record
      el_sz : Tsize_t;
      size : longint;
      alloc : longint;
      data : Pchar;
    end;

{*xxxxxxxx
static inline zarray_t *zarray_create(size_t el_sz)

    assert(el_sz > 0);

    zarray_t *za = (zarray_t*) calloc(1, sizeof(zarray_t));
    za->el_sz = el_sz;
    return za;


static inline void zarray_destroy(zarray_t *za)

    if (za == NULL)
        return;

    if (za->data != NULL)
        free(za->data);
    memset(za, 0, sizeof(zarray_t));
    free(za);


static inline zarray_t *zarray_copy(const zarray_t *za)

    assert(za != NULL);

    zarray_t *zb = (zarray_t*) calloc(1, sizeof(zarray_t));
    zb->el_sz = za->el_sz;
    zb->size = za->size;
    zb->alloc = za->alloc;
    zb->data = (char*) malloc(zb->alloc * zb->el_sz);
    memcpy(zb->data, za->data, za->size * za->el_sz);
    return zb;


static int iceillog2(int v)

    v--;
    v |= v >> 1;
    v |= v >> 2;
    v |= v >> 4;
    v |= v >> 8;
    v |= v >> 16;
    v++;
    return v;


static inline zarray_t *zarray_copy_subset(const zarray_t *za,
                             int start_idx,
                             int end_idx_exclusive)

    zarray_t *out = (zarray_t*) calloc(1, sizeof(zarray_t));
    out->el_sz = za->el_sz;
    out->size = end_idx_exclusive - start_idx;
    out->alloc = iceillog2(out->size); // round up pow 2
    out->data = (char*) malloc(out->alloc * out->el_sz);
    memcpy(out->data,  za->data +(start_idx*out->el_sz), out->size*out->el_sz);
    return out;


static inline int zarray_size(const zarray_t *za)

    assert(za != NULL);

    return za->size;


static inline void zarray_ensure_capacity(zarray_t *za, int capacity)

    assert(za != NULL);

    if (capacity <= za->alloc)
        return;

    while (za->alloc < capacity) 
        za->alloc *= 2;
        if (za->alloc < 8)
            za->alloc = 8;
    

    za->data = (char*) realloc(za->data, za->alloc * za->el_sz);


static inline void zarray_add(zarray_t *za, const void *p)

    assert(za != NULL);
    assert(p != NULL);

    zarray_ensure_capacity(za, za->size + 1);

    memcpy(&za->data[za->size*za->el_sz], p, za->el_sz);
    za->size++;


static inline void zarray_get(const zarray_t *za, int idx, void *p)

    assert(za != NULL);
    assert(p != NULL);
    assert(idx >= 0);
    assert(idx < za->size);

    memcpy(p, &za->data[idx*za->el_sz], za->el_sz);


inline static void zarray_get_volatile(const zarray_t *za, int idx, void *p)

    assert(za != NULL);
    assert(p != NULL);
    assert(idx >= 0);
    assert(idx < za->size);

    *((void**) p) = &za->data[idx*za->el_sz];


inline static void zarray_truncate(zarray_t *za, int sz)

   assert(za != NULL);
   assert(sz <= za->size);
   za->size = sz;


static inline void zarray_remove_index(zarray_t *za, int idx, int shuffle)

    assert(za != NULL);
    assert(idx >= 0);
    assert(idx < za->size);

    if (shuffle) 
        if (idx < za->size-1)
            memcpy(&za->data[idx*za->el_sz], &za->data[(za->size-1)*za->el_sz], za->el_sz);
        za->size--;
        return;
     else 
        // size = 10, idx = 7. Should copy 2 entries (at idx=8 and idx=9).
        // size = 10, idx = 9. Should copy 0 entries.
        int ncopy = za->size - idx - 1;
        if (ncopy > 0)
            memmove(&za->data[idx*za->el_sz], &za->data[(idx+1)*za->el_sz], ncopy*za->el_sz);
        za->size--;
        return;
    


static inline int zarray_remove_value(zarray_t *za, const void *p, int shuffle)

    assert(za != NULL);
    assert(p != NULL);

    for (int idx = 0; idx < za->size; idx++) 
        if (!memcmp(p, &za->data[idx*za->el_sz], za->el_sz)) 
            zarray_remove_index(za, idx, shuffle);
            return 1;
        
    

    return 0;



static inline void zarray_insert(zarray_t *za, int idx, const void *p)

    assert(za != NULL);
    assert(p != NULL);
    assert(idx >= 0);
    assert(idx <= za->size);

    zarray_ensure_capacity(za, za->size + 1);
    // size = 10, idx = 7. Should copy three entries (idx=7, idx=8, idx=9)
    int ncopy = za->size - idx;

    memmove(&za->data[(idx+1)*za->el_sz], &za->data[idx*za->el_sz], ncopy*za->el_sz);
    memcpy(&za->data[idx*za->el_sz], p, za->el_sz);

    za->size++;



static inline void zarray_set(zarray_t *za, int idx, const void *p, void *outp)

    assert(za != NULL);
    assert(p != NULL);
    assert(idx >= 0);
    assert(idx < za->size);

    if (outp != NULL)
        memcpy(outp, &za->data[idx*za->el_sz], za->el_sz);

    memcpy(&za->data[idx*za->el_sz], p, za->el_sz);


static inline void zarray_map(zarray_t *za, void (*f)(void*))

    assert(za != NULL);
    assert(f != NULL);

    for (int idx = 0; idx < za->size; idx++)
        f(&za->data[idx*za->el_sz]);


    void zarray_vmap(zarray_t *za, void (*f)());

static inline void zarray_clear(zarray_t *za)

    assert(za != NULL);
    za->size = 0;


static inline int zarray_contains(const zarray_t *za, const void *p)

    assert(za != NULL);
    assert(p != NULL);

    for (int idx = 0; idx < za->size; idx++) 
        if (!memcmp(p, &za->data[idx*za->el_sz], za->el_sz)) 
            return 1;
        
    

    return 0;


static inline void zarray_sort(zarray_t *za, int (*compar)(const void*, const void*))

    assert(za != NULL);
    assert(compar != NULL);
    if (za->size == 0)
        return;

    qsort(za->data, za->size, za->el_sz, compar);


 }

function zstrcmp(a_pp:pointer; b_pp:pointer):longint;cdecl;external libapriltag;
{xxxxxxxxx
static inline int zarray_index_of(const zarray_t *za, const void *p)

    assert(za != NULL);
    assert(p != NULL);

    for (int i = 0; i < za->size; i++) 
        if (!memcmp(p, &za->data[i*za->el_sz], za->el_sz))
            return i;
    

    return -1;



static inline void zarray_add_all(zarray_t * dest, const zarray_t * source)

    assert(dest->el_sz == source->el_sz);

    // Don't allocate on stack because el_sz could be larger than ~8 MB
    // stack size
    char *tmp = (char*)calloc(1, dest->el_sz);

    for (int i = 0; i < zarray_size(source); i++) 
        zarray_get(source, i, tmp);
        zarray_add(dest, tmp);
   

    free(tmp);

 }
{ C++ end of extern C conditionnal removed }

// === Konventiert am: 12-9-26 17:28:31 ===


implementation



end.
