/* EINA - EFL data type library
 * Copyright (C) 2007-2008 Carsten Haitzler, Vincent Torri, Jorge Luis Zapata Muga
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
 */

#ifndef EINA_TYPES_H_
#define EINA_TYPES_H_

/**
 * @addtogroup Eina_Core_Group Core
 *
 * @{
 */

/**
 * @defgroup Eina_Types_Group Types
 *
 * @brief Definition for eina types and core functions.
 *
 * @{
 */




typedef unsigned char Eina_Bool;

/**
 * @def EINA_FALSE
 * boolean value FALSE (numerical value 0)
 */
#define EINA_FALSE ((Eina_Bool)0)

/**
 * @def EINA_TRUE
 * boolean value TRUE (numerical value 1)
 */
#define EINA_TRUE  ((Eina_Bool)1)

/**
 * @typedef Eina_Compare_Cb
 * Function used in functions using sorting. It compares @p data1 and
 * @p data2. If @p data1 is 'less' than @p data2, -1 must be returned,
 * if it is 'greater', 1 must be returned, and if they are equal, 0
 * must be returned.
 */
typedef int (*Eina_Compare_Cb)(const void *data1, const void *data2);

/**
 * @def EINA_COMPARE_CB
 * Macro to cast to Eina_Compare_Cb.
 */
#define EINA_COMPARE_CB(function) ((Eina_Compare_Cb)function)

/**
 * @typedef Eina_Random_Cb
 * Function used in shuffling functions. An integer between min and max
 * inclusive must be returned.
 *
 * @since 1.8
 */
typedef int (*Eina_Random_Cb)(const int min, const int max);

/**
 * @def EINA_RANDOM_CB
 * Macro to cast to Eina_Random_Cb.
 */
#define EINA_RANDOM_CB(function) ((Eina_Random_Cb)function)

/**
 * @typedef Eina_Process_Cb
 * Method that processes some data and returns new data.
 * It's meant to be used as a callback to process all nodes inside a container
 * (See eina_iterator_processed_new, for example.)
 * @param data The data to process.
 * @param fdata Context data.
 * @return The processed data.
 */
typedef void* (*Eina_Process_Cb)(const void *container, void *data, void *fdata);

/**
 * @def EINA_PROCESS_CB
 * Macro to cast to Eina_Process.
 */
#define EINA_PROCESS_CB(Function) ((Eina_Process_Cb)Function)
/**
 * @typedef Eina_Each_Cb
 * A callback type used when iterating over a container.
 */
typedef Eina_Bool (*Eina_Each_Cb)(const void *container, void *data, void *fdata);

/**
 * @def EINA_EACH_CB
 * Macro to cast to Eina_Each.
 */
#define EINA_EACH_CB(Function) ((Eina_Each_Cb)Function)

/**
 * @typedef Eina_Free_Cb
 * A callback type used to free data when iterating over a container.
 */
typedef void (*Eina_Free_Cb)(void *data);

/**
 * @def EINA_FREE_CB
 * Macro to cast to Eina_Free_Cb.
 */
#define EINA_FREE_CB(Function) ((Eina_Free_Cb)Function)

/**
 * @def EINA_C_ARRAY_LENGTH
 * Macro to return the array length of a standard c array.
 *
 * For example:
 * int foo[] = { 0, 1, 2, 3 };
 * would return 4 and not 4 * sizeof(int).
 *
 * @since 1.2.0
 */
// xxxxxxxx#define EINA_C_ARRAY_LENGTH(arr) (sizeof(arr) / sizeof((arr)[0]))

/**
 * @def EINA_DOUBLE_EQUAL
 * Macro to compare 2 double floating point values and deal with precision
 * loss issues.
 *
 * @since 1.18
 */
#define EINA_DOUBLE_EQUAL(x, y) \
   (fabs((x) - (y)) <= (2.2204460492503131e-16) * fabs((x)))

/**
 * @}
 */

/**
 * @}
 */

#endif /* EINA_TYPES_H_ */
