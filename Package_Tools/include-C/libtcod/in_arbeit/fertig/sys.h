/* BSD 3-Clause License
 *
 * Copyright © 2008-2021, Jice and the libtcod contributors.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef _TCOD_SYS_H
#define _TCOD_SYS_H

#include "image.h"
#include "list.h"
#include "mouse_types.h"
#include "portability.h"

typedef enum {
  TCOD_EVENT_NONE = 0,
  TCOD_EVENT_KEY_PRESS = 1,
  TCOD_EVENT_KEY_RELEASE = 2,
  TCOD_EVENT_KEY = TCOD_EVENT_KEY_PRESS | TCOD_EVENT_KEY_RELEASE,
  TCOD_EVENT_MOUSE_MOVE = 4,
  TCOD_EVENT_MOUSE_PRESS = 8,
  TCOD_EVENT_MOUSE_RELEASE = 16,
  TCOD_EVENT_MOUSE = TCOD_EVENT_MOUSE_MOVE | TCOD_EVENT_MOUSE_PRESS | TCOD_EVENT_MOUSE_RELEASE,
  /* #ifdef TCOD_TOUCH_INPUT */
  TCOD_EVENT_FINGER_MOVE = 32,
  TCOD_EVENT_FINGER_PRESS = 64,
  TCOD_EVENT_FINGER_RELEASE = 128,
  TCOD_EVENT_FINGER = TCOD_EVENT_FINGER_MOVE | TCOD_EVENT_FINGER_PRESS | TCOD_EVENT_FINGER_RELEASE,
  /* #endif */
  TCOD_EVENT_ANY = TCOD_EVENT_KEY | TCOD_EVENT_MOUSE | TCOD_EVENT_FINGER,
} TCOD_event_t;

struct SDL_Surface;
typedef void (*SDL_renderer_t)(struct SDL_Surface* sdl_renderer);

/* thread stuff */
typedef void* TCOD_thread_t;
typedef void* TCOD_semaphore_t;
typedef void* TCOD_mutex_t;
typedef void* TCOD_cond_t;

#ifdef __cplusplus
extern "C" {
#endif
 void TCOD_sys_startup(void);
 void TCOD_sys_shutdown(void);

// xxxxxxx dep

/* filesystem stuff */

 bool TCOD_sys_create_directory(const char* path);

 bool TCOD_sys_delete_file(const char* path);

 bool TCOD_sys_delete_directory(const char* path);

 bool TCOD_sys_is_directory(const char* path);

 TCOD_list_t TCOD_sys_get_directory_content(const char* path, const char* pattern);

 bool TCOD_sys_file_exists(const char* filename, ...);

 bool TCOD_sys_read_file(const char* filename, unsigned char** buf, size_t* size);

 bool TCOD_sys_write_file(const char* filename, unsigned char* buf, uint32_t size);
/* threads */

 TCOD_thread_t TCOD_thread_new(int (*func)(void*), void* data);

 void TCOD_thread_delete(TCOD_thread_t th);

 int TCOD_sys_get_num_cores(void);

 void TCOD_thread_wait(TCOD_thread_t th);
/* mutex */

 TCOD_mutex_t TCOD_mutex_new(void);

 void TCOD_mutex_in(TCOD_mutex_t mut);

 void TCOD_mutex_out(TCOD_mutex_t mut);

 void TCOD_mutex_delete(TCOD_mutex_t mut);
/* semaphore */

 TCOD_semaphore_t TCOD_semaphore_new(int initVal);

 void TCOD_semaphore_lock(TCOD_semaphore_t sem);

 void TCOD_semaphore_unlock(TCOD_semaphore_t sem);

 void TCOD_semaphore_delete(TCOD_semaphore_t sem);
/* condition */

 TCOD_cond_t TCOD_condition_new(void);

 void TCOD_condition_signal(TCOD_cond_t sem);

 void TCOD_condition_broadcast(TCOD_cond_t sem);

 void TCOD_condition_wait(TCOD_cond_t sem, TCOD_mutex_t mut);

 void TCOD_condition_delete(TCOD_cond_t sem);
/* dynamic library */
typedef void* TCOD_library_t;

 TCOD_library_t TCOD_load_library(const char* path);

 void* TCOD_get_function_address(TCOD_library_t library, const char* function_name);

 void TCOD_close_library(TCOD_library_t);

// xxxxxxxxxxxxxxxxxxxxxxx end dep

#ifndef NO_SDL
 uint32_t TCOD_sys_elapsed_milli(void);
 float TCOD_sys_elapsed_seconds(void);
 void TCOD_sys_sleep_milli(uint32_t val);
 void TCOD_sys_set_fps(int val);
 int TCOD_sys_get_fps(void);
 float TCOD_sys_get_last_frame_length(void);

 void TCOD_sys_save_screenshot(const char* filename);
 void TCOD_sys_force_fullscreen_resolution(int width, int height);
 extern int TCOD_sys_set_renderer(TCOD_renderer_t renderer);
 TCOD_renderer_t TCOD_sys_get_renderer(void);
/**
    Return the resolution of the current monitor.
 */

 TCOD_Error TCOD_sys_get_current_resolution(int* w, int* h);// TCOD_DEPRECATED("Use SDL to determine the screen resolution instead.")
 void TCOD_sys_get_fullscreen_offsets(int* offset_x, int* offset_y);
 void TCOD_sys_get_char_size(int* w, int* h);

/**
 *  Upload a tile to the active tileset.
 *
 *  `asciiCode` is the Unicode codepoint for this tile.
 *
 *  `font_x` and `font_y` are the tile-coordinates on the active tilemap.
 *
 *  `img` is the tile to upload.
 *
 *  `x` and `y` are the upper-left pixel-coordinates of the tile on the `img`.
 */
 void TCOD_sys_update_char(int asciiCode, int font_x, int font_y, TCOD_image_t img, int x, int y);

 SDL_Window* TCOD_sys_get_SDL_window(void);
 SDL_Renderer* TCOD_sys_get_SDL_renderer(void);


 TCOD_event_t TCOD_sys_wait_for_event(int eventMask, TCOD_key_t* key, TCOD_mouse_t* mouse, bool flush);//TCOD_DEPRECATED("This API is deprecated, use SDL_WaitEvent instead.")
 TCOD_event_t TCOD_sys_check_for_event(int eventMask, TCOD_key_t* key, TCOD_mouse_t* mouse);//TCOD_DEPRECATED("This API is deprecated, use SDL_PollEvent instead.")

/* clipboard */

 bool TCOD_sys_clipboard_set(const char* value);//TCOD_DEPRECATED("Use the SDL2 API to handle the clipboard.")

 char* TCOD_sys_clipboard_get(void);//TCOD_DEPRECATED("Use the SDL2 API to handle the clipboard.")

/* SDL renderer callback */

 void TCOD_sys_register_SDL_renderer(SDL_renderer_t renderer); // TCOD__DEPRECATED_NOMESSAGE
#endif  // NO_SDL
#ifdef __cplusplus
}  // extern "C"
#endif
#endif
