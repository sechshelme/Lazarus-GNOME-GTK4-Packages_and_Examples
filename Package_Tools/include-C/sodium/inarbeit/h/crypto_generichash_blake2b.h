#ifndef crypto_generichash_blake2b_H
#define crypto_generichash_blake2b_H

#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>

#include "export.h"


typedef struct/* CRYPTO_ALIGN(64)*/ crypto_generichash_blake2b_state {
    unsigned char opaque[384];
} crypto_generichash_blake2b_state;


#define crypto_generichash_blake2b_BYTES_MIN     16U
extern
size_t crypto_generichash_blake2b_bytes_min(void);

#define crypto_generichash_blake2b_BYTES_MAX     64U
extern
size_t crypto_generichash_blake2b_bytes_max(void);

#define crypto_generichash_blake2b_BYTES         32U
extern
size_t crypto_generichash_blake2b_bytes(void);

#define crypto_generichash_blake2b_KEYBYTES_MIN  16U
extern
size_t crypto_generichash_blake2b_keybytes_min(void);

#define crypto_generichash_blake2b_KEYBYTES_MAX  64U
extern
size_t crypto_generichash_blake2b_keybytes_max(void);

#define crypto_generichash_blake2b_KEYBYTES      32U
extern
size_t crypto_generichash_blake2b_keybytes(void);

#define crypto_generichash_blake2b_SALTBYTES     16U
extern
size_t crypto_generichash_blake2b_saltbytes(void);

#define crypto_generichash_blake2b_PERSONALBYTES 16U
extern
size_t crypto_generichash_blake2b_personalbytes(void);

extern
size_t crypto_generichash_blake2b_statebytes(void);

extern
int crypto_generichash_blake2b(unsigned char *out, size_t outlen,
                               const unsigned char *in,
                               unsigned long long inlen,
                               const unsigned char *key, size_t keylen)
        ;

extern
int crypto_generichash_blake2b_salt_personal(unsigned char *out, size_t outlen,
                                             const unsigned char *in,
                                             unsigned long long inlen,
                                             const unsigned char *key,
                                             size_t keylen,
                                             const unsigned char *salt,
                                             const unsigned char *personal)
        ;

extern
int crypto_generichash_blake2b_init(crypto_generichash_blake2b_state *state,
                                    const unsigned char *key,
                                    const size_t keylen, const size_t outlen)
       ;

extern
int crypto_generichash_blake2b_init_salt_personal(crypto_generichash_blake2b_state *state,
                                                  const unsigned char *key,
                                                  const size_t keylen, const size_t outlen,
                                                  const unsigned char *salt,
                                                  const unsigned char *personal)
       ;

extern
int crypto_generichash_blake2b_update(crypto_generichash_blake2b_state *state,
                                      const unsigned char *in,
                                      unsigned long long inlen)
       ;

extern
int crypto_generichash_blake2b_final(crypto_generichash_blake2b_state *state,
                                     unsigned char *out,
                                     const size_t outlen) ;

extern
void crypto_generichash_blake2b_keygen(unsigned char k[crypto_generichash_blake2b_KEYBYTES])
        ;

#ifdef __cplusplus
}
#endif

#endif
