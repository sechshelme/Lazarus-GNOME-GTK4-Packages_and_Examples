
unit schemasInternals;
interface

{
  Automatically converted by H2Pas 1.0.0 from schemasInternals.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    schemasInternals.h
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
PxmlChar  = ^xmlChar;
PxmlSchema  = ^xmlSchema;
PxmlSchemaAnnot  = ^xmlSchemaAnnot;
PxmlSchemaAnnotPtr  = ^xmlSchemaAnnotPtr;
PxmlSchemaAttribute  = ^xmlSchemaAttribute;
PxmlSchemaAttributeGroup  = ^xmlSchemaAttributeGroup;
PxmlSchemaAttributeGroupPtr  = ^xmlSchemaAttributeGroupPtr;
PxmlSchemaAttributeLink  = ^xmlSchemaAttributeLink;
PxmlSchemaAttributeLinkPtr  = ^xmlSchemaAttributeLinkPtr;
PxmlSchemaAttributePtr  = ^xmlSchemaAttributePtr;
PxmlSchemaContentType  = ^xmlSchemaContentType;
PxmlSchemaElement  = ^xmlSchemaElement;
PxmlSchemaElementPtr  = ^xmlSchemaElementPtr;
PxmlSchemaFacet  = ^xmlSchemaFacet;
PxmlSchemaFacetLink  = ^xmlSchemaFacetLink;
PxmlSchemaFacetLinkPtr  = ^xmlSchemaFacetLinkPtr;
PxmlSchemaFacetPtr  = ^xmlSchemaFacetPtr;
PxmlSchemaNotation  = ^xmlSchemaNotation;
PxmlSchemaNotationPtr  = ^xmlSchemaNotationPtr;
PxmlSchemaType  = ^xmlSchemaType;
PxmlSchemaTypeLink  = ^xmlSchemaTypeLink;
PxmlSchemaTypeLinkPtr  = ^xmlSchemaTypeLinkPtr;
PxmlSchemaTypePtr  = ^xmlSchemaTypePtr;
PxmlSchemaTypeType  = ^xmlSchemaTypeType;
PxmlSchemaVal  = ^xmlSchemaVal;
PxmlSchemaValPtr  = ^xmlSchemaValPtr;
PxmlSchemaValType  = ^xmlSchemaValType;
PxmlSchemaWildcard  = ^xmlSchemaWildcard;
PxmlSchemaWildcardNs  = ^xmlSchemaWildcardNs;
PxmlSchemaWildcardNsPtr  = ^xmlSchemaWildcardNsPtr;
PxmlSchemaWildcardPtr  = ^xmlSchemaWildcardPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: internal interfaces for XML Schemas
 * Description: internal interfaces for the XML Schemas handling
 *              and schema validity checking
 *		The Schemas development is a Work In Progress.
 *              Some of those interfaces are not guaranteed to be API or ABI stable !
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_SCHEMA_INTERNALS_H__}
{$define __XML_SCHEMA_INTERNALS_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_SCHEMAS_ENABLED}
{$include <libxml/xmlregexp.h>}
{$include <libxml/hash.h>}
{$include <libxml/dict.h>}
{ C++ extern C conditionnal removed }
type
  PxmlSchemaValType = ^TxmlSchemaValType;
  TxmlSchemaValType =  Longint;
  Const
    XML_SCHEMAS_UNKNOWN = 0;
    XML_SCHEMAS_STRING = 1;
    XML_SCHEMAS_NORMSTRING = 2;
    XML_SCHEMAS_DECIMAL = 3;
    XML_SCHEMAS_TIME = 4;
    XML_SCHEMAS_GDAY = 5;
    XML_SCHEMAS_GMONTH = 6;
    XML_SCHEMAS_GMONTHDAY = 7;
    XML_SCHEMAS_GYEAR = 8;
    XML_SCHEMAS_GYEARMONTH = 9;
    XML_SCHEMAS_DATE = 10;
    XML_SCHEMAS_DATETIME = 11;
    XML_SCHEMAS_DURATION = 12;
    XML_SCHEMAS_FLOAT = 13;
    XML_SCHEMAS_DOUBLE = 14;
    XML_SCHEMAS_BOOLEAN = 15;
    XML_SCHEMAS_TOKEN = 16;
    XML_SCHEMAS_LANGUAGE = 17;
    XML_SCHEMAS_NMTOKEN = 18;
    XML_SCHEMAS_NMTOKENS = 19;
    XML_SCHEMAS_NAME = 20;
    XML_SCHEMAS_QNAME = 21;
    XML_SCHEMAS_NCNAME = 22;
    XML_SCHEMAS_ID = 23;
    XML_SCHEMAS_IDREF = 24;
    XML_SCHEMAS_IDREFS = 25;
    XML_SCHEMAS_ENTITY = 26;
    XML_SCHEMAS_ENTITIES = 27;
    XML_SCHEMAS_NOTATION = 28;
    XML_SCHEMAS_ANYURI = 29;
    XML_SCHEMAS_INTEGER = 30;
    XML_SCHEMAS_NPINTEGER = 31;
    XML_SCHEMAS_NINTEGER = 32;
    XML_SCHEMAS_NNINTEGER = 33;
    XML_SCHEMAS_PINTEGER = 34;
    XML_SCHEMAS_INT = 35;
    XML_SCHEMAS_UINT = 36;
    XML_SCHEMAS_LONG = 37;
    XML_SCHEMAS_ULONG = 38;
    XML_SCHEMAS_SHORT = 39;
    XML_SCHEMAS_USHORT = 40;
    XML_SCHEMAS_BYTE = 41;
    XML_SCHEMAS_UBYTE = 42;
    XML_SCHEMAS_HEXBINARY = 43;
    XML_SCHEMAS_BASE64BINARY = 44;
    XML_SCHEMAS_ANYTYPE = 45;
    XML_SCHEMAS_ANYSIMPLETYPE = 46;
