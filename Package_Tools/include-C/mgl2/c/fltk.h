/***************************************************************************
 * fltk.h is part of Math Graphic Library
 * Copyright (C) 2007-2016 Alexey Balakin <mathgl.abalakin@gmail.ru>       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU Lesser General Public License  as       *
 *   published by the Free Software Foundation; either version 3 of the    *
 *   License, or (at your option) any later version.                       *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU Lesser General Public     *
 *   License along with this program; if not, write to the                 *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/
#ifndef _MGL_FLTK_H_
#define _MGL_FLTK_H_

#include <mgl2/abstract.h>
//-----------------------------------------------------------------------------
#ifdef __cplusplus
extern "C" {
#endif
/// Creates FLTK window for plotting
HMGL MGL_EXPORT mgl_create_graph_fltk(int (*draw)(HMGL gr, void *p), const char *title, void *par, void (*load)(void *p));
uintptr_t MGL_EXPORT mgl_create_graph_fltk_(const char *title, int);
/// Run main FLTK loop for event handling.
int MGL_EXPORT mgl_fltk_run();
int MGL_EXPORT mgl_fltk_run_();
/// Run main FLTK loop for event handling in separate thread.
int MGL_EXPORT mgl_fltk_thr();
/// FLTK function for asking user.
void MGL_EXPORT mgl_ask_fltk(const wchar_t *quest, wchar_t *res);
/// FLTK function for displaying progress of something.
void MGL_EXPORT mgl_progress_fltk(int value, int maximal, HMGL gr);
/// Return pointer to widget (Fl_MGLView*) used for plotting
MGL_EXPORT_PURE void *mgl_fltk_widget(HMGL gr);
#endif
