typedef struct sfons_allocator_t {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} sfons_allocator_t;

typedef struct sfons_desc_t {
    int width;    // initial width of font atlas texture (default: 512, must be power of 2)
    int height;   // initial height of font atlas texture (default: 512, must be power of 2)
    sfons_allocator_t allocator;    // optional memory allocation overrides
} sfons_desc_t;

extern FONScontext* sfons_create(const sfons_desc_t* desc);
extern void sfons_destroy(FONScontext* ctx);
extern void sfons_flush(FONScontext* ctx);
extern uint32_t sfons_rgba(uint8_t r, uint8_t g, uint8_t b, uint8_t a);

#ifdef __cplusplus
} /* extern "C" */
#endif
#endif /* SOKOL_FONTSTASH_INCLUDED */


