/*
    sfetch_logger_t

    Used in sfetch_desc_t to provide a custom logging and error reporting
    callback to sokol-fetch.
*/
typedef struct sfetch_logger_t {
    void (*func)(
        const char* tag,                // always "sfetch"
        uint32_t log_level,             // 0=panic, 1=error, 2=warning, 3=info
        uint32_t log_item_id,           // SFETCH_LOGITEM_*
        const char* message_or_null,    // a message string, may be nullptr in release mode
        uint32_t line_nr,               // line number in sokol_fetch.h
        const char* filename_or_null,   // source filename, may be nullptr in release mode
        void* user_data);
    void* user_data;
} sfetch_logger_t;

/*
    sfetch_range_t

    A pointer-size pair struct to pass memory ranges into and out of sokol-fetch.
    When initialized from a value type (array or struct) you can use the
    SFETCH_RANGE() helper macro to build an sfetch_range_t struct.
*/
typedef struct sfetch_range_t {
    const void* ptr;
    size_t size;
} sfetch_range_t;

/*
    sfetch_allocator_t

    Used in sfetch_desc_t to provide custom memory-alloc and -free functions
    to sokol_fetch.h. If memory management should be overridden, both the
    alloc and free function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
typedef struct sfetch_allocator_t {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} sfetch_allocator_t;

/* configuration values for sfetch_setup() */
typedef struct sfetch_desc_t {
    uint32_t max_requests;          // max number of active requests across all channels (default: 128)
    uint32_t num_channels;          // number of channels to fetch requests in parallel (default: 1)
    uint32_t num_lanes;             // max number of requests active on the same channel (default: 1)
    sfetch_allocator_t allocator;   // optional memory allocation overrides (default: malloc/free)
    sfetch_logger_t logger;         // optional log function overrides (default: NO LOGGING!)
} sfetch_desc_t;

/* a request handle to identify an active fetch request, returned by sfetch_send() */
typedef struct sfetch_handle_t { uint32_t id; } sfetch_handle_t;

/* error codes */
typedef enum sfetch_error_t {
    SFETCH_ERROR_NO_ERROR,
    SFETCH_ERROR_FILE_NOT_FOUND,
    SFETCH_ERROR_NO_BUFFER,
    SFETCH_ERROR_BUFFER_TOO_SMALL,
    SFETCH_ERROR_UNEXPECTED_EOF,
    SFETCH_ERROR_INVALID_HTTP_STATUS,
    SFETCH_ERROR_CANCELLED,
    SFETCH_ERROR_JS_OTHER,          // check browser console for detailed error info
} sfetch_error_t;

/* the response struct passed to the response callback */
typedef struct sfetch_response_t {
    sfetch_handle_t handle;         // request handle this response belongs to
    bool dispatched;                // true when request is in DISPATCHED state (lane has been assigned)
    bool fetched;                   // true when request is in FETCHED state (fetched data is available)
    bool paused;                    // request is currently in paused state
    bool finished;                  // this is the last response for this request
    bool failed;                    // request has failed (always set together with 'finished')
    bool cancelled;                 // request was cancelled (always set together with 'finished')
    sfetch_error_t error_code;      // more detailed error code when failed is true
    uint32_t channel;               // the channel which processes this request
    uint32_t lane;                  // the lane this request occupies on its channel
    const char* path;               // the original filesystem path of the request
    void* user_data;                // pointer to read/write user-data area
    uint32_t data_offset;           // current offset of fetched data chunk in the overall file data
    sfetch_range_t data;            // the fetched data as ptr/size pair (data.ptr == buffer.ptr, data.size <= buffer.size)
    sfetch_range_t buffer;          // the user-provided buffer which holds the fetched data
} sfetch_response_t;

/* request parameters passed to sfetch_send() */
typedef struct sfetch_request_t {
    uint32_t channel;                                // index of channel this request is assigned to (default: 0)
    const char* path;                                // filesystem path or HTTP URL (required)
    void (*callback) (const sfetch_response_t*);     // response callback function pointer (required)
    uint32_t chunk_size;                             // number of bytes to load per stream-block (optional)
    sfetch_range_t buffer;                           // a memory buffer where the data will be loaded into (optional)
    sfetch_range_t user_data;                        // ptr/size of a POD user data block which will be memcpy'd (optional)
} sfetch_request_t;

/* setup sokol-fetch (can be called on multiple threads) */
extern void sfetch_setup(const sfetch_desc_t* desc);
/* discard a sokol-fetch context */
extern void sfetch_shutdown(void);
/* return true if sokol-fetch has been setup */
extern bool sfetch_valid(void);
/* get the desc struct that was passed to sfetch_setup() */
extern sfetch_desc_t sfetch_desc(void);
/* return the max userdata size in number of bytes (SFETCH_MAX_USERDATA_UINT64 * sizeof(uint64_t)) */
extern int sfetch_max_userdata_bytes(void);
/* return the value of the SFETCH_MAX_PATH implementation config value */
extern int sfetch_max_path(void);

/* send a fetch-request, get handle to request back */
extern sfetch_handle_t sfetch_send(const sfetch_request_t* request);
/* return true if a handle is valid *and* the request is alive */
extern bool sfetch_handle_valid(sfetch_handle_t h);
/* do per-frame work, moves requests into and out of IO threads, and invokes response-callbacks */
extern void sfetch_dowork(void);

/* bind a data buffer to a request (request must not currently have a buffer bound, must be called from response callback */
extern void sfetch_bind_buffer(sfetch_handle_t h, sfetch_range_t buffer);
/* clear the 'buffer binding' of a request, returns previous buffer pointer (can be 0), must be called from response callback */
extern void* sfetch_unbind_buffer(sfetch_handle_t h);
/* cancel a request that's in flight (will call response callback with .cancelled + .finished) */
extern void sfetch_cancel(sfetch_handle_t h);
/* pause a request (will call response callback each frame with .paused) */
extern void sfetch_pause(sfetch_handle_t h);
/* continue a paused request */
extern void sfetch_continue(sfetch_handle_t h);


