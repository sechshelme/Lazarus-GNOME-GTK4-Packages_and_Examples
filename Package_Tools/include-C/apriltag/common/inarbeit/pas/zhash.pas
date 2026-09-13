unit zhash;

interface

uses
  fp_apriltag;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Pzhash_t=type Pointer;

  Pzhash_iterator_t = ^Tzhash_iterator_t;
  Tzhash_iterator_t = record
      zh : Pzhash_t;
      czh : Pzhash_t;
      last_entry : longint;
    end;

function zhash_create(keysz:Tsize_t; valuesz:Tsize_t; hash:Pointer; equals:Pointer):Pzhash_t;cdecl;external libapriltag;
procedure zhash_destroy(zh:Pzhash_t);cdecl;external libapriltag;
function zhash_copy(other:Pzhash_t):Pzhash_t;cdecl;external libapriltag;
function zhash_contains(zh:Pzhash_t; key:pointer):longint;cdecl;external libapriltag;
function zhash_get(zh:Pzhash_t; key:pointer; out_value:pointer):longint;cdecl;external libapriltag;
function zhash_get_volatile(zh:Pzhash_t; key:pointer; out_p:pointer):longint;cdecl;external libapriltag;
function zhash_put(zh:Pzhash_t; key:pointer; value:pointer; oldkey:pointer; oldvalue:pointer):longint;cdecl;external libapriltag;
function zhash_remove(zh:Pzhash_t; key:pointer; oldkey:pointer; oldvalue:pointer):longint;cdecl;external libapriltag;
procedure zhash_clear(zh:Pzhash_t);cdecl;external libapriltag;
function zhash_size(zh:Pzhash_t):longint;cdecl;external libapriltag;
procedure zhash_iterator_init(zh:Pzhash_t; zit:Pzhash_iterator_t);cdecl;external libapriltag;
procedure zhash_iterator_init_const(zh:Pzhash_t; zit:Pzhash_iterator_t);cdecl;external libapriltag;
function zhash_iterator_next(zit:Pzhash_iterator_t; outkey:pointer; outvalue:pointer):longint;cdecl;external libapriltag;
function zhash_iterator_next_volatile(zit:Pzhash_iterator_t; outkey:pointer; outvalue:pointer):longint;cdecl;external libapriltag;
procedure zhash_iterator_remove(zit:Pzhash_iterator_t);cdecl;external libapriltag;
procedure zhash_map_keys(zh:Pzhash_t; f:procedure );cdecl;external libapriltag;
procedure zhash_map_values(zh:Pzhash_t; f:procedure );cdecl;external libapriltag;
procedure zhash_vmap_keys(vh:Pzhash_t; f:procedure );cdecl;external libapriltag;
procedure zhash_vmap_values(vh:Pzhash_t; f:procedure );cdecl;external libapriltag;
function zhash_keys(zh:Pzhash_t):Pzarray_t;cdecl;external libapriltag;
function zhash_values(zh:Pzhash_t):Pzarray_t;cdecl;external libapriltag;
function zhash_uint32_hash(a:pointer):Tuint32_t;cdecl;external libapriltag;
function zhash_uint32_equals(a:pointer; b:pointer):longint;cdecl;external libapriltag;
function zhash_uint64_hash(a:pointer):Tuint32_t;cdecl;external libapriltag;
function zhash_uint64_equals(a:pointer; b:pointer):longint;cdecl;external libapriltag;
function zhash_ptr_hash(a:pointer):Tuint32_t;cdecl;external libapriltag;
function zhash_ptr_equals(a:pointer; b:pointer):longint;cdecl;external libapriltag;
function zhash_str_hash(a:pointer):Tuint32_t;cdecl;external libapriltag;
function zhash_str_equals(a:pointer; b:pointer):longint;cdecl;external libapriltag;
procedure zhash_debug(zh:Pzhash_t);cdecl;external libapriltag;
{xxxxxxxx

    static inline zhash_t *zhash_str_str_create(void)
    
        return zhash_create(sizeof(char*), sizeof(char*),
                            zhash_str_hash, zhash_str_equals);
    



static inline char *zhash_str_str_get(zhash_t *zh, const char *key)

    char *value;
    if (zhash_get(zh, &key, &value))
        return value;
    return NULL;


    static inline void zhash_str_str_put(zhash_t *zh, char *key, char *value)
    
        char *oldkey, *oldval;
        if (zhash_put(zh, &key, &value, &oldkey, &oldval)) 
            free(oldkey);
            free(oldval);
        
    

    static inline void zhash_str_str_destroy(zhash_t *zh)
    
        zhash_iterator_t zit;
        zhash_iterator_init(zh, &zit);

        char *key, *value;
        while (zhash_iterator_next(&zit, &key, &value)) 
            free(key);
            free(value);
        

        zhash_destroy(zh);
    


static inline uint32_t zhash_int_hash(const void *_a)

    assert(_a != NULL);

    uint32_t a = *((int*) _a);
    return a;


static inline int zhash_int_equals(const void *_a, const void *_b)

    assert(_a != NULL);
    assert(_b != NULL);

    int a = *((int*) _a);
    int b = *((int*) _b);

    return a==b;

 }
{ C++ end of extern C conditionnal removed }

// === Konventiert am: 12-9-26 17:28:28 ===


implementation



end.
