unit soup_form;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{ 
 * Copyright 2008 Red Hat, Inc.
  }
{$ifndef  __SOUP_FORM_H__}

const
  __SOUP_FORM_H__ = 1;  
{$include "soup-types.h"}
{$include "soup-multipart.h"}

const
  SOUP_FORM_MIME_TYPE_URLENCODED = 'application/x-www-form-urlencoded';  
  SOUP_FORM_MIME_TYPE_MULTIPART = 'multipart/form-data';  

function soup_form_decode(encoded_form:Pchar):PGHashTable;cdecl;external libsoup;
function soup_form_decode_multipart(multipart:PSoupMultipart; file_control_name:Pchar; filename:PPchar; content_type:PPchar; file:PPGBytes):PGHashTable;cdecl;external libsoup;
function soup_form_encode(first_field:Pchar; args:array of const):Pchar;cdecl;external libsoup;
function soup_form_encode(first_field:Pchar):Pchar;cdecl;external libsoup;
function soup_form_encode_hash(form_data_set:PGHashTable):Pchar;cdecl;external libsoup;
function soup_form_encode_datalist(form_data_set:PPGData):Pchar;cdecl;external libsoup;
function soup_form_encode_valist(first_field:Pchar; args:Tva_list):Pchar;cdecl;external libsoup;
{$endif}
{ __SOUP_FORM_H__  }

// === Konventiert am: 29-9-25 19:44:54 ===


implementation



end.
