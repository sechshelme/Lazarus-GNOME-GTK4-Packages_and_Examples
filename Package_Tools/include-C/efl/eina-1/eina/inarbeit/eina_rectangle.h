/* EINA - EFL data type library
 * Copyright (C) 2007-2008 Jorge Luis Zapata Muga
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

#ifndef EINA_RECTANGLE_H_
#define EINA_RECTANGLE_H_

#include "eina_types.h"

/**
 * @addtogroup Eina_Rectangle_Group Rectangle
 *
 * @brief These functions provide rectangle management.
 */

/**
 * @addtogroup Eina_Tools_Group Tools
 *
 * @{
 */

/**
 * @defgroup Eina_Rectangle_Group Rectangle
 *
 * @{
 */

/** A zero-size rectangle. */
//#define EINA_RECTANGLE_INIT { 0, 0, 0, 0}
/** A format string useful for printf-like functions. */
#define EINA_RECTANGLE_FORMAT "dx%d - %dx%d"
/** Separates the components of the rectangle structure into a comma-separated list,
 * so they can be used as parameters. */
//#define EINA_RECTANGLE_ARGS(r) (r)->x, (r)->y, (r)->w, (r)->h

/** Creates an instance of an #Eina_Rect */
//#define EINA_RECT(x, y, w, h) ((Eina_Rect) { { (x), (y), (w), (h) } })
/** A zero-size rectangle that can be used to initialize #Eina_Rect structures. */
//#define EINA_RECT_ZERO() { EINA_RECTANGLE_INIT }
/** A zero-size rectangle that can be used to initialize #Eina_Rect structures. */
#define EINA_RECT_EMPTY() ((Eina_Rect) EINA_RECT_ZERO())

/** Creates an instance of an #Eina_Position2D */
//#define EINA_POSITION2D(x, y) ((Eina_Position2D) { (x), (y) })
/** Creates an instance of an #Eina_Size2D */
//#define EINA_SIZE2D(x, y) ((Eina_Size2D) { (x), (y) })

/** @brief A 2D position in pixel coordinates */
typedef struct _Eina_Position2D
{
   int x, y;
} Eina_Position2D;

/** @brief A 2D size in pixel coordinates */
typedef struct _Eina_Size2D
{
   int w, h;
} Eina_Size2D;


/**
 * @brief convenience macro for comparing two Eina_Size2D structs
 * @param[in] a An Eina_Size2D
 * @param[in] b An Eina_Size2D
 * @return 1 if the structs are equal, 0 if they are not
 * @since 1.24
 */
#define EINA_SIZE2D_EQ(a, b) \
  (((a).w == (b).w) && ((a).h == (b).h))

/**
 * @brief convenience macro for comparing two Eina_Position2D structs
 * @param[in] a An Eina_Position2D
 * @param[in] b An Eina_Position2D
 * @return 1 if the structs are equal, 0 if they are not
 * @since 1.24
 */
#define EINA_POSITION2D_EQ(a, b) \
  (((a).x == (b).x) && ((a).y == (b).y))
/**
 * @brief Convenience macro for getting the distance from one point to another
 * @param[in] a An Eina_Position2D
 * @param[in] b An Eina_Position2D
 * @return The distance between the two points.
 * @since 1.24
 */
#define EINA_POSITION2D_DISTANCE(a, b) \
  sqrt((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y))

/**
 * @typedef Eina_Rectangle
 * Simple rectangle structure.
 */
typedef struct _Eina_Rectangle
{
   int x; /**< top-left x coordinate of rectangle */
   int y; /**< top-left y coordinate of rectangle */
   int w; /**< width of rectangle */
   int h; /**< height of rectangle */
} Eina_Rectangle;

/**
 * @typedef Eina_Rect
 * A convenient rectangle structure which can be accessed in different ways.
 */
