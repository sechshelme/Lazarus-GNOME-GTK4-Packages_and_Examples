#ifndef ELM_CODE_TEXT_H_
# define ELM_CODE_TEXT_H_

#define ELM_CODE_TEXT_NOT_FOUND -1

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @file
 * @brief These routines are used for interacting with the textual content of files/lines in Elm Code.
 */

/**
 * @brief Line text handling functions.
 * @defgroup Elm_Code_Text access and manipulation within lines
 *
 * @{
 *
 * Functions for handling content of lines within elm code.
 *
 */

extern const char *elm_code_line_text_get(Elm_Code_Line *line, unsigned int *length);

extern void elm_code_line_text_set(Elm_Code_Line *line, const char *chars, unsigned int length);

extern int elm_code_line_text_strpos(Elm_Code_Line *line, const char *search, int offset);

extern Eina_Bool elm_code_line_text_contains(Elm_Code_Line *line, const char *search);

extern char *elm_code_line_text_substr(Elm_Code_Line *line, unsigned int position, int length);

extern void elm_code_line_text_insert(Elm_Code_Line *line, unsigned int position, const char *string, int length);

extern void elm_code_line_text_remove(Elm_Code_Line *line, unsigned int position, int length);

extern void elm_code_line_text_leading_whitespace_strip(Elm_Code_Line *line);

extern void elm_code_line_text_trailing_whitespace_strip(Elm_Code_Line *line);

/**
 * @}
 *
 * @brief Generic text handling functions.
 * @defgroup Text helper functions
 *
 * @{
 *
 * Functions for managing unicode text.
 *
 */

extern int elm_code_text_strnpos(const char *text, unsigned int length, const char *search, int offset);

extern int elm_code_text_newlinenpos(const char *text, unsigned int length, short *nllen);

extern unsigned int elm_code_text_is_whitespace(const char *text, unsigned int length);

/**
 * @}
 */

#ifdef __cplusplus
}
#endif

#endif /* ELM_CODE_TEXT_H_ */
