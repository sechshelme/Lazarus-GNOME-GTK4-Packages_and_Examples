/*====================================================================*
 -  Copyright (C) 2001 Leptonica.  All rights reserved.
 -
 -  Redistribution and use in source and binary forms, with or without
 -  modification, are permitted provided that the following conditions
 -  are met:
 -  1. Redistributions of source code must retain the above copyright
 -     notice, this list of conditions and the following disclaimer.
 -  2. Redistributions in binary form must reproduce the above
 -     copyright notice, this list of conditions and the following
 -     disclaimer in the documentation and/or other materials
 -     provided with the distribution.
 -
 -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 -  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 -  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL ANY
 -  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 -  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 -  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 -  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *====================================================================*/

#ifndef  LEPTONICA_ARRAY_ACCESS_H
#define  LEPTONICA_ARRAY_ACCESS_H

/*!
 * \file arrayaccess.h
 *
 * <pre>
 *  1, 2, 4, 8, 16 and 32 bit data access within an array of 32-bit words
 *
 *  This is used primarily to access 1, 2, 4, 8, 16 and 32 bit pixels
 *  in a line of image data, represented as an array of 32-bit words.
 *
 *     pdata:  pointer to first 32-bit word in the array
 *     n:      index of the pixel in the array
 *
 *  Function calls for these accessors are defined in arrayaccess.c.
 *
 *  However, for efficiency we use the inline macros for all accesses.
 *  Even though the 2 and 4 bit set* accessors are more complicated,
 *  they are about 10% faster than the function calls.
 *
 *  The 32 bit access is just a cast and ptr arithmetic.  We include
 *  it so that the input ptr can be void*.
 *
 *  At the end of this file is code for invoking the function calls
 *  instead of inlining.
 *
 *  The macro SET_DATA_BIT_VAL(pdata, n, val) is a bit slower than
 *      if (val == 0)
 *          CLEAR_DATA_BIT(pdata, n);
 *      else
 *          SET_DATA_BIT(pdata, n);
 *
 *  Some compilers complain when the SET macros are surrounded by
 *  parentheses, because parens require an evaluation and it is not
 *  defined for SET macros.  If SET_DATA_QBIT were defined as a
 *  compound macro, in analogy to l_setDataQbit(), it requires
 *  surrounding braces:
 * \code
 *     #define  SET_DATA_QBIT(pdata, n, val) \
 *        {l_uint32 *_TEMP_WORD_PTR_; \
 *         _TEMP_WORD_PTR_ = (l_uint32 *)(pdata) + ((n) >> 3); \
 *         *_TEMP_WORD_PTR_ &= ~(0xf0000000 >> (4 * ((n) & 7))); \
 *         *_TEMP_WORD_PTR_ |= (((val) & 15) << (28 - 4 * ((n) & 7)));}
 * \endcode
 *  but if used in an if/else
 * \code
 *      if (x)
 *         SET_DATA_QBIT(...);
 *      else
 *         ...
 * \endcode
 *  the compiler sees
 * \code
 *      if (x)
 *         {......};
 *      else
 *         ...
 * \endcode
 *  The semicolon comes after the brace and will not compile.
 *  This can be fixed in the call by either omitting the semicolon
 *  or requiring another set of braces around SET_DATA_QBIT(), but
 *  both these options break compatibility with current code, and
 *  require special attention by anyone using the macros.
 *
 *  There are (at least) two ways to fix this in the macro definitions,
 *  suggested by Dave Bryan.
 *  (1) Surround the braces in the macro above with
 *         do {....} while(0)
 *      Then the semicolon just terminates the expression.
 *  (2) Reduce the blocks to a single expression; e.g,
 *         *((l_uint32 *)(pdata) + ((n) >> 3)) = \
 *           *((l_uint32 *)(pdata) + ((n) >> 3)) \
 *           & ~(0xf0000000 >> (4 * ((n) & 7))) \
 *           | (((val) & 15) << (28 - 4 * ((n) & 7)))
 *      This appears to cause redundant computation, but the compiler
 *      should evaluate the common subexpression only once.
 *  All these methods have the same performance, giving about 300M
 *  SET_DATA_QBIT operations per second on a fast 64 bit system.
 *  Using the function calls instead of the macros results in about 250M
 *  SET_DATA_QBIT operations per second, a performance hit of nearly 20%.
 * </pre>
 */

#else

    /*=============================================================*/
    /*         Slower: use function calls for all accessors        */
    /*=============================================================*/

#define  GET_DATA_BIT(pdata, n)               l_getDataBit(pdata, n)
#define  SET_DATA_BIT(pdata, n)               l_setDataBit(pdata, n)
#define  CLEAR_DATA_BIT(pdata, n)             l_clearDataBit(pdata, n)
#define  SET_DATA_BIT_VAL(pdata, n, val)      l_setDataBitVal(pdata, n, val)

#define  GET_DATA_DIBIT(pdata, n)             l_getDataDibit(pdata, n)
#define  SET_DATA_DIBIT(pdata, n, val)        l_setDataDibit(pdata, n, val)
#define  CLEAR_DATA_DIBIT(pdata, n)           l_clearDataDibit(pdata, n)

#define  GET_DATA_QBIT(pdata, n)              l_getDataQbit(pdata, n)
#define  SET_DATA_QBIT(pdata, n, val)         l_setDataQbit(pdata, n, val)
#define  CLEAR_DATA_QBIT(pdata, n)            l_clearDataQbit(pdata, n)

#define  GET_DATA_BYTE(pdata, n)              l_getDataByte(pdata, n)
#define  SET_DATA_BYTE(pdata, n, val)         l_setDataByte(pdata, n, val)

#define  GET_DATA_TWO_BYTES(pdata, n)         l_getDataTwoBytes(pdata, n)
#define  SET_DATA_TWO_BYTES(pdata, n, val)    l_setDataTwoBytes(pdata, n, val)

#define  GET_DATA_FOUR_BYTES(pdata, n)         l_getDataFourBytes(pdata, n)
#define  SET_DATA_FOUR_BYTES(pdata, n, val)    l_setDataFourBytes(pdata, n, val)

#endif  /* USE_INLINE_ACCESSORS */


#endif /* LEPTONICA_ARRAY_ACCESS_H */
