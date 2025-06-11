
unit eldbus_introspection;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_introspection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_introspection.h
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
PEina_List  = ^Eina_List;
PEina_Stringshare  = ^Eina_Stringshare;
PEldbus_Introspection_Annotation  = ^Eldbus_Introspection_Annotation;
PEldbus_Introspection_Argument  = ^Eldbus_Introspection_Argument;
PEldbus_Introspection_Argument_Direction  = ^Eldbus_Introspection_Argument_Direction;
PEldbus_Introspection_Interface  = ^Eldbus_Introspection_Interface;
PEldbus_Introspection_Method  = ^Eldbus_Introspection_Method;
PEldbus_Introspection_Node  = ^Eldbus_Introspection_Node;
PEldbus_Introspection_Property  = ^Eldbus_Introspection_Property;
PEldbus_Introspection_Property_Access  = ^Eldbus_Introspection_Property_Access;
PEldbus_Introspection_Signal  = ^Eldbus_Introspection_Signal;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELDBUS_INTROSPECTION_INTROSPECTION_H}
{$define _ELDBUS_INTROSPECTION_INTROSPECTION_H}
{$include <Eina.h>}
{$include <Eo.h>}
{ FIXME: these are duplicated as @extern in eldbus_types.eot  }
{* Argument direction
 *
 * @ingroup Eldbus_Introspection
  }
{*< No direction  }
{*< Incoming direction  }
{*< Outgoing direction  }
type
  PEldbus_Introspection_Argument_Direction = ^TEldbus_Introspection_Argument_Direction;
  TEldbus_Introspection_Argument_Direction =  Longint;
  Const
    ELDBUS_INTROSPECTION_ARGUMENT_DIRECTION_NONE = 0;
    ELDBUS_INTROSPECTION_ARGUMENT_DIRECTION_IN = 1;
    ELDBUS_INTROSPECTION_ARGUMENT_DIRECTION_OUT = 2;
;
{* Property access rights
 *
 * @ingroup Eldbus_Introspection
  }
{*< Property can be read  }
{*< Property can be written  }
{*< Property can be read and
                                                  * written  }
type
  PEldbus_Introspection_Property_Access = ^TEldbus_Introspection_Property_Access;
  TEldbus_Introspection_Property_Access =  Longint;
  Const
    ELDBUS_INTROSPECTION_PROPERTY_ACCESS_READ = 0;
    ELDBUS_INTROSPECTION_PROPERTY_ACCESS_WRITE = 1;
    ELDBUS_INTROSPECTION_PROPERTY_ACCESS_READWRITE = 2;
;
{* DBus Node
 *
 * @ingroup Eldbus_Introspection
  }
{*< Node name (optional)  }
{*< List with nodes  }
{*< List with interfaces  }
type
  PEldbus_Introspection_Node = ^TEldbus_Introspection_Node;
  TEldbus_Introspection_Node = record
      name : PEina_Stringshare;
      nodes : PEina_List;
      interfaces : PEina_List;
    end;
{* DBus Interface
 *
 * @ingroup Eldbus_Introspection
  }
{*< Interface name  }
{*< List with interface methods  }
{*< List with interface signals  }
{*< List with interface properties  }
{*< List with interface annotations  }

  PEldbus_Introspection_Interface = ^TEldbus_Introspection_Interface;
  TEldbus_Introspection_Interface = record
      name : PEina_Stringshare;
      methods : PEina_List;
      signals : PEina_List;
      properties : PEina_List;
      annotations : PEina_List;
    end;
{* DBus Method
 *
 * @ingroup Eldbus_Introspection
  }
{*< Method name  }
{*< List with method arguments  }
{*< List with method annotations  }

  PEldbus_Introspection_Method = ^TEldbus_Introspection_Method;
  TEldbus_Introspection_Method = record
      name : PEina_Stringshare;
      arguments : PEina_List;
      annotations : PEina_List;
    end;
{* DBus Property
 *
 * @ingroup Eldbus_Introspection
  }
{*< Property name  }
{*< Property type  }
{*< Property access rights  }
{*< List with property annotations  }

  PEldbus_Introspection_Property = ^TEldbus_Introspection_Property;
  TEldbus_Introspection_Property = record
      name : PEina_Stringshare;
      _type : PEina_Stringshare;
      access : TEldbus_Introspection_Property_Access;
      annotations : PEina_List;
    end;
{* DBus Annotation
 *
 * @ingroup Eldbus_Introspection
  }
{*< Annotation name  }
{*< Annotation value  }

  PEldbus_Introspection_Annotation = ^TEldbus_Introspection_Annotation;
  TEldbus_Introspection_Annotation = record
      name : PEina_Stringshare;
      value : PEina_Stringshare;
    end;
{* DBus Argument
 *
 * @ingroup Eldbus_Introspection
  }
{*< Argument name (optional)  }
{*< Argument type  }
{*< Argument direction  }

  PEldbus_Introspection_Argument = ^TEldbus_Introspection_Argument;
  TEldbus_Introspection_Argument = record
      name : PEina_Stringshare;
      _type : PEina_Stringshare;
      direction : TEldbus_Introspection_Argument_Direction;
    end;
{* DBus Signal
 *
 * @ingroup Eldbus_Introspection
  }
{*< Signal name  }
{*< List with signal arguments  }
{*< List with signal annotations  }

  PEldbus_Introspection_Signal = ^TEldbus_Introspection_Signal;
  TEldbus_Introspection_Signal = record
      name : PEina_Stringshare;
      arguments : PEina_List;
      annotations : PEina_List;
    end;
{*
 * @brief Parses the introspection xml abstracting it to an object tree
 *
 * @param xml The introspection xml
 * @return The introspection object tree
 *
 * @since 1.17
  }
(* Const before type ignored *)

function eldbus_introspection_parse(xml:Pchar):PEldbus_Introspection_Node;cdecl;external;
{*
 * @brief Frees the introspection object tree
 *
 * @param node The root node of introspection tree
 *
 * @since 1.17
  }
procedure eldbus_introspection_node_free(node:PEldbus_Introspection_Node);cdecl;external;
{*
 * @brief Finds an interface by name
 *
 * @param interfaces The list of interfaces of type @c Eldbus_Introspection_Interface
 * @param name The interfaces's name to search for
 * @return Returns the interface found or @c NULL if not
 *
 * @since 1.17
  }
(* Const before type ignored *)
function eldbus_introspection_interface_find(interfaces:PEina_List; name:Pchar):PEldbus_Introspection_Interface;cdecl;external;
{*
 * @brief Finds a property by name
 *
 * @param properties The list of properties of type @c Eldbus_Introspection_Property
 * @param name The properties's name to search for
 * @return Returns the property found or @c NULL if not
 *
 * @since 1.17
  }
(* Const before type ignored *)
function eldbus_introspection_property_find(properties:PEina_List; name:Pchar):PEldbus_Introspection_Property;cdecl;external;
{*
 * @brief Finds an argument by name
 *
 * @param arguments The list of arguments of type @c Eldbus_Introspection_Property
 * @param name The arguments's name to search for
 * @return Returns the argument found or @c NULL if not
 *
 * @since 1.17
  }
(* Const before type ignored *)
function eldbus_introspection_argument_find(arguments:PEina_List; name:Pchar):PEldbus_Introspection_Argument;cdecl;external;
{$endif}

implementation


end.
