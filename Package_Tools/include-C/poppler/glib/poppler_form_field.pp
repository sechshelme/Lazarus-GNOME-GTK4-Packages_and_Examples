
unit poppler_form_field;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_form_field.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_form_field.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGDateTime  = ^GDateTime;
PGError  = ^GError;
PGList  = ^GList;
PPopplerAction  = ^PopplerAction;
PPopplerAdditionalActionType  = ^PopplerAdditionalActionType;
PPopplerCertificateInfo  = ^PopplerCertificateInfo;
PPopplerCertificateStatus  = ^PopplerCertificateStatus;
PPopplerColor  = ^PopplerColor;
PPopplerFormButtonType  = ^PopplerFormButtonType;
PPopplerFormChoiceType  = ^PopplerFormChoiceType;
PPopplerFormField  = ^PopplerFormField;
PPopplerFormFieldType  = ^PopplerFormFieldType;
PPopplerFormTextType  = ^PopplerFormTextType;
PPopplerNssPasswordFunc  = ^PopplerNssPasswordFunc;
PPopplerRectangle  = ^PopplerRectangle;
PPopplerSignatureInfo  = ^PopplerSignatureInfo;
PPopplerSignatureStatus  = ^PopplerSignatureStatus;
PPopplerSignatureValidationFlags  = ^PopplerSignatureValidationFlags;
PPopplerSigningData  = ^PopplerSigningData;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-form-field.h: glib interface to poppler
 *
 * Copyright (C) 2007 Carlos Garcia Campos <carlosgc@gnome.org>
 * Copyright (C) 2021 André Guerreiro <aguerreiro1985@gmail.com>
 * Copyright (C) 2021, 2023 Marek Kasik <mkasik@redhat.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __POPPLER_FORM_FIELD_H__}
{$define __POPPLER_FORM_FIELD_H__}
{$include <glib-object.h>}
{$include "poppler.h"}

