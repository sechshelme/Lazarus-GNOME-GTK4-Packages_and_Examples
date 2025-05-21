#ifndef _ECORE_GETOPT_H
#define _ECORE_GETOPT_H

#include <stdio.h>
#include <Eina.h>


/**
 * @ingroup Ecore
 * @defgroup Ecore_Getopt_Group Ecore Getopt
 *
 * This group contains powerful getopt replacement.
 *
 * This replacement handles both short (-X) or long options (--ABC)
 * options, with various actions supported, like storing one value and
 * already converting to required type, counting number of
 * occurrences, setting true or false values, show help, license,
 * copyright and even support user-defined callbacks.
 *
 * It is provided a set of C Pre Processor macros so definition is
 * straightforward.
 *
 * Values will be stored elsewhere indicated by an array of pointers
 * to values, it is given in separate to parser description so you can
 * use multiple values with the same parser.
 *
 * @{
 */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @typedef Ecore_Getopt_Action
 * @brief Enumeration for defining the actions to do when parsing command line
 * parameters.
 */
typedef enum {
   ECORE_GETOPT_ACTION_STORE, /**< Store a value */
   ECORE_GETOPT_ACTION_STORE_CONST, /**< Store a const */
   ECORE_GETOPT_ACTION_STORE_TRUE, /**< Store TRUE */
   ECORE_GETOPT_ACTION_STORE_FALSE, /**< Store FALSE */
   ECORE_GETOPT_ACTION_CHOICE, /**< Store a choice between several values */
   ECORE_GETOPT_ACTION_APPEND, /**< Allocate and store a new value of type Ecore_Getopt_Type */
   ECORE_GETOPT_ACTION_COUNT, /**< Store a count number */
   ECORE_GETOPT_ACTION_CALLBACK, /**< Call a callback */
   ECORE_GETOPT_ACTION_HELP, /**< Show help text */
   ECORE_GETOPT_ACTION_VERSION, /**< Show version */
   ECORE_GETOPT_ACTION_COPYRIGHT, /**< Show copyright */
   ECORE_GETOPT_ACTION_LICENSE, /**< Show license */
   ECORE_GETOPT_ACTION_BREAK, /**< Stop parsing options */
   ECORE_GETOPT_ACTION_CATEGORY
} Ecore_Getopt_Action;

/**
 * @typedef Ecore_Getopt_Type
 * @brief Enumeration for defining the type of the values to store when using
 * append action.
 */
typedef enum {
   ECORE_GETOPT_TYPE_STR, /**< Value of type string */
   ECORE_GETOPT_TYPE_BOOL, /**< Value of type boolean */
   ECORE_GETOPT_TYPE_SHORT, /**< Value of type short */
   ECORE_GETOPT_TYPE_INT, /**< Value of type int */
   ECORE_GETOPT_TYPE_LONG, /**< Value of type long */
   ECORE_GETOPT_TYPE_USHORT, /**< Value of type unsigned short */
   ECORE_GETOPT_TYPE_UINT, /**< Value of type unsigned int */
   ECORE_GETOPT_TYPE_ULONG, /**< Value of type unsigned long */
   ECORE_GETOPT_TYPE_DOUBLE /**< Value of type double */
} Ecore_Getopt_Type;

/**
 * @typedef Ecore_Getopt_Desc_Arg_Requirement
 * @brief Enumeration for defining if the command line options require an
 * argument.
 */
typedef enum {
   ECORE_GETOPT_DESC_ARG_REQUIREMENT_NO = 0, /**< Argument is not required */
   ECORE_GETOPT_DESC_ARG_REQUIREMENT_YES = 1, /**< Argument is required */
   ECORE_GETOPT_DESC_ARG_REQUIREMENT_OPTIONAL = 3 /**< Argument is optional */
} Ecore_Getopt_Desc_Arg_Requirement;

typedef struct _Ecore_Getopt_Desc_Store    Ecore_Getopt_Desc_Store;
typedef struct _Ecore_Getopt_Desc_Callback Ecore_Getopt_Desc_Callback;

