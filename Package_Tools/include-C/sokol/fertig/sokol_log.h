
/*
    Plug this function into the 'logger.func' struct item when initializing any of the sokol
    headers. For instance for sokol_audio.h it would look like this:

    saudio_setup(&(saudio_desc){
        .logger = {
            .func = slog_func
        }
    });
*/
extern void slog_func(const char* tag, uint32_t log_level, uint32_t log_item, const char* message, uint32_t line_nr, const char* filename, void* user_data);


