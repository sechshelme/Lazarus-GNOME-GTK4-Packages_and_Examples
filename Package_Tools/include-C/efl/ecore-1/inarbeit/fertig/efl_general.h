#undef extern_MAIN
#undef __EFL_UI
#undef __EFL_NET



// This file is designed to be included again and again

# define _EFL_VERSION_MICRO EFL_VERSION_MICRO
# define _EFL_VERSION_REVISION EFL_VERSION_REVISION
# define _EFL_VERSION_FLAVOR EFL_VERSION_FLAVOR

#ifdef EFL_BUILD_ID
# define _EFL_BUILD_ID EFL_BUILD_ID
#else
# define _EFL_BUILD_ID NULL
#endif


