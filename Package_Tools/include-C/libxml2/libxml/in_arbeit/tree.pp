
unit tree;
interface

{
  Automatically converted by H2Pas 1.0.0 from tree.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tree.h
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
Pchar  = ^char;
PFILE  = ^FILE;
Plongint  = ^longint;
PxmlAttr  = ^xmlAttr;
PxmlAttribute  = ^xmlAttribute;
PxmlAttributeDefault  = ^xmlAttributeDefault;
PxmlAttributePtr  = ^xmlAttributePtr;
PxmlAttributeType  = ^xmlAttributeType;
PxmlAttrPtr  = ^xmlAttrPtr;
PxmlBuf  = ^xmlBuf;
PxmlBuffer  = ^xmlBuffer;
PxmlBufferAllocationScheme  = ^xmlBufferAllocationScheme;
PxmlBufferPtr  = ^xmlBufferPtr;
PxmlBufPtr  = ^xmlBufPtr;
PxmlChar  = ^xmlChar;
PxmlDict  = ^xmlDict;
PxmlDoc  = ^xmlDoc;
PxmlDocProperties  = ^xmlDocProperties;
PxmlDocPtr  = ^xmlDocPtr;
PxmlDOMWrapCtxt  = ^xmlDOMWrapCtxt;
PxmlDOMWrapCtxtPtr  = ^xmlDOMWrapCtxtPtr;
PxmlDtd  = ^xmlDtd;
PxmlDtdPtr  = ^xmlDtdPtr;
PxmlElement  = ^xmlElement;
PxmlElementContent  = ^xmlElementContent;
PxmlElementContentOccur  = ^xmlElementContentOccur;
PxmlElementContentPtr  = ^xmlElementContentPtr;
PxmlElementContentType  = ^xmlElementContentType;
PxmlElementPtr  = ^xmlElementPtr;
PxmlElementType  = ^xmlElementType;
PxmlElementTypeVal  = ^xmlElementTypeVal;
PxmlEntity  = ^xmlEntity;
PxmlEntityPtr  = ^xmlEntityPtr;
PxmlEnumeration  = ^xmlEnumeration;
PxmlEnumerationPtr  = ^xmlEnumerationPtr;
PxmlID  = ^xmlID;
PxmlIDPtr  = ^xmlIDPtr;
PxmlNode  = ^xmlNode;
PxmlNodePtr  = ^xmlNodePtr;
PxmlNotation  = ^xmlNotation;
PxmlNotationPtr  = ^xmlNotationPtr;
PxmlNs  = ^xmlNs;
PxmlNsPtr  = ^xmlNsPtr;
PxmlNsType  = ^xmlNsType;
PxmlOutputBuffer  = ^xmlOutputBuffer;
PxmlOutputBufferPtr  = ^xmlOutputBufferPtr;
PxmlParserCtxt  = ^xmlParserCtxt;
PxmlParserCtxtPtr  = ^xmlParserCtxtPtr;
PxmlParserInput  = ^xmlParserInput;
PxmlParserInputBuffer  = ^xmlParserInputBuffer;
PxmlParserInputBufferPtr  = ^xmlParserInputBufferPtr;
PxmlParserInputPtr  = ^xmlParserInputPtr;
PxmlRef  = ^xmlRef;
PxmlRefPtr  = ^xmlRefPtr;
PxmlSAXHandler  = ^xmlSAXHandler;
PxmlSAXHandlerPtr  = ^xmlSAXHandlerPtr;
PxmlSAXLocator  = ^xmlSAXLocator;
PxmlSAXLocatorPtr  = ^xmlSAXLocatorPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: interfaces for tree manipulation
 * Description: this module describes the structures found in an tree resulting
 *              from an XML or HTML parsing, as well as the API provided for
 *              various processing on that tree
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_TREE_H__}
{$define __XML_TREE_H__}
{$include <stdio.h>}
{$include <limits.h>}
{$include <libxml/xmlversion.h>}
{$include <libxml/xmlstring.h>}
{ C++ extern C conditionnal removed }
{
 * Some of the basic types pointer to structures:
  }
{ xmlIO.h  }
type

  PxmlParserInputBufferPtr = ^TxmlParserInputBufferPtr;
  TxmlParserInputBufferPtr = PxmlParserInputBuffer;

  PxmlOutputBufferPtr = ^TxmlOutputBufferPtr;
  TxmlOutputBufferPtr = PxmlOutputBuffer;
{ parser.h  }

  PxmlParserInputPtr = ^TxmlParserInputPtr;
  TxmlParserInputPtr = PxmlParserInput;

  PxmlParserCtxtPtr = ^TxmlParserCtxtPtr;
  TxmlParserCtxtPtr = PxmlParserCtxt;

  PxmlSAXLocatorPtr = ^TxmlSAXLocatorPtr;
  TxmlSAXLocatorPtr = PxmlSAXLocator;

  PxmlSAXHandlerPtr = ^TxmlSAXHandlerPtr;
  TxmlSAXHandlerPtr = PxmlSAXHandler;
{ entities.h  }

  PxmlEntityPtr = ^TxmlEntityPtr;
  TxmlEntityPtr = PxmlEntity;
{*
 * BASE_BUFFER_SIZE:
 *
 * default buffer size 4000.
  }

