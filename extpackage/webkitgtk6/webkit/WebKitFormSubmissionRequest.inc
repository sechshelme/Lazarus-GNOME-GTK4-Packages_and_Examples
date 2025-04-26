{$IFDEF read_interface}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitFormSubmissionRequest, webkit_form_submission_request, WEBKIT, FORM_SUBMISSION_REQUEST, GObject) }
type
  TWebKitFormSubmissionRequest = record
  end;
  PWebKitFormSubmissionRequest = ^TWebKitFormSubmissionRequest;

  TWebKitFormSubmissionRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitFormSubmissionRequestClass = ^TWebKitFormSubmissionRequestClass;

function webkit_form_submission_request_get_type: TGType; cdecl; external libwebkit;
function webkit_form_submission_request_list_text_fields(request: PWebKitFormSubmissionRequest; field_names: PPGPtrArray; field_values: PPGPtrArray): Tgboolean; cdecl; external libwebkit;
procedure webkit_form_submission_request_submit(request: PWebKitFormSubmissionRequest); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:50:29 ===

function WEBKIT_TYPE_FORM_SUBMISSION_REQUEST: TGType;
function WEBKIT_FORM_SUBMISSION_REQUEST(obj: Pointer): PWebKitFormSubmissionRequest;
function WEBKIT_IS_FORM_SUBMISSION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_FORM_SUBMISSION_REQUEST: TGType;
begin
  Result := webkit_form_submission_request_get_type;
end;

function WEBKIT_FORM_SUBMISSION_REQUEST(obj: Pointer): PWebKitFormSubmissionRequest;
begin
  Result := PWebKitFormSubmissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_FORM_SUBMISSION_REQUEST));
end;

function WEBKIT_IS_FORM_SUBMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_FORM_SUBMISSION_REQUEST);
end;


{$ENDIF read_implementation}
