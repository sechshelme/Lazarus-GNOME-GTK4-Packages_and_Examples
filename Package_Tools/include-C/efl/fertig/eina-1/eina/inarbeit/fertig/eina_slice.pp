
unit eina_slice;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_slice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_slice.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PEina_Rw_Slice  = ^Eina_Rw_Slice;
PEina_Slice  = ^Eina_Slice;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2016 ProFUSION embedded systems
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef _EINA_SLICE_H}
{$define _EINA_SLICE_H}
{$include "eina_types.h"}
{$include <stdint.h>}
{$include <string.h>}
{$include <stdlib.h>}
{$include <stdio.h>}
{$include <sys/types.h>}
{$include "eina_str.h"}
{*
 * @addtogroup Eina_Slice_Group Memory Slices
 *
 * @brief These functions provide memory slices in read-only and
 * read-write forms.
 *
 * Memory slices define a contiguous linear memory starting at a given
 * pointer (@c mem) and spanning for a given length (@c len).
 *
 * They may be read-only (Eina_Slice) or read-write (Eina_Rw_Slice).
 *
 * @since 1.19
  }
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @defgroup Eina_Slice_Group Memory Slices
 *
 * @
  }
{*
 * @typedef Eina_Slice
 * Defines a read-only memory region.
 *
 * The slice is a memory starting at @c mem and accessible up to @c
 * len bytes.
 *
 * @see Eina_Rw_Slice for read-write memory regions.
 *
 * @since 1.19
  }
type
{*
 * @typedef Eina_Rw_Slice
 * Defines a read-and-write able memory region.
 *
 * The slice is a memory starting at @c mem and accessible up to @c
 * len bytes.
 *
 * @see Eina_Slice for read-only memory regions.
 *
 * @since 1.19
  }
{*
 * @struct _Eina_Slice
 * Defines a read-only memory region.
 *
 * The slice is a memory starting at @c mem and accessible up to @c
 * len bytes.
 *
 * @see Eina_Rw_Slice for read-write memory regions.
 *
 * @since 1.19
  }
{*< size of memory pointed by @c mem  }
(* Const before type ignored *)
{*< memory pointed by this slice. Just read, never modify it.  }
(* Const before type ignored *)
{*< memory as uint8_t pointer  }
  PEina_Slice = ^TEina_Slice;
  TEina_Slice = record
      len : Tsize_t;
      xxx : record
          case longint of
            0 : ( mem : pointer );
            1 : ( bytes : Puint8_t );
          end;
    end;

