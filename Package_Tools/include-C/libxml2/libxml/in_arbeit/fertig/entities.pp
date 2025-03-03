
unit entities;
interface

{
  Automatically converted by H2Pas 1.0.0 from entities.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    entities.h
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
PxmlDoc  = ^xmlDoc;
PxmlDtd  = ^xmlDtd;
PxmlEntitiesTable  = ^xmlEntitiesTable;
PxmlEntitiesTablePtr  = ^xmlEntitiesTablePtr;
PxmlEntity  = ^xmlEntity;
PxmlEntityType  = ^xmlEntityType;
PxmlNode  = ^xmlNode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: interface for the XML entities handling
 * Description: this module provides some of the entity API needed
 *              for the parser and applications.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_ENTITIES_H__}
{$define __XML_ENTITIES_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{ C++ extern C conditionnal removed }
{
 * The different valid entity types.
  }
type
  PxmlEntityType = ^TxmlEntityType;
  TxmlEntityType =  Longint;
  Const
    XML_INTERNAL_GENERAL_ENTITY = 1;
    XML_EXTERNAL_GENERAL_PARSED_ENTITY = 2;
    XML_EXTERNAL_GENERAL_UNPARSED_ENTITY = 3;
    XML_INTERNAL_PARAMETER_ENTITY = 4;
    XML_EXTERNAL_PARAMETER_ENTITY = 5;
    XML_INTERNAL_PREDEFINED_ENTITY = 6;
;
{
 * An unit of storage for an entity, contains the string, the value
 * and the linkind data needed for the linking in the hash table.
  }
{ application data  }
{ XML_ENTITY_DECL, must be second !  }
(* Const before type ignored *)
{ Entity name  }
{ First child link  }
{ Last child link  }
{ -> DTD  }
{ next sibling link   }
{ previous sibling link   }
{ the containing document  }
{ content without ref substitution  }
{ content or ndata if unparsed  }
{ the content length  }
{ The entity type  }
(* Const before type ignored *)
{ External identifier for PUBLIC  }
(* Const before type ignored *)
{ URI for a SYSTEM or PUBLIC Entity  }
{ unused  }
(* Const before type ignored *)
{ the full URI as computed  }
{ does the entity own the childrens  }
{ was the entity content checked  }
{ this is also used to count entities
					 * references done from that entity
					 * and if it contains '<'  }
type
  PxmlEntity = ^TxmlEntity;
  TxmlEntity = record
      _private : pointer;
      _type : TxmlElementType;
      name : PxmlChar;
      children : PxmlNode;
      last : PxmlNode;
      parent : PxmlDtd;
      next : PxmlNode;
      prev : PxmlNode;
      doc : PxmlDoc;
      orig : PxmlChar;
      content : PxmlChar;
      length : longint;
      etype : TxmlEntityType;
      ExternalID : PxmlChar;
      SystemID : PxmlChar;
      nexte : PxmlEntity;
      URI : PxmlChar;
      owner : longint;
      checked : longint;
    end;

{
 * All entities are stored in an hash table.
 * There is 2 separate hash tables for global and parameter entities.
  }
  TxmlHashTable = TxmlEntitiesTable;

  PxmlEntitiesTablePtr = ^TxmlEntitiesTablePtr;
  TxmlEntitiesTablePtr = PxmlEntitiesTable;
{
 * External functions:
  }
{$ifdef LIBXML_LEGACY_ENABLED}

procedure xmlInitializePredefinedEntities;cdecl;external;
{$endif}
{ LIBXML_LEGACY_ENABLED  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function xmlNewEntity(doc:TxmlDocPtr; name:PxmlChar; _type:longint; ExternalID:PxmlChar; SystemID:PxmlChar; 
           content:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlAddDocEntity(doc:TxmlDocPtr; name:PxmlChar; _type:longint; ExternalID:PxmlChar; SystemID:PxmlChar; 
           content:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlAddDtdEntity(doc:TxmlDocPtr; name:PxmlChar; _type:longint; ExternalID:PxmlChar; SystemID:PxmlChar; 
           content:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
function xmlGetPredefinedEntity(name:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlGetDocEntity(doc:PxmlDoc; name:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
function xmlGetDtdEntity(doc:TxmlDocPtr; name:PxmlChar):TxmlEntityPtr;cdecl;external;
(* Const before type ignored *)
function xmlGetParameterEntity(doc:TxmlDocPtr; name:PxmlChar):TxmlEntityPtr;cdecl;external;
{$ifdef LIBXML_LEGACY_ENABLED}
(* Const before type ignored *)
(* Const before type ignored *)
function xmlEncodeEntities(doc:TxmlDocPtr; input:PxmlChar):PxmlChar;cdecl;external;
{$endif}
{ LIBXML_LEGACY_ENABLED  }
(* Const before type ignored *)

function xmlEncodeEntitiesReentrant(doc:TxmlDocPtr; input:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlEncodeSpecialChars(doc:PxmlDoc; input:PxmlChar):PxmlChar;cdecl;external;
function xmlCreateEntitiesTable:TxmlEntitiesTablePtr;cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
function xmlCopyEntitiesTable(table:TxmlEntitiesTablePtr):TxmlEntitiesTablePtr;cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }

procedure xmlFreeEntitiesTable(table:TxmlEntitiesTablePtr);cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
procedure xmlDumpEntitiesTable(buf:TxmlBufferPtr; table:TxmlEntitiesTablePtr);cdecl;external;
procedure xmlDumpEntityDecl(buf:TxmlBufferPtr; ent:TxmlEntityPtr);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{$ifdef LIBXML_LEGACY_ENABLED}

procedure xmlCleanupPredefinedEntities;cdecl;external;
{$endif}
{ LIBXML_LEGACY_ENABLED  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_ENTITIES_H__  }

implementation


end.
