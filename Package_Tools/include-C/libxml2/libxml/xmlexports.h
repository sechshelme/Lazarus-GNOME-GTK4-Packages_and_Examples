/*
 * Summary: macros for marking symbols as exportable/importable.
 * Description: macros for marking symbols as exportable/importable.
 *
 * Copy: See Copyright for the status of this software.
 */

#ifndef __XML_EXPORTS_H__
#define __XML_EXPORTS_H__

#if defined(_WIN32) || defined(__CYGWIN__)
/** DOC_DISABLE */

#ifdef LIBXML_STATIC
  #define XMLPUBLIC
#elif defined(IN_LIBXML)
  #define XMLPUBLIC __declspec(dllexport)
#else
  #define XMLPUBLIC __declspec(dllimport)
#endif

#if defined(LIBXML_FASTCALL)
  #define  __fastcall
#else
  #define  __cdecl
#endif
#define  __cdecl

/** DOC_ENABLE */
#else /* not Windows */

/**
 * XMLPUBLIC:
 *
 * Macro which declares a public symbol
 */
#define XMLPUBLIC

/**
 * :
 *
 * Macro which declares the calling convention for exported functions
 */
#define 

/**
 * :
 *
 * Macro which declares the calling convention for exported functions that
 * use '...'.
 */
#define 

#endif /* platform switch */

/*
 * extern:
 *
 * Macro which declares an exportable function
 */
#define extern XMLPUBLIC

/**
 * XMLPUBVAR:
 *
 * Macro which declares an exportable variable
 */
#define XMLPUBVAR XMLPUBLIC extern

/* Compatibility */
#if !defined(LIBXML_DLL_IMPORT)
#define LIBXML_DLL_IMPORT XMLPUBVAR
#endif

#endif /* __XML_EXPORTS_H__ */


