#ifndef _EVAS_TABLE_EO_LEGACY_H_
#define _EVAS_TABLE_EO_LEGACY_H_

#ifndef _EVAS_TABLE_EO_CLASS_TYPE
#define _EVAS_TABLE_EO_CLASS_TYPE

typedef Eo Evas_Table;

#endif

#ifndef _EVAS_TABLE_EO_TYPES
#define _EVAS_TABLE_EO_TYPES

/**
 * @brief How to pack items into cells in a table.
 *
 * See @ref evas_object_table_homogeneous_get for an explanation of the
 * function of each one.
 *
 * @ingroup Evas_Object_Table
 */
typedef enum
{
  EVAS_OBJECT_TABLE_HOMOGENEOUS_NONE = 0, /**< No mode specified */
  EVAS_OBJECT_TABLE_HOMOGENEOUS_TABLE = 1, /**< Table mode */
  EVAS_OBJECT_TABLE_HOMOGENEOUS_ITEM = 2 /**< Item mode */
} Evas_Object_Table_Homogeneous_Mode;


#endif

/**
 * @brief Set how this table should layout children.
 *
 * Todo: consider aspect hint and respect it.
 *
 * @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_NONE If table does not use homogeneous
 * mode then columns and rows will be calculated based on hints of individual
 * cells. This operation mode is more flexible, but more complex and heavy to
 * calculate as well. Weight properties are handled as a boolean expand.
 * Negative alignment will be considered as 0.5. This is the default.
 *
 * Todo: @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_NONE should balance weight.
 *
 * @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_TABLE When homogeneous is relative to
 * table the own table size is divided equally among children, filling the
 * whole table area. That is, if table has @c WIDTH and @c COLUMNS, each cell
 * will get _WIDTH / COLUMNS_ pixels. If children have minimum size that is
 * larger than this amount (including padding), then it will overflow and be
 * aligned respecting the alignment hint, possible overlapping sibling cells.
 * Weight hint is used as a boolean, if greater than zero it will make the
 * child expand in that axis, taking as much space as possible (bounded to
 * maximum size hint). Negative alignment will be considered as 0.5.
 *
 * @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_ITEM When homogeneous is relative to item
 * it means the greatest minimum cell size will be used. That is, if no element
 * is set to expand, the table will have its contents to a minimum size, the
 * bounding box of all these children will be aligned relatively to the table
 * object using evas_object_table_align_get(). If the table area is too small
 * to hold this minimum bounding box, then the objects will keep their size and
 * the bounding box will overflow the box area, still respecting the alignment.
 * Weight hint is used as a boolean, if greater than zero it will make that
 * cell expand in that axis, toggling the *expand mode*, which makes the table
 * behave much like @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_TABLE, except that the
 * bounding box will overflow and items will not overlap siblings. If no
 * minimum size is provided at all then the table will fallback to expand mode
 * as well.
 *
 * @param[in] obj The object.
 * @param[in] homogeneous Table homogeneous mode
 *
 * @ingroup Evas_Object_Table_Group
 */
extern void evas_object_table_homogeneous_set(Evas_Table *obj, Evas_Object_Table_Homogeneous_Mode homogeneous);

