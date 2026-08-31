
#ifndef sodium_runtime_H
#define sodium_runtime_H

#include "export.h"

#ifdef __cplusplus
extern "C" {
#endif

extern
int sodium_runtime_has_neon(void);

extern
int sodium_runtime_has_sse2(void);

extern
int sodium_runtime_has_sse3(void);

extern
int sodium_runtime_has_ssse3(void);

extern
int sodium_runtime_has_sse41(void);

extern
int sodium_runtime_has_avx(void);

extern
int sodium_runtime_has_avx2(void);

extern
int sodium_runtime_has_avx512f(void);

extern
int sodium_runtime_has_pclmul(void);

extern
int sodium_runtime_has_aesni(void);

extern
int sodium_runtime_has_rdrand(void);

/* ------------------------------------------------------------------------- */

int _sodium_runtime_get_cpu_features(void);

#ifdef __cplusplus
}
#endif

#endif
