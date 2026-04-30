unit precision;

interface

uses
  fp_ode;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ODE_PRECISION_H_}
{$define _ODE_PRECISION_H_}
{ Define dSINGLE for single precision, dDOUBLE for double precision,
 * but never both!
  }
{$if defined(dIDESINGLE)}
{$define dSINGLE}
(*** was #elif ****){$else defined(dIDEDOUBLE)}
{$define dDOUBLE}
{$else}
{$define dDOUBLE}
{$endif}
{$endif}

// === Konventiert am: 30-4-26 17:09:20 ===


implementation



end.