/**
 * @brief Set how this table should layout children.
 *
 * Todo: consider aspect hint and respect it.
 *
 * @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_NONE If table does not use homogeneous
 * mode then columns and rows will be calculated based on hints of individual
 * cells. This operation mode is more flexible, but more complex and heavy to
 * calculate as well. Weight properties are handled as a boolean expand.
 * Negative alignment will be considered as 0.5. This is the default.
 *
 * Todo: @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_NONE should balance weight.
 *
 * @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_TABLE When homogeneous is relative to
 * table the own table size is divided equally among children, filling the
 * whole table area. That is, if table has @c WIDTH and @c COLUMNS, each cell
 * will get _WIDTH / COLUMNS_ pixels. If children have minimum size that is
 * larger than this amount (including padding), then it will overflow and be
 * aligned respecting the alignment hint, possible overlapping sibling cells.
 * Weight hint is used as a boolean, if greater than zero it will make the
 * child expand in that axis, taking as much space as possible (bounded to
 * maximum size hint). Negative alignment will be considered as 0.5.
 *
 * @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_ITEM When homogeneous is relative to item
 * it means the greatest minimum cell size will be used. That is, if no element
 * is set to expand, the table will have its contents to a minimum size, the
 * bounding box of all these children will be aligned relatively to the table
 * object using evas_object_table_align_get(). If the table area is too small
 * to hold this minimum bounding box, then the objects will keep their size and
 * the bounding box will overflow the box area, still respecting the alignment.
 * Weight hint is used as a boolean, if greater than zero it will make that
 * cell expand in that axis, toggling the *expand mode*, which makes the table
 * behave much like @ref EVAS_OBJECT_TABLE_HOMOGENEOUS_TABLE, except that the
 * bounding box will overflow and items will not overlap siblings. If no
 * minimum size is provided at all then the table will fallback to expand mode
 * as well.
 *
 * @param[in] obj The object.
 *
 * @return Table homogeneous mode
 *
 * @ingroup Evas_Object_Table_Group
 */
extern Evas_Object_Table_Homogeneous_Mode evas_object_table_homogeneous_get(const Evas_Table *obj);

/**
 * @brief Control the alignment of the whole bounding box of contents.
 *
 * @param[in] obj The object.
 * @param[in] horizontal Horizontal alignment
 * @param[in] vertical Vertical alignment
 *
 * @ingroup Evas_Object_Table_Group
 */
extern void evas_object_table_align_set(Evas_Table *obj, double horizontal, double vertical);

/**
 * @brief Control the alignment of the whole bounding box of contents.
 *
 * @param[in] obj The object.
 * @param[out] horizontal Horizontal alignment
 * @param[out] vertical Vertical alignment
 *
 * @ingroup Evas_Object_Table_Group
 */
extern void evas_object_table_align_get(const Evas_Table *obj, double *horizontal, double *vertical);

/**
 * @brief Control the padding between cells.
 *
 * @param[in] obj The object.
 * @param[in] horizontal Horizontal padding
 * @param[in] vertical Vertical padding
 *
 * @ingroup Evas_Object_Table_Group
 */
extern void evas_object_table_padding_set(Evas_Table *obj, int horizontal, int vertical);

/**
 * @brief Control the padding between cells.
 *
 * @param[in] obj The object.
 * @param[out] horizontal Horizontal padding
 * @param[out] vertical Vertical padding
 *
 * @ingroup Evas_Object_Table_Group
 */
extern void evas_object_table_padding_get(const Evas_Table *obj, int *horizontal, int *vertical);

/**
 * @brief Get the number of columns and rows this table takes.
 *
 * @note columns and rows are virtual entities, one can specify a table with a
 * single object that takes 4 columns and 5 rows. The only difference for a
 * single cell table is that paddings will be accounted proportionally.
 *
 * @param[in] obj The object.
 * @param[out] cols Columns in table
 * @param[out] rows Rows in table
 *
 * @ingroup Evas_Object_Table_Group
 */
extern void evas_object_table_col_row_size_get(const Evas_Table *obj, int *cols, int *rows);

/**
 * @brief Get the list of children for the table.
 *
 * @note This is a duplicate of the list kept by the table internally. It's up
 * to the user to destroy it when it no longer needs it. It's possible to
 * remove objects from the table when walking this list, but these removals
 * won't be reflected on it.
 *
 * @param[in] obj The object.
 *
 * @return Children list
 *
 * @ingroup Evas_Object_Table_Group
 */
extern Eina_List *evas_object_table_children_get(const Evas_Table *obj) ;

/**
 * @brief Get the child of the table at the given coordinates
 *
 * @note This does not take into account col/row spanning
 *
 * @param[in] obj The object.
 * @param[in] col Child column
 * @param[in] row Child row
 *
 * @return Child object
 *
 * @ingroup Evas_Object_Table_Group
 */
