{$IFDEF read_interface}


function lsm_str_is_uri(str: pchar): Tgboolean; cdecl; external liblasem;
function lsm_str_to_uri(str: pchar): pchar; cdecl; external liblasem;
function lsm_str_parse_double(str: PPchar; x: Pdouble): Tgboolean; cdecl; external liblasem;
function lsm_str_parse_double_list(str: PPchar; n_values: dword; values: Pdouble): dword; cdecl; external liblasem;
procedure lsm_str_point_list_exents(point_list: pchar; extents: PLsmExtents); cdecl; external liblasem;
{ xxxxxxxxxxxxxxxxxxxx
static inline void
lsm_str_skip_spaces (char **str)

  while (g_ascii_isspace (**str))
    (*str)++;


static inline void
lsm_str_skip_char (char **str, char c)

  while (**str == c)
    (*str)++;


static inline void
lsm_str_skip_comma_and_spaces (char **str)

  while (g_ascii_isspace (**str) || **str == ',')
    (*str)++;


static inline void
lsm_str_skip_semicolon_and_spaces (char **str)

  while (g_ascii_isspace (**str) || **str == ';')
    (*str)++;


static inline void
lsm_str_skip_colon_and_spaces (char **str)

  while (g_ascii_isspace (**str) || **str == ':')
    (*str)++;



static inline void
lsm_str_consolidate (char *str)

  char *to_ptr;
  char *from_ptr;

  if (str == NULL)
    return;

  from_ptr = str;
  to_ptr = str;
  while (*from_ptr != '\0')
    if (g_ascii_isspace (*from_ptr))
      if (to_ptr != str &&
          *(to_ptr - 1) != ' ')
        *to_ptr = ' ';
        to_ptr++;

     else
      *to_ptr = *from_ptr;
      to_ptr++;

    from_ptr++;


  if (to_ptr != str && *(to_ptr - 1) == ' ')
    *(to_ptr - 1) = '\0';
  else
    *to_ptr = '\0';


 }

// === Konventiert am: 3-3-26 15:55:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
