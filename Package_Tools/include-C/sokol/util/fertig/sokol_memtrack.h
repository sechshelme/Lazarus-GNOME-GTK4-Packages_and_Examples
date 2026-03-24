
typedef struct smemtrack_info_t {
    int num_allocs;
    int num_bytes;
} smemtrack_info_t;

extern smemtrack_info_t smemtrack_info(void);
extern void* smemtrack_alloc(size_t size, void* user_data);
extern void smemtrack_free(void* ptr, void* user_data);


