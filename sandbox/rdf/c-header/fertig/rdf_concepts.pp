
unit rdf_concepts;
interface

{
  Automatically converted by H2Pas 1.0.0 from rdf_concepts.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rdf_concepts.h
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
Plibrdf_concepts_index  = ^librdf_concepts_index;
Plibrdf_node  = ^librdf_node;
Plibrdf_uri  = ^librdf_uri;
Plibrdf_world  = ^librdf_world;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_concepts.h - Definitions of RDF concept URIs and nodes
 *
 * Copyright (C) 2000-2008, David Beckett http://www.dajobe.org/
 * Copyright (C) 2000-2004, University of Bristol, UK http://www.bristol.ac.uk/
 * 
 * This package is Free Software and part of Redland http://librdf.org/
 * 
 * It is licensed under the following three licenses as alternatives:
 *   1. GNU Lesser General Public License (LGPL) V2.1 or any newer version
 *   2. GNU General Public License (GPL) V2 or any newer version
 *   3. Apache License, V2.0 or any newer version
 * 
 * You may not use this file except in compliance with at least one of
 * the above three licenses.
 * 
 * See LICENSE.html or LICENSE.txt at the top of this package for the
 * complete terms and further detail along with the license texts for
 * the licenses in COPYING.LIB, COPYING and LICENSE-2.0.txt respectively.
 * 
 * 
  }
{$ifndef LIBRDF_CONCEPTS_H}
{$define LIBRDF_CONCEPTS_H}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_concepts_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ RDF Schema concepts defined in prose at
   *   http://www.w3.org/TR/2000/CR-rdf-schema-20000327/
   * and in RDF Schema form at 
   *   http://www.w3.org/2000/01/rdf-schema
    }
{ first entry from schema namespace  }
type
  Plibrdf_concepts_index = ^Tlibrdf_concepts_index;
  Tlibrdf_concepts_index =  Longint;
  Const
    LIBRDF_CONCEPT_MS_Alt = 0;
    LIBRDF_CONCEPT_MS_Bag = 1;
    LIBRDF_CONCEPT_MS_Property = 2;
    LIBRDF_CONCEPT_MS_Seq = 3;
    LIBRDF_CONCEPT_MS_Statement = 4;
    LIBRDF_CONCEPT_MS_object = 5;
    LIBRDF_CONCEPT_MS_predicate = 6;
    LIBRDF_CONCEPT_MS_subject = 7;
    LIBRDF_CONCEPT_MS_type = 8;
    LIBRDF_CONCEPT_MS_value = 9;
    LIBRDF_CONCEPT_MS_li = 10;
    LIBRDF_CONCEPT_MS_RDF = 11;
    LIBRDF_CONCEPT_MS_Description = 12;
    LIBRDF_CONCEPT_MS_aboutEach = 13;
    LIBRDF_CONCEPT_MS_aboutEachPrefix = 14;
    LIBRDF_CONCEPT_RS_nodeID = 15;
    LIBRDF_CONCEPT_RS_List = 16;
    LIBRDF_CONCEPT_RS_first = 17;
    LIBRDF_CONCEPT_RS_rest = 18;
    LIBRDF_CONCEPT_RS_nil = 19;
    LIBRDF_CONCEPT_RS_XMLLiteral = 20;
    LIBRDF_CONCEPT_S_Class = 21;
    LIBRDF_CONCEPT_S_ConstraintProperty = 22;
    LIBRDF_CONCEPT_S_ConstraintResource = 23;
    LIBRDF_CONCEPT_S_Container = 24;
    LIBRDF_CONCEPT_S_ContainerMembershipProperty = 25;
    LIBRDF_CONCEPT_S_Literal = 26;
    LIBRDF_CONCEPT_S_Resource = 27;
    LIBRDF_CONCEPT_S_comment = 28;
    LIBRDF_CONCEPT_S_domain = 29;
    LIBRDF_CONCEPT_S_isDefinedBy = 30;
    LIBRDF_CONCEPT_S_label = 31;
    LIBRDF_CONCEPT_S_range = 32;
    LIBRDF_CONCEPT_S_seeAlso = 33;
    LIBRDF_CONCEPT_S_subClassOf = 34;
    LIBRDF_CONCEPT_S_subPropertyOf = 35;
    LIBRDF_CONCEPT_FIRST_S_ID = LIBRDF_CONCEPT_S_Class;
    LIBRDF_CONCEPT_LAST_S_ID = LIBRDF_CONCEPT_S_subPropertyOf;
    LIBRDF_CONCEPT_RDF11_HTML = (LIBRDF_CONCEPT_S_subPropertyOf)+1;
    LIBRDF_CONCEPT_RDF11_langString = (LIBRDF_CONCEPT_S_subPropertyOf)+2;
    LIBRDF_CONCEPT_LAST = LIBRDF_CONCEPT_RDF11_langString;
