unit Eldbus_Model;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

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

// === Konventiert am: 10-6-25 19:47:51 ===


implementation



end.
