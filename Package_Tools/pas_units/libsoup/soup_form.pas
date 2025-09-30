unit soup_form;

interface

uses
  fp_glib2, fp_soup, soup_multipart;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SOUP_FORM_MIME_TYPE_URLENCODED = 'application/x-www-form-urlencoded';
  SOUP_FORM_MIME_TYPE_MULTIPART = 'multipart/form-data';

function soup_form_decode(encoded_form: pchar): PGHashTable; cdecl; external libsoup;
function soup_form_decode_multipart(multipart: PSoupMultipart; file_control_name: pchar; filename: PPchar; content_type: PPchar; file_: PPGBytes): PGHashTable; cdecl; external libsoup;
function soup_form_encode(first_field: pchar): pchar; cdecl; varargs; external libsoup;
function soup_form_encode_hash(form_data_set: PGHashTable): pchar; cdecl; external libsoup;
function soup_form_encode_datalist(form_data_set: PPGData): pchar; cdecl; external libsoup;
function soup_form_encode_valist(first_field: pchar; args: Tva_list): pchar; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:54 ===


implementation



end.
