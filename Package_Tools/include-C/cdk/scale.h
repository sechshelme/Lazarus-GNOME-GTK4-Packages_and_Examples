/*
 * $Id: gen-scale.h,v 1.9 2012/03/20 21:59:39 tom Exp $
 */

#ifndef CDKINCLUDES
#ifndef CDKSCALE_H
#define CDKSCALE_H	1

#ifdef __cplusplus
extern "C" {
#endif

#ifndef CDK_H
#define CDKINCLUDES
#include <cdk.h>
#undef CDKINCLUDES
#include <cdk/binding.h>
#include <cdk/cdkscreen.h>
#include <cdk/cdk_objs.h>
#endif

/*
 * Copyright 2004,2012 Thomas E. Dickey
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, distribute with
 * modifications, sublicense, and/or sell copies of the Software, and to permit
 * persons to whom the Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
 * ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
 * IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name(s) of the above copyright
 * holders shall not be used in advertising or otherwise to promote the sale,
 * use or other dealings in this Software without prior written authorization.
 */

/*
 * Define the CDK widget Scale structure.
 */
struct SScale {
   CDKOBJS	obj;
   WINDOW *	parent;
   WINDOW *	win;
   WINDOW *	shadowWin;
   WINDOW *	fieldWin;
   WINDOW *	labelWin;
   int		titleAdj;
   chtype *	label;
   int		labelLen;
   int		boxHeight;
   int		boxWidth;
   int		fieldWidth;
   int		fieldEdit;	/* offset from right-margin of field */
   chtype	fieldAttr;
   int	low;
   int	high;
   int	inc;
   int	fastinc;
   int	current;
   EExitType	exitType;
   boolean	shadow;
};
typedef struct SScale CDKSCALE;

/*
 * This creates a new pointer to a CDK int-Scale widget.
 */
CDKSCALE *newCDKScale (
		CDKSCREEN *	/* cdkscreen */,
		int		/* xpos */,
		int		/* ypos */,
		const char *	/* title */,
		const char *	/* label */,
		chtype		/* fieldAttr */,
		int		/* fieldWidth */,
		int		/* start */,
		int		/* low */,
		int		/* high */,
		int		/* inc */,
		int		/* fastInc */,
		boolean		/* Box */,
		boolean		/* shadow */);

/*
 * This activates the widget.
 */
int	activateCDKScale (
		CDKSCALE *	/* widget */,
		chtype *	/* actions */);

/*
 * This injects a single character into the widget.
 */
#define injectCDKScale(obj,input) injectCDKObject(obj,input,Int)

/*
 * This sets various attributes of the widget.
 */
void setCDKScale (
		CDKSCALE *	/* widget */,
		int		/* low */,
		int		/* high */,
		int		/* value */,
		boolean		/* Box */);

/*
 * These set/get the low and high values.
 */
void setCDKScaleLowHigh (
		CDKSCALE *	/* widget */,
		int		/* low */,
		int		/* high */);

int	getCDKScaleLowValue (
		CDKSCALE *	/* widget */);

int	getCDKScaleHighValue (
		CDKSCALE *	/* widget */);

/*
 * These set/get the digits.
 */

/*
 * These set/get the current value.
 */
void setCDKScaleValue (
		CDKSCALE *	/* widget */,
		int		/* value */);

int	getCDKScaleValue (
		CDKSCALE *	/* widget */);

/*
 * This sets the box attribute of the widget.
 */
void setCDKScaleBox (
		CDKSCALE *	/* widget */,
		boolean		/* Box */);

boolean getCDKScaleBox (
		CDKSCALE *	/* widget */);

/*
 * These set the drawing characters of the widget.
 */
#define setCDKScaleULChar(w,c)             setULCharOf(w,c)
#define setCDKScaleURChar(w,c)             setURCharOf(w,c)
#define setCDKScaleLLChar(w,c)             setLLCharOf(w,c)
#define setCDKScaleLRChar(w,c)             setLRCharOf(w,c)
#define setCDKScaleVerticalChar(w,c)       setVTCharOf(w,c)
#define setCDKScaleHorizontalChar(w,c)     setHZCharOf(w,c)
#define setCDKScaleBoxAttribute(w,c)       setBXAttrOf(w,c)

/*
 * This sets the background color of the widget.
 */
#define setCDKScaleBackgroundColor(w,c) setCDKObjectBackgroundColor(ObjOf(w),c)

/*
 * This sets the background attribute of the widget.
 */ 
#define setCDKScaleBackgroundAttrib(w,c) setBKAttrOf(w,c)

/*
 * This draws the widget on the screen.
 */
#define drawCDKScale(obj,Box) drawCDKObject(obj,Box)

/*
 * This erases the widget from the screen.
 */
#define eraseCDKScale(obj) eraseCDKObject(obj)

/*
 * This moves the widget to the given location on the screen.
 */
#define moveCDKScale(obj,xpos,ypos,relative,refresh) moveCDKObject(obj,xpos,ypos,relative,refresh)

/*
 * This allows the user to interactively position the widget on the screen.
 */
#define positionCDKScale(widget) positionCDKObject(ObjOf(widget),widget->win)

/*
 * This destroys the widget and associated memory.
 */
#define destroyCDKScale(obj) destroyCDKObject(obj)

/*
 * These set the pre/post process callback functions.
 */
#define setCDKScalePreProcess(w,f,d)  setCDKObjectPreProcess(ObjOf(w),f,d)
#define setCDKScalePostProcess(w,f,d) setCDKObjectPostProcess(ObjOf(w),f,d)

#ifdef __cplusplus
}
#endif

#endif /* CDKSCALE_H */
#endif /* CDKINCLUDES */
