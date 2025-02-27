
unit parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    parser.h
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
Plongint  = ^longint;
PxmlChar  = ^xmlChar;
PxmlFeature  = ^xmlFeature;
PxmlNode  = ^xmlNode;
PxmlNodePtr  = ^xmlNodePtr;
PxmlParserCtxt  = ^xmlParserCtxt;
PxmlParserInput  = ^xmlParserInput;
PxmlParserInputPtr  = ^xmlParserInputPtr;
PxmlParserInputState  = ^xmlParserInputState;
PxmlParserMode  = ^xmlParserMode;
PxmlParserNodeInfo  = ^xmlParserNodeInfo;
PxmlParserNodeInfoPtr  = ^xmlParserNodeInfoPtr;
PxmlParserNodeInfoSeq  = ^xmlParserNodeInfoSeq;
PxmlParserNodeInfoSeqPtr  = ^xmlParserNodeInfoSeqPtr;
PxmlParserOption  = ^xmlParserOption;
PxmlSAXHandler  = ^xmlSAXHandler;
PxmlSAXHandlerV1  = ^xmlSAXHandlerV1;
PxmlSAXHandlerV1Ptr  = ^xmlSAXHandlerV1Ptr;
PxmlSAXLocator  = ^xmlSAXLocator;
PxmlStartTag  = ^xmlStartTag;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: the core parser module
 * Description: Interfaces, constants and types related to the XML parser
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_PARSER_H__}
{$define __XML_PARSER_H__}
{$include <stdarg.h>}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{$include <libxml/dict.h>}
{$include <libxml/hash.h>}
{$include <libxml/valid.h>}
{$include <libxml/entities.h>}
{$include <libxml/xmlerror.h>}
{$include <libxml/xmlstring.h>}
{ C++ extern C conditionnal removed }
{*
 * XML_DEFAULT_VERSION:
 *
 * The default version of XML used: 1.0
  }

const
  XML_DEFAULT_VERSION = '1.0';  
{*
 * xmlParserInput:
 *
 * An xmlParserInput is an input flow for the XML processor.
 * Each entity parsed is associated an xmlParserInput (except the
 * few predefined ones). This is the case both for internal entities
 * - in which case the flow is already completely in memory - or
 * external entities - in which case we use the buf structure for
 * progressive reading and I18N conversions to the internal UTF-8 format.
  }
{*
 * xmlParserInputDeallocate:
 * @str:  the string to deallocate
 *
 * Callback for freeing some parser input allocations.
  }
type

  TxmlParserInputDeallocate = procedure (str:PxmlChar);cdecl;
{ Input buffer  }
{ UTF-8 encoded buffer  }
(* Const before type ignored *)
{ The file analyzed, if any  }
(* Const before type ignored *)
{ the directory/base of the file  }
(* Const before type ignored *)
{ Base of the array to parse  }
(* Const before type ignored *)
{ Current char being parsed  }
(* Const before type ignored *)
{ end of the array to parse  }
{ length if known  }
{ Current line  }
{ Current column  }
{
     * NOTE: consumed is only tested for equality in the parser code,
     *       so even if there is an overflow this should not give troubles
     *       for parsing very large instances.
      }
{ How many xmlChars already consumed  }
{ function to deallocate the base  }
(* Const before type ignored *)
{ the encoding string for entity  }
(* Const before type ignored *)
{ the version string for entity  }
{ Was that entity marked standalone  }
{ an unique identifier for the entity  }
  PxmlParserInput = ^TxmlParserInput;
  TxmlParserInput = record
      buf : TxmlParserInputBufferPtr;cdecl;
      filename : Pchar;
      directory : Pchar;
      base : PxmlChar;
      cur : PxmlChar;
      end : PxmlChar;
      length : longint;
      line : longint;
      col : longint;
      consumed : dword;
      free : TxmlParserInputDeallocate;
      encoding : PxmlChar;
      version : PxmlChar;
      standalone : longint;
      id : longint;
    end;

{*
 * xmlParserNodeInfo:
 *
 * The parser can be asked to collect Node information, i.e. at what
 * place in the file they were detected.
 * NOTE: This is off by default and not very well tested.
  }

  PxmlParserNodeInfoPtr = ^TxmlParserNodeInfoPtr;
  TxmlParserNodeInfoPtr = PxmlParserNodeInfo;
