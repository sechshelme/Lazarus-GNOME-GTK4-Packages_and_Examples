
unit Eldbus_Model;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eldbus_Model.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eldbus_Model.h
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


{$ifndef _ELDBUS_MODEL_H}
{$define _ELDBUS_MODEL_H}
{$include <Eldbus.h>}
{$include <Eo.h>}
{ C++ extern C conditionnal removed }
{$ifdef EFL_BETA_API_SUPPORT}
{$include <Efl.h>}
{$include <eldbus_model_connection.eo.h>}
{$include <eldbus_model_object.eo.h>}
{$include <eldbus_model_proxy.eo.h>}
{$include <eldbus_model_arguments.eo.h>}
{$include <eldbus_model_method.eo.h>}
{$include <eldbus_model_signal.eo.h>}
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
