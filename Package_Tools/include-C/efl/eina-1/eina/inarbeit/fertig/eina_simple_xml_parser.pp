
unit eina_simple_xml_parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_simple_xml_parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_simple_xml_parser.h
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
PEina_Inlist  = ^Eina_Inlist;
PEina_Simple_XML_Attribute  = ^Eina_Simple_XML_Attribute;
PEina_Simple_XML_Node  = ^Eina_Simple_XML_Node;
PEina_Simple_XML_Node_CData  = ^Eina_Simple_XML_Node_CData;
PEina_Simple_XML_Node_Comment  = ^Eina_Simple_XML_Node_Comment;
PEina_Simple_XML_Node_Data  = ^Eina_Simple_XML_Node_Data;
PEina_Simple_XML_Node_Doctype  = ^Eina_Simple_XML_Node_Doctype;
PEina_Simple_XML_Node_Doctype_Child  = ^Eina_Simple_XML_Node_Doctype_Child;
PEina_Simple_XML_Node_Processing  = ^Eina_Simple_XML_Node_Processing;
PEina_Simple_XML_Node_Root  = ^Eina_Simple_XML_Node_Root;
PEina_Simple_XML_Node_Tag  = ^Eina_Simple_XML_Node_Tag;
PEina_Simple_XML_Node_Type  = ^Eina_Simple_XML_Node_Type;
PEina_Simple_XML_Type  = ^Eina_Simple_XML_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2011 Gustavo Sverzut Barbieri
 *                    Cedric Bail
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_SIMPLE_XML_H_}
{$define EINA_SIMPLE_XML_H_}
{$include "eina_config.h"}
{$include "eina_types.h"}
{$include "eina_magic.h"}
{$include "eina_inlist.h"}
{*
 * @page eina_simple_xml_parser_example_01_page
 * @dontinclude eina_simple_xml_parser_01.c
 *
 * We are going to parse an XML sample file and print the data to stdout.
 *
 * Like all examples we start by including Eina:
 * @skipline #include
 *
 * We declare 2 booleans to keep track of tags:
 * @skipline tag_login
 * @skipline tag_message
 *
 * Here we declare some variables and initialize eina:
 * @until eina_init
 *
 * We fill buffer with the XML data from chat.xml:
 * @until fread
 *
 * We will use an Eina_Array to store the data:
 * @skipline array
 *
 * Here we call eina_simple_xml_parse(). We pass the buffer with data, its size,
 * we ask to strip leading and trailing whitespace, we give the callback
 * function and the array to store the formatted data:
 * @until _xml_tag_cb
 *
 * This will loop over the array and print the data using _print callback:
 * @skipline foreach
 *
 * This is the main XML parser callback, it will check for known tags and get
 * the corresponding values:
 * @skip static
 * @until str
 *
 * We first check for opening tag:
 * @skipline type
 *
 * If we know the tag should have attributes, then we find them using
 * eina_simple_xml_tag_attributes_find() and give them to another parsing
 * function using eina_simple_xml_attributes_parse():
 * @until _xml_attr_cb
 *
 * We check for other known tags:
 * @until tag_message
 *
 * We then check data for corresponding tag:
 * @until EINA_FALSE
 *
 * We are doing the formatting in same time and put all the \<post\> children
 * in str.
 * @until EINA_FALSE
 *
 * Finally, we store our string in the array:
 * @skipline push
 *
 * This is the callback to parse the attributes, we check for key name and keep
 * the value:
 * @skip static
 * @until snprintf
 *
 * This is the function that simply print items of the array:
 * @until EINA_TRUE
 *
 * You can see the full source code
 * @ref eina_simple_xml_parser_example_01 "here".
  }
{*
 * @page eina_simple_xml_parser_example_01
 * @include eina_simple_xml_parser_01.c
 * @example eina_simple_xml_parser_01.c
  }
{*
 * @defgroup Eina_Simple_XML_Group Simple_XML
 *
 * Simplistic relaxed SAX-like XML parser.
 *
 * This parser is far from being compliant with XML standard, but will
 * do for most XMLs out there. If you know that your format is simple
 * and will not vary in future with strange corner cases, then you can
 * use it safely.
 *
 * The parser is SAX like, that is, it will tokenize contents and call
 * you back so you can take some action. No contents are allocated
 * during this parser work and it's not recursive, so you can use it
 * with a very large document without worries.
 *
 * It will not validate the document anyhow, neither it will create a
 * tree hierarchy. That's up to you.
 *
 * Accordingly to XML, open tags may contain attributes. This parser
 * will not tokenize this. If you want you can use
 * eina_simple_xml_tag_attributes_find() and then
 * eina_simple_xml_attributes_parse().
 *
 * For more information, see
 * @ref eina_simple_xml_parser_example_01_page "this example".
 * @ingroup Eina_Tools_Group Tools
 *
 * @
  }
