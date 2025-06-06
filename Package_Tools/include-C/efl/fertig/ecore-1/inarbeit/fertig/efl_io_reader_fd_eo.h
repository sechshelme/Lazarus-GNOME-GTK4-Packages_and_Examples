#ifndef _EFL_IO_READER_FD_EO_H_
#define _EFL_IO_READER_FD_EO_H_

#ifndef _EFL_IO_READER_FD_EO_CLASS_TYPE
#define _EFL_IO_READER_FD_EO_CLASS_TYPE

typedef Eo Efl_Io_Reader_Fd;

#endif

#ifndef _EFL_IO_READER_FD_EO_TYPES
#define _EFL_IO_READER_FD_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** Reads fd using read(2).
 *
 * @ingroup Efl_Io_Reader_Fd
 */
#define EFL_IO_READER_FD_MIXIN efl_io_reader_fd_mixin_get()

extern  const Efl_Class *efl_io_reader_fd_mixin_get(void) ;

#ifdef EFL_IO_READER_FD_PROTECTED
/**
 * @brief Reader file descriptor
 *
 * @param[in] obj The object.
 * @param[in] fd File descriptor
 *
 * @ingroup Efl_Io_Reader_Fd
 */
extern  void efl_io_reader_fd_set(Eo *obj, int fd);
#endif

/**
 * @brief Reader file descriptor
 *
 * @param[in] obj The object.
 *
 * @return File descriptor
 *
 * @ingroup Efl_Io_Reader_Fd
 */
extern  int efl_io_reader_fd_get(const Eo *obj);
#endif /* EFL_BETA_API_SUPPORT */

#endif
