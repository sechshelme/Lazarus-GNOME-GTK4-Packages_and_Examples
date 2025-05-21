
unit efl_general;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_general.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_general.h
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


{$undef extern_MAIN}
{$undef __EFL_UI}
{$undef __EFL_NET}
{ This file is designed to be included again and again }

const
  _EFL_VERSION_MICRO = EFL_VERSION_MICRO;  
  _EFL_VERSION_REVISION = EFL_VERSION_REVISION;  
  _EFL_VERSION_FLAVOR = EFL_VERSION_FLAVOR;  
{$ifdef EFL_BUILD_ID}
  _EFL_BUILD_ID = EFL_BUILD_ID;  
{$else}

const
  _EFL_BUILD_ID = NULL;  
{$endif}

implementation


end.
