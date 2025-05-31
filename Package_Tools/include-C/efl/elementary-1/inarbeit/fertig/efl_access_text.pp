
unit efl_access_text;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_text.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_text.h
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
PEfl_Access_Text_Attribute  = ^Efl_Access_Text_Attribute;
PEfl_Access_Text_Range  = ^Efl_Access_Text_Range;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_INTERFACE_ATSPI_TEXT_H}
{$define ELM_INTERFACE_ATSPI_TEXT_H}
{$ifdef EFL_BETA_API_SUPPORT}
{$include "efl_access_text.eo.h"}
{*
 * @brief Free Efl_Access_Text_Attribute structure
  }

procedure elm_atspi_text_text_attribute_free(attr:PEfl_Access_Text_Attribute);cdecl;external;
{*
 * @brief Free Efl_Access_Text_Range structure
  }
procedure elm_atspi_text_text_range_free(range:PEfl_Access_Text_Range);cdecl;external;
{$endif}
{$endif}

implementation


end.
