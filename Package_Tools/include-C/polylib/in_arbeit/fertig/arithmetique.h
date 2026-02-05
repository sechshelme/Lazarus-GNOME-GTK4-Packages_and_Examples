/*
    This file is part of PolyLib.

    PolyLib is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    PolyLib is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with PolyLib.  If not, see <http://www.gnu.org/licenses/>.
*/

/* header file built by cproto */
#ifndef arithmetique_header_included
#define arithmetique_header_included

/** package arithmetique
 *
 * $Id: arithmetique.h,v 1.24 2007/02/22 09:16:57 skimo Exp $
 *
 * Francois Irigoin, mai 1989
 *
 * Modifications
 *  - rewrite of DIVIDE which was wrong (Remi Triolet, Francois Irigoin, 
 *    april 90)
 *  - simplification of POSITIVE_DIVIDE by suppressing one modulo
 *  - B.Meister : added addmul, operation existing in gmp and quite useful 
 *    (05-2005)
 */

/* We would like linear to be generic about the "integer" type used
 * to represent integer values. Thus Value is defined here. It should
 * be changed to "int" "long" or "long long". In an ideal world,
 * any source modification should be limited to this package.
 *
 * Indeed, we cannot switch easily to bignums that need constructors 
 * dans destructors... That would lead to too many modifications...
 * C++ would make things easier and cleaner...
 *
 * Fabien COELHO
 */

#include <stdio.h>
#include <limits.h>   /* Included for getting constants: INT_MAX, etc.. */

#ifdef GNUMP
#include <gmp.h>
#include <stdlib.h>
#include <string.h>
void mp_get_memory_functions(
		void *(**alloc_func_ptr) (size_t),
		void *(**realloc_func_ptr) (void *, size_t, size_t),
		void (**free_func_ptr) (void *, size_t));


typedef long long int Value;


typedef void (*value_print_gmp_free_t)(void *, size_t);
			      
/* errors.c */ 
extern unsigned int overflow_error;
extern unsigned int simplex_arithmetic_error;
extern unsigned int user_exception_error;
extern unsigned int parser_exception_error;
extern unsigned int any_exception_error; 
extern unsigned int the_last_just_thrown_exception;
extern void dump_exception_stack_to_file(FILE * /*f*/);
extern void dump_exception_stack(void);
extern jmp_buf *push_exception_on_stack(int /*what*/, const char * /*function*/, const char * /*file*/, int /*line*/);
extern void pop_exception_from_stack(int /*what*/, const char * /*function*/, const char * /*file*/, int /*line*/);
extern void throw_exception(int /*what*/, const char * /*function*/, const char * /*file*/, int /*line*/);

#endif /* arithmetique_header_included */



