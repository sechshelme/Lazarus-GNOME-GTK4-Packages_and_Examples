
unit hpdf_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_version.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



const
  HPDF_MAJOR_VERSION = 2;  
  HPDF_MINOR_VERSION = 4;  
  HPDF_BUGFIX_VERSION = 5;  
  HPDF_EXTRA_VERSION = '';  
  HPDF_VERSION_ID = ((HPDF_MAJOR_VERSION*10000)+(HPDF_MINOR_VERSION*100))+HPDF_BUGFIX_VERSION;  

implementation


end.
