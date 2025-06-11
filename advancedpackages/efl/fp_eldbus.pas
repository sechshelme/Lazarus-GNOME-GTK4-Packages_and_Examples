unit fp_eldbus;

interface

uses
  efl,
  fp_eina,
  fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}
  {$MACRO ON}

{$DEFINE all_includes:=
  {$include eldbus-1/Eldbus.inc}                               // io.
  {$include eldbus-1/eldbus_message.inc}                       // io.
  {$include eldbus-1/eldbus_signal_handler.inc}                // io.
  {$include eldbus-1/eldbus_connection.inc}                    // io.
  {$include eldbus-1/eldbus_object.inc}                        // io. -> eldbus_signal_handler
  {$include eldbus-1/eldbus_proxy.inc}                         // io.
  {$include eldbus-1/eldbus_introspection.inc}                 // io.
  {$include eldbus-1/eldbus_model_method_eo.inc}               // io. -> eldbus_introspection
  {$include eldbus-1/eldbus_model_proxy_eo.inc}                // io. -> eldbus_introspection
  {$include eldbus-1/eldbus_model_signal_eo.inc}               // io. -> eldbus_introspection
  {$include eldbus-1/eldbus_model_eo.inc}                      // io. -> eldbus_connection
  {$include eldbus-1/eldbus_model_arguments_eo.inc}            // io.
  {$include eldbus-1/eldbus_model_connection_eo.inc}           // io.
  {$include eldbus-1/eldbus_model_object_eo.inc}               // io.
  {$include eldbus-1/eldbus_freedesktop.inc}                   // io.
  {$include eldbus-1/eldbus_message_eina_value.inc}            // io.
  {$include eldbus-1/eldbus_message_helper.inc}                // io.
  {$include eldbus-1/eldbus_pending.inc}                       // io.
  {$include eldbus-1/eldbus_service.inc}                       // io.
}


{$DEFINE read_interface}
all_includes
{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
all_includes
{$UNDEF read_implementation}

end.

