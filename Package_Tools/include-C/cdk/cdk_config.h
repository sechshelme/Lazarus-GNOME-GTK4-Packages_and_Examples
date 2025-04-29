/* include/cdk_config.h.  Generated automatically by configure.  */
/*
 * $Id: config.hin,v 1.2 2000/01/17 14:48:19 tom Exp $
 */

#ifndef CDK_CONFIG_H
#define CDK_CONFIG_H 1


#define CDK_CONST /*nothing*/
#define CDK_CSTRING CDK_CONST char *
#define CDK_CSTRING2 CDK_CONST char * CDK_CONST *
#define CDK_PATCHDATE 20230201
#define CDK_VERSION "5.0"
#define CDK_HAVE_DIRENT_H 1
#define CDK_HAVE_GETBEGX 1
#define CDK_HAVE_GETBEGY 1
#define CDK_HAVE_GETCWD 1
#define CDK_HAVE_GETLOGIN 1
#define CDK_HAVE_GETMAXX 1
#define CDK_HAVE_GETMAXY 1
#define CDK_HAVE_GETOPT_H 1
#define CDK_HAVE_GETOPT_HEADER 1
#define CDK_HAVE_GRP_H 1
#define CDK_HAVE_INTTYPES_H 1
#define CDK_HAVE_LIMITS_H 1
#define CDK_HAVE_LSTAT 1
#define CDK_HAVE_MEMORY_H 1
#define CDK_HAVE_MKTIME 1
#define CDK_HAVE_NCURSES_H 1
#define CDK_HAVE_PWD_H 1
#define CDK_HAVE_SETLOCALE 1
#define CDK_HAVE_SLEEP 1
#define CDK_HAVE_START_COLOR 1
#define CDK_HAVE_STDINT_H 1
#define CDK_HAVE_STDLIB_H 1
#define CDK_HAVE_STRDUP 1
#define CDK_HAVE_STRERROR 1
#define CDK_HAVE_STRINGS_H 1
#define CDK_HAVE_STRING_H 1
#define CDK_HAVE_SYS_STAT_H 1
#define CDK_HAVE_SYS_TYPES_H 1
#define CDK_HAVE_TERM_H 1
#define CDK_HAVE_TYPE_CHTYPE 1
#define CDK_HAVE_UNCTRL_H 1
#define CDK_HAVE_UNISTD_H 1
#define CDK_MIXEDCASE_FILENAMES 1
#define CDK_NCURSES 1
#define CDK_PACKAGE "cdk"
#define CDK_STDC_HEADERS 1
#define CDK_SYSTEM_NAME "linux-gnu"
#define CDK_TYPE_CHTYPE_IS_SCALAR 1
#define setbegyx(win,y,x) ERR

#if !defined(CDK_HAVE_LSTAT) && !defined(lstat)
#define lstat(f,b) stat(f,b)
#endif

#endif /* CDK_CONFIG_H */
