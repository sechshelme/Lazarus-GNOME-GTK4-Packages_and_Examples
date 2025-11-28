{$IFDEF read_interface}

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

function librdf_get_concept_ms_namespace(world:Plibrdf_world):Plibrdf_uri;cdecl;external librdf;
function librdf_get_concept_schema_namespace(world:Plibrdf_world):Plibrdf_uri;cdecl;external librdf;
function librdf_get_concept_resource_by_index(world:Plibrdf_world; idx:Tlibrdf_concepts_index):Plibrdf_node;cdecl;external librdf;
function librdf_get_concept_uri_by_index(world:Plibrdf_world; idx:Tlibrdf_concepts_index):Plibrdf_uri;cdecl;external librdf;

function LIBRDF_MS_Alt(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Bag(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Property(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Seq(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Statement(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_object(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_predicate(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_subject(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_type(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_value(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_li(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_RDF(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Description(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_aboutEach(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_aboutEachPrefix(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_nodeID(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_List(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_first(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_rest(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_nil(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_XMLLiteral(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_Class(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_ConstraintProperty(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_ConstraintResource(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_Container(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_ContainerMembershipProperty(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_Literal(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_Resource(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_comment(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_domain(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_isDefinedBy(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_label(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_range(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_seeAlso(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_subClassOf(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_subPropertyOf(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Alt_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Bag_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Property_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Seq_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Statement_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_object_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_predicate_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_subject_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_type_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_value_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_li_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_RDF_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_Description_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_aboutEach_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_MS_aboutEachPrefix_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_nodeID_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_List_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_first_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_rest_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_nil_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RS_XMLLiteral_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_subPropertyOf_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_subClassOf_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_seeAlso_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_range_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_label_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_isDefinedBy_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_domain_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_comment_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_Resource_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_Literal_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_Container_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_ContainerMembershipProperty_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_ConstraintResource_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_ConstraintProperty_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_S_Class_URI(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RDF11_HTML(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_RDF11_langString(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_URI_RDF_MS(world : Plibrdf_world) : Plibrdf_node;
function LIBRDF_URI_RDF_SCHEMA(world : Plibrdf_world) : Plibrdf_node;

// === Konventiert am: Plibrdf_world5 17:39:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function LIBRDF_MS_Alt(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Alt:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Alt);
end;

function LIBRDF_MS_Bag(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Bag:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Bag);
end;

function LIBRDF_MS_Property(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Property:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Property);
end;

function LIBRDF_MS_Seq(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Seq:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Seq);
end;

function LIBRDF_MS_Statement(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Statement:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Statement);
end;

function LIBRDF_MS_object(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_object:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_object);
end;

function LIBRDF_MS_predicate(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_predicate:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_predicate);
end;

function LIBRDF_MS_subject(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_subject:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_subject);
end;

function LIBRDF_MS_type(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_type:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_type);
end;

function LIBRDF_MS_value(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_value:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_value);
end;

function LIBRDF_MS_li(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_li:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_li);
end;

function LIBRDF_MS_RDF(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_RDF:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_RDF);
end;

function LIBRDF_MS_Description(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Description:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_Description);
end;

function LIBRDF_MS_aboutEach(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_aboutEach:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_aboutEach);
end;

function LIBRDF_MS_aboutEachPrefix(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_aboutEachPrefix:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_MS_aboutEachPrefix);
end;

function LIBRDF_RS_nodeID(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_nodeID:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_nodeID);
end;

function LIBRDF_RS_List(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_List:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_List);
end;

function LIBRDF_RS_first(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_first:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_first);
end;

function LIBRDF_RS_rest(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_rest:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_rest);
end;

function LIBRDF_RS_nil(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_nil:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_nil);
end;

function LIBRDF_RS_XMLLiteral(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_XMLLiteral:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RS_XMLLiteral);
end;

function LIBRDF_S_Class(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_Class:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_Class);
end;

function LIBRDF_S_ConstraintProperty(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_ConstraintProperty:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_ConstraintProperty);
end;

function LIBRDF_S_ConstraintResource(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_ConstraintResource:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_ConstraintResource);
end;

function LIBRDF_S_Container(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_Container:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_Container);
end;

function LIBRDF_S_ContainerMembershipProperty(world: Plibrdf_world
  ): Plibrdf_node;
begin
  LIBRDF_S_ContainerMembershipProperty:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_ContainerMembershipProperty);
end;

function LIBRDF_S_Literal(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_Literal:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_Literal);
end;

function LIBRDF_S_Resource(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_Resource:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_Resource);
end;

function LIBRDF_S_comment(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_comment:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_comment);
end;

function LIBRDF_S_domain(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_domain:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_domain);
end;

function LIBRDF_S_isDefinedBy(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_isDefinedBy:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_isDefinedBy);
end;

function LIBRDF_S_label(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_label:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_label);
end;

function LIBRDF_S_range(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_range:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_range);
end;

function LIBRDF_S_seeAlso(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_seeAlso:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_seeAlso);
end;

function LIBRDF_S_subClassOf(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_subClassOf:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_subClassOf);
end;

function LIBRDF_S_subPropertyOf(world : Plibrdf_world) : Plibrdf_node;
begin
  LIBRDF_S_subPropertyOf:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_S_subPropertyOf);
end;

function LIBRDF_MS_Alt_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Alt_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Alt);
end;

function LIBRDF_MS_Bag_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Bag_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Bag);
end;

function LIBRDF_MS_Property_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Property_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Property);
end;

function LIBRDF_MS_Seq_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Seq_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Seq);
end;

function LIBRDF_MS_Statement_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Statement_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Statement);
end;

function LIBRDF_MS_object_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_object_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_object);
end;

function LIBRDF_MS_predicate_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_predicate_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_predicate);
end;

function LIBRDF_MS_subject_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_subject_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_subject);
end;

function LIBRDF_MS_type_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_type_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_type);
end;

function LIBRDF_MS_value_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_value_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_value);
end;

function LIBRDF_MS_li_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_li_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_li);
end;

function LIBRDF_MS_RDF_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_RDF_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_RDF);
end;

function LIBRDF_MS_Description_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_Description_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_Description);
end;

function LIBRDF_MS_aboutEach_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_aboutEach_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_aboutEach);
end;

function LIBRDF_MS_aboutEachPrefix_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_MS_aboutEachPrefix_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_MS_aboutEachPrefix);
end;

function LIBRDF_RS_nodeID_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_nodeID_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_nodeID);
end;

function LIBRDF_RS_List_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_List_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_List);
end;

function LIBRDF_RS_first_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_first_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_first);
end;

function LIBRDF_RS_rest_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_rest_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_rest);
end;

function LIBRDF_RS_nil_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_nil_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_nil);
end;

function LIBRDF_RS_XMLLiteral_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RS_XMLLiteral_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_RS_XMLLiteral);
end;

function LIBRDF_S_subPropertyOf_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_subPropertyOf_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_subPropertyOf);
end;

function LIBRDF_S_subClassOf_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_subClassOf_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_subClassOf);
end;

function LIBRDF_S_seeAlso_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_seeAlso_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_seeAlso);
end;

function LIBRDF_S_range_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_range_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_range);
end;

function LIBRDF_S_label_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_label_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_label);
end;

function LIBRDF_S_isDefinedBy_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_isDefinedBy_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_isDefinedBy);
end;

function LIBRDF_S_domain_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_domain_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_domain);
end;

function LIBRDF_S_comment_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_comment_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_comment);
end;

function LIBRDF_S_Resource_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_Resource_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_Resource);
end;

function LIBRDF_S_Literal_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_Literal_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_Literal);
end;

function LIBRDF_S_Container_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_Container_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_Container);
end;

function LIBRDF_S_ContainerMembershipProperty_URI(world: Plibrdf_world
  ): Plibrdf_node;
begin
  LIBRDF_S_ContainerMembershipProperty_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_ContainerMembershipProperty);
end;

function LIBRDF_S_ConstraintResource_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_ConstraintResource_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_ConstraintResource);
end;

function LIBRDF_S_ConstraintProperty_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_ConstraintProperty_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_ConstraintProperty);
end;

function LIBRDF_S_Class_URI(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_S_Class_URI:=librdf_get_concept_uri_by_index(world,LIBRDF_CONCEPT_S_Class);
end;

function LIBRDF_RDF11_HTML(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RDF11_HTML:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RDF11_HTML);
end;

function LIBRDF_RDF11_langString(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_RDF11_langString:=librdf_get_concept_resource_by_index(world,LIBRDF_CONCEPT_RDF11_langString);
end;

function LIBRDF_URI_RDF_MS(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_URI_RDF_MS:=librdf_get_concept_ms_namespace(world);
end;

function LIBRDF_URI_RDF_SCHEMA(world: Plibrdf_world): Plibrdf_node;
begin
  LIBRDF_URI_RDF_SCHEMA:=librdf_get_concept_schema_namespace(world);
end;


{$ENDIF read_implementation}
