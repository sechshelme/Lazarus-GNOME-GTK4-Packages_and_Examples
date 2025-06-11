unit fp_ecore_con;

interface

  uses
    efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}
  {$MACRO ON}

{$DEFINE includes:=
  {$include ecore-con-1/Ecore_Con.inc}                               // io.
  {$include ecore-con-1/Ecore_Con_Eet.inc}                           // io. -> Ecore_Con
  {$include ecore-con-1/ecore_con_eet_base_eo.inc}                   // io.
  {$include ecore-con-1/ecore_con_eet_client_obj_eo.inc}             // io.
  {$include ecore-con-1/ecore_con_eet_server_obj_eo.inc}             // io.
  {$include ecore-con-1/Efl_Net.inc}                                 // io.
  {$include ecore-con-1/efl_net_http_types_eot.inc}                  // io.
  {$include ecore-con-1/efl_net_control_technology_eo.inc}           // io.
  {$include ecore-con-1/efl_net_control_access_point_eo.inc}         // io. -> efl_net_control_technology_eo
  {$include ecore-con-1/efl_net_control_manager_eo.inc}              // io. -> efl_net_control_access_point_eo
  {$include ecore-con-1/efl_net_ssl_types_eot.inc}                   // io.
  {$include ecore-con-1/efl_net_ssl_context_eo.inc}                  // io. -> efl_net_ssl_types_eot
  {$include ecore-con-1/efl_net_dialer_http_eo.inc}                  // io. -> efl_net_http_types_eot
  {$include ecore-con-1/efl_net_dialer_websocket_eo.inc}             // io. -> efl_net_http_types_eot
  {$include ecore-con-1/efl_net_dialer_eo.inc}                       // io.
  {$include ecore-con-1/efl_net_dialer_simple_eo.inc}                // io.
  {$include ecore-con-1/efl_net_dialer_ssl_eo.inc}                   // io. -> efl_net_ssl_context_eo
  {$include ecore-con-1/efl_net_dialer_tcp_eo.inc}                   // io.
  {$include ecore-con-1/efl_net_dialer_udp_eo.inc}                   // io.
  {$include ecore-con-1/efl_net_dialer_unix_eo.inc}                  // io.
  {$include ecore-con-1/efl_net_ip_address_eo.inc}                   // io.
  {$include ecore-con-1/efl_net_socket_eo.inc}                       // io.
  {$include ecore-con-1/efl_net_socket_udp_eo.inc}                   // io. -> efl_net_ip_address_eo
  {$include ecore-con-1/efl_net_socket_fd_eo.inc}                    // io,
  {$include ecore-con-1/efl_net_socket_simple_eo.inc}                // io.
  {$include ecore-con-1/efl_net_socket_ssl_eo.inc}                   // io. -> efl_net_socket_eo, efl_net_ssl_context_eo, efl_net_ssl_types_eot
  {$include ecore-con-1/efl_net_socket_tcp_eo.inc}                   // io.
  {$include ecore-con-1/efl_net_socket_unix_eo.inc}                  // io.
  {$include ecore-con-1/efl_net_server_eo.inc}                       // io. -> efl_net_socket_eo
  {$include ecore-con-1/efl_net_server_fd_eo.inc}                    // io.
  {$include ecore-con-1/efl_net_server_ip_eo.inc}                    // io.
  {$include ecore-con-1/efl_net_server_simple_eo.inc}                // io.
  {$include ecore-con-1/efl_net_server_ssl_eo.inc}                   // io. -> efl_net_ssl_context_eo
  {$include ecore-con-1/efl_net_server_tcp_eo.inc}                   // io.
  {$include ecore-con-1/efl_net_server_udp_client_eo.inc}            // io.
  {$include ecore-con-1/efl_net_server_udp_eo.inc}                   // io.
  {$include ecore-con-1/efl_net_server_unix_eo.inc}                  // io.
  {$include ecore-con-1/efl_net_session_eo.inc}                      // io.
  {$include ecore-con-1/efl_net_types_eot.inc}                       // io.
}


{$DEFINE read_interface}
includes
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
includes
{$UNDEF read_implementation}

end.
