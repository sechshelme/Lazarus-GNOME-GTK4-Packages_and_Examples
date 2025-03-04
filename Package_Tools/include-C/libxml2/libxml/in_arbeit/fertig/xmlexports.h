/*
 * Summary: macros for marking symbols as exportable/importable.
 * Description: macros for marking symbols as exportable/importable.
 *
 * Copy: See Copyright for the status of this software.
 */



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
 * extern:
 *
 * Macro which declares an exportable variable
 */
#define extern XMLPUBLIC extern

/* Compatibility */
#if !defined(LIBXML_DLL_IMPORT)
#define LIBXML_DLL_IMPORT extern
#endif

#endif /* __XML_EXPORTS_H__ */


