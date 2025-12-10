unit ldap_schema;

interface

uses
  cytypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $OpenLDAP$  }
{ This work is part of OpenLDAP Software <http://www.openldap.org/>.
 *
 * Copyright 1998-2022 The OpenLDAP Foundation.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted only as authorized by the OpenLDAP
 * Public License.
 *
 * A copy of this license is available in file LICENSE in the
 * top-level directory of the distribution or, alternatively, at
 * <http://www.OpenLDAP.org/license.html>.
  }
{ ldap-schema.h - Header for basic schema handling functions that can be
 *		used by both clients and servers.
 * these routines should be renamed ldap_x_...
  }
{$ifndef _LDAP_SCHEMA_H}

const
  _LDAP_SCHEMA_H = 1;  
{$include <ldap_cdefs.h>}
{ Codes for parsing errors  }

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
  Pldap_schema_extension_item = ^Tldap_schema_extension_item;
  Tldap_schema_extension_item = record
      lsei_name : Pchar;
      lsei_values : ^Pchar;
    end;
  TLDAPSchemaExtensionItem = Tldap_schema_extension_item;
  PLDAPSchemaExtensionItem = ^TLDAPSchemaExtensionItem;
{ REQUIRED  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }

  Pldap_syntax = ^Tldap_syntax;
  Tldap_syntax = record
      syn_oid : Pchar;
      syn_names : ^Pchar;
      syn_desc : Pchar;
      syn_extensions : ^PLDAPSchemaExtensionItem;
    end;
  TLDAPSyntax = Tldap_syntax;
  PLDAPSyntax = ^TLDAPSyntax;
{ REQUIRED  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }
{ REQUIRED  }
{ OPTIONAL  }

  Pldap_matchingrule = ^Tldap_matchingrule;
  Tldap_matchingrule = record
      mr_oid : Pchar;
      mr_names : ^Pchar;
      mr_desc : Pchar;
      mr_obsolete : longint;
      mr_syntax_oid : Pchar;
      mr_extensions : ^PLDAPSchemaExtensionItem;
    end;
  TLDAPMatchingRule = Tldap_matchingrule;
  PLDAPMatchingRule = ^TLDAPMatchingRule;
{ REQUIRED  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }
{ REQUIRED  }
{ OPTIONAL  }

  Pldap_matchingruleuse = ^Tldap_matchingruleuse;
  Tldap_matchingruleuse = record
      mru_oid : Pchar;
      mru_names : ^Pchar;
      mru_desc : Pchar;
      mru_obsolete : longint;
      mru_applies_oids : ^Pchar;
      mru_extensions : ^PLDAPSchemaExtensionItem;
    end;
  TLDAPMatchingRuleUse = Tldap_matchingruleuse;
  PLDAPMatchingRuleUse = ^TLDAPMatchingRuleUse;
{ REQUIRED  }
{ OPTIONAL  }
{ OPTIONAL  }
{ 0=no, 1=yes  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }
{ 0=no, 1=yes  }
{ 0=no, 1=yes  }
{ 0=no, 1=yes  }
{ 0=userApplications, 1=directoryOperation,
				   2=distributedOperation, 3=dSAOperation  }
{ OPTIONAL  }

  Pldap_attributetype = ^Tldap_attributetype;
  Tldap_attributetype = record
      at_oid : Pchar;
      at_names : ^Pchar;
      at_desc : Pchar;
      at_obsolete : longint;
      at_sup_oid : Pchar;
      at_equality_oid : Pchar;
      at_ordering_oid : Pchar;
      at_substr_oid : Pchar;
      at_syntax_oid : Pchar;
      at_syntax_len : longint;
      at_single_value : longint;
      at_collective : longint;
      at_no_user_mod : longint;
      at_usage : longint;
      at_extensions : ^PLDAPSchemaExtensionItem;
    end;
  TLDAPAttributeType = Tldap_attributetype;
  PLDAPAttributeType = ^TLDAPAttributeType;
{ REQUIRED  }
{ OPTIONAL  }
{ OPTIONAL  }
{ 0=no, 1=yes  }
{ OPTIONAL  }
{ 0=ABSTRACT, 1=STRUCTURAL, 2=AUXILIARY  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }

  Pldap_objectclass = ^Tldap_objectclass;
  Tldap_objectclass = record
      oc_oid : Pchar;
      oc_names : ^Pchar;
      oc_desc : Pchar;
      oc_obsolete : longint;
      oc_sup_oids : ^Pchar;
      oc_kind : longint;
      oc_at_oids_must : ^Pchar;
      oc_at_oids_may : ^Pchar;
      oc_extensions : ^PLDAPSchemaExtensionItem;
    end;
  TLDAPObjectClass = Tldap_objectclass;
  PLDAPObjectClass = ^TLDAPObjectClass;
{ REQUIRED  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }
{ 0=no, 1=yes  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }
{ OPTIONAL  }

  Pldap_contentrule = ^Tldap_contentrule;
  Tldap_contentrule = record
      cr_oid : Pchar;
      cr_names : ^Pchar;
      cr_desc : Pchar;
      cr_sup_oids : ^Pchar;
      cr_obsolete : longint;
      cr_oc_oids_aux : ^Pchar;
      cr_at_oids_must : ^Pchar;
      cr_at_oids_may : ^Pchar;
      cr_at_oids_not : ^Pchar;
      cr_extensions : ^PLDAPSchemaExtensionItem;
    end;
  TLDAPContentRule = Tldap_contentrule;
  PLDAPContentRule = ^TLDAPContentRule;
{ REQUIRED  }
{ OPTIONAL  }
{ OPTIONAL  }
{ 0=no, 1=yes  }
{ REQUIRED  }
{ REQUIRED  }
{ OPTIONAL  }
{ OPTIONAL  }

  Pldap_nameform = ^Tldap_nameform;
  Tldap_nameform = record
      nf_oid : Pchar;
      nf_names : ^Pchar;
      nf_desc : Pchar;
      nf_obsolete : longint;
      nf_objectclass : Pchar;
      nf_at_oids_must : ^Pchar;
      nf_at_oids_may : ^Pchar;
      nf_extensions : ^PLDAPSchemaExtensionItem;
    end;
  TLDAPNameForm = Tldap_nameform;
  PLDAPNameForm = ^TLDAPNameForm;
{ REQUIRED  }
{ OPTIONAL  }
{ OPTIONAL  }
{ 0=no, 1=yes  }
{ REQUIRED  }
{ number of sr_sup_ruleids  }
{ OPTIONAL  }
{ OPTIONAL  }

  Pldap_structurerule = ^Tldap_structurerule;
  Tldap_structurerule = record
      sr_ruleid : longint;
      sr_names : ^Pchar;
      sr_desc : Pchar;
      sr_obsolete : longint;
      sr_nameform : Pchar;
      sr_nsup_ruleids : longint;
      sr_sup_ruleids : Plongint;
      sr_extensions : ^PLDAPSchemaExtensionItem;
    end;
  TLDAPStructureRule = Tldap_structurerule;
  PLDAPStructureRule = ^TLDAPStructureRule;
{
 * Misc macros
  }

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
{
 * Flags that control how liberal the parsing routines are.
  }
{ Strict parsing                }
  LDAP_SCHEMA_ALLOW_NONE = $00;  
{ Allow missing oid             }
  LDAP_SCHEMA_ALLOW_NO_OID = $01;  
{ Allow bogus extra quotes      }
  LDAP_SCHEMA_ALLOW_QUOTED = $02;  
{ Allow descr instead of OID    }
  LDAP_SCHEMA_ALLOW_DESCR = $04;  
{ Allow descr as OID prefix     }
  LDAP_SCHEMA_ALLOW_DESCR_PREFIX = $08;  
{ Allow OID macros in slapd     }
  LDAP_SCHEMA_ALLOW_OID_MACRO = $10;  
{ Allow fields in most any order  }
  LDAP_SCHEMA_ALLOW_OUT_OF_ORDER_FIELDS = $20;  
{ Be very liberal in parsing    }
  LDAP_SCHEMA_ALLOW_ALL = $3f;  
{ Don't malloc any result       }
  LDAP_SCHEMA_SKIP = $80;  

function ldap_syntax2name(syn:PLDAPSyntax):Pchar;cdecl;external libldap;
function ldap_matchingrule2name(mr:PLDAPMatchingRule):Pchar;cdecl;external libldap;
function ldap_matchingruleuse2name(mru:PLDAPMatchingRuleUse):Pchar;cdecl;external libldap;
function ldap_attributetype2name(at:PLDAPAttributeType):Pchar;cdecl;external libldap;
function ldap_objectclass2name(oc:PLDAPObjectClass):Pchar;cdecl;external libldap;
function ldap_contentrule2name(cr:PLDAPContentRule):Pchar;cdecl;external libldap;
function ldap_nameform2name(nf:PLDAPNameForm):Pchar;cdecl;external libldap;
function ldap_structurerule2name(sr:PLDAPStructureRule):Pchar;cdecl;external libldap;
procedure ldap_syntax_free(syn:PLDAPSyntax);cdecl;external libldap;
procedure ldap_matchingrule_free(mr:PLDAPMatchingRule);cdecl;external libldap;
procedure ldap_matchingruleuse_free(mr:PLDAPMatchingRuleUse);cdecl;external libldap;
procedure ldap_attributetype_free(at:PLDAPAttributeType);cdecl;external libldap;
procedure ldap_objectclass_free(oc:PLDAPObjectClass);cdecl;external libldap;
procedure ldap_contentrule_free(cr:PLDAPContentRule);cdecl;external libldap;
procedure ldap_nameform_free(nf:PLDAPNameForm);cdecl;external libldap;
procedure ldap_structurerule_free(sr:PLDAPStructureRule);cdecl;external libldap;
function ldap_str2structurerule(s:Pchar; code:Plongint; errp:PPchar; flags:dword):PLDAPStructureRule;cdecl;external libldap;
function ldap_str2nameform(s:Pchar; code:Plongint; errp:PPchar; flags:dword):PLDAPNameForm;cdecl;external libldap;
function ldap_str2contentrule(s:Pchar; code:Plongint; errp:PPchar; flags:dword):PLDAPContentRule;cdecl;external libldap;
function ldap_str2objectclass(s:Pchar; code:Plongint; errp:PPchar; flags:dword):PLDAPObjectClass;cdecl;external libldap;
function ldap_str2attributetype(s:Pchar; code:Plongint; errp:PPchar; flags:dword):PLDAPAttributeType;cdecl;external libldap;
function ldap_str2syntax(s:Pchar; code:Plongint; errp:PPchar; flags:dword):PLDAPSyntax;cdecl;external libldap;
function ldap_str2matchingrule(s:Pchar; code:Plongint; errp:PPchar; flags:dword):PLDAPMatchingRule;cdecl;external libldap;
function ldap_str2matchingruleuse(s:Pchar; code:Plongint; errp:PPchar; flags:dword):PLDAPMatchingRuleUse;cdecl;external libldap;
function ldap_structurerule2str(sr:PLDAPStructureRule):Pchar;cdecl;external libldap;
function ldap_structurerule2bv(sr:PLDAPStructureRule; bv:Pberval):Pberval;cdecl;external libldap;
function ldap_nameform2str(nf:PLDAPNameForm):Pchar;cdecl;external libldap;
function ldap_nameform2bv(nf:PLDAPNameForm; bv:Pberval):Pberval;cdecl;external libldap;
function ldap_contentrule2str(cr:PLDAPContentRule):Pchar;cdecl;external libldap;
function ldap_contentrule2bv(cr:PLDAPContentRule; bv:Pberval):Pberval;cdecl;external libldap;
function ldap_objectclass2str(oc:PLDAPObjectClass):Pchar;cdecl;external libldap;
function ldap_objectclass2bv(oc:PLDAPObjectClass; bv:Pberval):Pberval;cdecl;external libldap;
function ldap_attributetype2str(at:PLDAPAttributeType):Pchar;cdecl;external libldap;
function ldap_attributetype2bv(at:PLDAPAttributeType; bv:Pberval):Pberval;cdecl;external libldap;
function ldap_syntax2str(syn:PLDAPSyntax):Pchar;cdecl;external libldap;
function ldap_syntax2bv(syn:PLDAPSyntax; bv:Pberval):Pberval;cdecl;external libldap;
function ldap_matchingrule2str(mr:PLDAPMatchingRule):Pchar;cdecl;external libldap;
function ldap_matchingrule2bv(mr:PLDAPMatchingRule; bv:Pberval):Pberval;cdecl;external libldap;
function ldap_matchingruleuse2str(mru:PLDAPMatchingRuleUse):Pchar;cdecl;external libldap;
function ldap_matchingruleuse2bv(mru:PLDAPMatchingRuleUse; bv:Pberval):Pberval;cdecl;external libldap;
function ldap_scherr2str(code:longint):Pchar;cdecl;external libldap;
{$endif}

// === Konventiert am: 10-12-25 16:58:21 ===


implementation



end.
