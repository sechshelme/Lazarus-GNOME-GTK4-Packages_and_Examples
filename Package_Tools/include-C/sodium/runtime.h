
#ifndef sodium_runtime_H
#define sodium_runtime_H

#include "export.h"

#ifdef __cplusplus
extern "C" {
#endif

extern_WEAK
int sodium_runtime_has_neon(void);

extern_WEAK
int sodium_runtime_has_sse2(void);

extern_WEAK
int sodium_runtime_has_sse3(void);

extern_WEAK
int sodium_runtime_has_ssse3(void);

extern_WEAK
int sodium_runtime_has_sse41(void);

extern_WEAK
int sodium_runtime_has_avx(void);

extern_WEAK
int sodium_runtime_has_avx2(void);

extern_WEAK
int sodium_runtime_has_avx512f(void);

extern_WEAK
int sodium_runtime_has_pclmul(void);

extern_WEAK
int sodium_runtime_has_aesni(void);

extern_WEAK
int sodium_runtime_has_rdrand(void);

/* ------------------------------------------------------------------------- */

int _sodium_runtime_get_cpu_features(void);

#ifdef __cplusplus
}
#endif

#endif
