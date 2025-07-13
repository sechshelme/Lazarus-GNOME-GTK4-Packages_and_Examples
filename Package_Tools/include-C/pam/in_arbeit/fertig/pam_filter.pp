
unit pam_filter;
interface

{
  Automatically converted by H2Pas 1.0.0 from pam_filter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pam_filter.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id$
 *
 * this file is associated with the Linux-PAM filter module.
 * it was written by Andrew G. Morgan <morgan@linux.kernel.org>
 *
  }
{$ifndef PAM_FILTER_H}
{$define PAM_FILTER_H}
{$include <sys/file.h>}
{
 * this will fail if there is some problem with these file descriptors
 * being allocated by the pam_filter Linux-PAM module. The numbers
 * here are thought safe, but the filter developer should use the
 * macros, as these numbers are subject to change.
 *
 * The APPXXX_FILENO file descriptors are the STDIN/OUT/ERR_FILENO of the
 * application. The filter uses the STDIN/OUT/ERR_FILENO's to converse
 * with the user, passes (modified) user input to the application via
 * APPIN_FILENO, and receives application output from APPOUT_FILENO/ERR.
  }
{ write here to give application input  }

const
  APPIN_FILENO = 3;  
{ read here to get application output  }
  APPOUT_FILENO = 4;  
{ read here to get application errors  }
  APPERR_FILENO = 5;  
{ used by select  }
  APPTOP_FILE = 6;  
{$endif}

implementation


end.
