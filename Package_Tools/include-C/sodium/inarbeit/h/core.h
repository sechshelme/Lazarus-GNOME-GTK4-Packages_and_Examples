
#ifndef sodium_core_H
#define sodium_core_H

#include "export.h"

#ifdef __cplusplus
extern "C" {
#endif

extern
int sodium_init(void)
;

/* ---- */

extern
int sodium_set_misuse_handler(void (*handler)(void));

extern
void sodium_misuse(void)
;

#ifdef __cplusplus
}
#endif

#endif