#ifndef _ECORE_GETOPT_PREDEF
typedef struct _Ecore_Getopt Ecore_Getopt;
#define _ECORE_GETOPT_PREDEF 1
#endif
#ifndef _ECORE_GETOPT_DESC_PREDEF
typedef struct _Ecore_Getopt_Desc Ecore_Getopt_Desc;
#define _ECORE_GETOPT_DESC_PREDEF 1
#endif
#ifndef _ECORE_GETOPT_VALUE_PREDEF
typedef union _Ecore_Getopt_Value Ecore_Getopt_Value;
#define _ECORE_GETOPT_VALUE_PREDEF 1
#endif

/**
 * @union _Ecore_Getopt_Value
 * @brief Union listing the types of parameters that can take Getopt values.
 */
union _Ecore_Getopt_Value
{
   char          **strp; /**< String pointer */
   unsigned char  *boolp; /**< Boolean pointer */
   short          *shortp; /**< Short pointer */
   int            *intp; /**< Int pointer */
   long           *longp; /**< Long pointer */
   unsigned short *ushortp; /**< Unsigned short pointer */
   unsigned int   *uintp; /**< Unsigned int pointer */
   unsigned long  *ulongp; /**< Unsigned long pointer */
   double         *doublep; /**< Double pointer */
   Eina_List     **listp; /**< List pointer */
   void          **ptrp; /**< Void pointer */
};

/**
 * @struct _Ecore_Getopt_Desc_Store
 * @brief Structure used when action is ECORE_GETOPT_ACTION_STORE. It contains
 * information about the value to store.
 */
struct _Ecore_Getopt_Desc_Store
{
   Ecore_Getopt_Type                 type; /**< type of data being handled */
   Ecore_Getopt_Desc_Arg_Requirement arg_req; /**< option argument requirement */
   union
   {
      const char    *strv; /**< String value */
      Eina_Bool      boolv; /**< Boolean value */
      short          shortv; /**< Short value */
      int            intv; /**< Int value */
      long           longv; /**< Long value */
      unsigned short ushortv; /**< Unsigned short value */
      unsigned int   uintv; /**< Unsigned int value */
      unsigned long  ulongv; /**< Unsigned long value */
      double         doublev; /**< Double value */
   } def; /**< value of data being handled */
};

/**
 * @struct _Ecore_Getopt_Desc_Callback
 * @brief Structure used when action is ECORE_GETOPT_ACTION_CALLBACK. It
 * contains information about the callback to call.
 */
struct _Ecore_Getopt_Desc_Callback
{
   Eina_Bool                         (*func)(const Ecore_Getopt *parser,
                                             const Ecore_Getopt_Desc *desc,
                                             const char *str,
                                             void *data,
                                             Ecore_Getopt_Value *storage); /**< function to call as a callback */
   const void                       *data; /**< data to pass to the callback */
   Ecore_Getopt_Desc_Arg_Requirement arg_req; /**< option argument requirement */
   const char                       *def;
};

/**
 * @struct _Ecore_Getopt_Desc
 * @brief Structure that describe an option of the command line.
 */
struct _Ecore_Getopt_Desc
{
   char                shortname; /**< used with a single dash */
   const char         *longname; /**< used with double dashes */
   const char         *help; /**< used by --help/ecore_getopt_help() */
   const char         *metavar; /**< used by ecore_getopt_help() with nargs > 0 */

   Ecore_Getopt_Action action;   /**< define how to handle it */
   union
   {
      const Ecore_Getopt_Desc_Store    store;
      const void                      *store_const;
      const char *const               *choices; /* NULL terminated. */
      const Ecore_Getopt_Type          append_type;
      const Ecore_Getopt_Desc_Callback callback;
      const void                      *dummy;
   } action_param; /**< Action parameter */
};

/**
 * @struct _Ecore_Getopt
 * @brief Structure that contains information on all command line options.
 */
struct _Ecore_Getopt
{
   const char             *prog; /**< to be used when ecore_app_args_get() fails */
   const char             *usage; /**< usage example, %%prog is replaced by @ref prog */
   const char             *version; /**< if exists, --version will work */
   const char             *copyright; /**< if exists, --copyright will work */
   const char             *license; /**< if exists, --license will work */
   const char             *description; /**< long description, possible multiline */
   Eina_Bool               strict : 1; /**< fail on errors */
   const Ecore_Getopt_Desc descs[];   /**< A table that contains the description of all the other options (NULL terminated).*/

};