type
  TEina_Simple_XML_Node_Tag = TEina_Simple_XML_Node_Root;
  TEina_Simple_XML_Node_Data = TEina_Simple_XML_Node_CData;
  TEina_Simple_XML_Node_Data = TEina_Simple_XML_Node_Processing;
  TEina_Simple_XML_Node_Data = TEina_Simple_XML_Node_Doctype;
  TEina_Simple_XML_Node_Data = TEina_Simple_XML_Node_Doctype_Child;
{*< @since 1.8  }
  TEina_Simple_XML_Node_Data = TEina_Simple_XML_Node_Comment;
(* Const before type ignored *)
(* Const before type ignored *)
  PEina_Simple_XML_Attribute = ^TEina_Simple_XML_Attribute;
  TEina_Simple_XML_Attribute = record
      __in_list : TEina_Inlist;
      parent : PEina_Simple_XML_Node_Tag;
      key : Pchar;
      value : Pchar;
    end;

{*< @since 1.8  }

  PEina_Simple_XML_Node_Type = ^TEina_Simple_XML_Node_Type;
  TEina_Simple_XML_Node_Type =  Longint;
  Const
    EINA_SIMPLE_XML_NODE_ROOT = 0;
    EINA_SIMPLE_XML_NODE_TAG = 1;
    EINA_SIMPLE_XML_NODE_DATA = 2;
    EINA_SIMPLE_XML_NODE_CDATA = 3;
    EINA_SIMPLE_XML_NODE_PROCESSING = 4;
    EINA_SIMPLE_XML_NODE_DOCTYPE = 5;
    EINA_SIMPLE_XML_NODE_COMMENT = 6;
    EINA_SIMPLE_XML_NODE_DOCTYPE_CHILD = 7;
;
type
  PEina_Simple_XML_Node = ^TEina_Simple_XML_Node;
  TEina_Simple_XML_Node = record
      __in_list : TEina_Inlist;
      parent : PEina_Simple_XML_Node_Tag;
      _type : TEina_Simple_XML_Node_Type;
    end;

(* Const before type ignored *)
  PEina_Simple_XML_Node_Tag = ^TEina_Simple_XML_Node_Tag;
  TEina_Simple_XML_Node_Tag = record
      base : TEina_Simple_XML_Node;
      children : PEina_Inlist;
      attributes : PEina_Inlist;
      name : Pchar;
    end;

  PEina_Simple_XML_Node_Data = ^TEina_Simple_XML_Node_Data;
  TEina_Simple_XML_Node_Data = record
      base : TEina_Simple_XML_Node;
      length : Tsize_t;
      data : Pchar;
    end;

{*
 * @typedef _Eina_Simple_XML_Type
 * a simple XML type.
  }
{!< \<tag attribute="value"\>  }
{!< \<tag attribute="value" /\>  }
{!< \</tag\>  }
{!< tag text data  }
{!< \<![CDATA[something]]\>  }
{!< error contents  }
{!< \<?xml ... ?\> \<?php .. ?\>  }
{!< \<!DOCTYPE html  }
{!< \<!-- something --\>  }
{!< whatever is ignored by parser, like whitespace  }
{!< \<!DOCTYPE_CHILD @since 1.8  }

  PEina_Simple_XML_Type = ^TEina_Simple_XML_Type;
  TEina_Simple_XML_Type =  Longint;
  Const
    EINA_SIMPLE_XML_OPEN = 0;
    EINA_SIMPLE_XML_OPEN_EMPTY = 1;
    EINA_SIMPLE_XML_CLOSE = 2;
    EINA_SIMPLE_XML_DATA = 3;
    EINA_SIMPLE_XML_CDATA = 4;
    EINA_SIMPLE_XML_ERROR = 5;
    EINA_SIMPLE_XML_PROCESSING = 6;
    EINA_SIMPLE_XML_DOCTYPE = 7;
    EINA_SIMPLE_XML_COMMENT = 8;
    EINA_SIMPLE_XML_IGNORED = 9;
    EINA_SIMPLE_XML_DOCTYPE_CHILD = 10;