typedef union _Eina_Rect
{
   Eina_Rectangle rect; /**< Embedded simple rectangle structure */
   struct {
      Eina_Position2D pos; /**< Top-left corner in pixels */
      Eina_Size2D size; /**< Size in pixels */
   } xxx;
   struct {
      int x; /**< Top-left x coordinate of rectangle */
      int y; /**< Top-left y coordinate of rectangle */
      int w; /**< Width of rectangle */
      int h; /**< Height of rectangle */
   } xxx;
} Eina_Rect;

/**
 * @typedef Eina_Rectangle_Pool
 * Type for an opaque pool of rectangles.
 */
typedef struct _Eina_Rectangle_Pool Eina_Rectangle_Pool;

/**
 * @typedef Eina_Rectangle_Packing
 * Type for an Eina Pool based on a packing algorithm.
 * @since 1.11
 */
typedef enum {
  Eina_Packing_Descending,            /**< Current */
  Eina_Packing_Ascending,             /**< sorting in ascending order */
  Eina_Packing_Bottom_Left,           /**< sorting in bottom left fashion */
  Eina_Packing_Bottom_Left_Skyline,   /**< bottom left skyline  */
  Eina_Packing_Bottom_Left_Skyline_Improved   /**< optimized bottom left skyline  */
} Eina_Rectangle_Packing;

/**
 * @typedef Eina_Rectangle_Outside
 * Enumeration of the positions around a rectangle.
 * @since 1.19
 */
typedef enum {
    EINA_RECTANGLE_OUTSIDE_TOP = 1,    /**< Position is over the rectangle */
    EINA_RECTANGLE_OUTSIDE_LEFT = 2,   /**< Position is to the left of the rectangle */
    EINA_RECTANGLE_OUTSIDE_BOTTOM = 4, /**< Position is below the rectangle */
    EINA_RECTANGLE_OUTSIDE_RIGHT = 8   /**< Position is to the right of the rectangle */
} Eina_Rectangle_Outside;


/**
 * @brief Checks if the given spans intersect.
 *
 * @param[in] c1 The column of the first span.
 * @param[in] l1 The length of the first span.
 * @param[in] c2 The column of the second span.
 * @param[in] l2 The length of the second span.
 * @return #EINA_TRUE if the given spans intersect, #EINA_FALSE otherwise.
 */

/**
 * @brief Sets the coordinates and size of a rectangle.
 *
 * @param[out] rect The rectangle.
 * @param[in] x The X coordinate of the rectangle's top-left corner.
 * @param[in] y The Y coordinate of the rectangle's top-left corner.
 * @param[in] w The width of the rectangle.
 * @param[in] h The height of the rectangle.
 *
 * This function sets its top-left X coordinate to @p x, its top-left
 * Y coordinate to @p y, its width to @p w and its height to @p h.
 *
 * No check is done on @p r, so it must be a valid rectangle.
 */

/**
 * @brief Checks if the given point is inside the rectangle.
 *
 * @param[in] rect The rectangle.
 * @param[in] x The x coordinate of the point.
 * @param[in] y The y coordinate of the point.
 * @return #EINA_TRUE if the point (@p x, @p y) is within the edges of
 * @p r, #EINA_FALSE otherwise.
 *
 * No check is done on @p r, so it must be a valid rectangle.
 */

/**
 * @brief FIXME I am useless and used by no one
 *
 * @param in The inner rectangle.
 * @param out The outer rectangle.
 * @param res The resulting rectangle.
 *
 */

/**
 * @brief Slices a rectangle vertically into two subrectangles.
 *
 * @param[in] rect The rectangle to slice.
 * @param[out] slice The sliced part of the rectangle.
 * @param[out] remainder The left over part of the rectangle after slicing.
 * @param[in] amount The slice location's horizontal distance from the left.
 * @return #EINA_TRUE if the cut succeeds, #EINA_FALSE otherwise.
 *
 * Cut a rectangle vertically at a distance @p amount from the
 * rectangle's left edge.  If the @p amount value is greater than the
 * rectangle's width, no cut is performed and #EINA_FALSE is returned.
 */

