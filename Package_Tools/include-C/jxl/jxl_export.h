
#ifndef extern_H
#define extern_H

#ifdef JXL_STATIC_DEFINE
#  define extern
#  define JXL_NO_EXPORT
#else
#  ifndef extern
#    ifdef JXL_INTERNAL_LIBRARY_BUILD
        /* We are building this library */
#      define extern __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define extern __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef JXL_NO_EXPORT
#    define JXL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef JXL_DEPRECATED
#  define JXL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef JXL_DEPRECATED_EXPORT
#  define JXL_DEPRECATED_EXPORT extern JXL_DEPRECATED
#endif

#ifndef JXL_DEPRECATED_NO_EXPORT
#  define JXL_DEPRECATED_NO_EXPORT JXL_NO_EXPORT JXL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef JXL_NO_DEPRECATED
#    define JXL_NO_DEPRECATED
#  endif
#endif

#endif /* extern_H */
