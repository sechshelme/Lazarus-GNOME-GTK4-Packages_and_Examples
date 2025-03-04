unit schemasInternals;

interface

uses
  ctypes, xml2_common, xmlstring, xmlregexp, tree, Hash, dict;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlSchemaValType = ^TxmlSchemaValType;
  TxmlSchemaValType = longint;

const
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

type
  PxmlSchemaTypeType = ^TxmlSchemaTypeType;
  TxmlSchemaTypeType = longint;

const
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

type
  PxmlSchemaContentType = ^TxmlSchemaContentType;
  TxmlSchemaContentType = longint;

const
  XML_SCHEMA_CONTENT_UNKNOWN = 0;
  XML_SCHEMA_CONTENT_EMPTY = 1;
  XML_SCHEMA_CONTENT_ELEMENTS = 2;
  XML_SCHEMA_CONTENT_MIXED = 3;
  XML_SCHEMA_CONTENT_SIMPLE = 4;
  XML_SCHEMA_CONTENT_MIXED_OR_ELEMENTS = 5;
  XML_SCHEMA_CONTENT_BASIC = 6;
  XML_SCHEMA_CONTENT_ANY = 7;

const
  XML_SCHEMAS_ANYATTR_SKIP = 1;
  XML_SCHEMAS_ANYATTR_LAX = 2;
  XML_SCHEMAS_ANYATTR_STRICT = 3;
  XML_SCHEMAS_ANY_SKIP = 1;
  XML_SCHEMAS_ANY_LAX = 2;
  XML_SCHEMAS_ANY_STRICT = 3;
  XML_SCHEMAS_ATTR_USE_PROHIBITED = 0;
  XML_SCHEMAS_ATTR_USE_REQUIRED = 1;
  XML_SCHEMAS_ATTR_USE_OPTIONAL = 2;
  XML_SCHEMAS_ATTR_GLOBAL = 1 shl 0;
  XML_SCHEMAS_ATTR_NSDEFAULT = 1 shl 7;
  XML_SCHEMAS_ATTR_INTERNAL_RESOLVED = 1 shl 8;
  XML_SCHEMAS_ATTR_FIXED = 1 shl 9;

const
  XML_SCHEMAS_WILDCARD_COMPLETE = 1 shl 0;

const
  XML_SCHEMAS_ATTRGROUP_WILDCARD_BUILDED = 1 shl 0;
  XML_SCHEMAS_ATTRGROUP_GLOBAL = 1 shl 1;
  XML_SCHEMAS_ATTRGROUP_MARKED = 1 shl 2;
  XML_SCHEMAS_ATTRGROUP_REDEFINED = 1 shl 3;
  XML_SCHEMAS_ATTRGROUP_HAS_REFS = 1 shl 4;

