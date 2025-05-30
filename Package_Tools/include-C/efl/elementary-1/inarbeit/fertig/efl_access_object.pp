
unit efl_access_object;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_object.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_object.h
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
PEfl_Access_Attribute  = ^Efl_Access_Attribute;
PEina_List  = ^Eina_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_ACCESS_H}
{$define EFL_ACCESS_H}
{$ifdef EFL_BETA_API_SUPPORT}
{$include "efl_access_object.eo.h"}
{*
 * Free Efl_Access_Attributes_List
  }

procedure efl_access_attributes_list_free(list:PEina_List);cdecl;external;
{*
 * Free the Efl_Access_Attribute type
  }
procedure efl_access_attribute_free(attr:PEfl_Access_Attribute);cdecl;external;
{*
 * Emits Accessible 'StateChanged' signal.
  }
{*
 * Emits Accessible 'PropertyChanged' signal for 'Name' property.
  }
{*
 * Emits Accessible 'ChildrenChanged' signal with deleted child as argument.
  }
{$endif}
{$endif}

implementation


end.
