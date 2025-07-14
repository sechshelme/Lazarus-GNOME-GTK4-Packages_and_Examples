unit fp_string;

interface

uses
  clib,
  fp_stdlib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function memcpy(__dest: pointer; __src: pointer; __n: Tsize_t): pointer; cdecl; external libc;
function memmove(__dest: pointer; __src: pointer; __n: Tsize_t): pointer; cdecl; external libc;
function memccpy(__dest: pointer; __src: pointer; __c: longint; __n: Tsize_t): pointer; cdecl; external libc;
function memset(__s: pointer; __c: longint; __n: Tsize_t): pointer; cdecl; external libc;
function memcmp(__s1: pointer; __s2: pointer; __n: Tsize_t): longint; cdecl; external libc;
function memchr(__s: pointer; __c: longint; __n: Tsize_t): pointer; cdecl; external libc;
function rawmemchr(__s: pointer; __c: longint): pointer; cdecl; external libc;
function memrchr(__s: pointer; __c: longint; __n: Tsize_t): pointer; cdecl; external libc;
function strcpy(__dest: pchar; __src: pchar): pchar; cdecl; external libc;
function strncpy(__dest: pchar; __src: pchar; __n: Tsize_t): pchar; cdecl; external libc;
function strcat(__dest: pchar; __src: pchar): pchar; cdecl; external libc;
function strncat(__dest: pchar; __src: pchar; __n: Tsize_t): pchar; cdecl; external libc;
function strcmp(__s1: pchar; __s2: pchar): longint; cdecl; external libc;
function strncmp(__s1: pchar; __s2: pchar; __n: Tsize_t): longint; cdecl; external libc;
function strcoll(__s1: pchar; __s2: pchar): longint; cdecl; external libc;
function strxfrm(__dest: pchar; __src: pchar; __n: Tsize_t): Tsize_t; cdecl; external libc;
function strcoll_l(__s1: pchar; __s2: pchar; __l: Tlocale_t): longint; cdecl; external libc;
function strxfrm_l(__dest: pchar; __src: pchar; __n: Tsize_t; __l: Tlocale_t): Tsize_t; cdecl; external libc;
function strdup(__s: pchar): pchar; cdecl; external libc;
function strndup(__string: pchar; __n: Tsize_t): pchar; cdecl; external libc;
function strchr(__s: pchar; __c: longint): pchar; cdecl; external libc;
function strrchr(__s: pchar; __c: longint): pchar; cdecl; external libc;
function strchrnul(__s: pchar; __c: longint): pchar; cdecl; external libc;
function strcspn(__s: pchar; __reject: pchar): Tsize_t; cdecl; external libc;
function strspn(__s: pchar; __accept: pchar): Tsize_t; cdecl; external libc;
function strpbrk(__s: pchar; __accept: pchar): pchar; cdecl; external libc;
function strstr(__haystack: pchar; __needle: pchar): pchar; cdecl; external libc;
function strtok(__s: pchar; __delim: pchar): pchar; cdecl; external libc;
function strtok_r(__s: pchar; __delim: pchar; __save_ptr: PPchar): pchar; cdecl; external libc;
function strcasestr(__haystack: pchar; __needle: pchar): pchar; cdecl; external libc;
function memmem(__haystack: pointer; __haystacklen: Tsize_t; __needle: pointer; __needlelen: Tsize_t): pointer; cdecl; external libc;
function mempcpy(__dest: pointer; __src: pointer; __n: Tsize_t): pointer; cdecl; external libc;
function strlen(__s: pchar): Tsize_t; cdecl; external libc;
function strnlen(__string: pchar; __maxlen: Tsize_t): Tsize_t; cdecl; external libc;
function strerror(__errnum: longint): pchar; cdecl; external libc;
function strerror_r(__errnum: longint; __buf: pchar; __buflen: Tsize_t): pchar; cdecl; external libc;
function strerrordesc_np(__err: longint): pchar; cdecl; external libc;
function strerrorname_np(__err: longint): pchar; cdecl; external libc;
function strerror_l(__errnum: longint; __l: Tlocale_t): pchar; cdecl; external libc;
procedure explicit_bzero(__s: pointer; __n: Tsize_t); cdecl; external libc;
function strsep(__stringp: PPchar; __delim: pchar): pchar; cdecl; external libc;
function strsignal(__sig: longint): pchar; cdecl; external libc;
function sigabbrev_np(__sig: longint): pchar; cdecl; external libc;
function sigdescr_np(__sig: longint): pchar; cdecl; external libc;
function stpcpy(__dest: pchar; __src: pchar): pchar; cdecl; external libc;
function stpncpy(__dest: pchar; __src: pchar; __n: Tsize_t): pchar; cdecl; external libc;
function strlcpy(__dest: pchar; __src: pchar; __n: Tsize_t): Tsize_t; cdecl; external libc;
function strlcat(__dest: pchar; __src: pchar; __n: Tsize_t): Tsize_t; cdecl; external libc;
function strverscmp(__s1: pchar; __s2: pchar): longint; cdecl; external libc;
function strfry(__string: pchar): pchar; cdecl; external libc;
function memfrob(__s: pointer; __n: Tsize_t): pointer; cdecl; external libc;
function basename(__filename: pchar): pchar; cdecl; external libc;

// === Konventiert am: 14-7-25 16:27:57 ===


implementation



end.
