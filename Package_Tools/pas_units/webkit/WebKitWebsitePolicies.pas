unit WebKitWebsitePolicies;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebsitePolicies, webkit_website_policies, WEBKIT, WEBSITE_POLICIES, GObject) }
type
  PWebKitAutoplayPolicy = ^TWebKitAutoplayPolicy;
  TWebKitAutoplayPolicy = longint;

const
  WEBKIT_AUTOPLAY_ALLOW = 0;
  WEBKIT_AUTOPLAY_ALLOW_WITHOUT_SOUND = 1;
  WEBKIT_AUTOPLAY_DENY = 2;

type
  TWebKitWebsitePolicies = record
  end;
  PWebKitWebsitePolicies = ^TWebKitWebsitePolicies;

  TWebKitWebsitePoliciesClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebsitePoliciesClass = ^TWebKitWebsitePoliciesClass;

function webkit_website_policies_get_type: TGType; cdecl; external libwebkit;
function webkit_website_policies_new: PWebKitWebsitePolicies; cdecl; external libwebkit;
function webkit_website_policies_new_with_policies(first_policy_name: Pgchar; args: array of const): PWebKitWebsitePolicies; cdecl; external libwebkit;
function webkit_website_policies_new_with_policies(first_policy_name: Pgchar): PWebKitWebsitePolicies; cdecl; external libwebkit;
function webkit_website_policies_get_autoplay_policy(policies: PWebKitWebsitePolicies): TWebKitAutoplayPolicy; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:18:48 ===

function WEBKIT_TYPE_WEBSITE_POLICIES: TGType;
function WEBKIT_WEBSITE_POLICIES(obj: Pointer): PWebKitWebsitePolicies;
function WEBKIT_IS_WEBSITE_POLICIES(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_WEBSITE_POLICIES: TGType;
begin
  Result := webkit_website_policies_get_type;
end;

function WEBKIT_WEBSITE_POLICIES(obj: Pointer): PWebKitWebsitePolicies;
begin
  Result := PWebKitWebsitePolicies(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEBSITE_POLICIES));
end;

function WEBKIT_IS_WEBSITE_POLICIES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEBSITE_POLICIES);
end;



end.