/**
 * @brief Definition for filling Ecore_Getopt_Desc table with an callback action and argument requirements.
 *
 * @param shortname The option short name.
 * @param longname The option long name.
 * @param help The help message concerning this option.
 * @param metavar The metavar message concerning the parameter of the option.
 * @param callback_func The callback function to call.
 * @param callback_data The data to pass to the callback.
 * @param argument_requirement The required arguments to this option.
 * @param default_value The default values for these arguments.
 */

/**
 * @brief Definition for filling Ecore_Getopt_Desc table with a help action.
 *
 * @param shortname The help option short name.
 * @param longname The help option long name.
 */

/**
 * Shows nicely formatted help message for the given parser.
 *
 * @param fp The file the message will be printed on.
 * @param info The structure containing information about command line options.
 *
 * @see ecore_getopt_help_category()
 */
extern void       ecore_getopt_help(FILE *fp, const Ecore_Getopt *info);

/**
 * Shows help for a single category (along with program usage and description).
 *
 * @param fp The file the message will be printed on.
 * @param info The structure containing information about command line options.
 * @param category The category to print.
 *
 * @return @c EINA_TRUE when the category exists, @c EINA_FALSE otherwise.
 *
 * @see ecore_getopt_help()
 */
extern Eina_Bool  ecore_getopt_help_category(FILE *fp, const Ecore_Getopt *info, const char *category);

/**
 * Checks parser for duplicate entries, print them out.
 *
 * @return @c EINA_TRUE if there are duplicates, @c EINA_FALSE otherwise.
 * @param parser The parser to be checked.
 */
extern Eina_Bool  ecore_getopt_parser_has_duplicates(const Ecore_Getopt *parser);

/**
 * Parses command line parameters.
 *
 * Walks the command line parameters and parse them based on @a parser
 * description, doing actions based on @c parser->descs->action, like
 * showing help text, license, copyright, storing values in values and
 * so on.
 *
 * It is expected that values is of the same size than @c parser->descs,
 * options that do not need a value it will be left untouched.
 *
 * All values are expected to be initialized before use. Options with
 * action @c ECORE_GETOPT_ACTION_STORE and non required arguments
 * (others than @c ECORE_GETOPT_DESC_ARG_REQUIREMENT_YES), are expected
 * to provide a value in @c def to be used.
 *
 * The following actions will store @c 1 on value as a boolean
 * (@c value->boolp) if it's not @c NULL to indicate these actions were
 * executed:
 *   - @c ECORE_GETOPT_ACTION_HELP
 *   - @c ECORE_GETOPT_ACTION_VERSION
 *   - @c ECORE_GETOPT_ACTION_COPYRIGHT
 *   - @c ECORE_GETOPT_ACTION_LICENSE
 *
 * Just @c ECORE_GETOPT_ACTION_APPEND will allocate memory and thus
 * need to be freed. For consistency between all of appended subtypes,
 * @c eina_list->data will contain an allocated memory with the value,
 * that is, for @c ECORE_GETOPT_TYPE_STR it will contain a copy of the
 * argument, @c ECORE_GETOPT_TYPE_INT a pointer to an allocated
 * integer and so on.
 *
 * If parser is in strict mode (see @c Ecore_Getopt->strict), then any
 * error will abort parsing and @c -1 is returned. Otherwise it will try
 * to continue as far as possible.
 *
 * This function may reorder @a argv elements.
 *
 * Translation of help strings (description), metavar, usage, license
 * and copyright may be translated, standard/global gettext() call
 * will be applied on them if ecore was compiled with such support.
 *
 * This function will @b not parse positional arguments! If these are
 * declared (metavar is defined with both shortname and longname being
 * empty), then you must call ecore_getopt_parse_positional() with the
 * last argument (@c start) being the result of this function. This is
 * done so you can have "quit options", those that once called you
 * want to exit without doing further parsing, as is the case with
 * help, license, copyright, version and eventually others you may
 * define.
 *
 * @param parser Description of how to work.
 * @param values Where to store values, it is assumed that this is a vector
 *        of the same size as @c parser->descs. Values should be previously
 *        initialized.
 * @param argc How many elements in @a argv. If not provided it will be
 *        retrieved with ecore_app_args_get().
 * @param argv Command line parameters.
 *
 * @return Index of first non-option parameter or @c -1 on error.
 *
 * @see ecore_getopt_parse_positional()
 */
extern int        ecore_getopt_parse(const Ecore_Getopt *parser, Ecore_Getopt_Value *values, int argc, char **argv);