;
{ NOTE: If the above list changes, edit the macros below and
 * librdf_concept_labels in rdf_concepts.c The above list is ordered
 * by simple 'sort' order 
  }
{ Get Redland uri object for RDF Syntax/Schema namespaces  }

function librdf_get_concept_ms_namespace(world:Plibrdf_world):Plibrdf_uri;cdecl;external;
function librdf_get_concept_schema_namespace(world:Plibrdf_world):Plibrdf_uri;cdecl;external;
{ Get Redland node/uri object for RDF concepts  }
function librdf_get_concept_resource_by_index(world:Plibrdf_world; idx:Tlibrdf_concepts_index):Plibrdf_node;cdecl;external;
function librdf_get_concept_uri_by_index(world:Plibrdf_world; idx:Tlibrdf_concepts_index):Plibrdf_uri;cdecl;external;
{ public macros for the resources (librdf_node*) representing the concepts
  }
{*
 * LIBRDF_MS_Alt:
 *
 * RDF namespace concept librdf_node Alt
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Alt(world : longint) : longint;

{*
 * LIBRDF_MS_Bag:
 *
 * RDF namespace concept librdf_node Bag
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Bag(world : longint) : longint;

{*
 * LIBRDF_MS_Property:
 *
 * RDF namespace concept librdf_node Property
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Property(world : longint) : longint;

{*
 * LIBRDF_MS_Seq:
 *
 * RDF namespace concept librdf_node Seq
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Seq(world : longint) : longint;

{*
 * LIBRDF_MS_Statement:
 *
 * RDF namespace concept librdf_node Statement
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Statement(world : longint) : longint;

{*
 * LIBRDF_MS_object:
 *
 * RDF namespace concept librdf_node object
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_object(world : longint) : longint;

{*
 * LIBRDF_MS_predicate:
 *
 * RDF namespace concept librdf_node predicate
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_predicate(world : longint) : longint;

{*
 * LIBRDF_MS_subject:
 *
 * RDF namespace concept librdf_node subject
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_subject(world : longint) : longint;

{*
 * LIBRDF_MS_type:
 *
 * RDF namespace concept librdf_node type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_type(world : longint) : longint;

{*
 * LIBRDF_MS_value:
 *
 * RDF namespace concept librdf_node value
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_value(world : longint) : longint;

{*
 * LIBRDF_MS_li:
 *
 * RDF namespace concept librdf_node li
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_li(world : longint) : longint;

{*
 * LIBRDF_MS_RDF:
 *
 * RDF namespace concept librdf_node RDF
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_RDF(world : longint) : longint;

{*
 * LIBRDF_MS_Description:
 *
 * RDF namespace concept librdf_node Description
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Description(world : longint) : longint;

{*
 * LIBRDF_MS_aboutEach:
 *
 * RDF namespace concept librdf_node aboutEach
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_aboutEach(world : longint) : longint;

{*
 * LIBRDF_MS_aboutEachPrefix:
 *
 * RDF namespace concept librdf_node aboutEachPrefix
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_aboutEachPrefix(world : longint) : longint;

{*
 * LIBRDF_RS_nodeID:
 *
 * RDF namespace concept librdf_node nodeID
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_nodeID(world : longint) : longint;

{*
 * LIBRDF_RS_List:
 *
 * RDF namespace concept librdf_node List
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_List(world : longint) : longint;

{*
 * LIBRDF_RS_first:
 *
 * RDF namespace concept librdf_node first
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_first(world : longint) : longint;

{*
 * LIBRDF_RS_rest:
 *
 * RDF namespace concept librdf_node rest
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_rest(world : longint) : longint;

{*
 * LIBRDF_RS_nil:
 *
 * RDF namespace concept librdf_node nil
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_nil(world : longint) : longint;

{*
 * LIBRDF_RS_XMLLiteral:
 *
 * RDF namespace concept librdf_node XMLLiteral
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_XMLLiteral(world : longint) : longint;

{*
 * LIBRDF_S_Class:
 *
 * RDFS namespace concept Class
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Class(world : longint) : longint;

{*
 * LIBRDF_S_ConstraintProperty:
 *
 * RDFS namespace concept ConstraintProperty
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ConstraintProperty(world : longint) : longint;

{*
 * LIBRDF_S_ConstraintResource:
 *
 * RDFS namespace concept ConstraintResource
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ConstraintResource(world : longint) : longint;

{*
 * LIBRDF_S_Container:
 *
 * RDFS namespace concept Container
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Container(world : longint) : longint;

{*
 * LIBRDF_S_ContainerMembershipProperty:
 *
 * RDFS namespace concept ContainerMembershipProperty
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ContainerMembershipProperty(world : longint) : longint;

{*
 * LIBRDF_S_Literal:
 *
 * RDFS namespace concept Literal
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Literal(world : longint) : longint;

{*
 * LIBRDF_S_Resource:
 *
 * RDFS namespace concept Resource
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Resource(world : longint) : longint;

{*
 * LIBRDF_S_comment:
 *
 * RDFS namespace concept comment
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_comment(world : longint) : longint;

{*
 * LIBRDF_S_domain:
 *
 * RDFS namespace concept domain
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_domain(world : longint) : longint;

{*
 * LIBRDF_S_isDefinedBy:
 *
 * RDFS namespace concept isDefinedBy
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_isDefinedBy(world : longint) : longint;

{*
 * LIBRDF_S_label:
 *
 * RDFS namespace concept label
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_label(world : longint) : longint;

{*
 * LIBRDF_S_range:
 *
 * RDFS namespace concept range
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_range(world : longint) : longint;

{*
 * LIBRDF_S_seeAlso:
 *
 * RDFS namespace concept seeAlso
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_seeAlso(world : longint) : longint;

{*
 * LIBRDF_S_subClassOf:
 *
 * RDFS namespace concept subClassOf
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subClassOf(world : longint) : longint;

{*
 * LIBRDF_S_subPropertyOf:
 *
 * RDFS namespace concept subPropertyOf
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subPropertyOf(world : longint) : longint;

{*
 * LIBRDF_S_subPropertyOf:
 *
 * RDFS namespace concept subPropertyOf
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subPropertyOf(world : longint) : longint;

{ public macros for the URIs (librdf_uri*) representing the concepts  }
{*
 * LIBRDF_MS_Alt_URI:
 *
 * RDF namespace concept URI Alt
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Alt_URI(world : longint) : longint;

{*
 * LIBRDF_MS_Bag_URI:
 *
 * RDF namespace concept URI Bag
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Bag_URI(world : longint) : longint;

{*
 * LIBRDF_MS_Property_URI:
 *
 * RDF namespace concept URI Property
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Property_URI(world : longint) : longint;

{*
 * LIBRDF_MS_Seq_URI:
 *
 * RDF namespace concept URI Seq
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Seq_URI(world : longint) : longint;

{*
 * LIBRDF_MS_Statement_URI:
 *
 * RDF namespace concept URI Statement
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Statement_URI(world : longint) : longint;

{*
 * LIBRDF_MS_object_URI:
 *
 * RDF namespace concept URI object
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_object_URI(world : longint) : longint;

{*
 * LIBRDF_MS_predicate_URI:
 *
 * RDF namespace concept URI predicate
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_predicate_URI(world : longint) : longint;

{*
 * LIBRDF_MS_subject_URI:
 *
 * RDF namespace concept URI subject
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_subject_URI(world : longint) : longint;

{*
 * LIBRDF_MS_type_URI:
 *
 * RDF namespace concept URI type
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_type_URI(world : longint) : longint;

{*
 * LIBRDF_MS_value_URI:
 *
 * RDF namespace concept URI value
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_value_URI(world : longint) : longint;

{*
 * LIBRDF_MS_li_URI:
 *
 * RDF namespace concept URI li
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_li_URI(world : longint) : longint;

{*
 * LIBRDF_MS_RDF_URI:
 *
 * RDF namespace concept URI RDF
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_RDF_URI(world : longint) : longint;

{*
 * LIBRDF_MS_Description_URI:
 *
 * RDF namespace concept URI Description
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Description_URI(world : longint) : longint;

{*
 * LIBRDF_MS_aboutEach_URI:
 *
 * RDF namespace concept URI aboutEach
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_aboutEach_URI(world : longint) : longint;

{*
 * LIBRDF_MS_aboutEachPrefix_URI:
 *
 * RDF namespace concept URI aboutEachPrefix
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_aboutEachPrefix_URI(world : longint) : longint;

{*
 * LIBRDF_RS_nodeID_URI:
 *
 * RDF namespace concept URI nodeID
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_nodeID_URI(world : longint) : longint;

{*
 * LIBRDF_RS_List_URI:
 *
 * RDF namespace concept URI List
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_List_URI(world : longint) : longint;

{*
 * LIBRDF_RS_first_URI:
 *
 * RDF namespace concept URI first
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_first_URI(world : longint) : longint;

{*
 * LIBRDF_RS_rest_URI:
 *
 * RDF namespace concept URI rest
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_rest_URI(world : longint) : longint;

{*
 * LIBRDF_RS_nil_URI:
 *
 * RDF namespace concept URI nil
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_nil_URI(world : longint) : longint;

{*
 * LIBRDF_RS_XMLLiteral_URI:
 *
 * RDF namespace concept URI XMLLiteral
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_XMLLiteral_URI(world : longint) : longint;

{*
 * LIBRDF_S_subPropertyOf_URI:
 *
 * RDFS namespace concept URI subPropertyOf
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subPropertyOf_URI(world : longint) : longint;

{*
 * LIBRDF_S_subClassOf_URI:
 *
 * RDFS namespace concept URI subClassOf
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subClassOf_URI(world : longint) : longint;

{*
 * LIBRDF_S_seeAlso_URI:
 *
 * RDFS namespace concept URI seeAlso
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_seeAlso_URI(world : longint) : longint;

{*
 * LIBRDF_S_range_URI:
 *
 * RDFS namespace concept URI range
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_range_URI(world : longint) : longint;

{*
 * LIBRDF_S_label_URI:
 *
 * RDFS namespace concept URI label
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_label_URI(world : longint) : longint;

{*
 * LIBRDF_S_isDefinedBy_URI:
 *
 * RDFS namespace concept URI isDefinedBy
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_isDefinedBy_URI(world : longint) : longint;

{*
 * LIBRDF_S_domain_URI:
 *
 * RDFS namespace concept URI domain
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_domain_URI(world : longint) : longint;

{*
 * LIBRDF_S_comment_URI:
 *
 * RDFS namespace concept URI comment
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_comment_URI(world : longint) : longint;

{*
 * LIBRDF_S_Resource_URI:
 *
 * RDFS namespace concept URI Resource
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Resource_URI(world : longint) : longint;

{*
 * LIBRDF_S_Literal_URI:
 *
 * RDFS namespace concept URI Literal
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Literal_URI(world : longint) : longint;

{*
 * LIBRDF_S_Container_URI:
 *
 * RDFS namespace concept URI Container
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Container_URI(world : longint) : longint;

{*
 * LIBRDF_S_ContainerMembershipProperty_URI:
 *
 * RDFS namespace concept URI ContainerMembershipProperty
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ContainerMembershipProperty_URI(world : longint) : longint;

{*
 * LIBRDF_S_ConstraintResource_URI:
 *
 * RDFS namespace concept URI ConstraintResource
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ConstraintResource_URI(world : longint) : longint;

{*
 * LIBRDF_S_ConstraintProperty_URI:
 *
 * RDFS namespace concept URI ConstraintProperty
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ConstraintProperty_URI(world : longint) : longint;

{*
 * LIBRDF_S_Class_URI:
 *
 * RDFS namespace concept URI Class
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Class_URI(world : longint) : longint;

{*
 * LIBRDF_RDF11_HTML:
 *
 * RDF 1.1 namespace concept HTML
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RDF11_HTML(world : longint) : longint;

{*
 * LIBRDF_RDF11_langString:
 *
 * RDF 1.1 namespace concept langString
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RDF11_langString(world : longint) : longint;

{*
 * LIBRDF_URI_RDF_MS:
 *
 * #librdf_uri for <literal>rdf:</literal> namespace.  Copy with
 * librdf_new_uri_from_uri() before using.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_URI_RDF_MS(world : longint) : longint;

{*
 * LIBRDF_URI_RDF_SCHEMA:
 *
 * #librdf_uri for <literal>rdfs:</literal> namespace.  Copy with
 * librdf_new_uri_from_uri() before using.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_URI_RDF_SCHEMA(world : longint) : longint;

{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Alt(world : longint) : longint;
begin
  LIBRDF_MS_Alt:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Alt);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Bag(world : longint) : longint;
begin
  LIBRDF_MS_Bag:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Bag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Property(world : longint) : longint;
begin
  LIBRDF_MS_Property:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Property);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Seq(world : longint) : longint;
begin
  LIBRDF_MS_Seq:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Seq);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Statement(world : longint) : longint;
begin
  LIBRDF_MS_Statement:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Statement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_object(world : longint) : longint;
begin
  LIBRDF_MS_object:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_predicate(world : longint) : longint;
begin
  LIBRDF_MS_predicate:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_predicate);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_subject(world : longint) : longint;
begin
  LIBRDF_MS_subject:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_subject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_type(world : longint) : longint;
begin
  LIBRDF_MS_type:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_value(world : longint) : longint;
begin
  LIBRDF_MS_value:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_value);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_li(world : longint) : longint;
begin
  LIBRDF_MS_li:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_li);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_RDF(world : longint) : longint;
begin
  LIBRDF_MS_RDF:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_RDF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Description(world : longint) : longint;
begin
  LIBRDF_MS_Description:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Description);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_aboutEach(world : longint) : longint;
begin
  LIBRDF_MS_aboutEach:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_aboutEach);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_aboutEachPrefix(world : longint) : longint;
begin
  LIBRDF_MS_aboutEachPrefix:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_aboutEachPrefix);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_nodeID(world : longint) : longint;
begin
  LIBRDF_RS_nodeID:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_nodeID);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_List(world : longint) : longint;
begin
  LIBRDF_RS_List:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_List);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_first(world : longint) : longint;
begin
  LIBRDF_RS_first:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_first);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_rest(world : longint) : longint;
begin
  LIBRDF_RS_rest:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_rest);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_nil(world : longint) : longint;
begin
  LIBRDF_RS_nil:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_nil);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_XMLLiteral(world : longint) : longint;
begin
  LIBRDF_RS_XMLLiteral:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_XMLLiteral);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Class(world : longint) : longint;
begin
  LIBRDF_S_Class:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_Class);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ConstraintProperty(world : longint) : longint;
begin
  LIBRDF_S_ConstraintProperty:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_ConstraintProperty);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ConstraintResource(world : longint) : longint;
begin
  LIBRDF_S_ConstraintResource:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_ConstraintResource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Container(world : longint) : longint;
begin
  LIBRDF_S_Container:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_Container);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ContainerMembershipProperty(world : longint) : longint;
begin
  LIBRDF_S_ContainerMembershipProperty:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_ContainerMembershipProperty);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Literal(world : longint) : longint;
begin
  LIBRDF_S_Literal:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_Literal);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Resource(world : longint) : longint;
begin
  LIBRDF_S_Resource:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_Resource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_comment(world : longint) : longint;
begin
  LIBRDF_S_comment:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_comment);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_domain(world : longint) : longint;
begin
  LIBRDF_S_domain:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_domain);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_isDefinedBy(world : longint) : longint;
begin
  LIBRDF_S_isDefinedBy:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_isDefinedBy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_label(world : longint) : longint;
begin
  LIBRDF_S_label:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_label);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_range(world : longint) : longint;
begin
  LIBRDF_S_range:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_range);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_seeAlso(world : longint) : longint;
begin
  LIBRDF_S_seeAlso:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_seeAlso);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subClassOf(world : longint) : longint;
begin
  LIBRDF_S_subClassOf:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_subClassOf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subPropertyOf(world : longint) : longint;
begin
  LIBRDF_S_subPropertyOf:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_subPropertyOf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subPropertyOf(world : longint) : longint;
begin
  LIBRDF_S_subPropertyOf:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_subPropertyOf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Alt_URI(world : longint) : longint;
begin
  LIBRDF_MS_Alt_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Alt);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Bag_URI(world : longint) : longint;
begin
  LIBRDF_MS_Bag_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Bag);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Property_URI(world : longint) : longint;
begin
  LIBRDF_MS_Property_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Property);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Seq_URI(world : longint) : longint;
begin
  LIBRDF_MS_Seq_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Seq);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Statement_URI(world : longint) : longint;
begin
  LIBRDF_MS_Statement_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Statement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_object_URI(world : longint) : longint;
begin
  LIBRDF_MS_object_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_predicate_URI(world : longint) : longint;
begin
  LIBRDF_MS_predicate_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_predicate);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_subject_URI(world : longint) : longint;
begin
  LIBRDF_MS_subject_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_subject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_type_URI(world : longint) : longint;
begin
  LIBRDF_MS_type_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_value_URI(world : longint) : longint;
begin
  LIBRDF_MS_value_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_value);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_li_URI(world : longint) : longint;
begin
  LIBRDF_MS_li_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_li);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_RDF_URI(world : longint) : longint;
begin
  LIBRDF_MS_RDF_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_RDF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_Description_URI(world : longint) : longint;
begin
  LIBRDF_MS_Description_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Description);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_aboutEach_URI(world : longint) : longint;
begin
  LIBRDF_MS_aboutEach_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_aboutEach);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_MS_aboutEachPrefix_URI(world : longint) : longint;
begin
  LIBRDF_MS_aboutEachPrefix_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_aboutEachPrefix);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_nodeID_URI(world : longint) : longint;
begin
  LIBRDF_RS_nodeID_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_nodeID);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_List_URI(world : longint) : longint;
begin
  LIBRDF_RS_List_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_List);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_first_URI(world : longint) : longint;
begin
  LIBRDF_RS_first_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_first);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_rest_URI(world : longint) : longint;
begin
  LIBRDF_RS_rest_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_rest);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_nil_URI(world : longint) : longint;
begin
  LIBRDF_RS_nil_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_nil);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RS_XMLLiteral_URI(world : longint) : longint;
begin
  LIBRDF_RS_XMLLiteral_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_XMLLiteral);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subPropertyOf_URI(world : longint) : longint;
begin
  LIBRDF_S_subPropertyOf_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_subPropertyOf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_subClassOf_URI(world : longint) : longint;
begin
  LIBRDF_S_subClassOf_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_subClassOf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_seeAlso_URI(world : longint) : longint;
begin
  LIBRDF_S_seeAlso_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_seeAlso);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_range_URI(world : longint) : longint;
begin
  LIBRDF_S_range_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_range);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_label_URI(world : longint) : longint;
begin
  LIBRDF_S_label_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_label);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_isDefinedBy_URI(world : longint) : longint;
begin
  LIBRDF_S_isDefinedBy_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_isDefinedBy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_domain_URI(world : longint) : longint;
begin
  LIBRDF_S_domain_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_domain);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_comment_URI(world : longint) : longint;
begin
  LIBRDF_S_comment_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_comment);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Resource_URI(world : longint) : longint;
begin
  LIBRDF_S_Resource_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_Resource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Literal_URI(world : longint) : longint;
begin
  LIBRDF_S_Literal_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_Literal);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Container_URI(world : longint) : longint;
begin
  LIBRDF_S_Container_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_Container);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ContainerMembershipProperty_URI(world : longint) : longint;
begin
  LIBRDF_S_ContainerMembershipProperty_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_ContainerMembershipProperty);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ConstraintResource_URI(world : longint) : longint;
begin
  LIBRDF_S_ConstraintResource_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_ConstraintResource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_ConstraintProperty_URI(world : longint) : longint;
begin
  LIBRDF_S_ConstraintProperty_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_ConstraintProperty);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_S_Class_URI(world : longint) : longint;
begin
  LIBRDF_S_Class_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_Class);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RDF11_HTML(world : longint) : longint;
begin
  LIBRDF_RDF11_HTML:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RDF11_HTML);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_RDF11_langString(world : longint) : longint;
begin
  LIBRDF_RDF11_langString:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RDF11_langString);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_URI_RDF_MS(world : longint) : longint;
begin
  LIBRDF_URI_RDF_MS:=librdf_get_concept_ms_namespace(world);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRDF_URI_RDF_SCHEMA(world : longint) : longint;
begin
  LIBRDF_URI_RDF_SCHEMA:=librdf_get_concept_schema_namespace(world);
end;


end.