const
  XML_SCHEMAS_TYPE_MIXED = 1 shl 0;
  XML_SCHEMAS_TYPE_DERIVATION_METHOD_EXTENSION = 1 shl 1;
  XML_SCHEMAS_TYPE_DERIVATION_METHOD_RESTRICTION = 1 shl 2;
  XML_SCHEMAS_TYPE_GLOBAL = 1 shl 3;
  XML_SCHEMAS_TYPE_OWNED_ATTR_WILDCARD = 1 shl 4;
  XML_SCHEMAS_TYPE_VARIETY_ABSENT = 1 shl 5;
  XML_SCHEMAS_TYPE_VARIETY_LIST = 1 shl 6;
  XML_SCHEMAS_TYPE_VARIETY_UNION = 1 shl 7;
  XML_SCHEMAS_TYPE_VARIETY_ATOMIC = 1 shl 8;
  XML_SCHEMAS_TYPE_FINAL_EXTENSION = 1 shl 9;
  XML_SCHEMAS_TYPE_FINAL_RESTRICTION = 1 shl 10;
  XML_SCHEMAS_TYPE_FINAL_LIST = 1 shl 11;
  XML_SCHEMAS_TYPE_FINAL_UNION = 1 shl 12;
  XML_SCHEMAS_TYPE_FINAL_DEFAULT = 1 shl 13;
  XML_SCHEMAS_TYPE_BUILTIN_PRIMITIVE = 1 shl 14;
  XML_SCHEMAS_TYPE_MARKED = 1 shl 16;
  XML_SCHEMAS_TYPE_BLOCK_DEFAULT = 1 shl 17;
  XML_SCHEMAS_TYPE_BLOCK_EXTENSION = 1 shl 18;
  XML_SCHEMAS_TYPE_BLOCK_RESTRICTION = 1 shl 19;
  XML_SCHEMAS_TYPE_ABSTRACT = 1 shl 20;
  XML_SCHEMAS_TYPE_FACETSNEEDVALUE = 1 shl 21;
  XML_SCHEMAS_TYPE_INTERNAL_RESOLVED = 1 shl 22;
  XML_SCHEMAS_TYPE_INTERNAL_INVALID = 1 shl 23;
  XML_SCHEMAS_TYPE_WHITESPACE_PRESERVE = 1 shl 24;
  XML_SCHEMAS_TYPE_WHITESPACE_REPLACE = 1 shl 25;
  XML_SCHEMAS_TYPE_WHITESPACE_COLLAPSE = 1 shl 26;
  XML_SCHEMAS_TYPE_HAS_FACETS = 1 shl 27;
  XML_SCHEMAS_TYPE_NORMVALUENEEDED = 1 shl 28;
  XML_SCHEMAS_TYPE_FIXUP_1 = 1 shl 29;
  XML_SCHEMAS_TYPE_REDEFINED = 1 shl 30;
  XML_SCHEMAS_TYPE_REDEFINING = 1 shl 31;

const
  XML_SCHEMAS_ELEM_NILLABLE = 1 shl 0;
  XML_SCHEMAS_ELEM_GLOBAL = 1 shl 1;
  XML_SCHEMAS_ELEM_DEFAULT = 1 shl 2;
  XML_SCHEMAS_ELEM_FIXED = 1 shl 3;
  XML_SCHEMAS_ELEM_ABSTRACT = 1 shl 4;
  XML_SCHEMAS_ELEM_TOPLEVEL = 1 shl 5;
  XML_SCHEMAS_ELEM_REF = 1 shl 6;
  XML_SCHEMAS_ELEM_NSDEFAULT = 1 shl 7;
  XML_SCHEMAS_ELEM_INTERNAL_RESOLVED = 1 shl 8;
  XML_SCHEMAS_ELEM_CIRCULAR = 1 shl 9;
  XML_SCHEMAS_ELEM_BLOCK_ABSENT = 1 shl 10;
  XML_SCHEMAS_ELEM_BLOCK_EXTENSION = 1 shl 11;
  XML_SCHEMAS_ELEM_BLOCK_RESTRICTION = 1 shl 12;
  XML_SCHEMAS_ELEM_BLOCK_SUBSTITUTION = 1 shl 13;
  XML_SCHEMAS_ELEM_FINAL_ABSENT = 1 shl 14;
  XML_SCHEMAS_ELEM_FINAL_EXTENSION = 1 shl 15;
  XML_SCHEMAS_ELEM_FINAL_RESTRICTION = 1 shl 16;
  XML_SCHEMAS_ELEM_SUBST_GROUP_HEAD = 1 shl 17;
  XML_SCHEMAS_ELEM_INTERNAL_CHECKED = 1 shl 18;

const
  XML_SCHEMAS_FACET_UNKNOWN = 0;
  XML_SCHEMAS_FACET_PRESERVE = 1;
  XML_SCHEMAS_FACET_REPLACE = 2;
  XML_SCHEMAS_FACET_COLLAPSE = 3;

