
unit soup_method;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_method.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_method.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2008 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{*
 * SECTION:soup-method
 * @section_id: SoupMethod
 * @short_description: HTTP method definitions
 *
 * soup-method.h contains a number of defines for standard HTTP and
 * WebDAV headers. You do not need to use these defines; you can pass
 * arbitrary strings to soup_message_new() if you prefer.
 * 
 * The thing that these defines <emphasis>are</emphasis> useful for is
 * performing quick comparisons against soup_message_get_method();
 * because #SoupMessage always contains an interned string, and these
 * macros return interned strings, you can compare methods directly
 * against these macros rather than needing to use strcmp(). This is
 * most useful in #SoupServer handlers. Eg:
 * 
 * <informalexample><programlisting>
 * 	if (soup_message_get_method (msg) != SOUP_METHOD_GET &amp;&amp; soup_message_get_method (msg) != SOUP_METHOD_HEAD) 
 * 		soup_message_set_status (msg, SOUP_METHOD_NOT_IMPLEMENTED);
 * 		return;
 * 	
 * </programlisting></informalexample>
 * }
{ xxxxxxxxxxxxxxxxxxxx
#define _SOUP_INTERN_METHOD(method) (_SOUP_ATOMIC_INTERN_STRING (_SOUP_METHOD_##method, #method))

#define SOUP_METHOD_OPTIONS   _SOUP_INTERN_METHOD (OPTIONS)
#define SOUP_METHOD_GET       _SOUP_INTERN_METHOD (GET)
#define SOUP_METHOD_HEAD      _SOUP_INTERN_METHOD (HEAD)
#define SOUP_METHOD_POST      _SOUP_INTERN_METHOD (POST)
#define SOUP_METHOD_PUT       _SOUP_INTERN_METHOD (PUT)
#define SOUP_METHOD_DELETE    _SOUP_INTERN_METHOD (DELETE)
#define SOUP_METHOD_TRACE     _SOUP_INTERN_METHOD (TRACE)
#define SOUP_METHOD_CONNECT   _SOUP_INTERN_METHOD (CONNECT)

#define SOUP_METHOD_PROPFIND  _SOUP_INTERN_METHOD (PROPFIND)
#define SOUP_METHOD_PROPPATCH _SOUP_INTERN_METHOD (PROPPATCH)
#define SOUP_METHOD_MKCOL     _SOUP_INTERN_METHOD (MKCOL)
#define SOUP_METHOD_COPY      _SOUP_INTERN_METHOD (COPY)
#define SOUP_METHOD_MOVE      _SOUP_INTERN_METHOD (MOVE)
#define SOUP_METHOD_LOCK      _SOUP_INTERN_METHOD (LOCK)
#define SOUP_METHOD_UNLOCK    _SOUP_INTERN_METHOD (UNLOCK)

extern gpointer _SOUP_METHOD_OPTIONS;
extern gpointer _SOUP_METHOD_GET;
extern gpointer _SOUP_METHOD_HEAD;
extern gpointer _SOUP_METHOD_POST;
extern gpointer _SOUP_METHOD_PUT;
extern gpointer _SOUP_METHOD_DELETE;
extern gpointer _SOUP_METHOD_TRACE;
extern gpointer _SOUP_METHOD_CONNECT;

extern gpointer _SOUP_METHOD_PROPFIND;
extern gpointer _SOUP_METHOD_PROPPATCH;
extern gpointer _SOUP_METHOD_MKCOL;
extern gpointer _SOUP_METHOD_COPY;
extern gpointer _SOUP_METHOD_MOVE;
extern gpointer _SOUP_METHOD_LOCK;
extern gpointer _SOUP_METHOD_UNLOCK;
 }
(* error 


implementation


end.
