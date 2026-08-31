#ifndef crypto_pwhash_H
#define crypto_pwhash_H

#include <stddef.h>

#include "crypto_pwhash_argon2i.h"
#include "crypto_pwhash_argon2id.h"
#include "export.h"

#ifdef __cplusplus
# ifdef __GNUC__
#  pragma GCC diagnostic ignored "-Wlong-long"
# endif
extern "C" {
#endif

#define crypto_pwhash_ALG_ARGON2I13 crypto_pwhash_argon2i_ALG_ARGON2I13
extern
int crypto_pwhash_alg_argon2i13(void);

#define crypto_pwhash_ALG_ARGON2ID13 crypto_pwhash_argon2id_ALG_ARGON2ID13
extern
int crypto_pwhash_alg_argon2id13(void);

#define crypto_pwhash_ALG_DEFAULT crypto_pwhash_ALG_ARGON2ID13
extern
int crypto_pwhash_alg_default(void);

#define crypto_pwhash_BYTES_MIN crypto_pwhash_argon2id_BYTES_MIN
extern
size_t crypto_pwhash_bytes_min(void);

#define crypto_pwhash_BYTES_MAX crypto_pwhash_argon2id_BYTES_MAX
extern
size_t crypto_pwhash_bytes_max(void);

#define crypto_pwhash_PASSWD_MIN crypto_pwhash_argon2id_PASSWD_MIN
extern
size_t crypto_pwhash_passwd_min(void);

#define crypto_pwhash_PASSWD_MAX crypto_pwhash_argon2id_PASSWD_MAX
extern
size_t crypto_pwhash_passwd_max(void);

#define crypto_pwhash_SALTBYTES crypto_pwhash_argon2id_SALTBYTES
extern
size_t crypto_pwhash_saltbytes(void);

#define crypto_pwhash_STRBYTES crypto_pwhash_argon2id_STRBYTES
extern
size_t crypto_pwhash_strbytes(void);

#define crypto_pwhash_STRPREFIX crypto_pwhash_argon2id_STRPREFIX
extern
const char *crypto_pwhash_strprefix(void);

#define crypto_pwhash_OPSLIMIT_MIN crypto_pwhash_argon2id_OPSLIMIT_MIN
extern
size_t crypto_pwhash_opslimit_min(void);

#define crypto_pwhash_OPSLIMIT_MAX crypto_pwhash_argon2id_OPSLIMIT_MAX
extern
size_t crypto_pwhash_opslimit_max(void);

#define crypto_pwhash_MEMLIMIT_MIN crypto_pwhash_argon2id_MEMLIMIT_MIN
extern
size_t crypto_pwhash_memlimit_min(void);

#define crypto_pwhash_MEMLIMIT_MAX crypto_pwhash_argon2id_MEMLIMIT_MAX
extern
size_t crypto_pwhash_memlimit_max(void);

#define crypto_pwhash_OPSLIMIT_INTERACTIVE crypto_pwhash_argon2id_OPSLIMIT_INTERACTIVE
extern
size_t crypto_pwhash_opslimit_interactive(void);

#define crypto_pwhash_MEMLIMIT_INTERACTIVE crypto_pwhash_argon2id_MEMLIMIT_INTERACTIVE
extern
size_t crypto_pwhash_memlimit_interactive(void);

#define crypto_pwhash_OPSLIMIT_MODERATE crypto_pwhash_argon2id_OPSLIMIT_MODERATE
extern
size_t crypto_pwhash_opslimit_moderate(void);

#define crypto_pwhash_MEMLIMIT_MODERATE crypto_pwhash_argon2id_MEMLIMIT_MODERATE
extern
size_t crypto_pwhash_memlimit_moderate(void);

#define crypto_pwhash_OPSLIMIT_SENSITIVE crypto_pwhash_argon2id_OPSLIMIT_SENSITIVE
extern
size_t crypto_pwhash_opslimit_sensitive(void);

#define crypto_pwhash_MEMLIMIT_SENSITIVE crypto_pwhash_argon2id_MEMLIMIT_SENSITIVE
extern
size_t crypto_pwhash_memlimit_sensitive(void);

/*
 * With this function, do not forget to store all parameters, including the
 * algorithm identifier in order to produce deterministic output.
 * The crypto_pwhash_* definitions, including crypto_pwhash_ALG_DEFAULT,
 * may change.
 */
extern
int crypto_pwhash(unsigned char * const out, unsigned long long outlen,
                  const char * const passwd, unsigned long long passwdlen,
                  const unsigned char * const salt,
                  unsigned long long opslimit, size_t memlimit, int alg)
        ;

/*
 * The output string already includes all the required parameters, including
 * the algorithm identifier. The string is all that has to be stored in
 * order to verify a password.
 */
extern
int crypto_pwhash_str(char out[crypto_pwhash_STRBYTES],
                      const char * const passwd, unsigned long long passwdlen,
                      unsigned long long opslimit, size_t memlimit)
        ;

extern
int crypto_pwhash_str_alg(char out[crypto_pwhash_STRBYTES],
                          const char * const passwd, unsigned long long passwdlen,
                          unsigned long long opslimit, size_t memlimit, int alg)
        ;

extern
int crypto_pwhash_str_verify(const char str[crypto_pwhash_STRBYTES],
                             const char * const passwd,
                             unsigned long long passwdlen)
        ;

extern
int crypto_pwhash_str_needs_rehash(const char str[crypto_pwhash_STRBYTES],
                                   unsigned long long opslimit, size_t memlimit)
        ;

#define crypto_pwhash_PRIMITIVE "argon2i"
extern
const char *crypto_pwhash_primitive(void)
        ;

#ifdef __cplusplus
}
#endif

#endif