;
{
 * XML Schemas defines multiple type of types.
  }
{ A built-in datatype  }
type
  PxmlSchemaTypeType = ^TxmlSchemaTypeType;
  TxmlSchemaTypeType =  Longint;
  Const
    XML_SCHEMA_TYPE_BASIC = 1;
    XML_SCHEMA_TYPE_ANY = 2;
    XML_SCHEMA_TYPE_FACET = 3;
    XML_SCHEMA_TYPE_SIMPLE = 4;
    XML_SCHEMA_TYPE_COMPLEX = 5;
    XML_SCHEMA_TYPE_SEQUENCE = 6;
    XML_SCHEMA_TYPE_CHOICE = 7;
    XML_SCHEMA_TYPE_ALL = 8;
    XML_SCHEMA_TYPE_SIMPLE_CONTENT = 9;
    XML_SCHEMA_TYPE_COMPLEX_CONTENT = 10;
    XML_SCHEMA_TYPE_UR = 11;
    XML_SCHEMA_TYPE_RESTRICTION = 12;
    XML_SCHEMA_TYPE_EXTENSION = 13;
    XML_SCHEMA_TYPE_ELEMENT = 14;
    XML_SCHEMA_TYPE_ATTRIBUTE = 15;
    XML_SCHEMA_TYPE_ATTRIBUTEGROUP = 16;
    XML_SCHEMA_TYPE_GROUP = 17;
    XML_SCHEMA_TYPE_NOTATION = 18;
    XML_SCHEMA_TYPE_LIST = 19;
    XML_SCHEMA_TYPE_UNION = 20;
    XML_SCHEMA_TYPE_ANY_ATTRIBUTE = 21;
    XML_SCHEMA_TYPE_IDC_UNIQUE = 22;
    XML_SCHEMA_TYPE_IDC_KEY = 23;
    XML_SCHEMA_TYPE_IDC_KEYREF = 24;
    XML_SCHEMA_TYPE_PARTICLE = 25;
    XML_SCHEMA_TYPE_ATTRIBUTE_USE = 26;
    XML_SCHEMA_FACET_MININCLUSIVE = 1000;
    XML_SCHEMA_FACET_MINEXCLUSIVE = 1001;
    XML_SCHEMA_FACET_MAXINCLUSIVE = 1002;
    XML_SCHEMA_FACET_MAXEXCLUSIVE = 1003;
    XML_SCHEMA_FACET_TOTALDIGITS = 1004;
    XML_SCHEMA_FACET_FRACTIONDIGITS = 1005;
    XML_SCHEMA_FACET_PATTERN = 1006;
    XML_SCHEMA_FACET_ENUMERATION = 1007;
    XML_SCHEMA_FACET_WHITESPACE = 1008;
    XML_SCHEMA_FACET_LENGTH = 1009;
    XML_SCHEMA_FACET_MAXLENGTH = 1010;
    XML_SCHEMA_FACET_MINLENGTH = 1011;
    XML_SCHEMA_EXTRA_QNAMEREF = 2000;
    XML_SCHEMA_EXTRA_ATTR_USE_PROHIB = 2001;
;
{ Obsolete  }
type
  PxmlSchemaContentType = ^TxmlSchemaContentType;
  TxmlSchemaContentType =  Longint;
  Const
    XML_SCHEMA_CONTENT_UNKNOWN = 0;
    XML_SCHEMA_CONTENT_EMPTY = 1;
    XML_SCHEMA_CONTENT_ELEMENTS = 2;
    XML_SCHEMA_CONTENT_MIXED = 3;
    XML_SCHEMA_CONTENT_SIMPLE = 4;
    XML_SCHEMA_CONTENT_MIXED_OR_ELEMENTS = 5;
    XML_SCHEMA_CONTENT_BASIC = 6;
    XML_SCHEMA_CONTENT_ANY = 7;
;
type

  PxmlSchemaValPtr = ^TxmlSchemaValPtr;
  TxmlSchemaValPtr = PxmlSchemaVal;

  PxmlSchemaTypePtr = ^TxmlSchemaTypePtr;
  TxmlSchemaTypePtr = PxmlSchemaType;

  PxmlSchemaFacetPtr = ^TxmlSchemaFacetPtr;
  TxmlSchemaFacetPtr = PxmlSchemaFacet;
{*
 * Annotation
  }

  PxmlSchemaAnnotPtr = ^TxmlSchemaAnnotPtr;
  TxmlSchemaAnnotPtr = PxmlSchemaAnnot;
{ the annotation  }
  PxmlSchemaAnnot = ^TxmlSchemaAnnot;
  TxmlSchemaAnnot = record
      next : PxmlSchemaAnnot;
      content : TxmlNodePtr;
    end;

{*
 * XML_SCHEMAS_ANYATTR_SKIP:
 *
 * Skip unknown attribute from validation
 * Obsolete, not used anymore.
  }

