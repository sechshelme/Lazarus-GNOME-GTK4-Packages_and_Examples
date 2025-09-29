/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/* 
 * Copyright 2008 Red Hat, Inc.
 */

#ifndef  __SOUP_FORM_H__
#define  __SOUP_FORM_H__ 1

#include "soup-types.h"
#include "soup-multipart.h"



#define SOUP_FORM_MIME_TYPE_URLENCODED "application/x-www-form-urlencoded"
#define SOUP_FORM_MIME_TYPE_MULTIPART  "multipart/form-data"

extern
GHashTable  *soup_form_decode           (const char   *encoded_form);
extern
GHashTable  *soup_form_decode_multipart (SoupMultipart *multipart,
					 const char    *file_control_name,
					 char         **filename,
					 char         **content_type,
					 GBytes       **file);

extern
char        *soup_form_encode           (const char   *first_field,
					 ...) ;
extern
char        *soup_form_encode_hash      (GHashTable   *form_data_set);
extern
char        *soup_form_encode_datalist  (GData       **form_data_set);
extern
char        *soup_form_encode_valist    (const char   *first_field,
					 va_list       args);



#endif /* __SOUP_FORM_H__ */
