/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2013 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
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
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
 */

#if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)
#error "Only <colord.h> can be included directly."
#endif

#ifndef __CD_INTERP_AKIMA_H
#define __CD_INTERP_AKIMA_H

#include <glib-object.h>
#include <colord/cd-interp.h>



#define CD_TYPE_INTERP_AKIMA (cd_interp_akima_get_type ())
////G_DECLARE_DERIVABLE_TYPE (CdInterpAkima, cd_interp_akima, CD, INTERP_AKIMA, CdInterp)

struct _CdInterpAkimaClass
{
	CdInterpClass		 parent_class;
};

CdInterp	*cd_interp_akima_new			(void);



#endif /* __CD_INTERP_AKIMA_H */

