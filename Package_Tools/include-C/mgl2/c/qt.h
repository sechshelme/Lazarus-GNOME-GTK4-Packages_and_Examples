/***************************************************************************
 * qt.h is part of Math Graphic Library
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
#ifndef _MGL_QT_H_
#define _MGL_QT_H_
#include <mgl2/abstract.h>
//-----------------------------------------------------------------------------
/// Creates Qt window for plotting
HMGL MGL_EXPORT mgl_create_graph_qt(int (*draw)(HMGL gr, void *p), const char *title, void *par, void (*load)(void *p));
uintptr_t MGL_EXPORT mgl_create_graph_qt_(const char *title, int);
/// Run main Qt loop for event handling.
int MGL_EXPORT mgl_qt_run();
int MGL_EXPORT mgl_qt_run_();
/// Return pointer to widget (QMathGL*) used for plotting
MGL_EXPORT_PURE void *mgl_qt_widget(HMGL gr);
#endif