const
  XML_SCHEMAS_ANYATTR_SKIP = 1;  
{*
 * XML_SCHEMAS_ANYATTR_LAX:
 *
 * Ignore validation non definition on attributes
 * Obsolete, not used anymore.
  }
  XML_SCHEMAS_ANYATTR_LAX = 2;  
{*
 * XML_SCHEMAS_ANYATTR_STRICT:
 *
 * Apply strict validation rules on attributes
 * Obsolete, not used anymore.
  }
  XML_SCHEMAS_ANYATTR_STRICT = 3;  
{*
 * XML_SCHEMAS_ANY_SKIP:
 *
 * Skip unknown attribute from validation
  }
  XML_SCHEMAS_ANY_SKIP = 1;  
{*
 * XML_SCHEMAS_ANY_LAX:
 *
 * Used by wildcards.
 * Validate if type found, don't worry if not found
  }
  XML_SCHEMAS_ANY_LAX = 2;  
{*
 * XML_SCHEMAS_ANY_STRICT:
 *
 * Used by wildcards.
 * Apply strict validation rules
  }
  XML_SCHEMAS_ANY_STRICT = 3;  
{*
 * XML_SCHEMAS_ATTR_USE_PROHIBITED:
 *
 * Used by wildcards.
 * The attribute is prohibited.
  }
  XML_SCHEMAS_ATTR_USE_PROHIBITED = 0;  
{*
 * XML_SCHEMAS_ATTR_USE_REQUIRED:
 *
 * The attribute is required.
  }
  XML_SCHEMAS_ATTR_USE_REQUIRED = 1;  
{*
 * XML_SCHEMAS_ATTR_USE_OPTIONAL:
 *
 * The attribute is optional.
  }
  XML_SCHEMAS_ATTR_USE_OPTIONAL = 2;  
{*
 * XML_SCHEMAS_ATTR_GLOBAL:
 *
 * allow elements in no namespace
  }
  XML_SCHEMAS_ATTR_GLOBAL = 1 shl 0;  
{*
 * XML_SCHEMAS_ATTR_NSDEFAULT:
 *
 * allow elements in no namespace
  }
  XML_SCHEMAS_ATTR_NSDEFAULT = 1 shl 7;  
{*
 * XML_SCHEMAS_ATTR_INTERNAL_RESOLVED:
 *
 * this is set when the "type" and "ref" references
 * have been resolved.
  }
  XML_SCHEMAS_ATTR_INTERNAL_RESOLVED = 1 shl 8;  
{*
 * XML_SCHEMAS_ATTR_FIXED:
 *
 * the attribute has a fixed value
  }
  XML_SCHEMAS_ATTR_FIXED = 1 shl 9;  
{*
 * xmlSchemaAttribute:
 * An attribute definition.
  }
type

  PxmlSchemaAttributePtr = ^TxmlSchemaAttributePtr;
  TxmlSchemaAttributePtr = PxmlSchemaAttribute;
{ the next attribute (not used?)  }
(* Const before type ignored *)
{ the name of the declaration  }
(* Const before type ignored *)
{ Deprecated; not used  }
(* Const before type ignored *)
{ Deprecated; not used  }
(* Const before type ignored *)
{ Deprecated; not used  }
(* Const before type ignored *)
{ the local name of the type definition  }
(* Const before type ignored *)
{ the ns URI of the type definition  }
{ Deprecated; not used  }
{ Deprecated; not used  }
(* Const before type ignored *)
{ The initial value of the value constraint  }
{ the type definition  }
(* Const before type ignored *)
(* Const before type ignored *)
{ Deprecated; not used  }
{ The compiled value constraint  }
{ Deprecated; not used  }
  PxmlSchemaAttribute = ^TxmlSchemaAttribute;
  TxmlSchemaAttribute = record
      _type : TxmlSchemaTypeType;
      next : PxmlSchemaAttribute;
      name : PxmlChar;
      id : PxmlChar;
      ref : PxmlChar;
      refNs : PxmlChar;
      typeName : PxmlChar;
      typeNs : PxmlChar;
      annot : TxmlSchemaAnnotPtr;
      base : TxmlSchemaTypePtr;
      occurs : longint;
      defValue : PxmlChar;
      subtypes : TxmlSchemaTypePtr;
      node : TxmlNodePtr;
      targetNamespace : PxmlChar;
      flags : longint;
      refPrefix : PxmlChar;
      defVal : TxmlSchemaValPtr;
      refDecl : TxmlSchemaAttributePtr;
    end;

{*
 * xmlSchemaAttributeLink:
 * Used to build a list of attribute uses on complexType definitions.
 * WARNING: Deprecated; not used.
  }

  PxmlSchemaAttributeLinkPtr = ^TxmlSchemaAttributeLinkPtr;
  TxmlSchemaAttributeLinkPtr = PxmlSchemaAttributeLink;
{ the next attribute link ...  }
{ the linked attribute  }
  PxmlSchemaAttributeLink = ^TxmlSchemaAttributeLink;
  TxmlSchemaAttributeLink = record
      next : PxmlSchemaAttributeLink;
      attr : PxmlSchemaAttribute;
    end;

{*
 * XML_SCHEMAS_WILDCARD_COMPLETE:
 *
 * If the wildcard is complete.
  }

const
  XML_SCHEMAS_WILDCARD_COMPLETE = 1 shl 0;  
{*
 * xmlSchemaCharValueLink:
 * Used to build a list of namespaces on wildcards.
  }
type

  PxmlSchemaWildcardNsPtr = ^TxmlSchemaWildcardNsPtr;
  TxmlSchemaWildcardNsPtr = PxmlSchemaWildcardNs;
{ the next constraint link ...  }
(* Const before type ignored *)
{ the value  }
  PxmlSchemaWildcardNs = ^TxmlSchemaWildcardNs;
  TxmlSchemaWildcardNs = record
      next : PxmlSchemaWildcardNs;
      value : PxmlChar;
    end;

