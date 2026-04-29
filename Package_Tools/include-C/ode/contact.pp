
unit contact;
interface

{
  Automatically converted by H2Pas 1.0.0 from contact.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    contact.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PdContact  = ^dContact;
PdContactGeom  = ^dContactGeom;
PdSurfaceParameters  = ^dSurfaceParameters;
Pxxxx  = ^xxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001,2002 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 ************************************************************************ }
{$ifndef _ODE_CONTACT_H_}
{$define _ODE_CONTACT_H_}
{$include <ode/common.h>}
{ C++ extern C conditionnal removed }
{*< Use axis dependent friction  }
{*< Same as above  }
{*< Use FDir for the first friction value  }
{*< Restore collision energy anti-parallel to the normal  }
{*< Don't use global erp for penetration reduction  }
{*< Don't use global cfm for penetration constraint  }
{*< Use a non-zero target velocity for the constraint  }
{*< Force-dependent slip.  }
{*< Rolling/Angular friction  }
{*< For rolling friction  }
type
  Txxxx =  Longint;
  Const
    dContactMu2 = $001;
    dContactAxisDep = $001;
    dContactFDir1 = $002;
    dContactBounce = $004;
    dContactSoftERP = $008;
    dContactSoftCFM = $010;
    dContactMotion1 = $020;
    dContactMotion2 = $040;
    dContactMotionN = $080;
    dContactSlip1 = $100;
    dContactSlip2 = $200;
    dContactRolling = $400;
    dContactApprox0 = $0000;
    dContactApprox1_1 = $1000;
    dContactApprox1_2 = $2000;
    dContactApprox1_N = $4000;
    dContactApprox1 = $7000;

{ must always be defined  }
{ only defined if the corresponding flag is set in mode  }
{*< Rolling friction  }
{*< Spinning friction  }
{*< Coefficient of restitution  }
{*< Bouncing threshold  }
type
  PdSurfaceParameters = ^TdSurfaceParameters;
  TdSurfaceParameters = record
      mode : longint;
      mu : TdReal;
      mu2 : TdReal;
      rho : TdReal;
      rho2 : TdReal;
      rhoN : TdReal;
      bounce : TdReal;
      bounce_vel : TdReal;
      soft_erp : TdReal;
      soft_cfm : TdReal;
      motion1 : TdReal;
      motion2 : TdReal;
      motionN : TdReal;
      slip1 : TdReal;
      slip2 : TdReal;
    end;
{*
 * @brief Describe the contact point between two geoms.
 *
 * If two bodies touch, or if a body touches a static feature in its 
 * environment, the contact is represented by one or more "contact 
 * points", described by dContactGeom.
 *
 * The convention is that if body 1 is moved along the normal vector by 
 * a distance depth (or equivalently if body 2 is moved the same distance 
 * in the opposite direction) then the contact depth will be reduced to 
 * zero. This means that the normal vector points "in" to body 1.
 *
 * @ingroup collide
  }
{< contact position }
{< normal vector }
{< penetration depth }
{< the colliding geoms }
{< (to be documented) }

  PdContactGeom = ^TdContactGeom;
  TdContactGeom = record
      pos : TdVector3;
      normal : TdVector3;
      depth : TdReal;
      g1 : TdGeomID;
      g2 : TdGeomID;
      side1 : longint;
      side2 : longint;
    end;
{ contact info used by contact joint  }

  PdContact = ^TdContact;
  TdContact = record
      surface : TdSurfaceParameters;
      geom : TdContactGeom;
      fdir1 : TdVector3;
    end;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
