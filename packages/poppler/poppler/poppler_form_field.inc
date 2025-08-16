{$IFDEF read_interface}


type
  PPopplerSignatureStatus = ^TPopplerSignatureStatus;
  TPopplerSignatureStatus = longint;

const
  POPPLER_SIGNATURE_VALID = 0;
  POPPLER_SIGNATURE_INVALID = 1;
  POPPLER_SIGNATURE_DIGEST_MISMATCH = 2;
  POPPLER_SIGNATURE_DECODING_ERROR = 3;
  POPPLER_SIGNATURE_GENERIC_ERROR = 4;
  POPPLER_SIGNATURE_NOT_FOUND = 5;
  POPPLER_SIGNATURE_NOT_VERIFIED = 6;

type
  PPopplerCertificateStatus = ^TPopplerCertificateStatus;
  TPopplerCertificateStatus = longint;

const
  POPPLER_CERTIFICATE_TRUSTED = 0;
  POPPLER_CERTIFICATE_UNTRUSTED_ISSUER = 1;
  POPPLER_CERTIFICATE_UNKNOWN_ISSUER = 2;
  POPPLER_CERTIFICATE_REVOKED = 3;
  POPPLER_CERTIFICATE_EXPIRED = 4;
  POPPLER_CERTIFICATE_GENERIC_ERROR = 5;
  POPPLER_CERTIFICATE_NOT_VERIFIED = 6;

type
  PPopplerSignatureValidationFlags = ^TPopplerSignatureValidationFlags;
  TPopplerSignatureValidationFlags = longint;

const
  POPPLER_SIGNATURE_VALIDATION_FLAG_VALIDATE_CERTIFICATE = 1 shl 0;
  POPPLER_SIGNATURE_VALIDATION_FLAG_WITHOUT_OCSP_REVOCATION_CHECK = 1 shl 1;
  POPPLER_SIGNATURE_VALIDATION_FLAG_USE_AIA_CERTIFICATE_FETCH = 1 shl 2;

type
  PPopplerFormFieldType = ^TPopplerFormFieldType;
  TPopplerFormFieldType = longint;

const
  POPPLER_FORM_FIELD_UNKNOWN = 0;
  POPPLER_FORM_FIELD_BUTTON = 1;
  POPPLER_FORM_FIELD_TEXT = 2;
  POPPLER_FORM_FIELD_CHOICE = 3;
  POPPLER_FORM_FIELD_SIGNATURE = 4;

type
  PPopplerFormButtonType = ^TPopplerFormButtonType;
  TPopplerFormButtonType = longint;

const
  POPPLER_FORM_BUTTON_PUSH = 0;
  POPPLER_FORM_BUTTON_CHECK = 1;
  POPPLER_FORM_BUTTON_RADIO = 2;

type
  PPopplerFormTextType = ^TPopplerFormTextType;
  TPopplerFormTextType = longint;

const
  POPPLER_FORM_TEXT_NORMAL = 0;
  POPPLER_FORM_TEXT_MULTILINE = 1;
  POPPLER_FORM_TEXT_FILE_SELECT = 2;

type
  PPopplerFormChoiceType = ^TPopplerFormChoiceType;
  TPopplerFormChoiceType = longint;

const
  POPPLER_FORM_CHOICE_COMBO = 0;
  POPPLER_FORM_CHOICE_LIST = 1;

type
  PPopplerAdditionalActionType = ^TPopplerAdditionalActionType;
  TPopplerAdditionalActionType = longint;

const
  POPPLER_ADDITIONAL_ACTION_FIELD_MODIFIED = 0;
  POPPLER_ADDITIONAL_ACTION_FORMAT_FIELD = 1;
  POPPLER_ADDITIONAL_ACTION_VALIDATE_FIELD = 2;
  POPPLER_ADDITIONAL_ACTION_CALCULATE_FIELD = 3;

