unit ldap_schema;

interface

uses
  fp_ldap;

const
  LDAP_SCHERR_OUTOFMEM = 1;
  LDAP_SCHERR_UNEXPTOKEN = 2;
  LDAP_SCHERR_NOLEFTPAREN = 3;
  LDAP_SCHERR_NORIGHTPAREN = 4;
  LDAP_SCHERR_NODIGIT = 5;
  LDAP_SCHERR_BADNAME = 6;
  LDAP_SCHERR_BADDESC = 7;
  LDAP_SCHERR_BADSUP = 8;
  LDAP_SCHERR_DUPOPT = 9;
  LDAP_SCHERR_EMPTY = 10;
  LDAP_SCHERR_MISSING = 11;
  LDAP_SCHERR_OUT_OF_ORDER = 12;

type
  Tldap_schema_extension_item = record
    lsei_name: pchar;
    lsei_values: ^pchar;
  end;
  Pldap_schema_extension_item = ^Tldap_schema_extension_item;
  TLDAPSchemaExtensionItem = Tldap_schema_extension_item;
  PLDAPSchemaExtensionItem = ^TLDAPSchemaExtensionItem;

  Tldap_syntax = record
    syn_oid: pchar;
    syn_names: ^pchar;
    syn_desc: pchar;
    syn_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_syntax = ^Tldap_syntax;
  TLDAPSyntax = Tldap_syntax;
  PLDAPSyntax = ^TLDAPSyntax;

  Tldap_matchingrule = record
    mr_oid: pchar;
    mr_names: ^pchar;
    mr_desc: pchar;
    mr_obsolete: longint;
    mr_syntax_oid: pchar;
    mr_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_matchingrule = ^Tldap_matchingrule;
  TLDAPMatchingRule = Tldap_matchingrule;
  PLDAPMatchingRule = ^TLDAPMatchingRule;

  Tldap_matchingruleuse = record
    mru_oid: pchar;
    mru_names: ^pchar;
    mru_desc: pchar;
    mru_obsolete: longint;
    mru_applies_oids: ^pchar;
    mru_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_matchingruleuse = ^Tldap_matchingruleuse;
  TLDAPMatchingRuleUse = Tldap_matchingruleuse;
  PLDAPMatchingRuleUse = ^TLDAPMatchingRuleUse;

  Tldap_attributetype = record
    at_oid: pchar;
    at_names: ^pchar;
    at_desc: pchar;
    at_obsolete: longint;
    at_sup_oid: pchar;
    at_equality_oid: pchar;
    at_ordering_oid: pchar;
    at_substr_oid: pchar;
    at_syntax_oid: pchar;
    at_syntax_len: longint;
    at_single_value: longint;
    at_collective: longint;
    at_no_user_mod: longint;
    at_usage: longint;
    at_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_attributetype = ^Tldap_attributetype;
  TLDAPAttributeType = Tldap_attributetype;
  PLDAPAttributeType = ^TLDAPAttributeType;

  Tldap_objectclass = record
    oc_oid: pchar;
    oc_names: ^pchar;
    oc_desc: pchar;
    oc_obsolete: longint;
    oc_sup_oids: ^pchar;
    oc_kind: longint;
    oc_at_oids_must: ^pchar;
    oc_at_oids_may: ^pchar;
    oc_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_objectclass = ^Tldap_objectclass;
  TLDAPObjectClass = Tldap_objectclass;
  PLDAPObjectClass = ^TLDAPObjectClass;

  Tldap_contentrule = record
    cr_oid: pchar;
    cr_names: ^pchar;
    cr_desc: pchar;
    cr_sup_oids: ^pchar;
    cr_obsolete: longint;
    cr_oc_oids_aux: ^pchar;
    cr_at_oids_must: ^pchar;
    cr_at_oids_may: ^pchar;
    cr_at_oids_not: ^pchar;
    cr_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_contentrule = ^Tldap_contentrule;
  TLDAPContentRule = Tldap_contentrule;
  PLDAPContentRule = ^TLDAPContentRule;

  Tldap_nameform = record
    nf_oid: pchar;
    nf_names: ^pchar;
    nf_desc: pchar;
    nf_obsolete: longint;
    nf_objectclass: pchar;
    nf_at_oids_must: ^pchar;
    nf_at_oids_may: ^pchar;
    nf_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_nameform = ^Tldap_nameform;
  TLDAPNameForm = Tldap_nameform;
  PLDAPNameForm = ^TLDAPNameForm;

  Tldap_structurerule = record
    sr_ruleid: longint;
    sr_names: ^pchar;
    sr_desc: pchar;
    sr_obsolete: longint;
    sr_nameform: pchar;
    sr_nsup_ruleids: longint;
    sr_sup_ruleids: Plongint;
    sr_extensions: ^PLDAPSchemaExtensionItem;
  end;
  Pldap_structurerule = ^Tldap_structurerule;
  TLDAPStructureRule = Tldap_structurerule;
  PLDAPStructureRule = ^TLDAPStructureRule;

