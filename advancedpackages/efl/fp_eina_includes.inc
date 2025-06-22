


// eina-1
{$include eina-1/Efl_Config.inc}                                              // io.
{$include eina-1/eina_config.inc}                                             // io.


{$include eina-1/eina/eina_types.inc}                                         // io.                      ( Viele Makros entfernt )
{$include eina-1/eina/eina_iterator.inc}                                      // io.
{$include eina-1/eina/eina_error.inc}                                         // io.
{$include eina-1/eina/eina_mempool.inc}                                       // io. -> eina_error
{$include eina-1/eina/eina_lock.inc}                                          // io. -> eina_error
{$include eina-1/eina/eina_magic.inc}                                         // io. -> eina_error
{$include eina-1/eina/eina_safety_checks.inc}                                 // io. -> eina_error
{$include eina-1/eina/eina_main.inc}                                          // io. -> Efl_Config, eina_error
{$include eina-1/eina/eina_rbtree.inc}                                        // io. -> eina_iterator
{$include eina-1/eina/eina_hash.inc}                                          // io. -> eina_iterator
{$include eina-1/eina/eina_xattr.inc}                                         // io. -> eina_iterator
{$include eina-1/eina/eina_accessor.inc}                                      // io.
{$include eina-1/eina/eina_inarray.inc}                                       // io. -> eina_iterator, eina_accessor
{$include eina-1/eina/eina_list.inc}                                          // io. -> eina_iterator, eina_accessor
{$include eina-1/eina/eina_clist.inc}                                         // io.
{$include eina-1/eina/eina_array.inc}                                         // io. -> eina_iterator, eina_accessor
{$include eina-1/eina/eina_module.inc}                                        // io. -> eina_error, eina_array
{$include eina-1/eina/eina_benchmark.inc}                                     // io. -> eina_array
{$include eina-1/eina/eina_inlist.inc}                                        // io. -> eina_iterator, eina_accessor
{$include eina-1/eina/eina_simple_xml_parser.inc}                             // io. -> eina_inlist
{$include eina-1/eina/eina_quadtree.inc}                                      // io. -> eina_inlist
{$include eina-1/eina/eina_fp.inc}                                            // io.
{$include eina-1/eina/eina_convert.inc}                                       // io. -> eina_error, eina_fp
{$include eina-1/eina/eina_tmpstr.inc}                                        // io.
{$include eina-1/eina/eina_file.inc}                                          // io. -> eina_array, eina_tmpstr, eina_iterator
{$include eina-1/eina/eina_vector.inc}                                        // io.
{$include eina-1/eina/eina_rectangle.inc}                                     // io.
{$include eina-1/eina/eina_tiler.inc}                                         // io. -> eina_iterator, eina_rectangle
{$include eina-1/eina/eina_quad.inc}                                          // io. -> eina_rectangle
{$include eina-1/eina/eina_matrix.inc}                                        // io. -> eina_fp, eina_rectangle, eina_quad
{$include eina-1/eina/eina_bezier.inc}                                        // io.
{$include eina-1/eina/eina_matrixsparse.inc}                                  // io. -> eina_iterator
{$include eina-1/eina/eina_quaternion.inc}                                    // io. -> eina_fp, eina_matrix
{$include eina-1/eina/eina_stringshare.inc}                                   // io.
{$include eina-1/eina/eina_slice.inc}                                         // io.
{$include eina-1/eina/eina_str.inc}                                           // io.
{$include eina-1/eina/eina_strbuf.inc}                                        // io. -> eina_slice
{$include eina-1/eina/eina_slstr.inc}                                         // io. -> eina_tmpstr, eina_stringshare, eina_strbuf
{$include eina-1/eina/eina_unicode.inc}                                       // io.
{$include eina-1/eina/eina_ustringshare.inc}                                  // io. -> eina_unicode
{$include eina-1/eina/eina_ustrbuf.inc}                                       // io. -> eina_slice, eina_strbuf, eina_unicode
{$include eina-1/eina/eina_binbuf.inc}                                        // io. -> eina_strbuf, eina_slice
{$include eina-1/eina/eina_value.inc}                                         // io. -> eina_list, eina_error, eina_inarray, eina_hash
{$include eina-1/eina/eina_abstract_content.inc}                              // io. -> eina_value, eina_iterator, eina_slice
{$include eina-1/eina/eina_log.inc}                                           // io.
{$include eina-1/eina/eina_promise.inc}                                       // io. -> eina_value, eina_error, eina_log, eina_iterator
{$include eina-1/eina/eina_thread.inc}                                        // io.
{$include eina-1/eina/eina_thread_queue.inc}                                  // io.
{$include eina-1/eina/eina_debug.inc}                                         // io.
{$include eina-1/eina/eina_debug_private.inc}                                 // io. -> eina_thread, eina_debug
{$include eina-1/eina/eina_freeq.inc}                                         // io.
{$include eina-1/eina/eina_prefix.inc}                                        // io.
{$include eina-1/eina/eina_alloca.inc}                                        // io.
{$include eina-1/eina/eina_binshare.inc}                                      // io.
{$include eina-1/eina/eina_counter.inc}                                       // io.
{$include eina-1/eina/eina_cow.inc}                                           // io.
{$include eina-1/eina/eina_cpu.inc}                                           // io.
{$include eina-1/eina/eina_evlog.inc}                                         // io.
{$include eina-1/eina/eina_trash.inc}                                         // io.
{$include eina-1/eina/eina_vpath.inc}                                         // io.
{$include eina-1/eina/eina_lalloc.inc}                                        // io.
{$include eina-1/eina/eina_mmap.inc}                                          // io.
{$include eina-1/eina/eina_range.inc}                                         // io.
{$include eina-1/eina/eina_refcount.inc}                                      // io.
{$include eina-1/eina/eina_safepointer.inc}                                   // io.
{$include eina-1/eina/eina_util.inc}                                          // io.
{$include eina-1/eina/eina_fnmatch.inc}                                       // io.
{$include eina-1/eina/eina_hamster.inc}                                       // io.
{$include eina-1/eina/eina_sha.inc}                                           // io.
{$include eina-1/eina/eina_value_util.inc}                                    // io.