/**
 * @brief Adds a rectangle in a new pool.
 *
 * @param[in] w The width of the rectangle.
 * @param[in] h The height of the rectangle.
 * @return A newly allocated pool on success, @c NULL otherwise.
 *
 * This function adds the rectangle of size (@p width, @p height) to a
 * new pool. If the pool can not be created, @c NULL is
 * returned. Otherwise the newly allocated pool is returned.
 */
extern Eina_Rectangle_Pool *eina_rectangle_pool_new(int w, int h)  ;

/**
 * @brief Returns the pool of the given rectangle.
 *
 * @param[in] rect The rectangle.
 * @return The pool of the given rectangle.
 *
 * This function returns the pool in which @p rect is. If  @p rect is
 * @c NULL, @c NULL is returned.
 */
extern Eina_Rectangle_Pool *eina_rectangle_pool_get(Eina_Rectangle *rect)  ;

/**
 * @brief Returns the width and height of the given pool.
 *
 * @param[in] pool The pool.
 * @param[out] w The returned width.
 * @param[out] h The returned height.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * This function returns the width and height of @p pool and store
 * them in respectively @p w and @p h if they are not @c NULL. If
 * @p pool is @c NULL, #EINA_FALSE is returned. Otherwise #EINA_TRUE is
 * returned.
 */
extern Eina_Bool            eina_rectangle_pool_geometry_get(Eina_Rectangle_Pool *pool, int *w, int *h)   ;

/**
 * @brief Gets the data from the given pool.
 *
 * @param[in] pool The pool.
 * @return The returned data.
 *
 * This function gets the data from @p pool set by
 * eina_rectangle_pool_data_set(). If @p pool is @c NULL, this
 * function returns @c NULL.
 */
extern void                *eina_rectangle_pool_data_get(Eina_Rectangle_Pool *pool)  ;

/**
 * @brief Sets the data to the given pool.
 *
 * @param[in,out] pool The pool.
 * @param[in] data The data to set.
 *
 * This function sets @p data to @p pool. If @p pool is @c NULL, this
 * function does nothing.
 */
extern void                 eina_rectangle_pool_data_set(Eina_Rectangle_Pool *pool, const void *data) ;

/**
 * @brief Frees the given pool.
 *
 * @param[in] pool The pool to free.
 *
 * This function frees the allocated data of @p pool. If @p pool is
 * @c NULL, this function returned immediately.
 */
extern void                 eina_rectangle_pool_free(Eina_Rectangle_Pool *pool) ;

/**
 * @brief Returns the number of rectangles in the given pool.
 *
 * @param[in] pool The pool.
 * @return The number of rectangles in the pool.
 *
 * This function returns the number of rectangles in @p pool.
 */
extern int                  eina_rectangle_pool_count(Eina_Rectangle_Pool *pool)  ;

/**
 * @brief Requests a rectangle of given size in the given pool.
 *
 * @param[in,out] pool The pool.
 * @param[in] w The width of the rectangle to request.
 * @param[in] h The height of the rectangle to request.
 * @return The requested rectangle on success, @c NULL otherwise.
 *
 * This function retrieves from @p pool the rectangle of width @p w and
 * height @p h. If @p pool is @c NULL, or @p w or @p h are non-positive,
 * the function returns @c NULL. If @p w or @p h are greater than the
 * pool size, the function returns @c NULL. On success, the function
 * returns the rectangle which matches the size (@p w, @p h).
 * Otherwise it returns @c NULL.
 */
extern Eina_Rectangle      *eina_rectangle_pool_request(Eina_Rectangle_Pool *pool, int w, int h)  ;

/**
 * @brief Removes the given rectangle from the pool.
 *
 * @param[in,out] rect The rectangle to remove from the pool.
 *
 * This function removes @p rect from the pool. If @p rect is
 * @c NULL, the function returns immediately. Otherwise it removes @p
 * rect from the pool.
 */