extern Efl_Canvas_Object *evas_object_table_child_get(const Evas_Table *obj, unsigned short col, unsigned short row);

/**
 * @brief Faster way to remove all child objects from a table object.
 *
 * @param[in] obj The object.
 * @param[in] clear If @c true, it will delete just removed children.
 *
 * @ingroup Evas_Object_Table_Group
 */
extern void evas_object_table_clear(Evas_Table *obj, Eina_Bool clear);

/**
 * @brief Get an accessor to get random access to the list of children for the
 * table.
 *
 * @note Do not remove or delete objects while walking the list.
 *
 * @param[in] obj The object.
 *
 * @return Accessor to children list
 *
 * @ingroup Evas_Object_Table_Group
 */
extern Eina_Accessor *evas_object_table_accessor_new(const Evas_Table *obj) ;

/**
 * @brief Get an iterator to walk the list of children for the table.
 *
 * @note Do not remove or delete objects while walking the list.
 *
 * @param[in] obj The object.
 *
 * @return Iterator to children
 *
 * @ingroup Evas_Object_Table_Group
 */
extern Eina_Iterator *evas_object_table_iterator_new(const Evas_Table *obj) ;

/**
 * @brief Create a table that is child of a given element @c parent.
 *
 * @param[in] obj The object.
 *
 * @return Children table
 *
 * @ingroup Evas_Object_Table_Group
 */
extern Efl_Canvas_Object *evas_object_table_add_to(Evas_Table *obj) ;

/**
 * @brief Get packing location of a child of table
 *
 * @param[in] obj The object.
 * @param[in] child The child object to add.
 * @param[out] col Pointer to store relative-horizontal position to place
 * child.
 * @param[out] row Pointer to store relative-vertical position to place child.
 * @param[out] colspan Pointer to store how many relative-horizontal positions
 * to use for this child.
 * @param[out] rowspan Pointer to store how many relative-vertical positions to
 * use for this child.
 *
 * @return @c true on success, @c false on failure.
 *
 * @since 1.1
 *
 * @ingroup Evas_Object_Table_Group
 */
extern Eina_Bool evas_object_table_pack_get(const Evas_Table *obj, Efl_Canvas_Object *child, unsigned short *col, unsigned short *row, unsigned short *colspan, unsigned short *rowspan);

/**
 * @brief Add a new child to a table object or set its current packing.
 *
 * Note that columns and rows only guarantee 16bit unsigned values at best.
 * That means that col + colspan AND row + rowspan must fit inside 16bit
 * unsigned values cleanly. You will be warned once values exceed 15bit
 * storage, and attempting to use values not able to fit in 16bits will result
 * in failure.
 *
 * @param[in] obj The object.
 * @param[in] child The child object to add.
 * @param[in] col Relative-horizontal position to place child.
 * @param[in] row Relative-vertical position to place child.
 * @param[in] colspan How many relative-horizontal positions to use for this
 * child.
 * @param[in] rowspan How many relative-vertical positions to use for this
 * child.
 *
 * @return @c true on success, @c false on failure.
 *
 * @ingroup Evas_Object_Table_Group
 */
extern Eina_Bool evas_object_table_pack(Evas_Table *obj, Efl_Canvas_Object *child, unsigned short col, unsigned short row, unsigned short colspan, unsigned short rowspan) ;

/**
 * @brief Remove child from table.
 *
 * @note removing a child will immediately call a walk over children in order
 * to recalculate numbers of columns and rows. If you plan to remove all
 * children, use @ref evas_object_table_clear instead.
 *
 * @param[in] obj The object.
 * @param[in] child Child to be removed
 *
 * @return @c true on success, @c false on failure.
 *
 * @ingroup Evas_Object_Table_Group
 */
extern Eina_Bool evas_object_table_unpack(Evas_Table *obj, Efl_Canvas_Object *child) ;


#endif