const
  LDAP_SCHEMA_NO = 0;
  LDAP_SCHEMA_YES = 1;
  LDAP_SCHEMA_USER_APPLICATIONS = 0;
  LDAP_SCHEMA_DIRECTORY_OPERATION = 1;
  LDAP_SCHEMA_DISTRIBUTED_OPERATION = 2;
  LDAP_SCHEMA_DSA_OPERATION = 3;
  LDAP_SCHEMA_ABSTRACT = 0;
  LDAP_SCHEMA_STRUCTURAL = 1;
  LDAP_SCHEMA_AUXILIARY = 2;
  LDAP_SCHEMA_ALLOW_NONE = $00;
  LDAP_SCHEMA_ALLOW_NO_OID = $01;
  LDAP_SCHEMA_ALLOW_QUOTED = $02;
  LDAP_SCHEMA_ALLOW_DESCR = $04;
  LDAP_SCHEMA_ALLOW_DESCR_PREFIX = $08;
  LDAP_SCHEMA_ALLOW_OID_MACRO = $10;
  LDAP_SCHEMA_ALLOW_OUT_OF_ORDER_FIELDS = $20;
  LDAP_SCHEMA_ALLOW_ALL = $3f;
  LDAP_SCHEMA_SKIP = $80;

function ldap_syntax2name(syn: PLDAPSyntax): pchar; cdecl; external libldap;
function ldap_matchingrule2name(mr: PLDAPMatchingRule): pchar; cdecl; external libldap;
function ldap_matchingruleuse2name(mru: PLDAPMatchingRuleUse): pchar; cdecl; external libldap;
function ldap_attributetype2name(at: PLDAPAttributeType): pchar; cdecl; external libldap;
function ldap_objectclass2name(oc: PLDAPObjectClass): pchar; cdecl; external libldap;
function ldap_contentrule2name(cr: PLDAPContentRule): pchar; cdecl; external libldap;
function ldap_nameform2name(nf: PLDAPNameForm): pchar; cdecl; external libldap;
function ldap_structurerule2name(sr: PLDAPStructureRule): pchar; cdecl; external libldap;
procedure ldap_syntax_free(syn: PLDAPSyntax); cdecl; external libldap;
procedure ldap_matchingrule_free(mr: PLDAPMatchingRule); cdecl; external libldap;
procedure ldap_matchingruleuse_free(mr: PLDAPMatchingRuleUse); cdecl; external libldap;
procedure ldap_attributetype_free(at: PLDAPAttributeType); cdecl; external libldap;
procedure ldap_objectclass_free(oc: PLDAPObjectClass); cdecl; external libldap;
procedure ldap_contentrule_free(cr: PLDAPContentRule); cdecl; external libldap;
procedure ldap_nameform_free(nf: PLDAPNameForm); cdecl; external libldap;
procedure ldap_structurerule_free(sr: PLDAPStructureRule); cdecl; external libldap;
function ldap_str2structurerule(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPStructureRule; cdecl; external libldap;
function ldap_str2nameform(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPNameForm; cdecl; external libldap;
function ldap_str2contentrule(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPContentRule; cdecl; external libldap;
function ldap_str2objectclass(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPObjectClass; cdecl; external libldap;
function ldap_str2attributetype(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPAttributeType; cdecl; external libldap;
function ldap_str2syntax(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPSyntax; cdecl; external libldap;
function ldap_str2matchingrule(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPMatchingRule; cdecl; external libldap;
function ldap_str2matchingruleuse(s: pchar; code: Plongint; errp: PPchar; flags: dword): PLDAPMatchingRuleUse; cdecl; external libldap;
function ldap_structurerule2str(sr: PLDAPStructureRule): pchar; cdecl; external libldap;
function ldap_structurerule2bv(sr: PLDAPStructureRule; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_nameform2str(nf: PLDAPNameForm): pchar; cdecl; external libldap;
function ldap_nameform2bv(nf: PLDAPNameForm; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_contentrule2str(cr: PLDAPContentRule): pchar; cdecl; external libldap;
function ldap_contentrule2bv(cr: PLDAPContentRule; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_objectclass2str(oc: PLDAPObjectClass): pchar; cdecl; external libldap;
function ldap_objectclass2bv(oc: PLDAPObjectClass; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_attributetype2str(at: PLDAPAttributeType): pchar; cdecl; external libldap;
function ldap_attributetype2bv(at: PLDAPAttributeType; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_syntax2str(syn: PLDAPSyntax): pchar; cdecl; external libldap;
function ldap_syntax2bv(syn: PLDAPSyntax; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_matchingrule2str(mr: PLDAPMatchingRule): pchar; cdecl; external libldap;
function ldap_matchingrule2bv(mr: PLDAPMatchingRule; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_matchingruleuse2str(mru: PLDAPMatchingRuleUse): pchar; cdecl; external libldap;
function ldap_matchingruleuse2bv(mru: PLDAPMatchingRuleUse; bv: Pberval): Pberval; cdecl; external libldap;
function ldap_scherr2str(code: longint): pchar; cdecl; external libldap;

// === Konventiert am: 10-12-25 16:58:21 ===


implementation



end.