{*
 * xmlSchemaWildcard.
 * A wildcard.
  }

  PxmlSchemaWildcardPtr = ^TxmlSchemaWildcardPtr;
  TxmlSchemaWildcardPtr = PxmlSchemaWildcard;
{ The kind of type  }
(* Const before type ignored *)
{ Deprecated; not used  }
{ Deprecated; not used  }
{ Deprecated; not used  }
{ Indicates if the ns constraint is of ##any  }
{ The list of allowed namespaces  }
{ The negated namespace  }
  PxmlSchemaWildcard = ^TxmlSchemaWildcard;
  TxmlSchemaWildcard = record
      _type : TxmlSchemaTypeType;
      id : PxmlChar;
      annot : TxmlSchemaAnnotPtr;
      node : TxmlNodePtr;
      minOccurs : longint;
      maxOccurs : longint;
      processContents : longint;
      any : longint;
      nsSet : TxmlSchemaWildcardNsPtr;
      negNsSet : TxmlSchemaWildcardNsPtr;
      flags : longint;
    end;

{*
 * XML_SCHEMAS_ATTRGROUP_WILDCARD_BUILDED:
 *
 * The attribute wildcard has been built.
  }

const
  XML_SCHEMAS_ATTRGROUP_WILDCARD_BUILDED = 1 shl 0;  
{*
 * XML_SCHEMAS_ATTRGROUP_GLOBAL:
 *
 * The attribute group has been defined.
  }
  XML_SCHEMAS_ATTRGROUP_GLOBAL = 1 shl 1;  
{*
 * XML_SCHEMAS_ATTRGROUP_MARKED:
 *
 * Marks the attr group as marked; used for circular checks.
  }
  XML_SCHEMAS_ATTRGROUP_MARKED = 1 shl 2;  
{*
 * XML_SCHEMAS_ATTRGROUP_REDEFINED:
 *
 * The attr group was redefined.
  }
  XML_SCHEMAS_ATTRGROUP_REDEFINED = 1 shl 3;  
{*
 * XML_SCHEMAS_ATTRGROUP_HAS_REFS:
 *
 * Whether this attr. group contains attr. group references.
  }
  XML_SCHEMAS_ATTRGROUP_HAS_REFS = 1 shl 4;  
{*
 * An attribute group definition.
 *
 * xmlSchemaAttribute and xmlSchemaAttributeGroup start of structures
 * must be kept similar
  }
type

  PxmlSchemaAttributeGroupPtr = ^TxmlSchemaAttributeGroupPtr;
  TxmlSchemaAttributeGroupPtr = PxmlSchemaAttributeGroup;
{ The kind of type  }
{ the next attribute if in a group ...  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ Deprecated; not used  }
(* Const before type ignored *)
{ Deprecated; not used  }
{ Deprecated; not used  }
(* Const before type ignored *)
{ Deprecated; not used  }
{ Deprecated; not used  }
(* Const before type ignored *)
  PxmlSchemaAttributeGroup = ^TxmlSchemaAttributeGroup;
  TxmlSchemaAttributeGroup = record
      _type : TxmlSchemaTypeType;
      next : PxmlSchemaAttribute;
      name : PxmlChar;
      id : PxmlChar;
      ref : PxmlChar;
      refNs : PxmlChar;
      annot : TxmlSchemaAnnotPtr;
      attributes : TxmlSchemaAttributePtr;
      node : TxmlNodePtr;
      flags : longint;
      attributeWildcard : TxmlSchemaWildcardPtr;
      refPrefix : PxmlChar;
      refItem : TxmlSchemaAttributeGroupPtr;
      targetNamespace : PxmlChar;
      attrUses : pointer;
    end;

{*
 * xmlSchemaTypeLink:
 * Used to build a list of types (e.g. member types of
 * simpleType with variety "union").
  }

  PxmlSchemaTypeLinkPtr = ^TxmlSchemaTypeLinkPtr;
  TxmlSchemaTypeLinkPtr = PxmlSchemaTypeLink;
{ the next type link ...  }
{ the linked type  }
  PxmlSchemaTypeLink = ^TxmlSchemaTypeLink;
  TxmlSchemaTypeLink = record
      next : PxmlSchemaTypeLink;
      _type : TxmlSchemaTypePtr;
    end;

{*
 * xmlSchemaFacetLink:
 * Used to build a list of facets.
  }

  PxmlSchemaFacetLinkPtr = ^TxmlSchemaFacetLinkPtr;
  TxmlSchemaFacetLinkPtr = PxmlSchemaFacetLink;
{ the next facet link ...  }
{ the linked facet  }
  PxmlSchemaFacetLink = ^TxmlSchemaFacetLink;
  TxmlSchemaFacetLink = record
      next : PxmlSchemaFacetLink;
      facet : TxmlSchemaFacetPtr;
    end;

{*
 * XML_SCHEMAS_TYPE_MIXED:
 *
 * the element content type is mixed
  }

const
  XML_SCHEMAS_TYPE_MIXED = 1 shl 0;  
{*
 * XML_SCHEMAS_TYPE_DERIVATION_METHOD_EXTENSION:
 *
 * the simple or complex type has a derivation method of "extension".
  }
  XML_SCHEMAS_TYPE_DERIVATION_METHOD_EXTENSION = 1 shl 1;  
{*
 * XML_SCHEMAS_TYPE_DERIVATION_METHOD_RESTRICTION:
 *
 * the simple or complex type has a derivation method of "restriction".
  }
  XML_SCHEMAS_TYPE_DERIVATION_METHOD_RESTRICTION = 1 shl 2;  
{*
 * XML_SCHEMAS_TYPE_GLOBAL:
 *
 * the type is global
  }
  XML_SCHEMAS_TYPE_GLOBAL = 1 shl 3;  
{*
 * XML_SCHEMAS_TYPE_OWNED_ATTR_WILDCARD:
 *
 * the complexType owns an attribute wildcard, i.e.
 * it can be freed by the complexType
  }
{ Obsolete.  }
  XML_SCHEMAS_TYPE_OWNED_ATTR_WILDCARD = 1 shl 4;  
{*
 * XML_SCHEMAS_TYPE_VARIETY_ABSENT:
 *
 * the simpleType has a variety of "absent".
 * TODO: Actually not necessary :-/, since if
 * none of the variety flags occur then it's
 * automatically absent.
  }
  XML_SCHEMAS_TYPE_VARIETY_ABSENT = 1 shl 5;  
{*
 * XML_SCHEMAS_TYPE_VARIETY_LIST:
 *
 * the simpleType has a variety of "list".
  }
  XML_SCHEMAS_TYPE_VARIETY_LIST = 1 shl 6;  
{*
 * XML_SCHEMAS_TYPE_VARIETY_UNION:
 *
 * the simpleType has a variety of "union".
  }
  XML_SCHEMAS_TYPE_VARIETY_UNION = 1 shl 7;  
{*
 * XML_SCHEMAS_TYPE_VARIETY_ATOMIC:
 *
 * the simpleType has a variety of "union".
  }
  XML_SCHEMAS_TYPE_VARIETY_ATOMIC = 1 shl 8;  
{*
 * XML_SCHEMAS_TYPE_FINAL_EXTENSION:
 *
 * the complexType has a final of "extension".
  }
  XML_SCHEMAS_TYPE_FINAL_EXTENSION = 1 shl 9;  
{*
 * XML_SCHEMAS_TYPE_FINAL_RESTRICTION:
 *
 * the simpleType/complexType has a final of "restriction".
  }
  XML_SCHEMAS_TYPE_FINAL_RESTRICTION = 1 shl 10;  
{*
 * XML_SCHEMAS_TYPE_FINAL_LIST:
 *
 * the simpleType has a final of "list".
  }
  XML_SCHEMAS_TYPE_FINAL_LIST = 1 shl 11;  
{*
 * XML_SCHEMAS_TYPE_FINAL_UNION:
 *
 * the simpleType has a final of "union".
  }
  XML_SCHEMAS_TYPE_FINAL_UNION = 1 shl 12;  
{*
 * XML_SCHEMAS_TYPE_FINAL_DEFAULT:
 *
 * the simpleType has a final of "default".
  }
  XML_SCHEMAS_TYPE_FINAL_DEFAULT = 1 shl 13;  
{*
 * XML_SCHEMAS_TYPE_BUILTIN_PRIMITIVE:
 *
 * Marks the item as a builtin primitive.
  }
  XML_SCHEMAS_TYPE_BUILTIN_PRIMITIVE = 1 shl 14;  
{*
 * XML_SCHEMAS_TYPE_MARKED:
 *
 * Marks the item as marked; used for circular checks.
  }
  XML_SCHEMAS_TYPE_MARKED = 1 shl 16;  
{*
 * XML_SCHEMAS_TYPE_BLOCK_DEFAULT:
 *
 * the complexType did not specify 'block' so use the default of the
 * <schema> item.
  }
  XML_SCHEMAS_TYPE_BLOCK_DEFAULT = 1 shl 17;  
{*
 * XML_SCHEMAS_TYPE_BLOCK_EXTENSION:
 *
 * the complexType has a 'block' of "extension".
  }
  XML_SCHEMAS_TYPE_BLOCK_EXTENSION = 1 shl 18;  
{*
 * XML_SCHEMAS_TYPE_BLOCK_RESTRICTION:
 *
 * the complexType has a 'block' of "restriction".
  }
  XML_SCHEMAS_TYPE_BLOCK_RESTRICTION = 1 shl 19;  
{*
 * XML_SCHEMAS_TYPE_ABSTRACT:
 *
 * the simple/complexType is abstract.
  }
  XML_SCHEMAS_TYPE_ABSTRACT = 1 shl 20;  
{*
 * XML_SCHEMAS_TYPE_FACETSNEEDVALUE:
 *
 * indicates if the facets need a computed value
  }
  XML_SCHEMAS_TYPE_FACETSNEEDVALUE = 1 shl 21;  
{*
 * XML_SCHEMAS_TYPE_INTERNAL_RESOLVED:
 *
 * indicates that the type was typefixed
  }
  XML_SCHEMAS_TYPE_INTERNAL_RESOLVED = 1 shl 22;  
{*
 * XML_SCHEMAS_TYPE_INTERNAL_INVALID:
 *
 * indicates that the type is invalid
  }
  XML_SCHEMAS_TYPE_INTERNAL_INVALID = 1 shl 23;  
{*
 * XML_SCHEMAS_TYPE_WHITESPACE_PRESERVE:
 *
 * a whitespace-facet value of "preserve"
  }
  XML_SCHEMAS_TYPE_WHITESPACE_PRESERVE = 1 shl 24;  
{*
 * XML_SCHEMAS_TYPE_WHITESPACE_REPLACE:
 *
 * a whitespace-facet value of "replace"
  }
  XML_SCHEMAS_TYPE_WHITESPACE_REPLACE = 1 shl 25;  
{*
 * XML_SCHEMAS_TYPE_WHITESPACE_COLLAPSE:
 *
 * a whitespace-facet value of "collapse"
  }
  XML_SCHEMAS_TYPE_WHITESPACE_COLLAPSE = 1 shl 26;  
{*
 * XML_SCHEMAS_TYPE_HAS_FACETS:
 *
 * has facets
  }
  XML_SCHEMAS_TYPE_HAS_FACETS = 1 shl 27;  
{*
 * XML_SCHEMAS_TYPE_NORMVALUENEEDED:
 *
 * indicates if the facets (pattern) need a normalized value
  }
  XML_SCHEMAS_TYPE_NORMVALUENEEDED = 1 shl 28;  
{*
 * XML_SCHEMAS_TYPE_FIXUP_1:
 *
 * First stage of fixup was done.
  }
  XML_SCHEMAS_TYPE_FIXUP_1 = 1 shl 29;  
{*
 * XML_SCHEMAS_TYPE_REDEFINED:
 *
 * The type was redefined.
  }
  XML_SCHEMAS_TYPE_REDEFINED = 1 shl 30;  
{*
 * XML_SCHEMAS_TYPE_REDEFINING:
 *
 * The type redefines an other type.
  }
  XML_SCHEMAS_TYPE_REDEFINING = 1 shl 31;  
{*
 * _xmlSchemaType:
 *
 * Schemas type definition.
  }
{ The kind of type  }
{ the next type if in a sequence ...  }
(* Const before type ignored *)
(* Const before type ignored *)
{ Deprecated; not used  }
(* Const before type ignored *)
{ Deprecated; not used  }
(* Const before type ignored *)
{ Deprecated; not used  }
{ Deprecated; not used  }
{ Deprecated; not used  }
{ Deprecated; not used  }
(* Const before type ignored *)
{ Base type's local name  }
(* Const before type ignored *)
{ Base type's target namespace  }
{ The base type component  }
{ Local facets  }
{ Deprecated; not used  }
{ Obsolete  }
{ Deprecated; not used  }
{ Type of built-in types.  }
{ member-types if a union type.  }
{ All facets (incl. inherited)  }
(* Const before type ignored *)
{ Deprecated; not used  }
{ Used for the simple content of complex types.
                                        Could we use @subtypes for this?  }
{ Holds the automaton of the content model  }
(* Const before type ignored *)
type
  PxmlSchemaType = ^TxmlSchemaType;
  TxmlSchemaType = record
      _type : TxmlSchemaTypeType;
      next : PxmlSchemaType;
      name : PxmlChar;
      id : PxmlChar;
      ref : PxmlChar;
      refNs : PxmlChar;
      annot : TxmlSchemaAnnotPtr;
      subtypes : TxmlSchemaTypePtr;
      attributes : TxmlSchemaAttributePtr;
      node : TxmlNodePtr;
      minOccurs : longint;
      maxOccurs : longint;
      flags : longint;
      contentType : TxmlSchemaContentType;
      base : PxmlChar;
      baseNs : PxmlChar;
      baseType : TxmlSchemaTypePtr;
      facets : TxmlSchemaFacetPtr;
      redef : PxmlSchemaType;
      recurse : longint;
      attributeUses : PxmlSchemaAttributeLinkPtr;
      attributeWildcard : TxmlSchemaWildcardPtr;
      builtInType : longint;
      memberTypes : TxmlSchemaTypeLinkPtr;
      facetSet : TxmlSchemaFacetLinkPtr;
      refPrefix : PxmlChar;
      contentTypeDef : TxmlSchemaTypePtr;
      contModel : TxmlRegexpPtr;
      targetNamespace : PxmlChar;
      attrUses : pointer;
    end;

{
 * xmlSchemaElement:
 * An element definition.
 *
 * xmlSchemaType, xmlSchemaFacet and xmlSchemaElement start of
 * structures must be kept similar
  }
{*
 * XML_SCHEMAS_ELEM_NILLABLE:
 *
 * the element is nillable
  }

const
  XML_SCHEMAS_ELEM_NILLABLE = 1 shl 0;  
{*
 * XML_SCHEMAS_ELEM_GLOBAL:
 *
 * the element is global
  }
  XML_SCHEMAS_ELEM_GLOBAL = 1 shl 1;  
{*
 * XML_SCHEMAS_ELEM_DEFAULT:
 *
 * the element has a default value
  }
  XML_SCHEMAS_ELEM_DEFAULT = 1 shl 2;  
{*
 * XML_SCHEMAS_ELEM_FIXED:
 *
 * the element has a fixed value
  }
  XML_SCHEMAS_ELEM_FIXED = 1 shl 3;  
{*
 * XML_SCHEMAS_ELEM_ABSTRACT:
 *
 * the element is abstract
  }
  XML_SCHEMAS_ELEM_ABSTRACT = 1 shl 4;  
{*
 * XML_SCHEMAS_ELEM_TOPLEVEL:
 *
 * the element is top level
 * obsolete: use XML_SCHEMAS_ELEM_GLOBAL instead
  }
  XML_SCHEMAS_ELEM_TOPLEVEL = 1 shl 5;  
{*
 * XML_SCHEMAS_ELEM_REF:
 *
 * the element is a reference to a type
  }
  XML_SCHEMAS_ELEM_REF = 1 shl 6;  
{*
 * XML_SCHEMAS_ELEM_NSDEFAULT:
 *
 * allow elements in no namespace
 * Obsolete, not used anymore.
  }
  XML_SCHEMAS_ELEM_NSDEFAULT = 1 shl 7;  
{*
 * XML_SCHEMAS_ELEM_INTERNAL_RESOLVED:
 *
 * this is set when "type", "ref", "substitutionGroup"
 * references have been resolved.
  }
  XML_SCHEMAS_ELEM_INTERNAL_RESOLVED = 1 shl 8;  
{*
 * XML_SCHEMAS_ELEM_CIRCULAR:
 *
 * a helper flag for the search of circular references.
  }
  XML_SCHEMAS_ELEM_CIRCULAR = 1 shl 9;  
{*
 * XML_SCHEMAS_ELEM_BLOCK_ABSENT:
 *
 * the "block" attribute is absent
  }
  XML_SCHEMAS_ELEM_BLOCK_ABSENT = 1 shl 10;  
{*
 * XML_SCHEMAS_ELEM_BLOCK_EXTENSION:
 *
 * disallowed substitutions are absent
  }
  XML_SCHEMAS_ELEM_BLOCK_EXTENSION = 1 shl 11;  
{*
 * XML_SCHEMAS_ELEM_BLOCK_RESTRICTION:
 *
 * disallowed substitutions: "restriction"
  }
  XML_SCHEMAS_ELEM_BLOCK_RESTRICTION = 1 shl 12;  
{*
 * XML_SCHEMAS_ELEM_BLOCK_SUBSTITUTION:
 *
 * disallowed substitutions: "substitution"
  }
  XML_SCHEMAS_ELEM_BLOCK_SUBSTITUTION = 1 shl 13;  
{*
 * XML_SCHEMAS_ELEM_FINAL_ABSENT:
 *
 * substitution group exclusions are absent
  }
  XML_SCHEMAS_ELEM_FINAL_ABSENT = 1 shl 14;  
{*
 * XML_SCHEMAS_ELEM_FINAL_EXTENSION:
 *
 * substitution group exclusions: "extension"
  }
  XML_SCHEMAS_ELEM_FINAL_EXTENSION = 1 shl 15;  
{*
 * XML_SCHEMAS_ELEM_FINAL_RESTRICTION:
 *
 * substitution group exclusions: "restriction"
  }
  XML_SCHEMAS_ELEM_FINAL_RESTRICTION = 1 shl 16;  
{*
 * XML_SCHEMAS_ELEM_SUBST_GROUP_HEAD:
 *
 * the declaration is a substitution group head
  }
  XML_SCHEMAS_ELEM_SUBST_GROUP_HEAD = 1 shl 17;  
{*
 * XML_SCHEMAS_ELEM_INTERNAL_CHECKED:
 *
 * this is set when the elem decl has been checked against
 * all constraints
  }
  XML_SCHEMAS_ELEM_INTERNAL_CHECKED = 1 shl 18;  
type

  PxmlSchemaElementPtr = ^TxmlSchemaElementPtr;
  TxmlSchemaElementPtr = PxmlSchemaElement;
{ The kind of type  }
{ Not used?  }
(* Const before type ignored *)
(* Const before type ignored *)
{ Deprecated; not used  }
(* Const before type ignored *)
{ Deprecated; not used  }
(* Const before type ignored *)
{ Deprecated; not used  }
{ the type definition  }
{ Deprecated; not used  }
{ Deprecated; not used  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ The original value of the value constraint.  }
{ This will now be used for the
                                          substitution group affiliation  }
{ Obsolete for WXS, maybe used for RelaxNG  }
(* Const before type ignored *)
{ Deprecated; not used  }
{ The compiled value constraint.  }
{ The identity-constraint defs  }
  PxmlSchemaElement = ^TxmlSchemaElement;
  TxmlSchemaElement = record
      _type : TxmlSchemaTypeType;
      next : PxmlSchemaType;
      name : PxmlChar;
      id : PxmlChar;
      ref : PxmlChar;
      refNs : PxmlChar;
      annot : TxmlSchemaAnnotPtr;
      subtypes : TxmlSchemaTypePtr;
      attributes : TxmlSchemaAttributePtr;
      node : TxmlNodePtr;
      minOccurs : longint;
      maxOccurs : longint;
      flags : longint;
      targetNamespace : PxmlChar;
      namedType : PxmlChar;
      namedTypeNs : PxmlChar;
      substGroup : PxmlChar;
      substGroupNs : PxmlChar;
      scope : PxmlChar;
      value : PxmlChar;
      refDecl : PxmlSchemaElement;
      contModel : TxmlRegexpPtr;
      contentType : TxmlSchemaContentType;
      refPrefix : PxmlChar;
      defVal : TxmlSchemaValPtr;
      idcs : pointer;
    end;

{
 * XML_SCHEMAS_FACET_UNKNOWN:
 *
 * unknown facet handling
  }

const
  XML_SCHEMAS_FACET_UNKNOWN = 0;  
{
 * XML_SCHEMAS_FACET_PRESERVE:
 *
 * preserve the type of the facet
  }
  XML_SCHEMAS_FACET_PRESERVE = 1;  
{
 * XML_SCHEMAS_FACET_REPLACE:
 *
 * replace the type of the facet
  }
  XML_SCHEMAS_FACET_REPLACE = 2;  
{
 * XML_SCHEMAS_FACET_COLLAPSE:
 *
 * collapse the types of the facet
  }
  XML_SCHEMAS_FACET_COLLAPSE = 3;  
{*
 * A facet definition.
  }
{ The kind of type  }
{ the next type if in a sequence ...  }
(* Const before type ignored *)
{ The original value  }
(* Const before type ignored *)
{ Obsolete  }
{ XML_SCHEMAS_FACET_PRESERVE, etc.  }
{ The compiled value  }
{ The regex for patterns  }
type
  PxmlSchemaFacet = ^TxmlSchemaFacet;
  TxmlSchemaFacet = record
      _type : TxmlSchemaTypeType;
      next : PxmlSchemaFacet;
      value : PxmlChar;
      id : PxmlChar;
      annot : TxmlSchemaAnnotPtr;
      node : TxmlNodePtr;
      fixed : longint;
      whitespace : longint;
      val : TxmlSchemaValPtr;
      regexp : TxmlRegexpPtr;
    end;

{*
 * A notation definition.
  }

  PxmlSchemaNotationPtr = ^TxmlSchemaNotationPtr;
  TxmlSchemaNotationPtr = PxmlSchemaNotation;
{ The kind of type  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PxmlSchemaNotation = ^TxmlSchemaNotation;
  TxmlSchemaNotation = record
      _type : TxmlSchemaTypeType;
      name : PxmlChar;
      annot : TxmlSchemaAnnotPtr;
      identifier : PxmlChar;
      targetNamespace : PxmlChar;
    end;

{
* TODO: Actually all those flags used for the schema should sit
* on the schema parser context, since they are used only
* during parsing an XML schema document, and not available
* on the component level as per spec.
 }
{*
 * XML_SCHEMAS_QUALIF_ELEM:
 *
 * Reflects elementFormDefault == qualified in
 * an XML schema document.
  }

const
  XML_SCHEMAS_QUALIF_ELEM = 1 shl 0;  
{*
 * XML_SCHEMAS_QUALIF_ATTR:
 *
 * Reflects attributeFormDefault == qualified in
 * an XML schema document.
  }
  XML_SCHEMAS_QUALIF_ATTR = 1 shl 1;  
{*
 * XML_SCHEMAS_FINAL_DEFAULT_EXTENSION:
 *
 * the schema has "extension" in the set of finalDefault.
  }
  XML_SCHEMAS_FINAL_DEFAULT_EXTENSION = 1 shl 2;  
{*
 * XML_SCHEMAS_FINAL_DEFAULT_RESTRICTION:
 *
 * the schema has "restriction" in the set of finalDefault.
  }
  XML_SCHEMAS_FINAL_DEFAULT_RESTRICTION = 1 shl 3;  
{*
 * XML_SCHEMAS_FINAL_DEFAULT_LIST:
 *
 * the schema has "list" in the set of finalDefault.
  }
  XML_SCHEMAS_FINAL_DEFAULT_LIST = 1 shl 4;  
{*
 * XML_SCHEMAS_FINAL_DEFAULT_UNION:
 *
 * the schema has "union" in the set of finalDefault.
  }
  XML_SCHEMAS_FINAL_DEFAULT_UNION = 1 shl 5;  
{*
 * XML_SCHEMAS_BLOCK_DEFAULT_EXTENSION:
 *
 * the schema has "extension" in the set of blockDefault.
  }
  XML_SCHEMAS_BLOCK_DEFAULT_EXTENSION = 1 shl 6;  
{*
 * XML_SCHEMAS_BLOCK_DEFAULT_RESTRICTION:
 *
 * the schema has "restriction" in the set of blockDefault.
  }
  XML_SCHEMAS_BLOCK_DEFAULT_RESTRICTION = 1 shl 7;  
{*
 * XML_SCHEMAS_BLOCK_DEFAULT_SUBSTITUTION:
 *
 * the schema has "substitution" in the set of blockDefault.
  }
  XML_SCHEMAS_BLOCK_DEFAULT_SUBSTITUTION = 1 shl 8;  
{*
 * XML_SCHEMAS_INCLUDING_CONVERT_NS:
 *
 * the schema is currently including an other schema with
 * no target namespace.
  }
  XML_SCHEMAS_INCLUDING_CONVERT_NS = 1 shl 9;  
{*
 * _xmlSchema:
 *
 * A Schemas definition
  }
(* Const before type ignored *)
{ schema name  }
(* Const before type ignored *)
{ the target namespace  }
(* Const before type ignored *)
(* Const before type ignored *)
{ Obsolete  }
{ unused by the library for users or bindings  }
{ the includes, this is opaque for now  }
{ whether to free the document  }
{ used to give anonymous components unique names  }
{ All identity-constraint defs.  }
{ Obsolete  }
type
  PxmlSchema = ^TxmlSchema;
  TxmlSchema = record
      name : PxmlChar;
      targetNamespace : PxmlChar;
      version : PxmlChar;
      id : PxmlChar;
      doc : TxmlDocPtr;
      annot : TxmlSchemaAnnotPtr;
      flags : longint;
      typeDecl : TxmlHashTablePtr;
      attrDecl : TxmlHashTablePtr;
      attrgrpDecl : TxmlHashTablePtr;
      elemDecl : TxmlHashTablePtr;
      notaDecl : TxmlHashTablePtr;
      schemasImports : TxmlHashTablePtr;
      _private : pointer;
      groupDecl : TxmlHashTablePtr;
      dict : TxmlDictPtr;
      includes : pointer;
      preserve : longint;
      counter : longint;
      idcDef : TxmlHashTablePtr;
      volatiles : pointer;
    end;


procedure xmlSchemaFreeType(_type:TxmlSchemaTypePtr);cdecl;external;
procedure xmlSchemaFreeWildcard(wildcard:TxmlSchemaWildcardPtr);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_SCHEMAS_ENABLED  }
{$endif}
{ __XML_SCHEMA_INTERNALS_H__  }

implementation


end.
