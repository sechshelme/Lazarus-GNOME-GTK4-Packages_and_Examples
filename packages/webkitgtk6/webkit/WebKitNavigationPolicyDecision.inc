{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitNavigationPolicyDecision, webkit_navigation_policy_decision, WEBKIT, NAVIGATION_POLICY_DECISION, WebKitPolicyDecision) }
type
  TWebKitNavigationPolicyDecision = record
  end;
  PWebKitNavigationPolicyDecision = ^TWebKitNavigationPolicyDecision;

  TWebKitNavigationPolicyDecisionClass = record
    parent_class: TWebKitPolicyDecisionClass;
  end;
  PWebKitNavigationPolicyDecisionClass = ^TWebKitNavigationPolicyDecisionClass;

function webkit_navigation_policy_decision_get_type: TGType; cdecl; external libwebkit;
function webkit_navigation_policy_decision_get_navigation_action(decision: PWebKitNavigationPolicyDecision): PWebKitNavigationAction; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:44:41 ===

function WEBKIT_TYPE_NAVIGATION_POLICY_DECISION: TGType;
function WEBKIT_NAVIGATION_POLICY_DECISION(obj: Pointer): PWebKitNavigationPolicyDecision;
function WEBKIT_IS_NAVIGATION_POLICY_DECISION(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_NAVIGATION_POLICY_DECISION: TGType;
begin
  Result := webkit_navigation_policy_decision_get_type;
end;

function WEBKIT_NAVIGATION_POLICY_DECISION(obj: Pointer): PWebKitNavigationPolicyDecision;
begin
  Result := PWebKitNavigationPolicyDecision(g_type_check_instance_cast(obj, WEBKIT_TYPE_NAVIGATION_POLICY_DECISION));
end;

function WEBKIT_IS_NAVIGATION_POLICY_DECISION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_NAVIGATION_POLICY_DECISION);
end;


{$ENDIF read_implementation}
