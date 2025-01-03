unit WebKitPolicyDecision;

interface

uses
  fp_glib2, fp_GTK4, WebKitWebsitePolicies;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_DERIVABLE_TYPE (WebKitPolicyDecision, webkit_policy_decision, WEBKIT, POLICY_DECISION, GObject) }
type
  TWebKitPolicyDecisionPrivate = record
  end;
  PWebKitPolicyDecisionPrivate = ^TWebKitPolicyDecisionPrivate;

  TWebKitPolicyDecisionClass = record
    parent_class: TGObjectClass;
    _webkit_reserved0: procedure; cdecl;
    _webkit_reserved1: procedure; cdecl;
    _webkit_reserved2: procedure; cdecl;
    _webkit_reserved3: procedure; cdecl;
    _webkit_reserved4: procedure; cdecl;
    _webkit_reserved5: procedure; cdecl;
    _webkit_reserved6: procedure; cdecl;
    _webkit_reserved7: procedure; cdecl;
  end;
  PWebKitPolicyDecisionClass = ^TWebKitPolicyDecisionClass;

  TWebKitPolicyDecision = record
    parent_instance: TGObject;
    priv: PWebKitPolicyDecisionPrivate;
  end;
  PWebKitPolicyDecision = ^TWebKitPolicyDecision;

function webkit_policy_decision_get_type: TGType; cdecl; external libwebkit;
procedure webkit_policy_decision_use(decision: PWebKitPolicyDecision); cdecl; external libwebkit;
procedure webkit_policy_decision_use_with_policies(decision: PWebKitPolicyDecision; policies: PWebKitWebsitePolicies); cdecl; external libwebkit;
procedure webkit_policy_decision_ignore(decision: PWebKitPolicyDecision); cdecl; external libwebkit;
procedure webkit_policy_decision_download(decision: PWebKitPolicyDecision); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:15:29 ===

function WEBKIT_TYPE_POLICY_DECISION: TGType;
function WEBKIT_POLICY_DECISION(obj: Pointer): PWebKitPolicyDecision;
function WEBKIT_IS_POLICY_DECISION(obj: Pointer): Tgboolean;
function WEBKIT_POLICY_DECISION_CLASS(klass: Pointer): PWebKitPolicyDecisionClass;
function WEBKIT_IS_POLICY_DECISION_CLASS(klass: Pointer): Tgboolean;
function WEBKIT_POLICY_DECISION_GET_CLASS(obj: Pointer): PWebKitPolicyDecisionClass;

implementation

function WEBKIT_TYPE_POLICY_DECISION: TGType;
begin
  Result := webkit_policy_decision_get_type;
end;

function WEBKIT_POLICY_DECISION(obj: Pointer): PWebKitPolicyDecision;
begin
  Result := PWebKitPolicyDecision(g_type_check_instance_cast(obj, WEBKIT_TYPE_POLICY_DECISION));
end;

function WEBKIT_IS_POLICY_DECISION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_POLICY_DECISION);
end;

function WEBKIT_POLICY_DECISION_CLASS(klass: Pointer): PWebKitPolicyDecisionClass;
begin
  Result := PWebKitPolicyDecisionClass(g_type_check_class_cast(klass, WEBKIT_TYPE_POLICY_DECISION));
end;

function WEBKIT_IS_POLICY_DECISION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, WEBKIT_TYPE_POLICY_DECISION);
end;

function WEBKIT_POLICY_DECISION_GET_CLASS(obj: Pointer): PWebKitPolicyDecisionClass;
begin
  Result := PWebKitPolicyDecisionClass(PGTypeInstance(obj)^.g_class);
end;


end.