(* Const before type ignored *)
{ Position & line # that text that created the node begins & ends on  }
  PxmlParserNodeInfo = ^TxmlParserNodeInfo;
  TxmlParserNodeInfo = record
      node : PxmlNode;
      begin_pos : dword;
      begin_line : dword;
      end_pos : dword;
      end_line : dword;
    end;


  PxmlParserNodeInfoSeqPtr = ^TxmlParserNodeInfoSeqPtr;
  TxmlParserNodeInfoSeqPtr = PxmlParserNodeInfoSeq;
  PxmlParserNodeInfoSeq = ^TxmlParserNodeInfoSeq;
  TxmlParserNodeInfoSeq = record
      maximum : dword;
      length : dword;
      buffer : PxmlParserNodeInfo;
    end;

{*
 * xmlParserInputState:
 *
 * The parser is now working also as a state based parser.
 * The recursive one use the state info for entities processing.
  }
{ nothing is to be parsed  }
{ nothing has been parsed  }
{ Misc* before int subset  }
{ Within a processing instruction  }
{ within some DTD content  }
{ Misc* after internal subset  }
{ within a comment  }
{ within a start tag  }
{ within the content  }
{ within a CDATA section  }
{ within a closing tag  }
{ within an entity declaration  }
{ within an entity value in a decl  }
{ within an attribute value  }
{ within a SYSTEM value  }
{ the Misc* after the last end tag  }
{ within an IGNORED section  }
{ within a PUBLIC value  }

  PxmlParserInputState = ^TxmlParserInputState;
  TxmlParserInputState =  Longint;
  Const
    XML_PARSER_EOF = -(1);
    XML_PARSER_START = 0;
    XML_PARSER_MISC = 1;
    XML_PARSER_PI = 2;
    XML_PARSER_DTD = 3;
    XML_PARSER_PROLOG = 4;
    XML_PARSER_COMMENT = 5;
    XML_PARSER_START_TAG = 6;
    XML_PARSER_CONTENT = 7;
    XML_PARSER_CDATA_SECTION = 8;
    XML_PARSER_END_TAG = 9;
    XML_PARSER_ENTITY_DECL = 10;
    XML_PARSER_ENTITY_VALUE = 11;
    XML_PARSER_ATTRIBUTE_VALUE = 12;
    XML_PARSER_SYSTEM_LITERAL = 13;
    XML_PARSER_EPILOG = 14;
    XML_PARSER_IGNORE = 15;
    XML_PARSER_PUBLIC_LITERAL = 16;
;
{*
 * XML_DETECT_IDS:
 *
 * Bit in the loadsubset context field to tell to do ID/REFs lookups.
 * Use it to initialize xmlLoadExtDtdDefaultValue.
  }
  XML_DETECT_IDS = 2;  
{*
 * XML_COMPLETE_ATTRS:
 *
 * Bit in the loadsubset context field to tell to do complete the
 * elements attributes lists with the ones defaulted from the DTDs.
 * Use it to initialize xmlLoadExtDtdDefaultValue.
  }
  XML_COMPLETE_ATTRS = 4;  
{*
 * XML_SKIP_IDS:
 *
 * Bit in the loadsubset context field to tell to not do ID/REFs registration.
 * Used to initialize xmlLoadExtDtdDefaultValue in some special cases.
  }
  XML_SKIP_IDS = 8;  
{*
 * xmlParserMode:
 *
 * A parser can operate in various modes
  }
type
  PxmlParserMode = ^TxmlParserMode;
  TxmlParserMode =  Longint;
  Const
    XML_PARSE_UNKNOWN = 0;
    XML_PARSE_DOM = 1;
    XML_PARSE_SAX = 2;
    XML_PARSE_PUSH_DOM = 3;
    XML_PARSE_PUSH_SAX = 4;
    XML_PARSE_READER = 5;
;
type
{*
 * xmlParserCtxt:
 *
 * The parser context.
 * NOTE This doesn't completely define the parser state, the (current ?)
 *      design of the parser uses recursive function calls since this allow
 *      and easy mapping from the production rules of the specification
 *      to the actual code. The drawback is that the actual function call
 *      also reflect the parser state. However most of the parsing routines
 *      takes as the only argument the parser context pointer, so migrating
 *      to a state based parser for progressive parsing shouldn't be too hard.
  }
{ The SAX handler  }
{ For SAX interface only, used by DOM build  }
{ the document being built  }
{ is the document well formed  }
{ shall we replace entities ?  }
(* Const before type ignored *)
{ the XML version string  }
(* Const before type ignored *)
{ the declared encoding, if any  }
{ standalone document  }
{ an HTML(1)/Docbook(2) document
                                       * 3 is HTML after <head>
                                       * 10 is HTML after <body>
                                        }
{ Input stream stack  }
{ Current input stream  }
{ Number of current input streams  }
{ Max number of input streams  }
{ stack of inputs  }
{ Node analysis stack only used for DOM building  }
{ Current parsed Node  }
{ Depth of the parsing stack  }
{ Max depth of the parsing stack  }
{ array of nodes  }
{ Whether node info should be kept  }
{ info about each node parsed  }
{ error code  }
{ reference and external subset  }
{ the internal subset has PE refs  }
{ are we parsing an external entity  }
{ is the document valid  }
{ shall we try to validate ?  }
{ The validity context  }
{ current type of input  }
{ next char look-ahead  }
{ the data directory  }
{ Node name stack  }
(* Const before type ignored *)
{ Current parsed Node  }
{ Depth of the parsing stack  }
{ Max depth of the parsing stack  }
(* Const before type ignored *)
{ array of nodes  }
{ unused  }
{ used by progressive parsing lookup  }
{ ugly but ...  }
{ SAX callbacks are disabled  }
{ Parsing is in int 1/ext 2 subset  }
(* Const before type ignored *)
{ name of subset  }
{ URI of external subset  }
{ SYSTEM ID of external subset  }
{ xml:space values  }
{ Should the parser preserve spaces  }
{ Depth of the parsing stack  }
{ Max depth of the parsing stack  }
{ array of space infos  }
{ to prevent entity substitution loops  }
{ used to check entities boundaries  }
{ encoding of the in-memory content
				         actually an xmlCharEncoding  }
{ Those two fields are there to  }
{ Speed up large node parsing  }
{ signal pedantic warnings  }
{ For user data, libxml won't touch it  }
{ should the external subset be loaded  }
{ set line number in element content  }
{ document's own catalog  }
{ run in recovery mode  }
{ is this a progressive parsing  }
{ dictionary for the parser  }
(* Const before type ignored *)
{ array for the attributes callbacks  }
{ the size of the array  }
{ use strings from dict to build tree  }
{
     * pre-interned strings
      }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{
     * Everything below is used only by the new SAX mode
      }
{ operating in the new SAX mode  }
{ the number of inherited namespaces  }
{ the size of the arrays  }
(* Const before type ignored *)
{ the array of prefix/namespace name  }
{ which attribute were allocated  }
{ array of data for push  }
{ defaulted attributes if any  }
{ non-CDATA attributes if any  }
{ is the document XML Namespace okay  }
{ Extra options  }
{
     * Those fields are needed only for streaming parsing so far
      }
{ Use dictionary names for the tree  }
{ number of freed element nodes  }
{ List of freed element nodes  }
{ number of freed attributes nodes  }
{ List of freed attributes nodes  }
{
     * the complete error information for the last error.
      }
{ the parser mode  }
{ number of entities references  }
{ size of parsed entities  }
{ for use by HTML non-recursive parser  }
{ Current NodeInfo  }
{ Depth of the parsing stack  }
{ Max depth of the parsing stack  }
{ array of nodeInfos  }
{ we need to label inputs  }
{ volume of entity copy  }
  PxmlParserCtxt = ^TxmlParserCtxt;
  TxmlParserCtxt = record
      sax : PxmlSAXHandler;
      userData : pointer;
      myDoc : TxmlDocPtr;
      wellFormed : longint;
      replaceEntities : longint;
      version : PxmlChar;
      encoding : PxmlChar;
      standalone : longint;
      html : longint;
      input : TxmlParserInputPtr;
      inputNr : longint;
      inputMax : longint;
      inputTab : PxmlParserInputPtr;
      node : TxmlNodePtr;
      nodeNr : longint;
      nodeMax : longint;
      nodeTab : PxmlNodePtr;
      record_info : longint;
      node_seq : TxmlParserNodeInfoSeq;
      errNo : longint;
      hasExternalSubset : longint;
      hasPErefs : longint;
      external : longint;
      valid : longint;
      validate : longint;
      vctxt : TxmlValidCtxt;
      instate : TxmlParserInputState;
      token : longint;
      directory : Pchar;
      name : PxmlChar;
      nameNr : longint;
      nameMax : longint;
      nameTab : ^PxmlChar;
      nbChars : longint;
      checkIndex : longint;
      keepBlanks : longint;
      disableSAX : longint;
      inSubset : longint;
      intSubName : PxmlChar;
      extSubURI : PxmlChar;
      extSubSystem : PxmlChar;
      space : Plongint;
      spaceNr : longint;
      spaceMax : longint;
      spaceTab : Plongint;
      depth : longint;
      entity : TxmlParserInputPtr;
      charset : longint;
      nodelen : longint;
      nodemem : longint;
      pedantic : longint;
      _private : pointer;
      loadsubset : longint;
      linenumbers : longint;
      catalogs : pointer;
      recovery : longint;
      progressive : longint;
      dict : TxmlDictPtr;
      atts : ^PxmlChar;
      maxatts : longint;
      docdict : longint;
      str_xml : PxmlChar;
      str_xmlns : PxmlChar;
      str_xml_ns : PxmlChar;
      sax2 : longint;
      nsNr : longint;
      nsMax : longint;
      nsTab : ^PxmlChar;
      attallocs : Plongint;
      pushTab : PxmlStartTag;
      attsDefault : TxmlHashTablePtr;
      attsSpecial : TxmlHashTablePtr;
      nsWellFormed : longint;
      options : longint;
      dictNames : longint;
      freeElemsNr : longint;
      freeElems : TxmlNodePtr;
      freeAttrsNr : longint;
      freeAttrs : TxmlAttrPtr;
      lastError : TxmlError;
      parseMode : TxmlParserMode;
      nbentities : dword;
      sizeentities : dword;
      nodeInfo : PxmlParserNodeInfo;
      nodeInfoNr : longint;
      nodeInfoMax : longint;
      nodeInfoTab : PxmlParserNodeInfo;
      input_id : longint;
      sizeentcopy : dword;
    end;

{*
 * xmlSAXLocator:
 *
 * A SAX Locator.
  }
(* Const before type ignored *)
(* Const before type ignored *)
  PxmlSAXLocator = ^TxmlSAXLocator;
  TxmlSAXLocator = record
      getPublicId : function (ctx:pointer):PxmlChar;cdecl;
      getSystemId : function (ctx:pointer):PxmlChar;cdecl;
      getLineNumber : function (ctx:pointer):longint;cdecl;
      getColumnNumber : function (ctx:pointer):longint;cdecl;
    end;

{*
 * xmlSAXHandler:
 *
 * A SAX handler is bunch of callbacks called by the parser when processing
 * of the input generate data or structure information.
  }
{*
 * resolveEntitySAXFunc:
 * @ctx:  the user data (XML parser context)
 * @publicId: The public ID of the entity
 * @systemId: The system ID of the entity
 *
 * Callback:
 * The entity loader, to control the loading of external entities,
 * the application can either:
 *    - override this resolveEntity() callback in the SAX block
 *    - or better use the xmlSetExternalEntityLoader() function to
 *      set up it's own entity resolution routine
 *
 * Returns the xmlParserInputPtr if inlined or NULL for DOM behaviour.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TresolveEntitySAXFunc = function (ctx:pointer; publicId:PxmlChar; systemId:PxmlChar):TxmlParserInputPtr;cdecl;
{*
 * internalSubsetSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name:  the root element name
 * @ExternalID:  the external ID
 * @SystemID:  the SYSTEM ID (e.g. filename or URL)
 *
 * Callback on internal subset declaration.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TinternalSubsetSAXFunc = procedure (ctx:pointer; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar);cdecl;
{*
 * externalSubsetSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name:  the root element name
 * @ExternalID:  the external ID
 * @SystemID:  the SYSTEM ID (e.g. filename or URL)
 *
 * Callback on external subset declaration.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TexternalSubsetSAXFunc = procedure (ctx:pointer; name:PxmlChar; ExternalID:PxmlChar; SystemID:PxmlChar);cdecl;
{*
 * getEntitySAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name: The entity name
 *
 * Get an entity by name.
 *
 * Returns the xmlEntityPtr if found.
  }
(* Const before type ignored *)

  TgetEntitySAXFunc = function (ctx:pointer; name:PxmlChar):TxmlEntityPtr;cdecl;
{*
 * getParameterEntitySAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name: The entity name
 *
 * Get a parameter entity by name.
 *
 * Returns the xmlEntityPtr if found.
  }
(* Const before type ignored *)

  TgetParameterEntitySAXFunc = function (ctx:pointer; name:PxmlChar):TxmlEntityPtr;cdecl;
{*
 * entityDeclSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name:  the entity name
 * @type:  the entity type
 * @publicId: The public ID of the entity
 * @systemId: The system ID of the entity
 * @content: the entity value (without processing).
 *
 * An entity definition has been parsed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TentityDeclSAXFunc = procedure (ctx:pointer; name:PxmlChar; _type:longint; publicId:PxmlChar; systemId:PxmlChar; 
                content:PxmlChar);cdecl;
{*
 * notationDeclSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name: The name of the notation
 * @publicId: The public ID of the entity
 * @systemId: The system ID of the entity
 *
 * What to do when a notation declaration has been parsed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TnotationDeclSAXFunc = procedure (ctx:pointer; name:PxmlChar; publicId:PxmlChar; systemId:PxmlChar);cdecl;
{*
 * attributeDeclSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @elem:  the name of the element
 * @fullname:  the attribute name
 * @type:  the attribute type
 * @def:  the type of default value
 * @defaultValue: the attribute default value
 * @tree:  the tree of enumerated value set
 *
 * An attribute definition has been parsed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TattributeDeclSAXFunc = procedure (ctx:pointer; elem:PxmlChar; fullname:PxmlChar; _type:longint; def:longint; 
                defaultValue:PxmlChar; tree:TxmlEnumerationPtr);cdecl;
{*
 * elementDeclSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name:  the element name
 * @type:  the element type
 * @content: the element value tree
 *
 * An element definition has been parsed.
  }
(* Const before type ignored *)

  TelementDeclSAXFunc = procedure (ctx:pointer; name:PxmlChar; _type:longint; content:TxmlElementContentPtr);cdecl;
{*
 * unparsedEntityDeclSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name: The name of the entity
 * @publicId: The public ID of the entity
 * @systemId: The system ID of the entity
 * @notationName: the name of the notation
 *
 * What to do when an unparsed entity declaration is parsed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TunparsedEntityDeclSAXFunc = procedure (ctx:pointer; name:PxmlChar; publicId:PxmlChar; systemId:PxmlChar; notationName:PxmlChar);cdecl;
{*
 * setDocumentLocatorSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @loc: A SAX Locator
 *
 * Receive the document locator at startup, actually xmlDefaultSAXLocator.
 * Everything is available on the context, so this is useless in our case.
  }

  TsetDocumentLocatorSAXFunc = procedure (ctx:pointer; loc:TxmlSAXLocatorPtr);cdecl;
{*
 * startDocumentSAXFunc:
 * @ctx:  the user data (XML parser context)
 *
 * Called when the document start being processed.
  }

  TstartDocumentSAXFunc = procedure (ctx:pointer);cdecl;
{*
 * endDocumentSAXFunc:
 * @ctx:  the user data (XML parser context)
 *
 * Called when the document end has been detected.
  }

  TendDocumentSAXFunc = procedure (ctx:pointer);cdecl;
{*
 * startElementSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name:  The element name, including namespace prefix
 * @atts:  An array of name/value attributes pairs, NULL terminated
 *
 * Called when an opening tag has been processed.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TstartElementSAXFunc = procedure (ctx:pointer; name:PxmlChar; atts:PPxmlChar);cdecl;
{*
 * endElementSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name:  The element name
 *
 * Called when the end of an element has been detected.
  }
(* Const before type ignored *)

  TendElementSAXFunc = procedure (ctx:pointer; name:PxmlChar);cdecl;
{*
 * attributeSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name:  The attribute name, including namespace prefix
 * @value:  The attribute value
 *
 * Handle an attribute that has been read by the parser.
 * The default handling is to convert the attribute into an
 * DOM subtree and past it in a new xmlAttr element added to
 * the element.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TattributeSAXFunc = procedure (ctx:pointer; name:PxmlChar; value:PxmlChar);cdecl;
{*
 * referenceSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @name:  The entity name
 *
 * Called when an entity reference is detected.
  }
(* Const before type ignored *)

  TreferenceSAXFunc = procedure (ctx:pointer; name:PxmlChar);cdecl;
{*
 * charactersSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @ch:  a xmlChar string
 * @len: the number of xmlChar
 *
 * Receiving some chars from the parser.
  }
(* Const before type ignored *)

  TcharactersSAXFunc = procedure (ctx:pointer; ch:PxmlChar; len:longint);cdecl;
{*
 * ignorableWhitespaceSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @ch:  a xmlChar string
 * @len: the number of xmlChar
 *
 * Receiving some ignorable whitespaces from the parser.
 * UNUSED: by default the DOM building will use characters.
  }
(* Const before type ignored *)

  TignorableWhitespaceSAXFunc = procedure (ctx:pointer; ch:PxmlChar; len:longint);cdecl;
{*
 * processingInstructionSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @target:  the target name
 * @data: the PI data's
 *
 * A processing instruction has been parsed.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TprocessingInstructionSAXFunc = procedure (ctx:pointer; target:PxmlChar; data:PxmlChar);cdecl;
{*
 * commentSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @value:  the comment content
 *
 * A comment has been parsed.
  }
(* Const before type ignored *)

  TcommentSAXFunc = procedure (ctx:pointer; value:PxmlChar);cdecl;
{*
 * cdataBlockSAXFunc:
 * @ctx:  the user data (XML parser context)
 * @value:  The pcdata content
 * @len:  the block length
 *
 * Called when a pcdata block has been parsed.
  }
(* Const before type ignored *)

  TcdataBlockSAXFunc = procedure (ctx:pointer; value:PxmlChar; len:longint);cdecl;
{*
 * warningSAXFunc:
 * @ctx:  an XML parser context
 * @msg:  the message to display/transmit
 * @...:  extra parameters for the message display
 *
 * Display and format a warning messages, callback.
  }
(* Const before type ignored *)

  TwarningSAXFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
{*
 * errorSAXFunc:
 * @ctx:  an XML parser context
 * @msg:  the message to display/transmit
 * @...:  extra parameters for the message display
 *
 * Display and format an error messages, callback.
  }
(* Const before type ignored *)

  TerrorSAXFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
{*
 * fatalErrorSAXFunc:
 * @ctx:  an XML parser context
 * @msg:  the message to display/transmit
 * @...:  extra parameters for the message display
 *
 * Display and format fatal error messages, callback.
 * Note: so far fatalError() SAX callbacks are not used, error()
 *       get all the callbacks for errors.
  }
(* Const before type ignored *)

  TfatalErrorSAXFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
{*
 * isStandaloneSAXFunc:
 * @ctx:  the user data (XML parser context)
 *
 * Is this document tagged standalone?
 *
 * Returns 1 if true
  }

  TisStandaloneSAXFunc = function (ctx:pointer):longint;cdecl;
{*
 * hasInternalSubsetSAXFunc:
 * @ctx:  the user data (XML parser context)
 *
 * Does this document has an internal subset.
 *
 * Returns 1 if true
  }

  ThasInternalSubsetSAXFunc = function (ctx:pointer):longint;cdecl;
{*
 * hasExternalSubsetSAXFunc:
 * @ctx:  the user data (XML parser context)
 *
 * Does this document has an external subset?
 *
 * Returns 1 if true
  }

  ThasExternalSubsetSAXFunc = function (ctx:pointer):longint;cdecl;
{***********************************************************************
 *									*
 *			The SAX version 2 API extensions		*
 *									*
 *********************************************************************** }
{*
 * XML_SAX2_MAGIC:
 *
 * Special constant found in SAX2 blocks initialized fields
  }

const
  XML_SAX2_MAGIC = $DEEDBEAF;  
{*
 * startElementNsSAX2Func:
 * @ctx:  the user data (XML parser context)
 * @localname:  the local name of the element
 * @prefix:  the element namespace prefix if available
 * @URI:  the element namespace name if available
 * @nb_namespaces:  number of namespace definitions on that node
 * @namespaces:  pointer to the array of prefix/URI pairs namespace definitions
 * @nb_attributes:  the number of attributes on that node
 * @nb_defaulted:  the number of defaulted attributes. The defaulted
 *                  ones are at the end of the array
 * @attributes:  pointer to the array of (localname/prefix/URI/value/end)
 *               attribute values.
 *
 * SAX2 callback when an element start has been detected by the parser.
 * It provides the namespace information for the element, as well as
 * the new namespace declarations on the element.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  TstartElementNsSAX2Func = procedure (ctx:pointer; localname:PxmlChar; prefix:PxmlChar; URI:PxmlChar; nb_namespaces:longint; 
                namespaces:PPxmlChar; nb_attributes:longint; nb_defaulted:longint; attributes:PPxmlChar);cdecl;
{*
 * endElementNsSAX2Func:
 * @ctx:  the user data (XML parser context)
 * @localname:  the local name of the element
 * @prefix:  the element namespace prefix if available
 * @URI:  the element namespace name if available
 *
 * SAX2 callback when an element end has been detected by the parser.
 * It provides the namespace information for the element.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TendElementNsSAX2Func = procedure (ctx:pointer; localname:PxmlChar; prefix:PxmlChar; URI:PxmlChar);cdecl;
{ unused error() get all the errors  }
{ The following fields are extensions available only on version 2  }
  PxmlSAXHandler = ^TxmlSAXHandler;
  TxmlSAXHandler = record
      internalSubset : TinternalSubsetSAXFunc;cdecl;
      isStandalone : TisStandaloneSAXFunc;
      hasInternalSubset : ThasInternalSubsetSAXFunc;
      hasExternalSubset : ThasExternalSubsetSAXFunc;
      resolveEntity : TresolveEntitySAXFunc;
      getEntity : TgetEntitySAXFunc;
      entityDecl : TentityDeclSAXFunc;
      notationDecl : TnotationDeclSAXFunc;
      attributeDecl : TattributeDeclSAXFunc;
      elementDecl : TelementDeclSAXFunc;
      unparsedEntityDecl : TunparsedEntityDeclSAXFunc;
      setDocumentLocator : TsetDocumentLocatorSAXFunc;
      startDocument : TstartDocumentSAXFunc;
      endDocument : TendDocumentSAXFunc;
      startElement : TstartElementSAXFunc;
      endElement : TendElementSAXFunc;
      reference : TreferenceSAXFunc;
      characters : TcharactersSAXFunc;
      ignorableWhitespace : TignorableWhitespaceSAXFunc;
      processingInstruction : TprocessingInstructionSAXFunc;
      comment : TcommentSAXFunc;
      warning : TwarningSAXFunc;
      error : TerrorSAXFunc;
      fatalError : TfatalErrorSAXFunc;
      getParameterEntity : TgetParameterEntitySAXFunc;
      cdataBlock : TcdataBlockSAXFunc;
      externalSubset : TexternalSubsetSAXFunc;
      initialized : dword;
      _private : pointer;
      startElementNs : TstartElementNsSAX2Func;
      endElementNs : TendElementNsSAX2Func;
      serror : TxmlStructuredErrorFunc;
    end;

{
 * SAX Version 1
  }

  PxmlSAXHandlerV1Ptr = ^TxmlSAXHandlerV1Ptr;
  TxmlSAXHandlerV1Ptr = PxmlSAXHandlerV1;
{ unused error() get all the errors  }
  PxmlSAXHandlerV1 = ^TxmlSAXHandlerV1;
  TxmlSAXHandlerV1 = record
      internalSubset : TinternalSubsetSAXFunc;
      isStandalone : TisStandaloneSAXFunc;
      hasInternalSubset : ThasInternalSubsetSAXFunc;
      hasExternalSubset : ThasExternalSubsetSAXFunc;
      resolveEntity : TresolveEntitySAXFunc;
      getEntity : TgetEntitySAXFunc;
      entityDecl : TentityDeclSAXFunc;
      notationDecl : TnotationDeclSAXFunc;
      attributeDecl : TattributeDeclSAXFunc;
      elementDecl : TelementDeclSAXFunc;
      unparsedEntityDecl : TunparsedEntityDeclSAXFunc;
      setDocumentLocator : TsetDocumentLocatorSAXFunc;
      startDocument : TstartDocumentSAXFunc;
      endDocument : TendDocumentSAXFunc;
      startElement : TstartElementSAXFunc;
      endElement : TendElementSAXFunc;
      reference : TreferenceSAXFunc;
      characters : TcharactersSAXFunc;
      ignorableWhitespace : TignorableWhitespaceSAXFunc;
      processingInstruction : TprocessingInstructionSAXFunc;
      comment : TcommentSAXFunc;
      warning : TwarningSAXFunc;
      error : TerrorSAXFunc;
      fatalError : TfatalErrorSAXFunc;
      getParameterEntity : TgetParameterEntitySAXFunc;
      cdataBlock : TcdataBlockSAXFunc;
      externalSubset : TexternalSubsetSAXFunc;
      initialized : dword;
    end;

{*
 * xmlExternalEntityLoader:
 * @URL: The System ID of the resource requested
 * @ID: The Public ID of the resource requested
 * @context: the XML parser context
 *
 * External entity loaders types.
 *
 * Returns the entity input parser.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TxmlExternalEntityLoader = function (URL:Pchar; ID:Pchar; context:TxmlParserCtxtPtr):TxmlParserInputPtr;cdecl;
{ C++ end of extern C conditionnal removed }
{$include <libxml/encoding.h>}
{$include <libxml/xmlIO.h>}
{$include <libxml/globals.h>}
{ C++ extern C conditionnal removed }
{
 * Init/Cleanup
  }

procedure xmlInitParser;cdecl;external;
procedure xmlCleanupParser;cdecl;external;
{
 * Input functions
  }
function xmlParserInputRead(in:TxmlParserInputPtr; len:longint):longint;cdecl;external;
function xmlParserInputGrow(in:TxmlParserInputPtr; len:longint):longint;cdecl;external;
{
 * Basic parsing Interfaces
  }
{$ifdef LIBXML_SAX1_ENABLED}
(* Const before type ignored *)
function xmlParseDoc(cur:PxmlChar):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlParseFile(filename:Pchar):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlParseMemory(buffer:Pchar; size:longint):TxmlDocPtr;cdecl;external;
{$endif}
{ LIBXML_SAX1_ENABLED  }

function xmlSubstituteEntitiesDefault(val:longint):longint;cdecl;external;
function xmlKeepBlanksDefault(val:longint):longint;cdecl;external;
procedure xmlStopParser(ctxt:TxmlParserCtxtPtr);cdecl;external;
function xmlPedanticParserDefault(val:longint):longint;cdecl;external;
function xmlLineNumbersDefault(val:longint):longint;cdecl;external;
{$ifdef LIBXML_SAX1_ENABLED}
{
 * Recovery mode
  }
(* Const before type ignored *)
function xmlRecoverDoc(cur:PxmlChar):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlRecoverMemory(buffer:Pchar; size:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlRecoverFile(filename:Pchar):TxmlDocPtr;cdecl;external;
{$endif}
{ LIBXML_SAX1_ENABLED  }
{
 * Less common routines and SAX interfaces
  }

function xmlParseDocument(ctxt:TxmlParserCtxtPtr):longint;cdecl;external;
function xmlParseExtParsedEnt(ctxt:TxmlParserCtxtPtr):longint;cdecl;external;
{$ifdef LIBXML_SAX1_ENABLED}
(* Const before type ignored *)
function xmlSAXUserParseFile(sax:TxmlSAXHandlerPtr; user_data:pointer; filename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlSAXUserParseMemory(sax:TxmlSAXHandlerPtr; user_data:pointer; buffer:Pchar; size:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlSAXParseDoc(sax:TxmlSAXHandlerPtr; cur:PxmlChar; recovery:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlSAXParseMemory(sax:TxmlSAXHandlerPtr; buffer:Pchar; size:longint; recovery:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlSAXParseMemoryWithData(sax:TxmlSAXHandlerPtr; buffer:Pchar; size:longint; recovery:longint; data:pointer):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlSAXParseFile(sax:TxmlSAXHandlerPtr; filename:Pchar; recovery:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlSAXParseFileWithData(sax:TxmlSAXHandlerPtr; filename:Pchar; recovery:longint; data:pointer):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlSAXParseEntity(sax:TxmlSAXHandlerPtr; filename:Pchar):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
function xmlParseEntity(filename:Pchar):TxmlDocPtr;cdecl;external;
{$endif}
{ LIBXML_SAX1_ENABLED  }
{$ifdef LIBXML_VALID_ENABLED}
(* Const before type ignored *)
(* Const before type ignored *)

function xmlSAXParseDTD(sax:TxmlSAXHandlerPtr; ExternalID:PxmlChar; SystemID:PxmlChar):TxmlDtdPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlParseDTD(ExternalID:PxmlChar; SystemID:PxmlChar):TxmlDtdPtr;cdecl;external;
function xmlIOParseDTD(sax:TxmlSAXHandlerPtr; input:TxmlParserInputBufferPtr; enc:TxmlCharEncoding):TxmlDtdPtr;cdecl;external;
{$endif}
{ LIBXML_VALID_ENABLE  }
{$ifdef LIBXML_SAX1_ENABLED}
(* Const before type ignored *)

function xmlParseBalancedChunkMemory(doc:TxmlDocPtr; sax:TxmlSAXHandlerPtr; user_data:pointer; depth:longint; _string:PxmlChar; 
           lst:PxmlNodePtr):longint;cdecl;external;
{$endif}
{ LIBXML_SAX1_ENABLED  }
(* Const before type ignored *)

function xmlParseInNodeContext(node:TxmlNodePtr; data:Pchar; datalen:longint; options:longint; lst:PxmlNodePtr):TxmlParserErrors;cdecl;external;
{$ifdef LIBXML_SAX1_ENABLED}
(* Const before type ignored *)
function xmlParseBalancedChunkMemoryRecover(doc:TxmlDocPtr; sax:TxmlSAXHandlerPtr; user_data:pointer; depth:longint; _string:PxmlChar; 
           lst:PxmlNodePtr; recover:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlParseExternalEntity(doc:TxmlDocPtr; sax:TxmlSAXHandlerPtr; user_data:pointer; depth:longint; URL:PxmlChar; 
           ID:PxmlChar; lst:PxmlNodePtr):longint;cdecl;external;
{$endif}
{ LIBXML_SAX1_ENABLED  }
(* Const before type ignored *)
(* Const before type ignored *)

function xmlParseCtxtExternalEntity(ctx:TxmlParserCtxtPtr; URL:PxmlChar; ID:PxmlChar; lst:PxmlNodePtr):longint;cdecl;external;
{
 * Parser contexts handling.
  }
function xmlNewParserCtxt:TxmlParserCtxtPtr;cdecl;external;
function xmlInitParserCtxt(ctxt:TxmlParserCtxtPtr):longint;cdecl;external;
procedure xmlClearParserCtxt(ctxt:TxmlParserCtxtPtr);cdecl;external;
procedure xmlFreeParserCtxt(ctxt:TxmlParserCtxtPtr);cdecl;external;
{$ifdef LIBXML_SAX1_ENABLED}
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlSetupParserForBuffer(ctxt:TxmlParserCtxtPtr; buffer:PxmlChar; filename:Pchar);cdecl;external;
{$endif}
{ LIBXML_SAX1_ENABLED  }
(* Const before type ignored *)

function xmlCreateDocParserCtxt(cur:PxmlChar):TxmlParserCtxtPtr;cdecl;external;
{$ifdef LIBXML_LEGACY_ENABLED}
{
 * Reading/setting optional parsing features.
  }
(* Const before type ignored *)
function xmlGetFeaturesList(len:Plongint; result:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlGetFeature(ctxt:TxmlParserCtxtPtr; name:Pchar; result:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xmlSetFeature(ctxt:TxmlParserCtxtPtr; name:Pchar; value:pointer):longint;cdecl;external;
{$endif}
{ LIBXML_LEGACY_ENABLED  }
{$ifdef LIBXML_PUSH_ENABLED}
{
 * Interfaces for the Push mode.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function xmlCreatePushParserCtxt(sax:TxmlSAXHandlerPtr; user_data:pointer; chunk:Pchar; size:longint; filename:Pchar):TxmlParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
function xmlParseChunk(ctxt:TxmlParserCtxtPtr; chunk:Pchar; size:longint; terminate:longint):longint;cdecl;external;
{$endif}
{ LIBXML_PUSH_ENABLED  }
{
 * Special I/O mode.
  }

function xmlCreateIOParserCtxt(sax:TxmlSAXHandlerPtr; user_data:pointer; ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; 
           enc:TxmlCharEncoding):TxmlParserCtxtPtr;cdecl;external;
function xmlNewIOInputStream(ctxt:TxmlParserCtxtPtr; input:TxmlParserInputBufferPtr; enc:TxmlCharEncoding):TxmlParserInputPtr;cdecl;external;
{
 * Node infos.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlParserFindNodeInfo(ctxt:TxmlParserCtxtPtr; node:TxmlNodePtr):PxmlParserNodeInfo;cdecl;external;
procedure xmlInitNodeInfoSeq(seq:TxmlParserNodeInfoSeqPtr);cdecl;external;
procedure xmlClearNodeInfoSeq(seq:TxmlParserNodeInfoSeqPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlParserFindNodeInfoIndex(seq:TxmlParserNodeInfoSeqPtr; node:TxmlNodePtr):dword;cdecl;external;
(* Const before type ignored *)
procedure xmlParserAddNodeInfo(ctxt:TxmlParserCtxtPtr; info:TxmlParserNodeInfoPtr);cdecl;external;
{
 * External entities handling actually implemented in xmlIO.
  }
procedure xmlSetExternalEntityLoader(f:TxmlExternalEntityLoader);cdecl;external;
function xmlGetExternalEntityLoader:TxmlExternalEntityLoader;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlLoadExternalEntity(URL:Pchar; ID:Pchar; ctxt:TxmlParserCtxtPtr):TxmlParserInputPtr;cdecl;external;
{
 * Index lookup, actually implemented in the encoding module
  }
function xmlByteConsumed(ctxt:TxmlParserCtxtPtr):longint;cdecl;external;
{
 * New set of simpler/more flexible APIs
  }
{*
 * xmlParserOption:
 *
 * This is the set of XML parser options that can be passed down
 * to the xmlReadDoc() and similar calls.
  }
{ recover on errors  }
{ substitute entities  }
{ load the external subset  }
{ default DTD attributes  }
{ validate with the DTD  }
{ suppress error reports  }
{ suppress warning reports  }
{ pedantic error reporting  }
{ remove blank nodes  }
{ use the SAX1 interface internally  }
{ Implement XInclude substitution   }
{ Forbid network access  }
{ Do not reuse the context dictionary  }
{ remove redundant namespaces declarations  }
{ merge CDATA as text nodes  }
{ do not generate XINCLUDE START/END nodes  }
{ compact small text nodes; no modification of
                                   the tree allowed afterwards (will possibly
				   crash if you try to modify the tree)  }
{ parse using XML-1.0 before update 5  }
{ do not fixup XINCLUDE xml:base uris  }
{ relax any hardcoded limit from the parser  }
{ parse using SAX2 interface before 2.7.0  }
{ ignore internal document encoding hint  }
{ Store big lines numbers in text PSVI field  }
type
  PxmlParserOption = ^TxmlParserOption;
  TxmlParserOption =  Longint;
  Const
    XML_PARSE_RECOVER = 1 shl 0;
    XML_PARSE_NOENT = 1 shl 1;
    XML_PARSE_DTDLOAD = 1 shl 2;
    XML_PARSE_DTDATTR = 1 shl 3;
    XML_PARSE_DTDVALID = 1 shl 4;
    XML_PARSE_NOERROR = 1 shl 5;
    XML_PARSE_NOWARNING = 1 shl 6;
    XML_PARSE_PEDANTIC = 1 shl 7;
    XML_PARSE_NOBLANKS = 1 shl 8;
    XML_PARSE_SAX1 = 1 shl 9;
    XML_PARSE_XINCLUDE = 1 shl 10;
    XML_PARSE_NONET = 1 shl 11;
    XML_PARSE_NODICT = 1 shl 12;
    XML_PARSE_NSCLEAN = 1 shl 13;
    XML_PARSE_NOCDATA = 1 shl 14;
    XML_PARSE_NOXINCNODE = 1 shl 15;
    XML_PARSE_COMPACT = 1 shl 16;
    XML_PARSE_OLD10 = 1 shl 17;
    XML_PARSE_NOBASEFIX = 1 shl 18;
    XML_PARSE_HUGE = 1 shl 19;
    XML_PARSE_OLDSAX = 1 shl 20;
    XML_PARSE_IGNORE_ENC = 1 shl 21;
    XML_PARSE_BIG_LINES = 1 shl 22;
;

procedure xmlCtxtReset(ctxt:TxmlParserCtxtPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCtxtResetPush(ctxt:TxmlParserCtxtPtr; chunk:Pchar; size:longint; filename:Pchar; encoding:Pchar):longint;cdecl;external;
function xmlCtxtUseOptions(ctxt:TxmlParserCtxtPtr; options:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReadDoc(cur:PxmlChar; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReadFile(URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReadMemory(buffer:Pchar; size:longint; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReadFd(fd:longint; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlReadIO(ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; URL:Pchar; encoding:Pchar; 
           options:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCtxtReadDoc(ctxt:TxmlParserCtxtPtr; cur:PxmlChar; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCtxtReadFile(ctxt:TxmlParserCtxtPtr; filename:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCtxtReadMemory(ctxt:TxmlParserCtxtPtr; buffer:Pchar; size:longint; URL:Pchar; encoding:Pchar; 
           options:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCtxtReadFd(ctxt:TxmlParserCtxtPtr; fd:longint; URL:Pchar; encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCtxtReadIO(ctxt:TxmlParserCtxtPtr; ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; URL:Pchar; 
           encoding:Pchar; options:longint):TxmlDocPtr;cdecl;external;
{
 * Library wide options
  }
{*
 * xmlFeature:
 *
 * Used to examine the existence of features that can be enabled
 * or disabled at compile-time.
 * They used to be called XML_FEATURE_xxx but this clashed with Expat
  }
{ just to be sure of allocation size  }
type
  PxmlFeature = ^TxmlFeature;
  TxmlFeature =  Longint;
  Const
    XML_WITH_THREAD = 1;
    XML_WITH_TREE = 2;
    XML_WITH_OUTPUT = 3;
    XML_WITH_PUSH = 4;
    XML_WITH_READER = 5;
    XML_WITH_PATTERN = 6;
    XML_WITH_WRITER = 7;
    XML_WITH_SAX1 = 8;
    XML_WITH_FTP = 9;
    XML_WITH_HTTP = 10;
    XML_WITH_VALID = 11;
    XML_WITH_HTML = 12;
    XML_WITH_LEGACY = 13;
    XML_WITH_C14N = 14;
    XML_WITH_CATALOG = 15;
    XML_WITH_XPATH = 16;
    XML_WITH_XPTR = 17;
    XML_WITH_XINCLUDE = 18;
    XML_WITH_ICONV = 19;
    XML_WITH_ISO8859X = 20;
    XML_WITH_UNICODE = 21;
    XML_WITH_REGEXP = 22;
    XML_WITH_AUTOMATA = 23;
    XML_WITH_EXPR = 24;
    XML_WITH_SCHEMAS = 25;
    XML_WITH_SCHEMATRON = 26;
    XML_WITH_MODULES = 27;
    XML_WITH_DEBUG = 28;
    XML_WITH_DEBUG_MEM = 29;
    XML_WITH_DEBUG_RUN = 30;
    XML_WITH_ZLIB = 31;
    XML_WITH_ICU = 32;
    XML_WITH_LZMA = 33;
    XML_WITH_NONE = 99999;
;

function xmlHasFeature(feature:TxmlFeature):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_PARSER_H__  }

implementation


end.