function poppler_form_field_get_type: TGType; cdecl; external poppler_glib;
function poppler_form_field_get_field_type(field: PPopplerFormField): TPopplerFormFieldType; cdecl; external poppler_glib;
function poppler_form_field_get_id(field: PPopplerFormField): Tgint; cdecl; external poppler_glib;
function poppler_form_field_get_font_size(field: PPopplerFormField): Tgdouble; cdecl; external poppler_glib;
function poppler_form_field_is_read_only(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
function poppler_form_field_get_partial_name(field: PPopplerFormField): Pgchar; cdecl; external poppler_glib;
function poppler_form_field_get_mapping_name(field: PPopplerFormField): Pgchar; cdecl; external poppler_glib;
function poppler_form_field_get_name(field: PPopplerFormField): Pgchar; cdecl; external poppler_glib;
function poppler_form_field_get_action(field: PPopplerFormField): PPopplerAction; cdecl; external poppler_glib;
function poppler_form_field_get_additional_action(field: PPopplerFormField; _type: TPopplerAdditionalActionType): PPopplerAction; cdecl; external poppler_glib;
function poppler_form_field_get_alternate_ui_name(field: PPopplerFormField): Pgchar; cdecl; external poppler_glib;
function poppler_form_field_button_get_button_type(field: PPopplerFormField): TPopplerFormButtonType; cdecl; external poppler_glib;
function poppler_form_field_button_get_state(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
procedure poppler_form_field_button_set_state(field: PPopplerFormField; state: Tgboolean); cdecl; external poppler_glib;
function poppler_form_field_text_get_text_type(field: PPopplerFormField): TPopplerFormTextType; cdecl; external poppler_glib;
function poppler_form_field_text_get_text(field: PPopplerFormField): Pgchar; cdecl; external poppler_glib;
procedure poppler_form_field_text_set_text(field: PPopplerFormField; text: Pgchar); cdecl; external poppler_glib;
function poppler_form_field_text_get_max_len(field: PPopplerFormField): Tgint; cdecl; external poppler_glib;
function poppler_form_field_text_do_spell_check(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
function poppler_form_field_text_do_scroll(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
function poppler_form_field_text_is_rich_text(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
function poppler_form_field_text_is_password(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
function poppler_form_field_choice_get_choice_type(field: PPopplerFormField): TPopplerFormChoiceType; cdecl; external poppler_glib;
function poppler_form_field_choice_is_editable(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
function poppler_form_field_choice_can_select_multiple(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
function poppler_form_field_choice_do_spell_check(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
function poppler_form_field_choice_commit_on_change(field: PPopplerFormField): Tgboolean; cdecl; external poppler_glib;
function poppler_form_field_choice_get_n_items(field: PPopplerFormField): Tgint; cdecl; external poppler_glib;
function poppler_form_field_choice_get_item(field: PPopplerFormField; index: Tgint): Pgchar; cdecl; external poppler_glib;
function poppler_form_field_choice_is_item_selected(field: PPopplerFormField; index: Tgint): Tgboolean; cdecl; external poppler_glib;
procedure poppler_form_field_choice_select_item(field: PPopplerFormField; index: Tgint); cdecl; external poppler_glib;
procedure poppler_form_field_choice_unselect_all(field: PPopplerFormField); cdecl; external poppler_glib;
procedure poppler_form_field_choice_toggle_item(field: PPopplerFormField; index: Tgint); cdecl; external poppler_glib;
procedure poppler_form_field_choice_set_text(field: PPopplerFormField; text: Pgchar); cdecl; external poppler_glib;
function poppler_form_field_choice_get_text(field: PPopplerFormField): Pgchar; cdecl; external poppler_glib;
function poppler_form_field_signature_validate_sync(field: PPopplerFormField; flags: TPopplerSignatureValidationFlags; cancellable: PGCancellable; error: PPGError): PPopplerSignatureInfo; cdecl; external poppler_glib;
procedure poppler_form_field_signature_validate_async(field: PPopplerFormField; flags: TPopplerSignatureValidationFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external poppler_glib;
function poppler_form_field_signature_validate_finish(field: PPopplerFormField; result: PGAsyncResult; error: PPGError): PPopplerSignatureInfo; cdecl; external poppler_glib;

function POPPLER_TYPE_SIGNATURE_INFO: TGType;

function poppler_signature_info_get_type: TGType; cdecl; external poppler_glib;
function poppler_signature_info_copy(siginfo: PPopplerSignatureInfo): PPopplerSignatureInfo; cdecl; external poppler_glib;
procedure poppler_signature_info_free(siginfo: PPopplerSignatureInfo); cdecl; external poppler_glib;
function poppler_signature_info_get_signature_status(siginfo: PPopplerSignatureInfo): TPopplerSignatureStatus; cdecl; external poppler_glib;
function poppler_signature_info_get_certificate_status(siginfo: PPopplerSignatureInfo): TPopplerCertificateStatus; cdecl; external poppler_glib;
function poppler_signature_info_get_certificate_info(siginfo: PPopplerSignatureInfo): PPopplerCertificateInfo; cdecl; external poppler_glib;
function poppler_signature_info_get_signer_name(siginfo: PPopplerSignatureInfo): Pgchar; cdecl; external poppler_glib;
function poppler_signature_info_get_local_signing_time(siginfo: PPopplerSignatureInfo): PGDateTime; cdecl; external poppler_glib;

function POPPLER_TYPE_SIGNING_DATA: TGType;

function poppler_signing_data_get_type: TGType; cdecl; external poppler_glib;
function poppler_signing_data_new: PPopplerSigningData; cdecl; external poppler_glib;
function poppler_signing_data_copy(signing_data: PPopplerSigningData): PPopplerSigningData; cdecl; external poppler_glib;
procedure poppler_signing_data_free(signing_data: PPopplerSigningData); cdecl; external poppler_glib;
procedure poppler_signing_data_set_destination_filename(signing_data: PPopplerSigningData; filename: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_destination_filename(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;
procedure poppler_signing_data_set_certificate_info(signing_data: PPopplerSigningData; certificate_info: PPopplerCertificateInfo); cdecl; external poppler_glib;
function poppler_signing_data_get_certificate_info(signing_data: PPopplerSigningData): PPopplerCertificateInfo; cdecl; external poppler_glib;
procedure poppler_signing_data_set_page(signing_data: PPopplerSigningData; page: longint); cdecl; external poppler_glib;
function poppler_signing_data_get_page(signing_data: PPopplerSigningData): longint; cdecl; external poppler_glib;
procedure poppler_signing_data_set_signature_text(signing_data: PPopplerSigningData; signature_text: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_signature_text(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;
procedure poppler_signing_data_set_signature_text_left(signing_data: PPopplerSigningData; signature_text_left: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_signature_text_left(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;
procedure poppler_signing_data_set_signature_rectangle(signing_data: PPopplerSigningData; signature_rect: PPopplerRectangle); cdecl; external poppler_glib;
function poppler_signing_data_get_signature_rectangle(signing_data: PPopplerSigningData): PPopplerRectangle; cdecl; external poppler_glib;
procedure poppler_signing_data_set_font_color(signing_data: PPopplerSigningData; font_color: PPopplerColor); cdecl; external poppler_glib;
function poppler_signing_data_get_font_color(signing_data: PPopplerSigningData): PPopplerColor; cdecl; external poppler_glib;
procedure poppler_signing_data_set_font_size(signing_data: PPopplerSigningData; font_size: Tgdouble); cdecl; external poppler_glib;
function poppler_signing_data_get_font_size(signing_data: PPopplerSigningData): Tgdouble; cdecl; external poppler_glib;
procedure poppler_signing_data_set_left_font_size(signing_data: PPopplerSigningData; font_size: Tgdouble); cdecl; external poppler_glib;
function poppler_signing_data_get_left_font_size(signing_data: PPopplerSigningData): Tgdouble; cdecl; external poppler_glib;
procedure poppler_signing_data_set_border_color(signing_data: PPopplerSigningData; border_color: PPopplerColor); cdecl; external poppler_glib;
function poppler_signing_data_get_border_color(signing_data: PPopplerSigningData): PPopplerColor; cdecl; external poppler_glib;
procedure poppler_signing_data_set_border_width(signing_data: PPopplerSigningData; border_width: Tgdouble); cdecl; external poppler_glib;
function poppler_signing_data_get_border_width(signing_data: PPopplerSigningData): Tgdouble; cdecl; external poppler_glib;
procedure poppler_signing_data_set_background_color(signing_data: PPopplerSigningData; background_color: PPopplerColor); cdecl; external poppler_glib;
function poppler_signing_data_get_background_color(signing_data: PPopplerSigningData): PPopplerColor; cdecl; external poppler_glib;
procedure poppler_signing_data_set_field_partial_name(signing_data: PPopplerSigningData; field_partial_name: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_field_partial_name(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;
procedure poppler_signing_data_set_reason(signing_data: PPopplerSigningData; reason: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_reason(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;
procedure poppler_signing_data_set_location(signing_data: PPopplerSigningData; location: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_location(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;
procedure poppler_signing_data_set_image_path(signing_data: PPopplerSigningData; image_path: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_image_path(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;
procedure poppler_signing_data_set_password(signing_data: PPopplerSigningData; password: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_password(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;
procedure poppler_signing_data_set_document_owner_password(signing_data: PPopplerSigningData; document_owner_password: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_document_owner_password(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;
procedure poppler_signing_data_set_document_user_password(signing_data: PPopplerSigningData; document_user_password: Pgchar); cdecl; external poppler_glib;
function poppler_signing_data_get_document_user_password(signing_data: PPopplerSigningData): Pgchar; cdecl; external poppler_glib;

function POPPLER_TYPE_CERTIFICATE_INFO: TGType;

function poppler_certificate_info_get_type: TGType; cdecl; external poppler_glib;
function poppler_certificate_info_new: PPopplerCertificateInfo; cdecl; external poppler_glib;
function poppler_certificate_info_copy(certificate_info: PPopplerCertificateInfo): PPopplerCertificateInfo; cdecl; external poppler_glib;
procedure poppler_certificate_info_free(certificate_info: PPopplerCertificateInfo); cdecl; external poppler_glib;
function poppler_certificate_info_get_id(certificate_info: PPopplerCertificateInfo): pchar; cdecl; external poppler_glib;
function poppler_certificate_info_get_subject_common_name(certificate_info: PPopplerCertificateInfo): pchar; cdecl; external poppler_glib;
function poppler_certificate_info_get_subject_organization(certificate_info: PPopplerCertificateInfo): pchar; cdecl; external poppler_glib;
function poppler_certificate_info_get_subject_email(certificate_info: PPopplerCertificateInfo): pchar; cdecl; external poppler_glib;
function poppler_certificate_info_get_issuer_common_name(certificate_info: PPopplerCertificateInfo): pchar; cdecl; external poppler_glib;
function poppler_certificate_info_get_issuer_organization(certificate_info: PPopplerCertificateInfo): pchar; cdecl; external poppler_glib;
function poppler_certificate_info_get_issuer_email(certificate_info: PPopplerCertificateInfo): pchar; cdecl; external poppler_glib;
function poppler_certificate_info_get_issuance_time(certificate_info: PPopplerCertificateInfo): PGDateTime; cdecl; external poppler_glib;
function poppler_certificate_info_get_expiration_time(certificate_info: PPopplerCertificateInfo): PGDateTime; cdecl; external poppler_glib;
function poppler_get_certificate_info_by_id(id: pchar): PPopplerCertificateInfo; cdecl; external poppler_glib;
function poppler_get_available_signing_certificates: PGList; cdecl; external poppler_glib;

procedure poppler_set_nss_dir(path: pchar); cdecl; external poppler_glib;
function poppler_get_nss_dir: pchar; cdecl; external poppler_glib;

type
  TPopplerNssPasswordFunc = function(text: Pgchar): pchar; cdecl;

procedure poppler_set_nss_password_callback(func: TPopplerNssPasswordFunc); cdecl; external poppler_glib;

// === Konventiert am: 15-8-25 16:55:00 ===

function POPPLER_TYPE_FORM_FIELD: TGType;
function POPPLER_FORM_FIELD(obj: Pointer): PPopplerFormField;
function POPPLER_IS_FORM_FIELD(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function POPPLER_TYPE_FORM_FIELD: TGType;
begin
  POPPLER_TYPE_FORM_FIELD := poppler_form_field_get_type;
end;

function POPPLER_FORM_FIELD(obj: Pointer): PPopplerFormField;
begin
  Result := PPopplerFormField(g_type_check_instance_cast(obj, POPPLER_TYPE_FORM_FIELD));
end;

function POPPLER_IS_FORM_FIELD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_FORM_FIELD);
end;

// ====

function POPPLER_TYPE_SIGNATURE_INFO: TGType;
begin
  POPPLER_TYPE_SIGNATURE_INFO := poppler_signature_info_get_type;
end;

function POPPLER_TYPE_SIGNING_DATA: TGType;
begin
  POPPLER_TYPE_SIGNING_DATA := poppler_signing_data_get_type;
end;

function POPPLER_TYPE_CERTIFICATE_INFO: TGType;
begin
  POPPLER_TYPE_CERTIFICATE_INFO := poppler_certificate_info_get_type;
end;


{$ENDIF read_implementation}
