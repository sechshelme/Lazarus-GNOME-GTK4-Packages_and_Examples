/***************************************************************************
 * addon.h is part of Math Graphic Library
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
#ifndef _MGL_ADDON_H_
#define _MGL_ADDON_H_
//-----------------------------------------------------------------------------
#include "mgl2/define.h"
/// Get random number with Gaussian distribution
double  mgl_gauss_rnd();
/// Fill frequencies for FFT
void  mgl_fft_freq(double *freq,long nn);

/// Remove double spaces from the string
void  mgl_strcls(char *str);
/// Get position of substring or return -1 if not found
long _PURE mgl_strpos(const char *str,char *fnd);
/// Get position of symbol or return -1 if not found
long _PURE mgl_chrpos(const char *str,char fnd);

/// Get uncommented string from file (NOTE: it is not thread safe!!!)
 char *mgl_fgetstr(FILE *fp);
/// Get parameters from uncommented strings of file (NOTE: it is not thread safe!!!)
void  mgl_fgetpar(FILE *fp, const char *str, ...);
/// Check if symbol denote true
int _CONST mgl_istrue(char ch);
/// Print test message
void  mgl_test(const char *str, ...);
/// Print info message
void  mgl_info(const char *str, ...);
/// Locate next data block (block started by -----)
 FILE *mgl_next_data(const char *fname,long p);
/// Enable executing MGL script if mgl_fgetstr() meet '#MGL fname.mgl [args]. Default value is 0 (false).
void  mgl_fgetstr_mgl(int enable);


