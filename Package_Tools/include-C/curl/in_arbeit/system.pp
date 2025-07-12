
unit system;
interface

{
  Automatically converted by H2Pas 1.0.0 from system.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    system.h
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
Pcurl_off_t  = ^curl_off_t;
Pcurl_socklen_t  = ^curl_socklen_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CURLINC_SYSTEM_H}
{$define CURLINC_SYSTEM_H}
{ Data type definition of curl_socklen_t.  }
{$ifdef CURL_TYPEOF_CURL_SOCKLEN_T}
type
  Pcurl_socklen_t = ^Tcurl_socklen_t;
  Tcurl_socklen_t = TCURL_TYPEOF_CURL_SOCKLEN_T;
{$endif}
{ Data type definition of curl_off_t.  }
{$ifdef CURL_TYPEOF_CURL_OFF_T}
type
  Pcurl_off_t = ^Tcurl_off_t;
  Tcurl_off_t = TCURL_TYPEOF_CURL_OFF_T;
{$endif}

implementation


end.
