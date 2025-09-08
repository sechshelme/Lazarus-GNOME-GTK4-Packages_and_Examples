/* Data structure for communication from the run-time dynamic linker for
   loaded ELF shared objects.
   Copyright (C) 1995-2024 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.  */

#ifndef	_LINK_H
#define	_LINK_H	1

#include <features.h>
#include <elf.h>
#include <dlfcn.h>
#include <sys/types.h>

/* We use this macro to refer to ELF types independent of the native wordsize.
   `ElfW(TYPE)' is used in place of `Elf32_TYPE' or `Elf64_TYPE'.  */
// xxxxxxxxxxxxxx #define ElfW(type)	_ElfW (Elf, __ELF_NATIVE_CLASS, type)
// xxxxxxxxxxxxxx #define _ElfW(e,w,t)	_ElfW_1 (e, w, _##t)
// xxxxxxxxxxxxxx #define _ElfW_1(e,w,t)	e##w##t

#include <bits/elfclass.h>		/* Defines __ELF_NATIVE_CLASS.  */
#include <bits/link.h>

/* The legacy rendezvous structure used by the run-time dynamic linker to
   communicate details of shared object loading to the debugger.  */

/* xxxxxxxxxxxxxxxxxxxxx
struct r_debug
  {
    int r_version;

    struct link_map *r_map;	

    ElfW(Addr) r_brk;
    enum 
      {
	RT_CONSISTENT,
	RT_ADD,			
	RT_DELETE		
      } r_state;

    ElfW(Addr) r_ldbase;
  };
*/

/* This is the symbol of that structure provided by the dynamic linker.  */
extern struct r_debug _r_debug;

/* The extended rendezvous structure used by the run-time dynamic linker
   to communicate details of shared object loading to the debugger.  If
   the executable's dynamic section has a DT_DEBUG element, the run-time
   linker sets that element's value to the address where this structure
   can be found.  */

struct r_debug_extended
  {
    struct r_debug base;

    /* The following field is added by r_version == 2.  */

    /* Link to the next r_debug_extended structure.  Each r_debug_extended
       structure represents a different namespace.  The first
       r_debug_extended structure is for the default namespace.  */
    struct r_debug_extended *r_next;
  };

/* This symbol refers to the "dynamic structure" in the `.dynamic' section
   of whatever module refers to `_DYNAMIC'.  So, to find its own
   `struct r_debug_extended', a program could do:
     for (dyn = _DYNAMIC; dyn->d_tag != DT_NULL; ++dyn)
       if (dyn->d_tag == DT_DEBUG)
	 r_debug_extended = (struct r_debug_extended *) dyn->d_un.d_ptr;
 */
extern ElfW(Dyn) ;

/* Structure describing a loaded shared object.  The `l_next' and `l_prev'
   members form a chain of all the shared objects loaded at startup.

   These data structures exist in space used by the run-time dynamic linker;
   modifying them may have disastrous results.  */

/* xxxxxxxxxxxxxxxx
struct link_map
  {

    ElfW(Addr) l_addr;		
		
    char *l_name;	
    ElfW(Dyn) *l_ld;		
    struct link_map *l_next, *l_prev;
  };
*/

#ifdef __USE_GNU

/* Version numbers for la_version handshake interface.  */
#include <bits/link_lavcurrent.h>

/* Activity types signaled through la_activity.  */
enum xxxxxxxxx
  {
    LA_ACT_CONSISTENT,		/* Link map consistent again.  */
    LA_ACT_ADD,			/* New object will be added.  */
    LA_ACT_DELETE		/* Objects will be removed.  */
  };

/* Values representing origin of name for dynamic loading.  */
enum xxxxxxxxxx
  {
    LA_SER_ORIG = 0x01,		/* Original name.  */
    LA_SER_LIBPATH = 0x02,	/* Directory from LD_LIBRARY_PATH.  */
    LA_SER_RUNPATH = 0x04,	/* Directory from RPATH/RUNPATH.  */
    LA_SER_CONFIG = 0x08,	/* Found through ldconfig.  */
    LA_SER_DEFAULT = 0x40,	/* Default directory.  */
    LA_SER_SECURE = 0x80	/* Unused.  */
  };

/* Values for la_objopen return value.  */
enum xxxxxxxxxxxxxxxxx
  {
    LA_FLG_BINDTO = 0x01,	/* Audit symbols bound to this object.  */
    LA_FLG_BINDFROM = 0x02	/* Audit symbols bound from this object.  */
  };

/* Values for la_symbind flags parameter.  */
enum xxxxxxxxxxxxxxxxxxxxx
  {
    LA_SYMB_NOPLTENTER = 0x01,	/* la_pltenter will not be called.  */
    LA_SYMB_NOPLTEXIT = 0x02,	/* la_pltexit will not be called.  */
    LA_SYMB_STRUCTCALL = 0x04,	/* Return value is a structure.  */
    LA_SYMB_DLSYM = 0x08,	/* Binding due to dlsym call.  */
    LA_SYMB_ALTVALUE = 0x10	/* Value has been changed by a previous
				   la_symbind call.  */
  };

/* xxxxxxxxxxxxxx
struct dl_phdr_info
  {
    ElfW(Addr) dlpi_addr;
    const char *dlpi_name;
    const ElfW(Phdr) *dlpi_phdr;
    ElfW(Half) dlpi_phnum;


    unsigned long long int dlpi_adds;
     unsigned long long int dlpi_subs;

    size_t dlpi_tls_modid;

    void *dlpi_tls_data;
  };

*/


extern int dl_iterate_phdr (int (*__callback) (struct dl_phdr_info *,
					       size_t, void *),
			    void *__data);


/* Prototypes for the ld.so auditing interfaces.  These are not
   defined anywhere in ld.so but instead have to be provided by the
   auditing DSO.  */
extern unsigned int la_version (unsigned int __version);
extern void la_activity (uintptr_t *__cookie, unsigned int __flag);
extern char *la_objsearch (const char *__name, uintptr_t *__cookie,
			   unsigned int __flag);
extern unsigned int la_objopen (struct link_map *__map, Lmid_t __lmid,
				uintptr_t *__cookie);
extern void la_preinit (uintptr_t *__cookie);
extern uintptr_t la_symbind32 (Elf32_Sym *__sym, unsigned int __ndx,
			       uintptr_t *__refcook, uintptr_t *__defcook,
			       unsigned int *__flags, const char *__symname);
extern uintptr_t la_symbind64 (Elf64_Sym *__sym, unsigned int __ndx,
			       uintptr_t *__refcook, uintptr_t *__defcook,
			       unsigned int *__flags, const char *__symname);
extern unsigned int la_objclose (uintptr_t *__cookie);


#endif

#endif /* link.h */
