
unit Efl_Config;
interface

{
  Automatically converted by H2Pas 1.0.0 from Efl_Config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Efl_Config.h
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


{$ifndef EFL_CONFIG_H}
{$define EFL_CONFIG_H}
{ Add -DEFL_API_OVERRIDE to your CFLAGS to override the default
 * installed api set and after that -DEFL_NOLEGACY_API_SUPPORT
 * as desired
  }
{$ifndef EFL_API_OVERRIDE }

const
  EFL_API_LEGACY_DEF = 'FIXME NOT IMPLEMENTED';  
{$endif}

const
  EFL_VERSION_MAJOR = 1;  
  EFL_VERSION_MINOR = 27;  
  EFL_VERSION_MICRO = 0;  
  EFL_BUILD_ID = 'none';  
{$endif}

implementation


end.
