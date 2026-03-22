typedef struct saudio_logger {
    void (*func)(
        const char* tag,                // always "saudio"
        uint32_t log_level,             // 0=panic, 1=error, 2=warning, 3=info
        uint32_t log_item_id,           // SAUDIO_LOGITEM_*
        const char* message_or_null,    // a message string, may be nullptr in release mode
        uint32_t line_nr,               // line number in sokol_audio.h
        const char* filename_or_null,   // source filename, may be nullptr in release mode
        void* user_data);
    void* user_data;
} saudio_logger;

/*
    saudio_allocator

    Used in saudio_desc to provide custom memory-alloc and -free functions
    to sokol_audio.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
*/
typedef struct saudio_allocator {
    void* (*alloc_fn)(size_t size, void* user_data);
    void (*free_fn)(void* ptr, void* user_data);
    void* user_data;
} saudio_allocator;

typedef enum saudio_n3ds_ndspinterptype {
    SAUDIO_N3DS_DSP_INTERP_POLYPHASE = 0,
    SAUDIO_N3DS_DSP_INTERP_LINEAR    = 1,
    SAUDIO_N3DS_DSP_INTERP_NONE      = 2,
} saudio_n3ds_ndspinterptype;

typedef struct saudio_n3ds_desc {
    /* the 3DS requires multiple queues that it alternates between. */
    /* a single buffer will "work" but is choppy due to a slight    */
    /* delay when it changes queues.                                */
    int queue_count; /* default value = 2 */

    /* NDSP_INTERP_POLYPHASE = 0 (high quality, slower) */
    /* NDSP_INTERP_LINEAR    = 1 (med quality, medium)  */
    /* NDSP_INTERP_NONE      = 2 (low quality, fast)    */
    saudio_n3ds_ndspinterptype interpolation_type; /* default value = 0 */

    /* 3DS supports different audio channels. they can be used */
    /* in a variety of ways as independent streams etc.        */
    /* this implementation in sokol does NOT allow multiple    */
    /* due to calling the global ndspInit/ndspExit functions.  */
    /* valid range 0-23                                        */
    int channel_id; /* default value = 0 */
} saudio_n3ds_desc;

typedef struct saudio_desc {
    int sample_rate;        // requested sample rate
    int num_channels;       // number of channels, default: 1 (mono)
    int buffer_frames;      // number of frames in streaming buffer
    int packet_frames;      // number of frames in a packet
    int num_packets;        // number of packets in packet queue
    void (*stream_cb)(float* buffer, int num_frames, int num_channels);  // optional streaming callback (no user data)
    void (*stream_userdata_cb)(float* buffer, int num_frames, int num_channels, void* user_data); //... and with user data
    void* user_data;        // optional user data argument for stream_userdata_cb
    saudio_n3ds_desc n3ds;       // optional data for use on n3ds
    saudio_allocator allocator;     // optional allocation override functions
    saudio_logger logger;           // optional logging function (default: NO LOGGING!)
} saudio_desc;

/* setup sokol-audio */
extern void saudio_setup(const saudio_desc* desc);
/* shutdown sokol-audio */
extern void saudio_shutdown(void);
/* true after setup if audio backend was successfully initialized */
extern bool saudio_isvalid(void);
/* return the saudio_desc.user_data pointer */
extern void* saudio_userdata(void);
/* return a copy of the original saudio_desc struct */
extern saudio_desc saudio_query_desc(void);
/* actual sample rate */
extern int saudio_sample_rate(void);
/* return actual backend buffer size in number of frames */
extern int saudio_buffer_frames(void);
/* actual number of channels */
extern int saudio_channels(void);
/* return true if audio context is currently suspended (only in WebAudio backend, all other backends return false) */
extern bool saudio_suspended(void);
/* get current number of frames to fill packet queue */
extern int saudio_expect(void);
/* push sample frames from main thread, returns number of frames actually pushed */
extern int saudio_push(const float* frames, int num_frames);