extern void                 eina_rectangle_pool_release(Eina_Rectangle *rect) ;

/**
 * @def EINA_RECTANGLE_SET
 * @brief Definition for the macro to set the values of a #Eina_Rectangle.
 *
 * @param[out] Rectangle The rectangle.
 * @param[in] X The X coordinate of the top left corner of the rectangle.
 * @param[in] Y The Y coordinate of the top left corner of the rectangle.
 * @param[in] W The width of the rectangle.
 * @param[in] H The height of the rectangle.
 *
 * This macro set the values of @p Rectangle. @p X and @p Y are the
 * coordinates of the top left corner of @p Rectangle, @p W is its
 * width and @p H is its height.
 */
// xxxxxxxxxxxxxxxxxxx
//#define EINA_RECTANGLE_SET(Rectangle, X, Y, W, H) \
//    {						  \
//      (Rectangle)->x = X;			  \
      //(Rectangle)->y = Y;			  \
//      (Rectangle)->w = W;			  \
//      (Rectangle)->h = H;			  \
//    }

/**
 * @def EINA_RECT_SET
 * Functionally equivalent to #EINA_RECTANGLE_SET
 */
// xxxxxxxxxxxxxxxxxxxxxxxx
//#define EINA_RECT_SET(rect, x, y, w, h) do { EINA_RECTANGLE_SET((&rect), x, y, w, h) } while (0)


/**
 * @brief Creates a new rectangle.
 *
 * @param[in] x The X coordinate of the top left corner of the rectangle.
 * @param[in] y The Y coordinate of the top left corner of the rectangle.
 * @param[in] w The width of the rectangle.
 * @param[in] h The height of the rectangle.
 * @return The new rectangle on success, @ NULL otherwise.
 *
 * This function creates a rectangle whose top left corner has the
 * coordinates (@p x, @p y), with height @p w and height @p h and adds
 * it to the rectangles pool.
 *
 * No check is done on @p w and @p h.
 */
extern Eina_Rectangle *eina_rectangle_new(int x, int y, int w, int h)  ;

/**
 * @brief Frees the given rectangle.
 *
 * @param[in] rect The rectangle to free.
 *
 * This function removes @p rect from the rectangles pool.
 */
extern void            eina_rectangle_free(Eina_Rectangle *rect) ;

/**
 * @brief Sets the type of given rectangle pool.
 *
 * @param[in,out] pool The rectangle pool for which type is to be set.
 * @param[in] type Type of Eina Pool based on packing algorithm.
 *
 * This function sets @p type of @p pool.
 * @see Eina_Rectangle_Packing
 * @since 1.11
 */
extern void            eina_rectangle_pool_packing_set(Eina_Rectangle_Pool *pool,Eina_Rectangle_Packing type) ;

/**
 * @brief calculates where rect2 is outside of rect1.
 *
 * @param[in] rect1 The rect to use as anchor
 * @param[in] rect2 The rect to look for outside positions
 *
 * @return An OR'd map of Eina_Rectangle_Outside values
 * @since 1.19
 */
extern Eina_Rectangle_Outside eina_rectangle_outside_position(Eina_Rectangle *rect1, Eina_Rectangle *rect2);

/**
 * @brief Compares two rectangles for equality
 *
 * @param[in] rect1 First rectangle. Must not be NULL.
 * @param[in] rect2 Second rectangle. Must not be NULL.
 * @return EINA_TRUE if the rectangles are equal (x, y, w and h are all equal).
 *
 * No check is made on the rectangles, so they should be valid and non
 * NULL for this function to be meaningful.
 *
 * @since 1.21
 */

#include "eina_inline_rectangle.x"

/**
 * @}
 */

/**
 * @}
 */

#endif /*_EINA_RECTANGLE_H_*/