const
  BASE_BUFFER_SIZE = 4096;  
{*
 * LIBXML_NAMESPACE_DICT:
 *
 * Defines experimental behaviour:
 * 1) xmlNs gets an additional field @context (a xmlDoc)
 * 2) when creating a tree, xmlNs->href is stored in the dict of xmlDoc.
  }
{ #define LIBXML_NAMESPACE_DICT  }
{*
 * xmlBufferAllocationScheme:
 *
 * A buffer allocation scheme can be defined to either match exactly the
 * need or double it's allocated size each time it is found too small.
  }
{ double each time one need to grow  }
{ grow only to the minimal size  }
{ immutable buffer  }
{ special allocation scheme used for I/O  }
{ exact up to a threshold, and doubleit thereafter  }
{ limit the upper size of the buffer  }
type
  PxmlBufferAllocationScheme = ^TxmlBufferAllocationScheme;
  TxmlBufferAllocationScheme =  Longint;
  Const
    XML_BUFFER_ALLOC_DOUBLEIT = 0;
    XML_BUFFER_ALLOC_EXACT = 1;
    XML_BUFFER_ALLOC_IMMUTABLE = 2;
    XML_BUFFER_ALLOC_IO = 3;
    XML_BUFFER_ALLOC_HYBRID = 4;
    XML_BUFFER_ALLOC_BOUNDED = 5;
;
{*
 * xmlBuffer:
 *
 * A buffer structure, this old construct is limited to 2GB and
 * is being deprecated, use API with xmlBuf instead
  }
type

  PxmlBufferPtr = ^TxmlBufferPtr;
  TxmlBufferPtr = PxmlBuffer;
{ The buffer content UTF8  }
{ The buffer size used  }
{ The buffer size  }
{ The realloc method  }
{ in IO mode we may have a different base  }
  PxmlBuffer = ^TxmlBuffer;
  TxmlBuffer = record
      content : PxmlChar;
      use : dword;
      size : dword;
      alloc : TxmlBufferAllocationScheme;
      contentIO : PxmlChar;
    end;

{*
 * xmlBuf:
 *
 * A buffer structure, new one, the actual structure internals are not public
  }
{*
 * xmlBufPtr:
 *
 * A pointer to a buffer structure, the actual structure internals are not
 * public
  }

  PxmlBufPtr = ^TxmlBufPtr;
  TxmlBufPtr = PxmlBuf;
{
 * A few public routines for xmlBuf. As those are expected to be used
 * mostly internally the bulk of the routines are internal in buf.h
  }
(* Const before type ignored *)

function xmlBufContent(buf:PxmlBuf):PxmlChar;cdecl;external;
function xmlBufEnd(buf:TxmlBufPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlBufUse(buf:TxmlBufPtr):Tsize_t;cdecl;external;
function xmlBufShrink(buf:TxmlBufPtr; len:Tsize_t):Tsize_t;cdecl;external;
{
 * LIBXML2_NEW_BUFFER:
 *
 * Macro used to express that the API use the new buffers for
 * xmlParserInputBuffer and xmlOutputBuffer. The change was
 * introduced in 2.9.0.
  }
{$define LIBXML2_NEW_BUFFER}
{*
 * XML_XML_NAMESPACE:
 *
 * This is the namespace for the special xml: prefix predefined in the
 * XML Namespace specification.
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XML_XML_NAMESPACE : PxmlChar;  

{*
 * XML_XML_ID:
 *
 * This is the name for the special xml:id attribute
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XML_XML_ID : PxmlChar;  

{
 * The different element types carried by an XML tree.
 *
 * NOTE: This is synchronized with DOM Level1 values
 *       See http://www.w3.org/TR/REC-DOM-Level-1/
 *
 * Actually this had diverged a bit, and now XML_DOCUMENT_TYPE_NODE should
 * be deprecated to use an XML_DTD_NODE.
  }
{$ifdef LIBXML_DOCB_ENABLED}
{$endif}
type
  PxmlElementType = ^TxmlElementType;
  TxmlElementType =  Longint;
  Const
    XML_ELEMENT_NODE = 1;
    XML_ATTRIBUTE_NODE = 2;
    XML_TEXT_NODE = 3;
    XML_CDATA_SECTION_NODE = 4;
    XML_ENTITY_REF_NODE = 5;
    XML_ENTITY_NODE = 6;
    XML_PI_NODE = 7;
    XML_COMMENT_NODE = 8;
    XML_DOCUMENT_NODE = 9;
    XML_DOCUMENT_TYPE_NODE = 10;
    XML_DOCUMENT_FRAG_NODE = 11;
    XML_NOTATION_NODE = 12;
    XML_HTML_DOCUMENT_NODE = 13;
    XML_DTD_NODE = 14;
    XML_ELEMENT_DECL = 15;
    XML_ATTRIBUTE_DECL = 16;
    XML_ENTITY_DECL = 17;
    XML_NAMESPACE_DECL = 18;
    XML_XINCLUDE_START = 19;
    XML_XINCLUDE_END = 20;
    XML_DOCB_DOCUMENT_NODE = 21;
;
{*
 * xmlNotation:
 *
 * A DTD Notation definition.
  }
type

  PxmlNotationPtr = ^TxmlNotationPtr;
  TxmlNotationPtr = PxmlNotation;
(* Const before type ignored *)
{ Notation name  }
(* Const before type ignored *)
{ Public identifier, if any  }
(* Const before type ignored *)
{ System identifier, if any  }
  PxmlNotation = ^TxmlNotation;
  TxmlNotation = record
      name : PxmlChar;
      PublicID : PxmlChar;
      SystemID : PxmlChar;
    end;

{*
 * xmlAttributeType:
 *
 * A DTD Attribute type definition.
  }

  PxmlAttributeType = ^TxmlAttributeType;
  TxmlAttributeType =  Longint;
  Const
    XML_ATTRIBUTE_CDATA = 1;
    XML_ATTRIBUTE_ID = 2;
    XML_ATTRIBUTE_IDREF = 3;
    XML_ATTRIBUTE_IDREFS = 4;
    XML_ATTRIBUTE_ENTITY = 5;
    XML_ATTRIBUTE_ENTITIES = 6;
    XML_ATTRIBUTE_NMTOKEN = 7;
    XML_ATTRIBUTE_NMTOKENS = 8;
    XML_ATTRIBUTE_ENUMERATION = 9;
    XML_ATTRIBUTE_NOTATION = 10;
;
{*
 * xmlAttributeDefault:
 *
 * A DTD Attribute default definition.
  }
type
  PxmlAttributeDefault = ^TxmlAttributeDefault;
  TxmlAttributeDefault =  Longint;
  Const
    XML_ATTRIBUTE_NONE = 1;
    XML_ATTRIBUTE_REQUIRED = 2;
    XML_ATTRIBUTE_IMPLIED = 3;
    XML_ATTRIBUTE_FIXED = 4;
;
{*
 * xmlEnumeration:
 *
 * List structure used when there is an enumeration in DTDs.
  }
type

  PxmlEnumerationPtr = ^TxmlEnumerationPtr;
  TxmlEnumerationPtr = PxmlEnumeration;
{ next one  }
(* Const before type ignored *)
{ Enumeration name  }
  PxmlEnumeration = ^TxmlEnumeration;
  TxmlEnumeration = record
      next : PxmlEnumeration;
      name : PxmlChar;
    end;

{*
 * xmlAttribute:
 *
 * An Attribute declaration in a DTD.
  }

  PxmlAttributePtr = ^TxmlAttributePtr;
  TxmlAttributePtr = PxmlAttribute;
{ application data  }
{ XML_ATTRIBUTE_DECL, must be second !  }
(* Const before type ignored *)
{ Attribute name  }
{ NULL  }
{ NULL  }
{ -> DTD  }
{ next sibling link   }
{ previous sibling link   }
{ the containing document  }
{ next in hash table  }
{ The attribute type  }
{ the default  }
(* Const before type ignored *)
{ or the default value  }
{ or the enumeration tree if any  }
(* Const before type ignored *)
{ the namespace prefix if any  }
(* Const before type ignored *)
{ Element holding the attribute  }
  PxmlAttribute = ^TxmlAttribute;
  TxmlAttribute = record
      _private : pointer;
      _type : TxmlElementType;
      name : PxmlChar;
      children : PxmlNode;
      last : PxmlNode;
      parent : PxmlDtd;
      next : PxmlNode;
      prev : PxmlNode;
      doc : PxmlDoc;
      nexth : PxmlAttribute;
      atype : TxmlAttributeType;
      def : TxmlAttributeDefault;
      defaultValue : PxmlChar;
      tree : TxmlEnumerationPtr;
      prefix : PxmlChar;
      elem : PxmlChar;
    end;

{*
 * xmlElementContentType:
 *
 * Possible definitions of element content types.
  }

  PxmlElementContentType = ^TxmlElementContentType;
  TxmlElementContentType =  Longint;
  Const
    XML_ELEMENT_CONTENT_PCDATA = 1;
    XML_ELEMENT_CONTENT_ELEMENT = 2;
    XML_ELEMENT_CONTENT_SEQ = 3;
    XML_ELEMENT_CONTENT_OR = 4;
;
{*
 * xmlElementContentOccur:
 *
 * Possible definitions of element content occurrences.
  }
type
  PxmlElementContentOccur = ^TxmlElementContentOccur;
  TxmlElementContentOccur =  Longint;
  Const
    XML_ELEMENT_CONTENT_ONCE = 1;
    XML_ELEMENT_CONTENT_OPT = 2;
    XML_ELEMENT_CONTENT_MULT = 3;
    XML_ELEMENT_CONTENT_PLUS = 4;
;
{*
 * xmlElementContent:
 *
 * An XML Element content as stored after parsing an element definition
 * in a DTD.
  }
type

  PxmlElementContentPtr = ^TxmlElementContentPtr;
  TxmlElementContentPtr = PxmlElementContent;
{ PCDATA, ELEMENT, SEQ or OR  }
{ ONCE, OPT, MULT or PLUS  }
(* Const before type ignored *)
{ Element name  }
{ first child  }
{ second child  }
{ parent  }
(* Const before type ignored *)
{ Namespace prefix  }
  PxmlElementContent = ^TxmlElementContent;
  TxmlElementContent = record
      _type : TxmlElementContentType;
      ocur : TxmlElementContentOccur;
      name : PxmlChar;
      c1 : PxmlElementContent;
      c2 : PxmlElementContent;
      parent : PxmlElementContent;
      prefix : PxmlChar;
    end;

{*
 * xmlElementTypeVal:
 *
 * The different possibilities for an element content type.
  }

  PxmlElementTypeVal = ^TxmlElementTypeVal;
  TxmlElementTypeVal =  Longint;
  Const
    XML_ELEMENT_TYPE_UNDEFINED = 0;
    XML_ELEMENT_TYPE_EMPTY = 1;
    XML_ELEMENT_TYPE_ANY = 2;
    XML_ELEMENT_TYPE_MIXED = 3;
    XML_ELEMENT_TYPE_ELEMENT = 4;
;
{ C++ end of extern C conditionnal removed }
{$include <libxml/xmlregexp.h>}
{ C++ extern C conditionnal removed }
{*
 * xmlElement:
 *
 * An XML Element declaration from a DTD.
  }
type

  PxmlElementPtr = ^TxmlElementPtr;
  TxmlElementPtr = PxmlElement;
{ application data  }
{ XML_ELEMENT_DECL, must be second !  }
(* Const before type ignored *)
{ Element name  }
{ NULL  }
{ NULL  }
{ -> DTD  }
{ next sibling link   }
{ previous sibling link   }
{ the containing document  }
{ The type  }
{ the allowed element content  }
{ List of the declared attributes  }
(* Const before type ignored *)
{ the namespace prefix if any  }
{$ifdef LIBXML_REGEXP_ENABLED}
{ the validating regexp  }
{$else}
{$endif}
type
  PxmlElement = ^TxmlElement;
  TxmlElement = record
      _private : pointer;
      _type : TxmlElementType;
      name : PxmlChar;
      children : PxmlNode;
      last : PxmlNode;
      parent : PxmlDtd;
      next : PxmlNode;
      prev : PxmlNode;
      doc : PxmlDoc;
      etype : TxmlElementTypeVal;
      content : TxmlElementContentPtr;
      attributes : TxmlAttributePtr;
      prefix : PxmlChar;
      contModel : TxmlRegexpPtr;
      contModel : pointer;
    end;

{*
 * XML_LOCAL_NAMESPACE:
 *
 * A namespace declaration node.
  }

const
  XML_LOCAL_NAMESPACE = XML_NAMESPACE_DECL;  
type
  PxmlNsType = ^TxmlNsType;
  TxmlNsType = TxmlElementType;
{*
 * xmlNs:
 *
 * An XML namespace.
 * Note that prefix == NULL is valid, it defines the default namespace
 * within the subtree (until overridden).
 *
 * xmlNsType is unified with xmlElementType.
  }

  PxmlNsPtr = ^TxmlNsPtr;
  TxmlNsPtr = PxmlNs;
{ next Ns link for this node   }
{ global or local  }
(* Const before type ignored *)
{ URL for the namespace  }
(* Const before type ignored *)
{ prefix for the namespace  }
{ application data  }
{ normally an xmlDoc  }
  PxmlNs = ^TxmlNs;
  TxmlNs = record
      next : PxmlNs;
      _type : TxmlNsType;
      href : PxmlChar;
      prefix : PxmlChar;
      _private : pointer;
      context : PxmlDoc;
    end;

{*
 * xmlDtd:
 *
 * An XML DTD, as defined by <!DOCTYPE ... There is actually one for
 * the internal subset and for the external subset.
  }

  PxmlDtdPtr = ^TxmlDtdPtr;
  TxmlDtdPtr = PxmlDtd;
{ application data  }
{ XML_DTD_NODE, must be second !  }
(* Const before type ignored *)
{ Name of the DTD  }
{ the value of the property link  }
{ last child link  }
{ child->parent link  }
{ next sibling link   }
{ previous sibling link   }
{ the containing document  }
{ End of common part  }
{ Hash table for notations if any  }
{ Hash table for elements if any  }
{ Hash table for attributes if any  }
{ Hash table for entities if any  }
(* Const before type ignored *)
{ External identifier for PUBLIC DTD  }
(* Const before type ignored *)
{ URI for a SYSTEM or PUBLIC DTD  }
{ Hash table for param entities if any  }
  PxmlDtd = ^TxmlDtd;
  TxmlDtd = record
      _private : pointer;
      _type : TxmlElementType;
      name : PxmlChar;
      children : PxmlNode;
      last : PxmlNode;
      parent : PxmlDoc;
      next : PxmlNode;
      prev : PxmlNode;
      doc : PxmlDoc;
      notations : pointer;
      elements : pointer;
      attributes : pointer;
      entities : pointer;
      ExternalID : PxmlChar;
      SystemID : PxmlChar;
      pentities : pointer;
    end;

{*
 * xmlAttr:
 *
 * An attribute on an XML node.
  }

  PxmlAttrPtr = ^TxmlAttrPtr;
  TxmlAttrPtr = PxmlAttr;
{ application data  }
{ XML_ATTRIBUTE_NODE, must be second !  }
(* Const before type ignored *)
{ the name of the property  }
{ the value of the property  }
{ NULL  }
{ child->parent link  }
{ next sibling link   }
{ previous sibling link   }
{ the containing document  }
{ pointer to the associated namespace  }
{ the attribute type if validating  }
{ for type/PSVI information  }
  PxmlAttr = ^TxmlAttr;
  TxmlAttr = record
      _private : pointer;
      _type : TxmlElementType;
      name : PxmlChar;
      children : PxmlNode;
      last : PxmlNode;
      parent : PxmlNode;
      next : PxmlAttr;
      prev : PxmlAttr;
      doc : PxmlDoc;
      ns : PxmlNs;
      atype : TxmlAttributeType;
      psvi : pointer;
    end;

{*
 * xmlID:
 *
 * An XML ID instance.
  }

  PxmlIDPtr = ^TxmlIDPtr;
  TxmlIDPtr = PxmlID;
{ next ID  }
(* Const before type ignored *)
{ The ID name  }
{ The attribute holding it  }
(* Const before type ignored *)
{ The attribute if attr is not available  }
{ The line number if attr is not available  }
{ The document holding the ID  }
  PxmlID = ^TxmlID;
  TxmlID = record
      next : PxmlID;
      value : PxmlChar;
      attr : TxmlAttrPtr;
      name : PxmlChar;
      lineno : longint;
      doc : PxmlDoc;
    end;

{*
 * xmlRef:
 *
 * An XML IDREF instance.
  }

  PxmlRefPtr = ^TxmlRefPtr;
  TxmlRefPtr = PxmlRef;
{ next Ref  }
(* Const before type ignored *)
{ The Ref name  }
{ The attribute holding it  }
(* Const before type ignored *)
{ The attribute if attr is not available  }
{ The line number if attr is not available  }
  PxmlRef = ^TxmlRef;
  TxmlRef = record
      next : PxmlRef;
      value : PxmlChar;
      attr : TxmlAttrPtr;
      name : PxmlChar;
      lineno : longint;
    end;

{*
 * xmlNode:
 *
 * A node in an XML tree.
  }

  PxmlNodePtr = ^TxmlNodePtr;
  TxmlNodePtr = PxmlNode;
{ application data  }
{ type number, must be second !  }
(* Const before type ignored *)
{ the name of the node, or the entity  }
{ parent->childs link  }
{ last child link  }
{ child->parent link  }
{ next sibling link   }
{ previous sibling link   }
{ the containing document  }
{ End of common part  }
{ pointer to the associated namespace  }
{ the content  }
{ properties list  }
{ namespace definitions on this node  }
{ for type/PSVI information  }
{ line number  }
{ extra data for XPath/XSLT  }
  PxmlNode = ^TxmlNode;
  TxmlNode = record
      _private : pointer;
      _type : TxmlElementType;
      name : PxmlChar;
      children : PxmlNode;
      last : PxmlNode;
      parent : PxmlNode;
      next : PxmlNode;
      prev : PxmlNode;
      doc : PxmlDoc;
      ns : PxmlNs;
      content : PxmlChar;
      properties : PxmlAttr;
      nsDef : PxmlNs;
      psvi : pointer;
      line : word;
      extra : word;
    end;

{*
 * XML_GET_CONTENT:
 *
 * Macro to extract the content pointer of a node.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function XML_GET_CONTENT(n : longint) : longint;

{*
 * XML_GET_LINE:
 *
 * Macro to extract the line number of an element node.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XML_GET_LINE(n : longint) : longint;

{*
 * xmlDocProperty
 *
 * Set of properties of the document as found by the parser
 * Some of them are linked to similarly named xmlParserOption
  }
{ document is XML well formed  }
{ document is Namespace valid  }
{ parsed with old XML-1.0 parser  }
{ DTD validation was successful  }
{ XInclude substitution was done  }
{ Document was built using the API
                                           and not by parsing an instance  }
{ built for internal processing  }
{ parsed or built HTML document  }
type
  PxmlDocProperties = ^TxmlDocProperties;
  TxmlDocProperties =  Longint;
  Const
    XML_DOC_WELLFORMED = 1 shl 0;
    XML_DOC_NSVALID = 1 shl 1;
    XML_DOC_OLD10 = 1 shl 2;
    XML_DOC_DTDVALID = 1 shl 3;
    XML_DOC_XINCLUDE = 1 shl 4;
    XML_DOC_USERBUILT = 1 shl 5;
    XML_DOC_INTERNAL = 1 shl 6;
    XML_DOC_HTML = 1 shl 7;
;
{*
 * xmlDoc:
 *
 * An XML document.
  }
type

  PxmlDocPtr = ^TxmlDocPtr;
  TxmlDocPtr = PxmlDoc;
{ application data  }
{ XML_DOCUMENT_NODE, must be second !  }
{ name/filename/URI of the document  }
{ the document tree  }
{ last child link  }
{ child->parent link  }
{ next sibling link   }
{ previous sibling link   }
{ autoreference to itself  }
{ End of common part  }
{ level of zlib compression  }
{ standalone document (no external refs)
				     1 if standalone="yes"
				     0 if standalone="no"
				    -1 if there is no XML declaration
				    -2 if there is an XML declaration, but no
					standalone attribute was specified  }
{ the document internal subset  }
{ the document external subset  }
{ Global namespace, the old way  }
(* Const before type ignored *)
{ the XML version string  }
(* Const before type ignored *)
{ external initial encoding, if any  }
{ Hash table for ID attributes if any  }
{ Hash table for IDREFs attributes if any  }
(* Const before type ignored *)
{ The URI for that document  }
{ Internal flag for charset handling,
				   actually an xmlCharEncoding  }
{ dict used to allocate names or NULL  }
{ for type/PSVI information  }
{ set of xmlParserOption used to parse the
				   document  }
{ set of xmlDocProperties for this document
				   set at the end of parsing  }
  PxmlDoc = ^TxmlDoc;
  TxmlDoc = record
      _private : pointer;
      _type : TxmlElementType;
      name : Pchar;
      children : PxmlNode;
      last : PxmlNode;
      parent : PxmlNode;
      next : PxmlNode;
      prev : PxmlNode;
      doc : PxmlDoc;
      compression : longint;
      standalone : longint;
      intSubset : PxmlDtd;
      extSubset : PxmlDtd;
      oldNs : PxmlNs;
      version : PxmlChar;
      encoding : PxmlChar;
      ids : pointer;
      refs : pointer;
      URL : PxmlChar;
      charset : longint;
      dict : PxmlDict;
      psvi : pointer;
      parseFlags : longint;
      properties : longint;
    end;


  PxmlDOMWrapCtxtPtr = ^TxmlDOMWrapCtxtPtr;
  TxmlDOMWrapCtxtPtr = PxmlDOMWrapCtxt;
{*
 * xmlDOMWrapAcquireNsFunction:
 * @ctxt:  a DOM wrapper context
 * @node:  the context node (element or attribute)
 * @nsName:  the requested namespace name
 * @nsPrefix:  the requested namespace prefix
 *
 * A function called to acquire namespaces (xmlNs) from the wrapper.
 *
 * Returns an xmlNsPtr or NULL in case of an error.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TxmlDOMWrapAcquireNsFunction = function (ctxt:TxmlDOMWrapCtxtPtr; node:TxmlNodePtr; nsName:PxmlChar; nsPrefix:PxmlChar):TxmlNsPtr;cdecl;
{*
 * xmlDOMWrapCtxt:
 *
 * Context for DOM wrapper-operations.
  }
{
    * The type of this context, just in case we need specialized
    * contexts in the future.
     }
{
    * Internal namespace map used for various operations.
     }
{
    * Use this one to acquire an xmlNsPtr intended for node->ns.
    * (Note that this is not intended for elem->nsDef).
     }
  PxmlDOMWrapCtxt = ^TxmlDOMWrapCtxt;
  TxmlDOMWrapCtxt = record
      _private : pointer;cdecl;
      _type : longint;
      namespaceMap : pointer;
      getNsForNodeFunc : TxmlDOMWrapAcquireNsFunction;
    end;

{*
 * xmlChildrenNode:
 *
 * Macro for compatibility naming layer with libxml1. Maps
 * to "children."
  }
{$ifndef xmlChildrenNode}

const
  xmlChildrenNode = children;  
{$endif}
{*
 * xmlRootNode:
 *
 * Macro for compatibility naming layer with libxml1. Maps
 * to "children".
  }
{$ifndef xmlRootNode}

const
  xmlRootNode = children;  
{$endif}
{
 * Variables.
  }
{
 * Some helper functions
  }
{#if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_XPATH_ENABLED) || \ }
{    defined(LIBXML_SCHEMAS_ENABLED) || defined(LIBXML_DEBUG_ENABLED) || \ }
{    defined (LIBXML_HTML_ENABLED) || defined(LIBXML_SAX1_ENABLED) || \ }
{    defined(LIBXML_HTML_ENABLED) || defined(LIBXML_WRITER_ENABLED) || \ }
{    defined(LIBXML_DOCB_ENABLED) || defined(LIBXML_LEGACY_ENABLED) }
(* Const before type ignored *)

function xmlValidateNCName(value:PxmlChar; space:longint):longint;cdecl;external;
{#endif }
{$if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_SCHEMAS_ENABLED)}
(* Const before type ignored *)

function xmlValidateQName(value:PxmlChar; space:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidateName(value:PxmlChar; space:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidateNMToken(value:PxmlChar; space:longint):longint;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

function xmlBuildQName(ncname:PxmlChar; prefix:PxmlChar; memory:PxmlChar; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlSplitQName2(name:PxmlChar; prefix:PPxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSplitQName3(name:PxmlChar; len:Plongint):PxmlChar;cdecl;external;
{
 * Handling Buffers, the old ones see @xmlBuf for the new ones.
  }
procedure xmlSetBufferAllocationScheme(scheme:TxmlBufferAllocationScheme);cdecl;external;
function xmlGetBufferAllocationScheme:TxmlBufferAllocationScheme;cdecl;external;
function xmlBufferCreate:TxmlBufferPtr;cdecl;external;
function xmlBufferCreateSize(size:Tsize_t):TxmlBufferPtr;cdecl;external;
function xmlBufferCreateStatic(mem:pointer; size:Tsize_t):TxmlBufferPtr;cdecl;external;
function xmlBufferResize(buf:TxmlBufferPtr; size:dword):longint;cdecl;external;
procedure xmlBufferFree(buf:TxmlBufferPtr);cdecl;external;
function xmlBufferDump(file:PFILE; buf:TxmlBufferPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlBufferAdd(buf:TxmlBufferPtr; str:PxmlChar; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlBufferAddHead(buf:TxmlBufferPtr; str:PxmlChar; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlBufferCat(buf:TxmlBufferPtr; str:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlBufferCCat(buf:TxmlBufferPtr; str:Pchar):longint;cdecl;external;
function xmlBufferShrink(buf:TxmlBufferPtr; len:dword):longint;cdecl;external;
function xmlBufferGrow(buf:TxmlBufferPtr; len:dword):longint;cdecl;external;
procedure xmlBufferEmpty(buf:TxmlBufferPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlBufferContent(buf:PxmlBuffer):PxmlChar;cdecl;external;
function xmlBufferDetach(buf:TxmlBufferPtr):PxmlChar;cdecl;external;
procedure xmlBufferSetAllocationScheme(buf:TxmlBufferPtr; scheme:TxmlBufferAllocationScheme);cdecl;external;
(* Const before type ignored *)
function xmlBufferLength(buf:PxmlBuffer):longint;cdecl;external;
{
 * Creating/freeing new structures.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCreateIntSubset(doc:TxmlDocPtr; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar):TxmlDtdPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNewDtd(doc:TxmlDocPtr; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar):TxmlDtdPtr;cdecl;external;
(* Const before type ignored *)
function xmlGetIntSubset(doc:PxmlDoc):TxmlDtdPtr;cdecl;external;
procedure xmlFreeDtd(cur:TxmlDtdPtr);cdecl;external;
{$ifdef LIBXML_LEGACY_ENABLED}
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNewGlobalNs(doc:TxmlDocPtr; href:PxmlChar; prefix:PxmlChar):TxmlNsPtr;cdecl;external;
{$endif}
{ LIBXML_LEGACY_ENABLED  }
(* Const before type ignored *)
(* Const before type ignored *)

function xmlNewNs(node:TxmlNodePtr; href:PxmlChar; prefix:PxmlChar):TxmlNsPtr;cdecl;external;
procedure xmlFreeNs(cur:TxmlNsPtr);cdecl;external;
procedure xmlFreeNsList(cur:TxmlNsPtr);cdecl;external;
(* Const before type ignored *)
function xmlNewDoc(version:PxmlChar):TxmlDocPtr;cdecl;external;
procedure xmlFreeDoc(cur:TxmlDocPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNewDocProp(doc:TxmlDocPtr; name:PxmlChar; value:PxmlChar):TxmlAttrPtr;cdecl;external;
{#if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_HTML_ENABLED) || \ }
{    defined(LIBXML_SCHEMAS_ENABLED) }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNewProp(node:TxmlNodePtr; name:PxmlChar; value:PxmlChar):TxmlAttrPtr;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

function xmlNewNsProp(node:TxmlNodePtr; ns:TxmlNsPtr; name:PxmlChar; value:PxmlChar):TxmlAttrPtr;cdecl;external;
(* Const before type ignored *)
function xmlNewNsPropEatName(node:TxmlNodePtr; ns:TxmlNsPtr; name:PxmlChar; value:PxmlChar):TxmlAttrPtr;cdecl;external;
procedure xmlFreePropList(cur:TxmlAttrPtr);cdecl;external;
procedure xmlFreeProp(cur:TxmlAttrPtr);cdecl;external;
function xmlCopyProp(target:TxmlNodePtr; cur:TxmlAttrPtr):TxmlAttrPtr;cdecl;external;
function xmlCopyPropList(target:TxmlNodePtr; cur:TxmlAttrPtr):TxmlAttrPtr;cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
function xmlCopyDtd(dtd:TxmlDtdPtr):TxmlDtdPtr;cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }
{$if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_SCHEMAS_ENABLED)}

function xmlCopyDoc(doc:TxmlDocPtr; recursive:longint):TxmlDocPtr;cdecl;external;
{$endif}
{ defined(LIBXML_TREE_ENABLED) || defined(LIBXML_SCHEMAS_ENABLED)  }
{
 * Creating new nodes.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function xmlNewDocNode(doc:TxmlDocPtr; ns:TxmlNsPtr; name:PxmlChar; content:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNewDocNodeEatName(doc:TxmlDocPtr; ns:TxmlNsPtr; name:PxmlChar; content:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNewNode(ns:TxmlNsPtr; name:PxmlChar):TxmlNodePtr;cdecl;external;
function xmlNewNodeEatName(ns:TxmlNsPtr; name:PxmlChar):TxmlNodePtr;cdecl;external;
{$if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_SCHEMAS_ENABLED)}
(* Const before type ignored *)
(* Const before type ignored *)

function xmlNewChild(parent:TxmlNodePtr; ns:TxmlNsPtr; name:PxmlChar; content:PxmlChar):TxmlNodePtr;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

function xmlNewDocText(doc:PxmlDoc; content:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNewText(content:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNewDocPI(doc:TxmlDocPtr; name:PxmlChar; content:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNewPI(name:PxmlChar; content:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNewDocTextLen(doc:TxmlDocPtr; content:PxmlChar; len:longint):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNewTextLen(content:PxmlChar; len:longint):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNewDocComment(doc:TxmlDocPtr; content:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNewComment(content:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNewCDataBlock(doc:TxmlDocPtr; content:PxmlChar; len:longint):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNewCharRef(doc:TxmlDocPtr; name:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNewReference(doc:PxmlDoc; name:PxmlChar):TxmlNodePtr;cdecl;external;
function xmlCopyNode(node:TxmlNodePtr; recursive:longint):TxmlNodePtr;cdecl;external;
function xmlDocCopyNode(node:TxmlNodePtr; doc:TxmlDocPtr; recursive:longint):TxmlNodePtr;cdecl;external;
function xmlDocCopyNodeList(doc:TxmlDocPtr; node:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlCopyNodeList(node:TxmlNodePtr):TxmlNodePtr;cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNewTextChild(parent:TxmlNodePtr; ns:TxmlNsPtr; name:PxmlChar; content:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNewDocRawNode(doc:TxmlDocPtr; ns:TxmlNsPtr; name:PxmlChar; content:PxmlChar):TxmlNodePtr;cdecl;external;
function xmlNewDocFragment(doc:TxmlDocPtr):TxmlNodePtr;cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }
{
 * Navigating.
  }
(* Const before type ignored *)

function xmlGetLineNo(node:PxmlNode):longint;cdecl;external;
{$if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_DEBUG_ENABLED)}
(* Const before type ignored *)

function xmlGetNodePath(node:PxmlNode):PxmlChar;cdecl;external;
{$endif}
{ defined(LIBXML_TREE_ENABLED) || defined(LIBXML_DEBUG_ENABLED)  }
(* Const before type ignored *)

function xmlDocGetRootElement(doc:PxmlDoc):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlGetLastChild(parent:PxmlNode):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNodeIsText(node:PxmlNode):longint;cdecl;external;
(* Const before type ignored *)
function xmlIsBlankNode(node:PxmlNode):longint;cdecl;external;
{
 * Changing the structure.
  }
{$if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_WRITER_ENABLED)}

function xmlDocSetRootElement(doc:TxmlDocPtr; root:TxmlNodePtr):TxmlNodePtr;cdecl;external;
{$endif}
{ defined(LIBXML_TREE_ENABLED) || defined(LIBXML_WRITER_ENABLED)  }
{$ifdef LIBXML_TREE_ENABLED}
(* Const before type ignored *)

procedure xmlNodeSetName(cur:TxmlNodePtr; name:PxmlChar);cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }

function xmlAddChild(parent:TxmlNodePtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlAddChildList(parent:TxmlNodePtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
{$if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_WRITER_ENABLED)}

function xmlReplaceNode(old:TxmlNodePtr; cur:TxmlNodePtr):TxmlNodePtr;cdecl;external;
{$endif}
{ defined(LIBXML_TREE_ENABLED) || defined(LIBXML_WRITER_ENABLED)  }
{#if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_HTML_ENABLED) || \ }
{    defined(LIBXML_SCHEMAS_ENABLED) || defined(LIBXML_XINCLUDE_ENABLED) }

function xmlAddPrevSibling(cur:TxmlNodePtr; elem:TxmlNodePtr):TxmlNodePtr;cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED || LIBXML_HTML_ENABLED || LIBXML_SCHEMAS_ENABLED  }

function xmlAddSibling(cur:TxmlNodePtr; elem:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlAddNextSibling(cur:TxmlNodePtr; elem:TxmlNodePtr):TxmlNodePtr;cdecl;external;
procedure xmlUnlinkNode(cur:TxmlNodePtr);cdecl;external;
function xmlTextMerge(first:TxmlNodePtr; second:TxmlNodePtr):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlTextConcat(node:TxmlNodePtr; content:PxmlChar; len:longint):longint;cdecl;external;
procedure xmlFreeNodeList(cur:TxmlNodePtr);cdecl;external;
procedure xmlFreeNode(cur:TxmlNodePtr);cdecl;external;
procedure xmlSetTreeDoc(tree:TxmlNodePtr; doc:TxmlDocPtr);cdecl;external;
procedure xmlSetListDoc(list:TxmlNodePtr; doc:TxmlDocPtr);cdecl;external;
{
 * Namespaces.
  }
(* Const before type ignored *)
function xmlSearchNs(doc:TxmlDocPtr; node:TxmlNodePtr; nameSpace:PxmlChar):TxmlNsPtr;cdecl;external;
(* Const before type ignored *)
function xmlSearchNsByHref(doc:TxmlDocPtr; node:TxmlNodePtr; href:PxmlChar):TxmlNsPtr;cdecl;external;
{#if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_XPATH_ENABLED) || \ }
{    defined(LIBXML_SCHEMAS_ENABLED) }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlGetNsList(doc:PxmlDoc; node:PxmlNode):PxmlNsPtr;cdecl;external;
{$endif}
{ defined(LIBXML_TREE_ENABLED) || defined(LIBXML_XPATH_ENABLED)  }

procedure xmlSetNs(node:TxmlNodePtr; ns:TxmlNsPtr);cdecl;external;
function xmlCopyNamespace(cur:TxmlNsPtr):TxmlNsPtr;cdecl;external;
function xmlCopyNamespaceList(cur:TxmlNsPtr):TxmlNsPtr;cdecl;external;
{
 * Changing the content.
  }
{#if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_XINCLUDE_ENABLED) || \ }
{    defined(LIBXML_SCHEMAS_ENABLED) || defined(LIBXML_HTML_ENABLED) }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSetProp(node:TxmlNodePtr; name:PxmlChar; value:PxmlChar):TxmlAttrPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSetNsProp(node:TxmlNodePtr; ns:TxmlNsPtr; name:PxmlChar; value:PxmlChar):TxmlAttrPtr;cdecl;external;
{$endif}
{ defined(LIBXML_TREE_ENABLED) || defined(LIBXML_XINCLUDE_ENABLED) || \
	  defined(LIBXML_SCHEMAS_ENABLED) || defined(LIBXML_HTML_ENABLED)  }
(* Const before type ignored *)
(* Const before type ignored *)

function xmlGetNoNsProp(node:PxmlNode; name:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlGetProp(node:PxmlNode; name:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHasProp(node:PxmlNode; name:PxmlChar):TxmlAttrPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHasNsProp(node:PxmlNode; name:PxmlChar; nameSpace:PxmlChar):TxmlAttrPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlGetNsProp(node:PxmlNode; name:PxmlChar; nameSpace:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStringGetNodeList(doc:PxmlDoc; value:PxmlChar):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStringLenGetNodeList(doc:PxmlDoc; value:PxmlChar; len:longint):TxmlNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlNodeListGetString(doc:TxmlDocPtr; list:PxmlNode; inLine:longint):PxmlChar;cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNodeListGetRawString(doc:PxmlDoc; list:PxmlNode; inLine:longint):PxmlChar;cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }
(* Const before type ignored *)

procedure xmlNodeSetContent(cur:TxmlNodePtr; content:PxmlChar);cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
(* Const before type ignored *)
procedure xmlNodeSetContentLen(cur:TxmlNodePtr; content:PxmlChar; len:longint);cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }
(* Const before type ignored *)

procedure xmlNodeAddContent(cur:TxmlNodePtr; content:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure xmlNodeAddContentLen(cur:TxmlNodePtr; content:PxmlChar; len:longint);cdecl;external;
(* Const before type ignored *)
function xmlNodeGetContent(cur:PxmlNode):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlNodeBufGetContent(buffer:TxmlBufferPtr; cur:PxmlNode):longint;cdecl;external;
(* Const before type ignored *)
function xmlBufGetNodeContent(buf:TxmlBufPtr; cur:PxmlNode):longint;cdecl;external;
(* Const before type ignored *)
function xmlNodeGetLang(cur:PxmlNode):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlNodeGetSpacePreserve(cur:PxmlNode):longint;cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
(* Const before type ignored *)
procedure xmlNodeSetLang(cur:TxmlNodePtr; lang:PxmlChar);cdecl;external;
procedure xmlNodeSetSpacePreserve(cur:TxmlNodePtr; val:longint);cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }
(* Const before type ignored *)
(* Const before type ignored *)

function xmlNodeGetBase(doc:PxmlDoc; cur:PxmlNode):PxmlChar;cdecl;external;
{$if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_XINCLUDE_ENABLED)}
(* Const before type ignored *)

procedure xmlNodeSetBase(cur:TxmlNodePtr; uri:PxmlChar);cdecl;external;
{$endif}
{
 * Removing content.
  }

function xmlRemoveProp(cur:TxmlAttrPtr):longint;cdecl;external;
{$if defined(LIBXML_TREE_ENABLED) || defined(LIBXML_SCHEMAS_ENABLED)}
(* Const before type ignored *)

function xmlUnsetNsProp(node:TxmlNodePtr; ns:TxmlNsPtr; name:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlUnsetProp(node:TxmlNodePtr; name:PxmlChar):longint;cdecl;external;
{$endif}
{ defined(LIBXML_TREE_ENABLED) || defined(LIBXML_SCHEMAS_ENABLED)  }
{
 * Internal, don't use.
  }
(* Const before type ignored *)

procedure xmlBufferWriteCHAR(buf:TxmlBufferPtr; _string:PxmlChar);cdecl;external;
(* Const before type ignored *)
procedure xmlBufferWriteChar(buf:TxmlBufferPtr; _string:Pchar);cdecl;external;
(* Const before type ignored *)
procedure xmlBufferWriteQuotedString(buf:TxmlBufferPtr; _string:PxmlChar);cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
(* Const before type ignored *)
procedure xmlAttrSerializeTxtContent(buf:TxmlBufferPtr; doc:TxmlDocPtr; attr:TxmlAttrPtr; _string:PxmlChar);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{$ifdef LIBXML_TREE_ENABLED}
{
 * Namespace handling.
  }

function xmlReconciliateNs(doc:TxmlDocPtr; tree:TxmlNodePtr):longint;cdecl;external;
{$endif}
{$ifdef LIBXML_OUTPUT_ENABLED}
{
 * Saving.
  }

procedure xmlDocDumpFormatMemory(cur:TxmlDocPtr; mem:PPxmlChar; size:Plongint; format:longint);cdecl;external;
procedure xmlDocDumpMemory(cur:TxmlDocPtr; mem:PPxmlChar; size:Plongint);cdecl;external;
(* Const before type ignored *)
procedure xmlDocDumpMemoryEnc(out_doc:TxmlDocPtr; doc_txt_ptr:PPxmlChar; doc_txt_len:Plongint; txt_encoding:Pchar);cdecl;external;
(* Const before type ignored *)
procedure xmlDocDumpFormatMemoryEnc(out_doc:TxmlDocPtr; doc_txt_ptr:PPxmlChar; doc_txt_len:Plongint; txt_encoding:Pchar; format:longint);cdecl;external;
function xmlDocFormatDump(f:PFILE; cur:TxmlDocPtr; format:longint):longint;cdecl;external;
function xmlDocDump(f:PFILE; cur:TxmlDocPtr):longint;cdecl;external;
procedure xmlElemDump(f:PFILE; doc:TxmlDocPtr; cur:TxmlNodePtr);cdecl;external;
(* Const before type ignored *)
function xmlSaveFile(filename:Pchar; cur:TxmlDocPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlSaveFormatFile(filename:Pchar; cur:TxmlDocPtr; format:longint):longint;cdecl;external;
function xmlBufNodeDump(buf:TxmlBufPtr; doc:TxmlDocPtr; cur:TxmlNodePtr; level:longint; format:longint):Tsize_t;cdecl;external;
function xmlNodeDump(buf:TxmlBufferPtr; doc:TxmlDocPtr; cur:TxmlNodePtr; level:longint; format:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlSaveFileTo(buf:TxmlOutputBufferPtr; cur:TxmlDocPtr; encoding:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlSaveFormatFileTo(buf:TxmlOutputBufferPtr; cur:TxmlDocPtr; encoding:Pchar; format:longint):longint;cdecl;external;
(* Const before type ignored *)
procedure xmlNodeDumpOutput(buf:TxmlOutputBufferPtr; doc:TxmlDocPtr; cur:TxmlNodePtr; level:longint; format:longint; 
            encoding:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSaveFormatFileEnc(filename:Pchar; cur:TxmlDocPtr; encoding:Pchar; format:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSaveFileEnc(filename:Pchar; cur:TxmlDocPtr; encoding:Pchar):longint;cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{
 * XHTML
  }
(* Const before type ignored *)
(* Const before type ignored *)

function xmlIsXHTML(systemID:PxmlChar; publicID:PxmlChar):longint;cdecl;external;
{
 * Compression.
  }
(* Const before type ignored *)
function xmlGetDocCompressMode(doc:PxmlDoc):longint;cdecl;external;
procedure xmlSetDocCompressMode(doc:TxmlDocPtr; mode:longint);cdecl;external;
function xmlGetCompressMode:longint;cdecl;external;
procedure xmlSetCompressMode(mode:longint);cdecl;external;
{
* DOM-wrapper helper functions.
 }
function xmlDOMWrapNewCtxt:TxmlDOMWrapCtxtPtr;cdecl;external;
procedure xmlDOMWrapFreeCtxt(ctxt:TxmlDOMWrapCtxtPtr);cdecl;external;
function xmlDOMWrapReconcileNamespaces(ctxt:TxmlDOMWrapCtxtPtr; elem:TxmlNodePtr; options:longint):longint;cdecl;external;
function xmlDOMWrapAdoptNode(ctxt:TxmlDOMWrapCtxtPtr; sourceDoc:TxmlDocPtr; node:TxmlNodePtr; destDoc:TxmlDocPtr; destParent:TxmlNodePtr; 
           options:longint):longint;cdecl;external;
function xmlDOMWrapRemoveNode(ctxt:TxmlDOMWrapCtxtPtr; doc:TxmlDocPtr; node:TxmlNodePtr; options:longint):longint;cdecl;external;
function xmlDOMWrapCloneNode(ctxt:TxmlDOMWrapCtxtPtr; sourceDoc:TxmlDocPtr; node:TxmlNodePtr; clonedNode:PxmlNodePtr; destDoc:TxmlDocPtr; 
           destParent:TxmlNodePtr; deep:longint; options:longint):longint;cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
{
 * 5 interfaces from DOM ElementTraversal, but different in entities
 * traversal.
  }
function xmlChildElementCount(parent:TxmlNodePtr):dword;cdecl;external;
function xmlNextElementSibling(node:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlFirstElementChild(parent:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlLastElementChild(parent:TxmlNodePtr):TxmlNodePtr;cdecl;external;
function xmlPreviousElementSibling(node:TxmlNodePtr):TxmlNodePtr;cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }
{$ifndef __XML_PARSER_H__}
{$include <libxml/xmlmemory.h>}
{$endif}
{$endif}
{ __XML_TREE_H__  }

implementation

{ was #define dname def_expr }
function XML_XML_NAMESPACE : PxmlChar;
  begin
    XML_XML_NAMESPACE:=PxmlChar('http://www.w3.org/XML/1998/namespace');
  end;

{ was #define dname def_expr }
function XML_XML_ID : PxmlChar;
  begin
    XML_XML_ID:=PxmlChar('xml:id');
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XML_GET_CONTENT(n : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if XML_ELEMENT_NODE then
    if_local1:=NULL
  else
    if_local1:=n^.content;
  XML_GET_CONTENT:=(n^._type)=(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XML_GET_LINE(n : longint) : longint;
begin
  XML_GET_LINE:=xmlGetLineNo(n);
end;


end.