{ was #define dname def_expr }
function POPPLER_TYPE_FORM_FIELD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_FORM_FIELD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_FORM_FIELD(obj : longint) : longint;

{*
 * PopplerSignatureStatus
 * @POPPLER_SIGNATURE_VALID: signature is cryptographically valid
 * @POPPLER_SIGNATURE_INVALID: signature is cryptographically invalid
 * @POPPLER_SIGNATURE_DIGEST_MISMATCH: document content was changed after the signature was applied
 * @POPPLER_SIGNATURE_DECODING_ERROR: signature CMS/PKCS7 structure is malformed
 * @POPPLER_SIGNATURE_GENERIC_ERROR: failed to verify signature
 * @POPPLER_SIGNATURE_NOT_FOUND: requested signature is not present in the document
 * @POPPLER_SIGNATURE_NOT_VERIFIED: signature not yet verified
 *
 * Signature verification results
 *
 * Since: 21.12.0
  }
type
  PPopplerSignatureStatus = ^TPopplerSignatureStatus;
  TPopplerSignatureStatus =  Longint;
  Const
    POPPLER_SIGNATURE_VALID = 0;
    POPPLER_SIGNATURE_INVALID = 1;
    POPPLER_SIGNATURE_DIGEST_MISMATCH = 2;
    POPPLER_SIGNATURE_DECODING_ERROR = 3;
    POPPLER_SIGNATURE_GENERIC_ERROR = 4;
    POPPLER_SIGNATURE_NOT_FOUND = 5;
    POPPLER_SIGNATURE_NOT_VERIFIED = 6;
;
{*
 * PopplerCertificateStatus
 * @POPPLER_CERTIFICATE_TRUSTED: certificate is considered trusted
 * @POPPLER_CERTIFICATE_UNTRUSTED_ISSUER: the issuer of this certificate has been marked as untrusted by the user
 * @POPPLER_CERTIFICATE_UNKNOWN_ISSUER: this certificate trust chain has not finished in a trusted root certificate
 * @POPPLER_CERTIFICATE_REVOKED: certificate was revoked by the issuing certificate authority
 * @POPPLER_CERTIFICATE_EXPIRED: signing time is outside the validity bounds of this certificate
 * @POPPLER_CERTIFICATE_GENERIC_ERROR: failed to verify certificate
 * @POPPLER_CERTIFICATE_NOT_VERIFIED: certificate not yet verified
 *
 * Signature certificate verification results
 *
 * Since: 21.12.0
  }
type
  PPopplerCertificateStatus = ^TPopplerCertificateStatus;
  TPopplerCertificateStatus =  Longint;
  Const
    POPPLER_CERTIFICATE_TRUSTED = 0;
    POPPLER_CERTIFICATE_UNTRUSTED_ISSUER = 1;
    POPPLER_CERTIFICATE_UNKNOWN_ISSUER = 2;
    POPPLER_CERTIFICATE_REVOKED = 3;
    POPPLER_CERTIFICATE_EXPIRED = 4;
    POPPLER_CERTIFICATE_GENERIC_ERROR = 5;
    POPPLER_CERTIFICATE_NOT_VERIFIED = 6;
;
{*
 * PopplerSignatureValidationFlags
 * @POPPLER_SIGNATURE_VALIDATION_FLAG_VALIDATE_CERTIFICATE: Whether to validate also the certificate of the signature
 * @POPPLER_SIGNATURE_VALIDATION_FLAG_WITHOUT_OCSP_REVOCATION_CHECK: Whether to not do OCSP (Online Certificate Status Protocol) revocation check
 * @POPPLER_SIGNATURE_VALIDATION_FLAG_USE_AIA_CERTIFICATE_FETCH: Whether to use AIA (Authority Information Access) extension for certificate fetching
 *
 * Signature validation flags
 *
 * Since: 21.12.0
  }
{< flags > }
type
  PPopplerSignatureValidationFlags = ^TPopplerSignatureValidationFlags;
  TPopplerSignatureValidationFlags =  Longint;
  Const
    POPPLER_SIGNATURE_VALIDATION_FLAG_VALIDATE_CERTIFICATE = 1 shl 0;
    POPPLER_SIGNATURE_VALIDATION_FLAG_WITHOUT_OCSP_REVOCATION_CHECK = 1 shl 1;
    POPPLER_SIGNATURE_VALIDATION_FLAG_USE_AIA_CERTIFICATE_FETCH = 1 shl 2;
;
type
  PPopplerFormFieldType = ^TPopplerFormFieldType;
  TPopplerFormFieldType =  Longint;
  Const
    POPPLER_FORM_FIELD_UNKNOWN = 0;
    POPPLER_FORM_FIELD_BUTTON = 1;
    POPPLER_FORM_FIELD_TEXT = 2;
    POPPLER_FORM_FIELD_CHOICE = 3;
    POPPLER_FORM_FIELD_SIGNATURE = 4;
;
type
  PPopplerFormButtonType = ^TPopplerFormButtonType;
  TPopplerFormButtonType =  Longint;
  Const
    POPPLER_FORM_BUTTON_PUSH = 0;
    POPPLER_FORM_BUTTON_CHECK = 1;
    POPPLER_FORM_BUTTON_RADIO = 2;
;
type
  PPopplerFormTextType = ^TPopplerFormTextType;
  TPopplerFormTextType =  Longint;
  Const
    POPPLER_FORM_TEXT_NORMAL = 0;
    POPPLER_FORM_TEXT_MULTILINE = 1;
    POPPLER_FORM_TEXT_FILE_SELECT = 2;
;
type
  PPopplerFormChoiceType = ^TPopplerFormChoiceType;
  TPopplerFormChoiceType =  Longint;
  Const
    POPPLER_FORM_CHOICE_COMBO = 0;
    POPPLER_FORM_CHOICE_LIST = 1;
;
{*
 * PopplerAdditionalActionType:
 * @POPPLER_ADDITIONAL_ACTION_FIELD_MODIFIED: The action to be performed when the user modifies the field.
 * @POPPLER_ADDITIONAL_ACTION_FORMAT_FIELD: The action to be performed before the field is formatted to
 * display its value.
 * @POPPLER_ADDITIONAL_ACTION_VALIDATE_FIELD: The action to be performed when the field value changes.
 * @POPPLER_ADDITIONAL_ACTION_CALCULATE_FIELD: The action to be performed when the field needs to be
 * recalculated.
 *
 * Form field additional action types to be passed to @poppler_form_field_get_additional_action
 *
 * Since: 0.72
  }
type
  PPopplerAdditionalActionType = ^TPopplerAdditionalActionType;
  TPopplerAdditionalActionType =  Longint;
  Const
    POPPLER_ADDITIONAL_ACTION_FIELD_MODIFIED = 0;
    POPPLER_ADDITIONAL_ACTION_FORMAT_FIELD = 1;
    POPPLER_ADDITIONAL_ACTION_VALIDATE_FIELD = 2;
    POPPLER_ADDITIONAL_ACTION_CALCULATE_FIELD = 3;
;

function poppler_form_field_get_type:TGType;cdecl;external;
function poppler_form_field_get_field_type(field:PPopplerFormField):TPopplerFormFieldType;cdecl;external;
function poppler_form_field_get_id(field:PPopplerFormField):Tgint;cdecl;external;
function poppler_form_field_get_font_size(field:PPopplerFormField):Tgdouble;cdecl;external;
function poppler_form_field_is_read_only(field:PPopplerFormField):Tgboolean;cdecl;external;
function poppler_form_field_get_partial_name(field:PPopplerFormField):Pgchar;cdecl;external;
function poppler_form_field_get_mapping_name(field:PPopplerFormField):Pgchar;cdecl;external;
function poppler_form_field_get_name(field:PPopplerFormField):Pgchar;cdecl;external;
function poppler_form_field_get_action(field:PPopplerFormField):PPopplerAction;cdecl;external;
function poppler_form_field_get_additional_action(field:PPopplerFormField; _type:TPopplerAdditionalActionType):PPopplerAction;cdecl;external;
function poppler_form_field_get_alternate_ui_name(field:PPopplerFormField):Pgchar;cdecl;external;
{ Button Field  }
function poppler_form_field_button_get_button_type(field:PPopplerFormField):TPopplerFormButtonType;cdecl;external;
function poppler_form_field_button_get_state(field:PPopplerFormField):Tgboolean;cdecl;external;
procedure poppler_form_field_button_set_state(field:PPopplerFormField; state:Tgboolean);cdecl;external;
{ Text Field  }
function poppler_form_field_text_get_text_type(field:PPopplerFormField):TPopplerFormTextType;cdecl;external;
function poppler_form_field_text_get_text(field:PPopplerFormField):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_form_field_text_set_text(field:PPopplerFormField; text:Pgchar);cdecl;external;
function poppler_form_field_text_get_max_len(field:PPopplerFormField):Tgint;cdecl;external;
function poppler_form_field_text_do_spell_check(field:PPopplerFormField):Tgboolean;cdecl;external;
function poppler_form_field_text_do_scroll(field:PPopplerFormField):Tgboolean;cdecl;external;
function poppler_form_field_text_is_rich_text(field:PPopplerFormField):Tgboolean;cdecl;external;
function poppler_form_field_text_is_password(field:PPopplerFormField):Tgboolean;cdecl;external;
{ Choice Field  }
function poppler_form_field_choice_get_choice_type(field:PPopplerFormField):TPopplerFormChoiceType;cdecl;external;
function poppler_form_field_choice_is_editable(field:PPopplerFormField):Tgboolean;cdecl;external;
function poppler_form_field_choice_can_select_multiple(field:PPopplerFormField):Tgboolean;cdecl;external;
function poppler_form_field_choice_do_spell_check(field:PPopplerFormField):Tgboolean;cdecl;external;
function poppler_form_field_choice_commit_on_change(field:PPopplerFormField):Tgboolean;cdecl;external;
function poppler_form_field_choice_get_n_items(field:PPopplerFormField):Tgint;cdecl;external;
function poppler_form_field_choice_get_item(field:PPopplerFormField; index:Tgint):Pgchar;cdecl;external;
function poppler_form_field_choice_is_item_selected(field:PPopplerFormField; index:Tgint):Tgboolean;cdecl;external;
procedure poppler_form_field_choice_select_item(field:PPopplerFormField; index:Tgint);cdecl;external;
procedure poppler_form_field_choice_unselect_all(field:PPopplerFormField);cdecl;external;
procedure poppler_form_field_choice_toggle_item(field:PPopplerFormField; index:Tgint);cdecl;external;
(* Const before type ignored *)
procedure poppler_form_field_choice_set_text(field:PPopplerFormField; text:Pgchar);cdecl;external;
function poppler_form_field_choice_get_text(field:PPopplerFormField):Pgchar;cdecl;external;
function poppler_form_field_signature_validate_sync(field:PPopplerFormField; flags:TPopplerSignatureValidationFlags; cancellable:PGCancellable; error:PPGError):PPopplerSignatureInfo;cdecl;external;
procedure poppler_form_field_signature_validate_async(field:PPopplerFormField; flags:TPopplerSignatureValidationFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function poppler_form_field_signature_validate_finish(field:PPopplerFormField; result:PGAsyncResult; error:PPGError):PPopplerSignatureInfo;cdecl;external;
{ Signature Field  }
{ was #define dname def_expr }
function POPPLER_TYPE_SIGNATURE_INFO : longint; { return type might be wrong }

function poppler_signature_info_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function poppler_signature_info_copy(siginfo:PPopplerSignatureInfo):PPopplerSignatureInfo;cdecl;external;
procedure poppler_signature_info_free(siginfo:PPopplerSignatureInfo);cdecl;external;
(* Const before type ignored *)
function poppler_signature_info_get_signature_status(siginfo:PPopplerSignatureInfo):TPopplerSignatureStatus;cdecl;external;
(* Const before type ignored *)
function poppler_signature_info_get_certificate_status(siginfo:PPopplerSignatureInfo):TPopplerCertificateStatus;cdecl;external;
(* Const before type ignored *)
function poppler_signature_info_get_certificate_info(siginfo:PPopplerSignatureInfo):PPopplerCertificateInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signature_info_get_signer_name(siginfo:PPopplerSignatureInfo):Pgchar;cdecl;external;
(* Const before type ignored *)
function poppler_signature_info_get_local_signing_time(siginfo:PPopplerSignatureInfo):PGDateTime;cdecl;external;
{ Signing Data  }
{ was #define dname def_expr }
function POPPLER_TYPE_SIGNING_DATA : longint; { return type might be wrong }

function poppler_signing_data_get_type:TGType;cdecl;external;
function poppler_signing_data_new:PPopplerSigningData;cdecl;external;
(* Const before type ignored *)
function poppler_signing_data_copy(signing_data:PPopplerSigningData):PPopplerSigningData;cdecl;external;
procedure poppler_signing_data_free(signing_data:PPopplerSigningData);cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_destination_filename(signing_data:PPopplerSigningData; filename:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_destination_filename(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_certificate_info(signing_data:PPopplerSigningData; certificate_info:PPopplerCertificateInfo);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_certificate_info(signing_data:PPopplerSigningData):PPopplerCertificateInfo;cdecl;external;
procedure poppler_signing_data_set_page(signing_data:PPopplerSigningData; page:longint);cdecl;external;
(* Const before type ignored *)
function poppler_signing_data_get_page(signing_data:PPopplerSigningData):longint;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_signature_text(signing_data:PPopplerSigningData; signature_text:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_signature_text(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_signature_text_left(signing_data:PPopplerSigningData; signature_text_left:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_signature_text_left(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_signature_rectangle(signing_data:PPopplerSigningData; signature_rect:PPopplerRectangle);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_signature_rectangle(signing_data:PPopplerSigningData):PPopplerRectangle;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_font_color(signing_data:PPopplerSigningData; font_color:PPopplerColor);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_font_color(signing_data:PPopplerSigningData):PPopplerColor;cdecl;external;
procedure poppler_signing_data_set_font_size(signing_data:PPopplerSigningData; font_size:Tgdouble);cdecl;external;
(* Const before type ignored *)
function poppler_signing_data_get_font_size(signing_data:PPopplerSigningData):Tgdouble;cdecl;external;
procedure poppler_signing_data_set_left_font_size(signing_data:PPopplerSigningData; font_size:Tgdouble);cdecl;external;
(* Const before type ignored *)
function poppler_signing_data_get_left_font_size(signing_data:PPopplerSigningData):Tgdouble;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_border_color(signing_data:PPopplerSigningData; border_color:PPopplerColor);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_border_color(signing_data:PPopplerSigningData):PPopplerColor;cdecl;external;
procedure poppler_signing_data_set_border_width(signing_data:PPopplerSigningData; border_width:Tgdouble);cdecl;external;
(* Const before type ignored *)
function poppler_signing_data_get_border_width(signing_data:PPopplerSigningData):Tgdouble;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_background_color(signing_data:PPopplerSigningData; background_color:PPopplerColor);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_background_color(signing_data:PPopplerSigningData):PPopplerColor;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_field_partial_name(signing_data:PPopplerSigningData; field_partial_name:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_field_partial_name(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_reason(signing_data:PPopplerSigningData; reason:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_reason(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_location(signing_data:PPopplerSigningData; location:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_location(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_image_path(signing_data:PPopplerSigningData; image_path:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_image_path(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_password(signing_data:PPopplerSigningData; password:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_password(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_document_owner_password(signing_data:PPopplerSigningData; document_owner_password:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_document_owner_password(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure poppler_signing_data_set_document_user_password(signing_data:PPopplerSigningData; document_user_password:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_signing_data_get_document_user_password(signing_data:PPopplerSigningData):Pgchar;cdecl;external;
{ Certificate Information  }
{ was #define dname def_expr }
function POPPLER_TYPE_CERTIFICATE_INFO : longint; { return type might be wrong }

function poppler_certificate_info_get_type:TGType;cdecl;external;
function poppler_certificate_info_new:PPopplerCertificateInfo;cdecl;external;
(* Const before type ignored *)
function poppler_certificate_info_copy(certificate_info:PPopplerCertificateInfo):PPopplerCertificateInfo;cdecl;external;
procedure poppler_certificate_info_free(certificate_info:PPopplerCertificateInfo);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_certificate_info_get_id(certificate_info:PPopplerCertificateInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_certificate_info_get_subject_common_name(certificate_info:PPopplerCertificateInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_certificate_info_get_subject_organization(certificate_info:PPopplerCertificateInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_certificate_info_get_subject_email(certificate_info:PPopplerCertificateInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_certificate_info_get_issuer_common_name(certificate_info:PPopplerCertificateInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_certificate_info_get_issuer_organization(certificate_info:PPopplerCertificateInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function poppler_certificate_info_get_issuer_email(certificate_info:PPopplerCertificateInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function poppler_certificate_info_get_issuance_time(certificate_info:PPopplerCertificateInfo):PGDateTime;cdecl;external;
(* Const before type ignored *)
function poppler_certificate_info_get_expiration_time(certificate_info:PPopplerCertificateInfo):PGDateTime;cdecl;external;
(* Const before type ignored *)
function poppler_get_certificate_info_by_id(id:Pchar):PPopplerCertificateInfo;cdecl;external;
function poppler_get_available_signing_certificates:PGList;cdecl;external;
{ NSS  }
(* Const before type ignored *)
procedure poppler_set_nss_dir(path:Pchar);cdecl;external;
function poppler_get_nss_dir:Pchar;cdecl;external;
(* Const before type ignored *)
type
  PPopplerNssPasswordFunc = ^TPopplerNssPasswordFunc;
  TPopplerNssPasswordFunc = function (text:Pgchar):Pchar;cdecl;

procedure poppler_set_nss_password_callback(func:TPopplerNssPasswordFunc);cdecl;external;
{$endif}
{ __POPPLER_FORM_FIELD_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_TYPE_FORM_FIELD : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_FORM_FIELD:=poppler_form_field_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_FORM_FIELD(obj : longint) : longint;
begin
  POPPLER_FORM_FIELD:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_FORM_FIELD,PopplerFormField);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_FORM_FIELD(obj : longint) : longint;
begin
  POPPLER_IS_FORM_FIELD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_FORM_FIELD);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_SIGNATURE_INFO : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_SIGNATURE_INFO:=poppler_signature_info_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_SIGNING_DATA : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_SIGNING_DATA:=poppler_signing_data_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_CERTIFICATE_INFO : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_CERTIFICATE_INFO:=poppler_certificate_info_get_type;
  end;


end.