const
  XML_SCHEMAS_QUALIF_ELEM = 1 shl 0;
  XML_SCHEMAS_QUALIF_ATTR = 1 shl 1;
  XML_SCHEMAS_FINAL_DEFAULT_EXTENSION = 1 shl 2;
  XML_SCHEMAS_FINAL_DEFAULT_RESTRICTION = 1 shl 3;
  XML_SCHEMAS_FINAL_DEFAULT_LIST = 1 shl 4;
  XML_SCHEMAS_FINAL_DEFAULT_UNION = 1 shl 5;
  XML_SCHEMAS_BLOCK_DEFAULT_EXTENSION = 1 shl 6;
  XML_SCHEMAS_BLOCK_DEFAULT_RESTRICTION = 1 shl 7;
  XML_SCHEMAS_BLOCK_DEFAULT_SUBSTITUTION = 1 shl 8;
  XML_SCHEMAS_INCLUDING_CONVERT_NS = 1 shl 9;

type
  TPxmlSchemaVal = record
  end;
  PxmlSchemaVal = ^TPxmlSchemaVal;
  PPxmlSchemaVal = ^PxmlSchemaVal;

  PxmlSchemaType = ^TxmlSchemaType;
  PxmlSchemaFacet = ^TxmlSchemaFacet;

  PxmlSchemaAnnot = ^TxmlSchemaAnnot;
  TxmlSchemaAnnot = record
    Next: PxmlSchemaAnnot;
    content: PxmlNode;
  end;

  PxmlSchemaAttribute = ^TxmlSchemaAttribute;
  TxmlSchemaAttribute = record
    _type: TxmlSchemaTypeType;
    Next: PxmlSchemaAttribute;
    Name: PxmlChar;
    id: PxmlChar;
    ref: PxmlChar;
    refNs: PxmlChar;
    typeName: PxmlChar;
    typeNs: PxmlChar;
    annot: PxmlSchemaAnnot;
    base: PxmlSchemaType;
    occurs: longint;
    defValue: PxmlChar;
    subtypes: PxmlSchemaType;
    node: PxmlNode;
    targetNamespace: PxmlChar;
    flags: longint;
    refPrefix: PxmlChar;
    defVal: PxmlSchemaVal;
    refDecl: PxmlSchemaAttribute;
  end;

  PxmlSchemaAttributeLink = ^TxmlSchemaAttributeLink;
  TxmlSchemaAttributeLink = record
    Next: PxmlSchemaAttributeLink;
    attr: PxmlSchemaAttribute;
  end;

  PxmlSchemaWildcardNs = ^TxmlSchemaWildcardNs;
  TxmlSchemaWildcardNs = record
    Next: PxmlSchemaWildcardNs;
    Value: PxmlChar;
  end;

  TxmlSchemaWildcard = record
    _type: TxmlSchemaTypeType;
    id: PxmlChar;
    annot: PxmlSchemaAnnot;
    node: PxmlNode;
    minOccurs: longint;
    maxOccurs: longint;
    processContents: longint;
    any: longint;
    nsSet: PxmlSchemaWildcardNs;
    negNsSet: PxmlSchemaWildcardNs;
    flags: longint;
  end;
  PxmlSchemaWildcard = ^TxmlSchemaWildcard;

  PxmlSchemaAttributeGroup = ^TxmlSchemaAttributeGroup;
  TxmlSchemaAttributeGroup = record
    _type: TxmlSchemaTypeType;
    Next: PxmlSchemaAttribute;
    Name: PxmlChar;
    id: PxmlChar;
    ref: PxmlChar;
    refNs: PxmlChar;
    annot: PxmlSchemaAnnot;
    attributes: PxmlSchemaAttribute;
    node: PxmlNode;
    flags: longint;
    attributeWildcard: PxmlSchemaWildcard;
    refPrefix: PxmlChar;
    refItem: PxmlSchemaAttributeGroup;
    targetNamespace: PxmlChar;
    attrUses: pointer;
  end;

  PxmlSchemaTypeLink = ^TxmlSchemaTypeLink;
  TxmlSchemaTypeLink = record
    Next: PxmlSchemaTypeLink;
    _type: PxmlSchemaType;
  end;

  PxmlSchemaFacetLink = ^TxmlSchemaFacetLink;
  TxmlSchemaFacetLink = record
    Next: PxmlSchemaFacetLink;
    facet: PxmlSchemaFacet;
  end;

  TxmlSchemaType = record
    _type: TxmlSchemaTypeType;
    Next: PxmlSchemaType;
    Name: PxmlChar;
    id: PxmlChar;
    ref: PxmlChar;
    refNs: PxmlChar;
    annot: PxmlSchemaAnnot;
    subtypes: PxmlSchemaType;
    attributes: PxmlSchemaAttribute;
    node: PxmlNode;
    minOccurs: longint;
    maxOccurs: longint;
    flags: longint;
    contentType: TxmlSchemaContentType;
    base: PxmlChar;
    baseNs: PxmlChar;
    baseType: PxmlSchemaType;
    facets: PxmlSchemaFacet;
    redef: PxmlSchemaType;
    recurse: longint;
    attributeUses: ^PxmlSchemaAttributeLink;
    attributeWildcard: PxmlSchemaWildcard;
    builtInType: longint;
    memberTypes: PxmlSchemaTypeLink;
    facetSet: PxmlSchemaFacetLink;
    refPrefix: PxmlChar;
    contentTypeDef: PxmlSchemaType;
    contModel: PxmlRegexp;
    targetNamespace: PxmlChar;
    attrUses: pointer;
  end;

  PxmlSchemaElement = ^TxmlSchemaElement;
  TxmlSchemaElement = record
    _type: TxmlSchemaTypeType;
    Next: PxmlSchemaType;
    Name: PxmlChar;
    id: PxmlChar;
    ref: PxmlChar;
    refNs: PxmlChar;
    annot: PxmlSchemaAnnot;
    subtypes: PxmlSchemaType;
    attributes: PxmlSchemaAttribute;
    node: PxmlNode;
    minOccurs: longint;
    maxOccurs: longint;
    flags: longint;
    targetNamespace: PxmlChar;
    namedType: PxmlChar;
    namedTypeNs: PxmlChar;
    substGroup: PxmlChar;
    substGroupNs: PxmlChar;
    scope: PxmlChar;
    Value: PxmlChar;
    refDecl: PxmlSchemaElement;
    contModel: PxmlRegexp;
    contentType: TxmlSchemaContentType;
    refPrefix: PxmlChar;
    defVal: PxmlSchemaVal;
    idcs: pointer;
  end;

  TxmlSchemaFacet = record
    _type: TxmlSchemaTypeType;
    Next: PxmlSchemaFacet;
    Value: PxmlChar;
    id: PxmlChar;
    annot: PxmlSchemaAnnot;
    node: PxmlNode;
    fixed: longint;
    whitespace: longint;
    val: PxmlSchemaVal;
    regexp: PxmlRegexp;
  end;

  TxmlSchemaNotation = record
    _type: TxmlSchemaTypeType;
    Name: PxmlChar;
    annot: PxmlSchemaAnnot;
    identifier: PxmlChar;
    targetNamespace: PxmlChar;
  end;
  PxmlSchemaNotation = ^TxmlSchemaNotation;

  TxmlSchema = record
    Name: PxmlChar;
    targetNamespace: PxmlChar;
    version: PxmlChar;
    id: PxmlChar;
    doc: PxmlDoc;
    annot: PxmlSchemaAnnot;
    flags: longint;
    typeDecl: PxmlHashTable;
    attrDecl: PxmlHashTable;
    attrgrpDecl: PxmlHashTable;
    elemDecl: PxmlHashTable;
    notaDecl: PxmlHashTable;
    schemasImports: PxmlHashTable;
    _private: pointer;
    groupDecl: PxmlHashTable;
    dict: PxmlDict;
    includes: pointer;
    preserve: longint;
    counter: longint;
    idcDef: PxmlHashTable;
    volatiles: pointer;
  end;
  PxmlSchema = ^TxmlSchema;

procedure xmlSchemaFreeType(_type: PxmlSchemaType); cdecl; external libxml2;
procedure xmlSchemaFreeWildcard(wildcard: PxmlSchemaWildcard); cdecl; external libxml2;

// === Konventiert am: 2-3-25 17:17:06 ===


implementation



end.
