/***************************************************************************
 * glut.h is part of Math Graphic Library
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
//-----------------------------------------------------------------------------
#ifndef _MGL_GLUT_H_
#define _MGL_GLUT_H_
#ifdef __cplusplus
#include <mgl2/wnd.h>
//-----------------------------------------------------------------------------
extern "C" {
#endif
void _mgl_key_up(unsigned char ch,int ,int );
HMGL  mgl_create_graph_glut(int (*draw)(HMGL gr, void *p), const char *title, void *par, void (*load)(void *p));


/// Switch on/off transparency (do not overwrite user settings)
void  mgl_glut_toggle_alpha(HMGL gr);
/// Switch on/off lighting (do not overwrite user settings)
void  mgl_glut_toggle_light(HMGL gr);
/// Switch off all zooming and rotation
void  mgl_glut_toggle_no(HMGL gr);
/// Update picture by calling user drawing function
void  mgl_glut_update(HMGL gr);
/// Reload user data and update picture
void  mgl_glut_reload(HMGL gr);
/// Show next frame (if one)
void  mgl_glut_next_frame(HMGL gr);
/// Show previous frame (if one)
void  mgl_glut_prev_frame(HMGL gr);
/// Run slideshow (animation) of frames
void  mgl_glut_animation(HMGL gr);


#endif
