#ifndef _EFL_IO_STDOUT_EO_H_
#define _EFL_IO_STDOUT_EO_H_

#ifndef _EFL_IO_STDOUT_EO_CLASS_TYPE
#define _EFL_IO_STDOUT_EO_CLASS_TYPE

typedef Eo Efl_Io_Stdout;

#endif

#ifndef _EFL_IO_STDOUT_EO_TYPES
#define _EFL_IO_STDOUT_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** Application's standard output (stdout).
 *
 * @ingroup Efl_Io_Stdout
 */
#define EFL_IO_STDOUT_CLASS efl_io_stdout_class_get()

extern  const Efl_Class *efl_io_stdout_class_get(void) ;
#endif /* EFL_BETA_API_SUPPORT */

#endif
