#ifndef EINA_DEBUG_PRIVATE_H_
# define EINA_DEBUG_PRIVATE_H_

# include "eina_config.h"
# include "eina_lock.h"
# include "eina_thread.h"

#define LOCAL_SERVER_PATH ".edebug"
#define LOCAL_SERVER_NAME "efl_debug"
#define LOCAL_SERVER_PORT 0

#define REMOTE_SERVER_PORT 6666


/* Max packet size */
#define EINA_DEBUG_MAX_PACKET_SIZE 10000000

typedef struct _Eina_Debug_Session Eina_Debug_Session;

typedef struct _Eina_Debug_Thread Eina_Debug_Thread;

struct _Eina_Debug_Thread
{
   Eina_Thread thread;

   Eina_Debug_Session *cmd_session;
   void *cmd_buffer;
   int cmd_result;

   int thread_id;
   int val;
};

extern Eina_Spinlock                _eina_debug_lock;
extern Eina_Spinlock                _eina_debug_thread_lock;
extern Eina_Thread                    _eina_debug_thread_mainloop;
extern Eina_Debug_Thread           *_eina_debug_thread_active;
extern int                          _eina_debug_thread_active_num;

/* TEMP: should be private to debug thread module */
void _eina_debug_thread_add(void *th);
void _eina_debug_thread_del(void *th);
void _eina_debug_thread_mainloop_set(void *th);

void *_eina_debug_chunk_push(int size);
void *_eina_debug_chunk_realloc(int size);
char *_eina_debug_chunk_strdup(const char *str);
void *_eina_debug_chunk_tmp_push(int size);
void  _eina_debug_chunk_tmp_reset(void);

const char *_eina_debug_file_get(const char *fname);

void _eina_debug_dump_fhandle_bt(FILE *f, void **bt, int btlen);



Eina_Bool _eina_debug_cpu_init(void);
Eina_Bool _eina_debug_cpu_shutdown(void);

Eina_Bool _eina_debug_bt_init(void);
Eina_Bool _eina_debug_bt_shutdown(void);

Eina_Bool _eina_debug_timer_init(void);
Eina_Bool _eina_debug_timer_shutdown(void);
#endif

