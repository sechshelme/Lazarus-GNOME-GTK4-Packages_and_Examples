



// evas-1/canvas

//{$include ecore-1/ecore_exe_eo.inc}                        // Doppelt mit  ecore_exe_eo_legacy und fehlerhafte Functionen
{$include ecore-1/ecore_exe_eo_legacy.inc}
{$include ecore-1/ecore_event_message_eo.inc}                // io.
{$include ecore-1/ecore_event_message_handler_eo.inc}        // io. -> ecore_event_message_eo
{$include ecore-1/Ecore.inc}                                 // io.
{$include ecore-1/Ecore_Common.inc}                          // io. -> ecore_exe_eo_legacy
{$include ecore-1/Ecore_Getopt.inc}                          // io.             ( Makros verseucht )
{$include ecore-1/Ecore_Legacy.inc}                          // io. -> Ecore_Common
{$include ecore-1/Efl_Core.inc}                              // io.
{$include ecore-1/efl_io_buffered_stream_eo.inc}             // io.
{$include ecore-1/efl_io_copier_eo.inc}                      // io.
{$include ecore-1/efl_io_file_eo.inc}                        // io.
{$include ecore-1/efl_io_closer_fd_eo.inc}                   // io.
{$include ecore-1/efl_io_positioner_fd_eo.inc}               // io.
{$include ecore-1/efl_io_reader_fd_eo.inc}                   // io.
{$include ecore-1/efl_io_writer_fd_eo.inc}                   // io.
{$include ecore-1/efl_io_sizer_fd_eo.inc}                    // io.
{$include ecore-1/efl_io_stderr_eo.inc}                      // io.
{$include ecore-1/efl_io_stdin_eo.inc}                       // io.
{$include ecore-1/efl_io_stdout_eo.inc}                      // io.
{$include ecore-1/efl_core_env_eo.inc}                       // io.
{$include ecore-1/efl_core_proc_env_eo.inc}                  // io. -> efl_core_env_eo
{$include ecore-1/efl_exe_eo.inc}                            // io. -> efl_core_env_eo
{$include ecore-1/efl_general.inc}                           // io.     ( evtl. löschen )
{$include ecore-1/efl_loop_eo.inc}                           // io.
{$include ecore-1/efl_loop_message_eo.inc}                   // io.
{$include ecore-1/efl_loop_fd_eo.inc}                        // io.
{$include ecore-1/efl_loop_message_handler_eo.inc}           // io.
{$include ecore-1/efl_loop_timer_eo.inc}                     // io.
{$include ecore-1/efl_loop_timer_eo_legacy.inc}              // io.
{$include ecore-1/efl_loop_handler_eo.inc}                   // io.
{$include ecore-1/efl_loop_message_future_eo.inc}            // io.
{$include ecore-1/efl_loop_message_future_handler_eo.inc}    // io. -> efl_loop_message_future_eo
{$include ecore-1/efl_loop_model_eo.inc}                     // io.
{$include ecore-1/efl_task_eo.inc}                           // io.
{$include ecore-1/Ecore_Eo.inc}                              // io. -> efl_loop_eo
{$include ecore-1/efl_loop_consumer_eo.inc}                  // io. -> efl_loop_eo
{$include ecore-1/efl_app_eo.inc}                            // io.
{$include ecore-1/efl_core_command_line_eo.inc}              // io.
{$include ecore-1/efl_cubic_bezier_interpolator_eo.inc}      // io.
{$include ecore-1/efl_thread_eo.inc}                         // io.
{$include ecore-1/efl_threadio_eo.inc}                       // io.
{$include ecore-1/efl_accelerate_interpolator_eo.inc}        // io.
{$include ecore-1/efl_boolean_model_eo.inc}                  // io.
{$include ecore-1/efl_bounce_interpolator_eo.inc}            // io.
{$include ecore-1/efl_composite_model_eo.inc}                // io.
{$include ecore-1/efl_container_model_eo.inc}                // io.
{$include ecore-1/efl_decelerate_interpolator_eo.inc}        // io.
{$include ecore-1/efl_sinusoidal_interpolator_eo.inc}        // io.
{$include ecore-1/efl_spring_interpolator_eo.inc}            // io.
{$include ecore-1/efl_divisor_interpolator_eo.inc}           // io.
{$include ecore-1/efl_filter_model_eo.inc}                   // io.
{$include ecore-1/efl_appthread_eo.inc}                      // io.
{$include ecore-1/efl_generic_model_eo.inc}                  // io.
{$include ecore-1/efl_linear_interpolator_eo.inc}            // io.