/**
 * Parses command line positional parameters.
 *
 * Walks the command line positional parameters (those that do not
 * start with "-" or "--") and parse them based on @a parser
 * description, doing actions based on @c parser->descs->action, like
 * storing values of some type.
 *
 * It is expected that @a values is of the same size than @c
 * parser->descs, same as with ecore_getopt_parse().
 *
 * All values are expected to be initialized before use.
 *
 * Unlike the ecore_getopt_parse(), only the following options are
 * supported:
 *  - @c ECORE_GETOPT_ACTION_STORE
 *  - @c ECORE_GETOPT_ACTION_CHOICE
 *  - @c ECORE_GETOPT_ACTION_APPEND
 *  - @c ECORE_GETOPT_ACTION_CALLBACK
 *
 * There is a special case for @c ECORE_GETOPT_ACTION_APPEND as it
 * will consume all remaining elements. It is also special in the
 * sense that it will allocate memory and thus need to be freed. For
 * consistency between all of appended subtypes, @c eina_list->data
 * will contain an allocated memory with the value, that is, for @c
 * ECORE_GETOPT_TYPE_STR it will contain a copy of the argument, @c
 * ECORE_GETOPT_TYPE_INT a pointer to an allocated integer and so on.
 *
 * If parser is in strict mode (see @c Ecore_Getopt->strict), then any
 * error will abort parsing and @c -1 is returned. Otherwise it will try
 * to continue as far as possible.
 *
 * Translation of help strings (description) and metavar may be done,
 * standard/global gettext() call will be applied on them if ecore was
 * compiled with such support.
 *
 * @param parser Description of how to work.
 * @param values Where to store values, it is assumed that this is a vector
 *        of the same size as @c parser->descs. Values should be previously
 *        initialized.
 * @param argc How many elements in @a argv. If not provided it will be
 *        retrieved with ecore_app_args_get().
 * @param argv Command line parameters.
 * @param start The initial position argument to look at, usually the
 *        return of ecore_getopt_parse(). If less than 1, will try to
 *        find it automatically.
 *
 * @return Index of first non-option parameter or @c -1 on error. If the
 *         last positional argument is of action @c
 *         ECORE_GETOPT_ACTION_APPEND then it will be the same as @a argc.
 */
extern int        ecore_getopt_parse_positional(const Ecore_Getopt *parser, Ecore_Getopt_Value *values, int argc, char **argv, int start);


/**
 * Utilities to free list and nodes allocated by @a ECORE_GETOPT_ACTION_APPEND.
 *
 * @param list Pointer to list to be freed.
 * @return always @c NULL, so you can easily make your list head @c NULL.
 */
extern Eina_List *ecore_getopt_list_free(Eina_List *list);

/**
 * Helper ecore_getopt callback to parse geometry (x:y:w:h).
 *
 * @param parser This parameter isn't in use.
 * @param desc This parameter isn't in use.
 * @param str Geometry value
 * @param data This parameter isn't in use.
 * @param storage Must be a pointer to @c Eina_Rectangle and will be used to
 * store the four values passed in the given string.
 * @return @c EINA_TRUE on success, @c EINA_FALSE on incorrect geometry value.
 *
 * This is a helper function to be used with ECORE_GETOPT_CALLBACK_*().
 *
 * @c callback_data value is ignored, you can safely use @c NULL.
 */
extern Eina_Bool  ecore_getopt_callback_geometry_parse(const Ecore_Getopt *parser, const Ecore_Getopt_Desc *desc, const char *str, void *data, Ecore_Getopt_Value *storage);

/**
 * Helper ecore_getopt callback to parse geometry size (WxH).
 *
 * @param parser This parameter isn't in use.
 * @param desc This parameter isn't in use.
 * @param str size value
 * @param data This parameter isn't in use.
 * @param storage Must be a pointer to @c Eina_Rectangle and will be used to
 * store the two values passed in the given string and @c 0 in the x and y
 * fields.
 * @return @c EINA_TRUE on success, @c EINA_FALSE on incorrect size value.
 *
 * @c callback_data value is ignored, you can safely use @c NULL.
 */
extern Eina_Bool  ecore_getopt_callback_size_parse(const Ecore_Getopt *parser, const Ecore_Getopt_Desc *desc, const char *str, void *data, Ecore_Getopt_Value *storage);



#endif /* _ECORE_GETOPT_H */