{*
 * @struct _Eina_Rw_Slice
 * Defines a read-and-write able memory region.
 *
 * The slice is a memory starting at @c mem and accessible up to @c
 * len bytes.
 *
 * @see Eina_Slice for read-only memory regions.
 *
 * @since 1.19
  }
{*< size of memory pointed by @c mem  }
{*< memory pointed by this slice. It's write able.  }
{*< memory as uint8_t pointer  }
  PEina_Rw_Slice = ^TEina_Rw_Slice;
  TEina_Rw_Slice = record
      len : Tsize_t;
      xxx : record
          case longint of
            0 : ( mem : pointer );
            1 : ( bytes : Puint8_t );
          end;
    end;

{*
 * @brief Convert the Read-write slice to read-only.
 *
 * @param[in] rw_slice the read-write slice to convert.
 * @return the red-only slice matching the slice.
  }
{*
 * @brief Compare two slices, similar to memcmp()
 *
 * @param[in] a the first slice to compare.
 * @param[in] b the second slice to compare.
 * @return 0 if equal, < 0 if a < b, > 0 if a > b
 *
 * @since 1.19
  }
{*
 * @def EINA_RW_SLICE_DECLARE(name, length)
 *
 * Declare a local (stack) array for storage at given @a length and
 * initialize an Eina_Rw_Slice called @a name.
 *
 * @param[in] name the name of the variable to be the Eina_Rw_Slice.
 * @param[in] length the size in bytes of the storage.
 *
 * @since 1.19
  }
{*
 * @def EINA_SLICE_STR_LITERAL(buf)
 *
 * Initializer for string literals (those declared as
 * double-quoted). The size will @b NOT include the trailing
 * null-terminator.
 *
 * It is often useful for globals.
 *
 * @param[in] buf The array to create the slice from.
 * @return The initialized slice object.
 *
 * @note This macro is usable with both Eina_Slice or Eina_Rw_Slice.
 *
 * @code
 * static const Eina_Slice ro_slice = EINA_SLICE_STR_LITERAL("hello world");
 * @endcode
 *
 * @see EINA_SLICE_STR() for more generic version.
 * @see EINA_SLICE_ARRAY() for version that uses a general array.
 *
 * @since 1.19
  }
{*
 * @def EINA_SLICE_STR(str)
 *
 * Initializer for strings (uses strlen()).
 *
 * @param[in] str The string to create the slice from.
 * @return The initialized slice object.
 *
 * @note This macro is usable with both Eina_Slice or Eina_Rw_Slice.
 *
 * @code
 * Eina_Slice ro_slice = EINA_SLICE_STR("hello world");
 * @endcode
 *
 * @see EINA_SLICE_STR() for specific version using literals.
 *
 * @since 1.19
  }
{*
 * @def EINA_SLICE_STR_FULL(str)
 *
 * Same as EINA_SLICE_STR_FULL, but it also contains the \0 element of the string
 *
 * @param[in] str The string to create the slice from.
 * @return The initialized slice object.
 *
 * @note This macro is usable with both Eina_Slice or Eina_Rw_Slice.
 *
 * @code
 * Eina_Slice ro_slice = EINA_SLICE_STR_FULL("hello world");
 * @endcode
 *
 * @see EINA_SLICE_STR_FULL() for specific version using literals.
 *
 * @since 1.24
  }
{*
 * @def EINA_SLICE_STR_FMT
 *
 * To be used in printf()-like statements, prints the slice as a
 * string, its @c len is to be used, then it doesn't need the null
 * terminator.
 *
 * Use with EINA_SLICE_STR_PRINT()
 *
 * @note This macro is usable with both Eina_Slice or Eina_Rw_Slice.
 *
 * @code
 * Eina_Slice s = EINA_SLICE_STR_LITERAL("hello");
 * printf("s=" EINA_SLICE_STR_FMT "\n", EINA_SLICE_STR_PRINT(s));
 * @endcode
 *
 * @since 1.19
  }

const
  EINA_SLICE_STR_FMT = '%.*s';  
{*
 * @def EINA_SLICE_STR_PRINT(s)
 *
 * @brief To be used in printf()-like statements when EINA_SLICE_STR_FMT was
 * used, it will print the slice as a string up to @c len.
 *
 * @param[in] s The slice.
 * @return The arguments for an EINA_SLICE_STR_FMT formatted printf.
 *
 * Use with EINA_SLICE_STR_FMT.
 *
 * @note This macro is usable with both Eina_Slice or Eina_Rw_Slice.
 *
 * @code
 * Eina_Slice s = EINA_SLICE_STR_LITERAL("hello");
 * printf("s=" EINA_SLICE_STR_FMT "\n", EINA_SLICE_STR_PRINT(s));
 * @endcode
 *
 * @since 1.19
  }
{*
 * @def EINA_SLICE_FMT
 *
 * To be used in printf()-like statements, prints the slice as
 * @c 0x1234+12 (@c mem + @c len).
 *
 * Use with EINA_SLICE_PRINT()
 *
 * @note This macro is usable with both Eina_Slice or Eina_Rw_Slice.
 *
 * @code
 * Eina_Slice s = EINA_SLICE_STR_LITERAL("hello");
 * printf("s=" EINA_SLICE_FMT "\n", EINA_SLICE_PRINT(s));
 * @endcode
 *
 * @since 1.19
  }
  EINA_SLICE_FMT = '%p+%zu';  
{*
 * @def EINA_SLICE_PRINT(s)
 *
 * To be used in printf()-like statements when EINA_SLICE_FMT was
 * used, it will print the slice @c mem and @c len.
 *
 * Use with EINA_SLICE_FMT.
 *
 * @note This macro is usable with both Eina_Slice or Eina_Rw_Slice.
 *
 * @param[in] s The slice.
 * @return The arguments for an EINA_SLICE_FMT formatted printf.
 *
 * @code
 * Eina_Slice s = EINA_SLICE_STR_LITERAL("hello");
 * printf("s=" EINA_SLICE_FMT "\n", EINA_SLICE_PRINT(s));
 * @endcode
 *
 * @since 1.19
  }
{*
 * @def EINA_SLICE_FOREACH(s, itr)
 *
 * Iterate over the slice memory, using @c itr. Each increment will be
 * using the size of @c itr pointer (int32_t* will do in increments of
 * 4 bytes).
 *
 * @note This macro is usable with both Eina_Slice or Eina_Rw_Slice.
 *
 * @note Be aware of memory alignment! Accessing unaligned memory may
 *       not be supported in some architectures.
 *
 * @param[in] s The slice.
 * @param[in,out] itr the iterator to hold each byte. Use a proper type, not
 *        "void*" or "const void*" as it doesn't have an intrinsic
 *        size.
 *
 * @since 1.19
  }
{$include "eina_inline_slice.x"}
{*
 * @
  }
{*
 * @
  }
{$endif}
{ _EINA_SLICE_H  }

implementation


end.
