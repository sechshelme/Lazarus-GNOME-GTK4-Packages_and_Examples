
#ifndef sodium_version_H
#define sodium_version_H

#include "export.h"

#define SODIUM_VERSION_STRING "1.0.18"

#define SODIUM_LIBRARY_VERSION_MAJOR 10
#define SODIUM_LIBRARY_VERSION_MINOR 3


#ifdef __cplusplus
extern "C" {
#endif

extern
const char *sodium_version_string(void);

extern
int         sodium_library_version_major(void);

extern
int         sodium_library_version_minor(void);

extern
int         sodium_library_minimal(void);

#ifdef __cplusplus
}
#endif

#endif
