#ifndef _EFL_LAYOUT_H
#define _EFL_LAYOUT_H

#include <Efl_Config.h>

#include <Eina.h>

#include <Eo.h>
/* This include has been added to support Eo in Evas */
#include <Efl.h>

#include <Efl_Canvas.h>

#ifdef extern
# undef extern
#endif


#ifdef __cplusplus
extern "C" {
#endif

#include <efl_layout_calc.eo.h>
#include <efl_layout_signal.eo.h>
#include <efl_layout_group.eo.h>
#include <efl_canvas_layout.eo.h>

#include <efl_canvas_layout_types.eot.h>

#include <efl_canvas_layout_part_type_provider.eo.h>
#include <efl_canvas_layout_part.eo.h>
#include <efl_canvas_layout_part_box.eo.h>
#include <efl_canvas_layout_part_table.eo.h>
#include <efl_canvas_layout_part_swallow.eo.h>
#include <efl_canvas_layout_part_text.eo.h>
#include <efl_canvas_layout_part_external.eo.h>

#ifdef __cplusplus
}
#endif


#endif
