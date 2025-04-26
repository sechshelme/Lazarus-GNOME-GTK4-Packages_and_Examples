{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitResponsePolicyDecision, webkit_response_policy_decision, WEBKIT, RESPONSE_POLICY_DECISION, WebKitPolicyDecision) }
type
  TWebKitResponsePolicyDecision = record
  end;
  PWebKitResponsePolicyDecision = ^TWebKitResponsePolicyDecision;

  TWebKitResponsePolicyDecisionClass = record
    parent_class: TWebKitPolicyDecisionClass;
  end;
  PWebKitResponsePolicyDecisionClass = ^TWebKitResponsePolicyDecisionClass;

function webkit_response_policy_decision_get_type: TGType; cdecl; external libwebkit;
function webkit_response_policy_decision_get_request(decision: PWebKitResponsePolicyDecision): PWebKitURIRequest; cdecl; external libwebkit;
function webkit_response_policy_decision_get_response(decision: PWebKitResponsePolicyDecision): PWebKitURIResponse; cdecl; external libwebkit;
function webkit_response_policy_decision_is_mime_type_supported(decision: PWebKitResponsePolicyDecision): Tgboolean; cdecl; external libwebkit;
function webkit_response_policy_decision_is_main_frame_main_resource(decision: PWebKitResponsePolicyDecision): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:31:46 ===

function WEBKIT_TYPE_RESPONSE_POLICY_DECISION: TGType;
function WEBKIT_RESPONSE_POLICY_DECISION(obj: Pointer): PWebKitResponsePolicyDecision;
function WEBKIT_IS_RESPONSE_POLICY_DECISION(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_RESPONSE_POLICY_DECISION: TGType;
begin
  Result := webkit_response_policy_decision_get_type;
end;

function WEBKIT_RESPONSE_POLICY_DECISION(obj: Pointer): PWebKitResponsePolicyDecision;
begin
  Result := PWebKitResponsePolicyDecision(g_type_check_instance_cast(obj, WEBKIT_TYPE_RESPONSE_POLICY_DECISION));
end;

function WEBKIT_IS_RESPONSE_POLICY_DECISION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_RESPONSE_POLICY_DECISION);
end;


{$ENDIF read_implementation}
