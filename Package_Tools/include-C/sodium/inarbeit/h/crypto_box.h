#ifndef crypto_box_H
#define crypto_box_H

/*
 * THREAD SAFETY: crypto_box_keypair() is thread-safe,
 * provided that sodium_init() was called before.
 *
 * Other functions are always thread-safe.
 */

#include <stddef.h>

#include "crypto_box_curve25519xsalsa20poly1305.h"
#include "export.h"

#ifdef __cplusplus
# ifdef __GNUC__
#  pragma GCC diagnostic ignored "-Wlong-long"
# endif
extern "C" {
#endif

#define crypto_box_SEEDBYTES crypto_box_curve25519xsalsa20poly1305_SEEDBYTES
extern
size_t  crypto_box_seedbytes(void);

#define crypto_box_PUBLICKEYBYTES crypto_box_curve25519xsalsa20poly1305_PUBLICKEYBYTES
extern
size_t  crypto_box_publickeybytes(void);

#define crypto_box_SECRETKEYBYTES crypto_box_curve25519xsalsa20poly1305_SECRETKEYBYTES
extern
size_t  crypto_box_secretkeybytes(void);

#define crypto_box_NONCEBYTES crypto_box_curve25519xsalsa20poly1305_NONCEBYTES
extern
size_t  crypto_box_noncebytes(void);

#define crypto_box_MACBYTES crypto_box_curve25519xsalsa20poly1305_MACBYTES
extern
size_t  crypto_box_macbytes(void);

#define crypto_box_MESSAGEBYTES_MAX crypto_box_curve25519xsalsa20poly1305_MESSAGEBYTES_MAX
extern
size_t  crypto_box_messagebytes_max(void);

#define crypto_box_PRIMITIVE "curve25519xsalsa20poly1305"
extern
const char *crypto_box_primitive(void);

extern
int crypto_box_seed_keypair(unsigned char *pk, unsigned char *sk,
                            const unsigned char *seed)
       ;

extern
int crypto_box_keypair(unsigned char *pk, unsigned char *sk)
       ;

extern
int crypto_box_easy(unsigned char *c, const unsigned char *m,
                    unsigned long long mlen, const unsigned char *n,
                    const unsigned char *pk, const unsigned char *sk)
;

extern
int crypto_box_open_easy(unsigned char *m, const unsigned char *c,
                         unsigned long long clen, const unsigned char *n,
                         const unsigned char *pk, const unsigned char *sk)
;

extern
int crypto_box_detached(unsigned char *c, unsigned char *mac,
                        const unsigned char *m, unsigned long long mlen,
                        const unsigned char *n, const unsigned char *pk,
                        const unsigned char *sk)
;

extern
int crypto_box_open_detached(unsigned char *m, const unsigned char *c,
                             const unsigned char *mac,
                             unsigned long long clen,
                             const unsigned char *n,
                             const unsigned char *pk,
                             const unsigned char *sk)
;

/* -- Precomputation interface -- */

#define crypto_box_BEFORENMBYTES crypto_box_curve25519xsalsa20poly1305_BEFORENMBYTES
extern
size_t  crypto_box_beforenmbytes(void);

extern
int crypto_box_beforenm(unsigned char *k, const unsigned char *pk,
                        const unsigned char *sk)
;

extern
int crypto_box_easy_afternm(unsigned char *c, const unsigned char *m,
                            unsigned long long mlen, const unsigned char *n,
                            const unsigned char *k) ;

extern
int crypto_box_open_easy_afternm(unsigned char *m, const unsigned char *c,
                                 unsigned long long clen, const unsigned char *n,
                                 const unsigned char *k)
;

extern
int crypto_box_detached_afternm(unsigned char *c, unsigned char *mac,
                                const unsigned char *m, unsigned long long mlen,
                                const unsigned char *n, const unsigned char *k)
;

extern
int crypto_box_open_detached_afternm(unsigned char *m, const unsigned char *c,
                                     const unsigned char *mac,
                                     unsigned long long clen, const unsigned char *n,
                                     const unsigned char *k)
;

/* -- Ephemeral SK interface -- */

#define crypto_box_SEALBYTES (crypto_box_PUBLICKEYBYTES + crypto_box_MACBYTES)
extern
size_t crypto_box_sealbytes(void);

extern
int crypto_box_seal(unsigned char *c, const unsigned char *m,
                    unsigned long long mlen, const unsigned char *pk)
       ;

extern
int crypto_box_seal_open(unsigned char *m, const unsigned char *c,
                         unsigned long long clen,
                         const unsigned char *pk, const unsigned char *sk)
       ;

/* -- NaCl compatibility interface ; Requires padding -- */

#define crypto_box_ZEROBYTES crypto_box_curve25519xsalsa20poly1305_ZEROBYTES
extern
size_t  crypto_box_zerobytes(void);

#define crypto_box_BOXZEROBYTES crypto_box_curve25519xsalsa20poly1305_BOXZEROBYTES
extern
size_t  crypto_box_boxzerobytes(void);

extern
int crypto_box(unsigned char *c, const unsigned char *m,
               unsigned long long mlen, const unsigned char *n,
               const unsigned char *pk, const unsigned char *sk)
     ;

extern
int crypto_box_open(unsigned char *m, const unsigned char *c,
                    unsigned long long clen, const unsigned char *n,
                    const unsigned char *pk, const unsigned char *sk)
     ;

extern
int crypto_box_afternm(unsigned char *c, const unsigned char *m,
                       unsigned long long mlen, const unsigned char *n,
                       const unsigned char *k) ;

extern
int crypto_box_open_afternm(unsigned char *m, const unsigned char *c,
                            unsigned long long clen, const unsigned char *n,
                            const unsigned char *k)
;

#ifdef __cplusplus
}
#endif

#endif