// Achtung, dies konventierten inline können fehlerhaft sein.

{$include eina-1/eina/eina_inline_rectangle.inc}               // io.
{$include eina-1/eina/eina_inline_vector.inc}                  // io.
{$include eina-1/eina/eina_inline_stringshare.inc}             // Nicht getestet
{$include eina-1/eina/eina_inline_list.inc}                    // Nicht getestet
{$include eina-1/eina/eina_inline_str.inc}                     // Nicht getestet
{$include eina-1/eina/eina_inline_slice.inc}                   // -> eina_inline_str  Nicht getestet
{$include eina-1/eina/eina_inline_lock_posix.inc}              // Fehlerhaft !
{$include eina-1/eina/eina_inline_lock_barrier.inc}            // io. -> eina_inline_lock_posix
//{$include eina-1/eina/eina_inline_mempool.inc}                 // Fehlerhaft !
//{$include eina-1/eina/eina_inline_safepointer.inc}             // Fehlerhaft !
{$include eina-1/eina/eina_inline_ustringshare.inc}            // Nicht getestet
{$include eina-1/eina/eina_inline_value.inc}                   // -> eina_inline_stringshare, eina_inline_list     Fehlerhaft !
{$include eina-1/eina/eina_inline_value_util.inc}              // -> eina_inline_value                             Fehlerhaft !
{$include eina-1/eina/eina_inline_log.inc}                     // Nicht getestet
{$include eina-1/eina/eina_inline_tiler.inc}                   // Nicht getestet
{$include eina-1/eina/eina_inline_clist.inc}                   // Nicht getestet
{$include eina-1/eina/eina_inline_crc.inc}                     // Nicht getestet
{$include eina-1/eina/eina_inline_hash.inc}                    // io -> eina_inline_crc   Nicht getestet
{$include eina-1/eina/eina_inline_cpu.inc}                     // Nicht getestet
{$include eina-1/eina/eina_inline_fp.inc}                      // Nicht getestet
{$include eina-1/eina/eina_inline_array.inc}                   // Nicht getestet
{$include eina-1/eina/eina_inline_range.inc}                   // Nicht getestet
{$include eina-1/eina/eina_inline_unicode.inc}                 // Nicht getestet
{$include eina-1/eina/eina_inline_f32p32.inc}                  // Nicht getestet
{$include eina-1/eina/eina_inline_f8p24.inc}                   // Nicht getestet
{$include eina-1/eina/eina_inline_f16p16.inc}                  // Nicht getestet
{$include eina-1/eina/eina_inline_file.inc}                    // io.
{$include eina-1/eina/eina_inline_inlist.inc}                  // Nicht getestet
//{$include eina-1/eina/eina_inline_rbtree.inc}                  // Fehlerhaft !
{$include eina-1/eina/eina_inline_trash.inc}                   // io.
{$include eina-1/eina/eina_inline_util.inc}                    // io.