;
(* Const before type ignored *)
type

  TEina_Simple_XML_Cb = function (data:pointer; _type:TEina_Simple_XML_Type; content:Pchar; offset:dword; length:dword):TEina_Bool;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  TEina_Simple_XML_Attribute_Cb = function (data:pointer; key:Pchar; value:Pchar):TEina_Bool;cdecl;
{*
 * @brief Parses a section of XML string text
 *
 * @param[in] buf The input string. May not contain \0 terminator.
 * @param[in] buflen The input string size.
 * @param[in] strip Whenever this parser should strip leading and trailing
 *            whitespace. These whitespace will still be issued, but as type
 *            #EINA_SIMPLE_XML_IGNORED.
 * @param[in] func What to call back while parse to do some action.  The
 *            first parameter is the given user @a data, the second is the
 *            token type, the third is the pointer to content start (it's
 *            not a NULL terminated string!), the fourth is where this
 *            content is located inside @a buf (does not include tag
 *            start, for instance "<!DOCTYPE value>" the offset points at
 *            "value"), the fifth is the size of the content. Whenever this
 *            function return #EINA_FALSE the parser will abort.
 * @param[in] data What to give as context to @a func.
 * @return #EINA_TRUE on success, or #EINA_FALSE if it was aborted by user or
 * parsing error.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eina_simple_xml_parse(buf:Pchar; buflen:dword; strip:TEina_Bool; func:TEina_Simple_XML_Cb; data:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Given the contents of a tag, find where the attributes start.
 *
 * @param[in] buf The input string. May not contain \0 terminator.
 * @param[in] buflen The input string size.
 * @return Pointer to the start of attributes, it can be used
 *         to feed eina_simple_xml_attributes_parse(). @c NULL is returned
 *         if no attributes were found.
 *
 * The tag contents is returned by eina_simple_xml_parse() when
 * type is #EINA_SIMPLE_XML_OPEN or #EINA_SIMPLE_XML_OPEN_EMPTY.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_simple_xml_tag_attributes_find(buf:Pchar; buflen:dword):Pchar;cdecl;external;
{*
 * @brief Given a buffer with xml attributes, parse them to key=value pairs.
 *
 * @param[in] buf The input string. May not contain \0 terminator.
 * @param[in] buflen The input string size.
 * @param[in] func What to call back while parse to do some action. The
 *            first parameter is the given user @a data, the second is the
 *            key (null-terminated) and the last is the value (null
 *            terminated). These strings should not be modified and
 *            reference is just valid until the function return.
 * @param[in] data Data to pass to the callback function.
 *
 * @return #EINA_TRUE on success, or #EINA_FALSE if it was aborted by user or
 *         parsing error.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_simple_xml_attributes_parse(buf:Pchar; buflen:dword; func:TEina_Simple_XML_Attribute_Cb; data:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Given a buffer with the xml value of an attributes, parse them to key:value pairs.
 *
 * @param[in] buf the input string. Need to contain \0 terminator.
 * @param[in] func what to call back while parse to do some action. The
 *            first parameter is the given user @a data, the second is the
 *            key (null-terminated) and the last is the value (null
 *            terminated). These strings should not be modified and
 *            reference is just valid until the function return.
 * @param[in] data data to pass to the callback function.
 *
 * @return #EINA_TRUE on success or #EINA_FALSE if it was aborted by user or
 *          parsing error.
 *
 * @since 1.14
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_simple_xml_attribute_w3c_parse(buf:Pchar; func:TEina_Simple_XML_Attribute_Cb; data:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Creates (and appends) new attribute to tag.
 *
 * @param[in,out] parent If provided, will be set in the resulting
 *                structure as well as the attribute will be appended to
 *                attributes list.
 * @param[in] key Null-terminated string. Must not be @c NULL.
 * @param[in] value Null-terminated string. If @c NULL, the empty string will be used.
 *
 * @return Newly allocated memory or @c NULL on error. This memory should be
 *         released with eina_simple_xml_attribute_free() or indirectly
 *         with eina_simple_xml_node_tag_free().
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_simple_xml_attribute_new(parent:PEina_Simple_XML_Node_Tag; key:Pchar; value:Pchar):PEina_Simple_XML_Attribute;cdecl;external;
{*
 * @brief Removes attribute from parent and deletes it.
 *
 * @param[in] attr attribute to release memory.
  }
procedure eina_simple_xml_attribute_free(attr:PEina_Simple_XML_Attribute);cdecl;external;
{*
 * @brief Creates new tag. If parent is provided, it is automatically appended.
 *
 * @param[in] parent If provided, will be set in the resulting structure
 *            as well as the tag will be appended to children list.
 * @param[in] name Null-terminated string. Must not be @c NULL.
 *
 * @return Newly allocated memory or @c NULL on error. This memory should be
 *         released with eina_simple_xml_node_tag_free() or indirectly
 *         with eina_simple_xml_node_tag_free() of the parent.
  }
(* Const before type ignored *)
function eina_simple_xml_node_tag_new(parent:PEina_Simple_XML_Node_Tag; name:Pchar):PEina_Simple_XML_Node_Tag;cdecl;external;
{*
 * @brief Removes tag from parent and deletes it.
 *
 * @param[in] tag to release memory.
  }
procedure eina_simple_xml_node_tag_free(tag:PEina_Simple_XML_Node_Tag);cdecl;external;
{*
 * @brief Creates new data. If parent is provided, it is automatically appended.
 *
 * @param[in,out] parent If provided, will be set in the resulting structure
 *                as well as the data will be appended to children list.
 * @param[in] contents String to be used. Must not be @c NULL.
 * @param[in] length Size in bytes of @a contents.
 *
 * @return Newly allocated memory or NULL on error. This memory should be
 *         released with eina_simple_xml_node_data_free() or indirectly
 *         with eina_simple_xml_node_tag_free() of the parent.
  }
(* Const before type ignored *)
function eina_simple_xml_node_data_new(parent:PEina_Simple_XML_Node_Tag; contents:Pchar; length:Tsize_t):PEina_Simple_XML_Node_Data;cdecl;external;
{*
 * @brief Removes data from parent and deletes it.
 *
 * @param[in] node to release memory.
  }
procedure eina_simple_xml_node_data_free(node:PEina_Simple_XML_Node_Data);cdecl;external;
{*
 * @brief Creates new cdata. If parent is provided, it is automatically appended.
 *
 * @param[in,out] parent If provided, will be set in the resulting structure
 *        as well as the cdata will be appended to children list.
 * @param[in] contents String to be used. Must not be @c NULL.
 * @param[in] length Size in bytes of @a content.
 *
 * @return Newly allocated memory or @c NULL on error. This memory should be
 *         released with eina_simple_xml_node_cdata_free() or indirectly
 *         with eina_simple_xml_node_tag_free() of the parent.
  }
(* Const before type ignored *)
function eina_simple_xml_node_cdata_new(parent:PEina_Simple_XML_Node_Tag; contents:Pchar; length:Tsize_t):PEina_Simple_XML_Node_CData;cdecl;external;
{*
 * @brief Removes cdata from parent and deletes it.
 *
 * @param[in] node to release memory.
  }
procedure eina_simple_xml_node_cdata_free(node:PEina_Simple_XML_Node_Data);cdecl;external;
{*
 * @brief Creates new doctype child. If parent is provided, it is automatically appended.
 *
 * @param[in,out] parent If provided, will be set in the resulting structure
 *                as well as the doctype child will be appended to children list.
 * @param[in] contents String to be used. Must not be @c NULL.
 * @param[in] length size in bytes of @a content.
 *
 * @return Newly allocated memory or @c NULL on error. This memory should be
 *         released with eina_simple_xml_node_doctype_child_free() or indirectly
 *         with eina_simple_xml_node_tag_free() of the parent.
 *
 * @since 1.8
  }
(* Const before type ignored *)
function eina_simple_xml_node_doctype_child_new(parent:PEina_Simple_XML_Node_Tag; contents:Pchar; length:Tsize_t):PEina_Simple_XML_Node_Doctype_Child;cdecl;external;
{*
 * @brief Removes doctype child from parent and deletes it.
 *
 * @param[in] node to release memory.
 *
 * @since 1.8
  }
procedure eina_simple_xml_node_doctype_child_free(node:PEina_Simple_XML_Node_Data);cdecl;external;
{*
 * @brief Creates new processing. If parent is provided, it is automatically appended.
 *
 * @param[in,out] parent If provided, will be set in the resulting structure
 *                as well as the processing will be appended to children list.
 * @param[in] contents String to be used. Must not be @c NULL.
 * @param[in] length Size in bytes of @a contents.
 *
 * @return Newly allocated memory or @c NULL on error. This memory should be
 *         released with eina_simple_xml_node_processing_free() or indirectly
 *         with eina_simple_xml_node_tag_free() of the parent.
  }
(* Const before type ignored *)
function eina_simple_xml_node_processing_new(parent:PEina_Simple_XML_Node_Tag; contents:Pchar; length:Tsize_t):PEina_Simple_XML_Node_Processing;cdecl;external;
{*
 * @brief Removes processing from parent and deletes it.
 *
 * @param[in] node processing to release memory.
  }
procedure eina_simple_xml_node_processing_free(node:PEina_Simple_XML_Node_Data);cdecl;external;
{*
 * @brief Creates new doctype. If parent is provided, it is automatically appended.
 *
 * @param[in,out] parent If provided, will be set in the resulting structure
 *                as well as the doctype will be appended to children list.
 * @param[in] contents String to be used. Must not be @c NULL.
 * @param[in] length Size in bytes of @a contents.
 *
 * @return Newly allocated memory or @c NULL on error. This memory should be
 *         released with eina_simple_xml_node_doctype_free() or indirectly
 *         with eina_simple_xml_node_tag_free() of the parent.
  }
(* Const before type ignored *)
function eina_simple_xml_node_doctype_new(parent:PEina_Simple_XML_Node_Tag; contents:Pchar; length:Tsize_t):PEina_Simple_XML_Node_Doctype;cdecl;external;
{*
 * @brief Removes doctype from parent and deletes it.
 *
 * @param[in] node doctype to release memory.
  }
procedure eina_simple_xml_node_doctype_free(node:PEina_Simple_XML_Node_Data);cdecl;external;
{*
 * @brief Creates new comment. If parent is provided, it is automatically appended.
 *
 * @param[in,out] parent If provided, will be set in the resulting structure
 *                as well as the comment will be appended to children list.
 * @param[in] contents String to be used. Must not be @c NULL.
 * @param[in] length Size in bytes of @a contents.
 *
 * @return Newly allocated memory or @c NULL on error. This memory should be
 *         released with eina_simple_xml_node_comment_free() or indirectly
 *         with eina_simple_xml_node_tag_free() of the parent.
  }
(* Const before type ignored *)
function eina_simple_xml_node_comment_new(parent:PEina_Simple_XML_Node_Tag; contents:Pchar; length:Tsize_t):PEina_Simple_XML_Node_Comment;cdecl;external;
{*
 * @brief Removes comment from parent and deletes it.
 *
 * @param[in] node comment to release memory.
  }
procedure eina_simple_xml_node_comment_free(node:PEina_Simple_XML_Node_Data);cdecl;external;
{*
 * @brief Loads a XML node tree based on the given string.
 *
 * @param[in] buf The input string. May not contain \0 terminator.
 * @param[in] buflen The input string size.
 * @param[in] strip Whenever this parser should strip leading and trailing
 *            whitespace.
 *
 * @return Document root with children tags, or @c NULL on errors.
 *         Document with errors may return partial tree instead of @c NULL,
 *         we'll do our best to avoid returning nothing.
  }
(* Const before type ignored *)
function eina_simple_xml_node_load(buf:Pchar; buflen:dword; strip:TEina_Bool):PEina_Simple_XML_Node_Root;cdecl;external;
{*
 * @brief Frees node tree build with eina_simple_xml_node_load()
 *
 * @param[in] root Memory returned by eina_simple_xml_node_load()
  }
procedure eina_simple_xml_node_root_free(root:PEina_Simple_XML_Node_Root);cdecl;external;
{*
 * @brief Converts the node tree under the given element to a XML string.
 *
 * @param[in,out] node The base node to convert.
 * @param[in] indent Indentation string, or @c NULL to disable it.
 *
 * @return @c NULL on errors, or a newly allocated string on success.
  }
(* Const before type ignored *)
function eina_simple_xml_node_dump(node:PEina_Simple_XML_Node; indent:Pchar):Pchar;cdecl;external;
{*
 * @
  }
{$endif}
{ EINA_SIMPLE_XML_H_  }

implementation


end.
