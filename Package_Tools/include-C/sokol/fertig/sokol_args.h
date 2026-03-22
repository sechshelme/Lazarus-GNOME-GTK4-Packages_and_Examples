typedef struct sargs_allocator {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} sargs_allocator;

typedef struct sargs_desc {
    int argc;
    char** argv;
    int max_args;
    int buf_size;
    sargs_allocator allocator;
} sargs_desc;

// setup sokol-args
extern void sargs_setup(const sargs_desc* desc);
// shutdown sokol-args
extern void sargs_shutdown(void);
// true between sargs_setup() and sargs_shutdown()
extern bool sargs_isvalid(void);
// test if an argument exists by key name
extern bool sargs_exists(const char* key);
// get value by key name, return empty string if key doesn't exist or an existing key has no value
extern const char* sargs_value(const char* key);
// get value by key name, return provided default if key doesn't exist or has no value
extern const char* sargs_value_def(const char* key, const char* def);
// return true if val arg matches the value associated with key
extern bool sargs_equals(const char* key, const char* val);
// return true if key's value is "true", "yes", "on" or an existing key has no value
extern bool sargs_boolean(const char* key);
// get index of arg by key name, return -1 if not exists
extern int sargs_find(const char* key);
// get number of parsed arguments
extern int sargs_num_args(void);
// get key name of argument at index, or empty string
extern const char* sargs_key_at(int index);
// get value string of argument at index, or empty string
extern const char* sargs_value_at(int index);


