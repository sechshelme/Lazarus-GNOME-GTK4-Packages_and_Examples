
unit efl_types_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_types_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_types_eot.h
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
Pchar  = ^char;
PEfl_Version  = ^Efl_Version;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TYPES_EOT_H_}
{$define _EFL_TYPES_EOT_H_}
{$ifndef _EFL_TYPES_EOT_TYPES}
{$define _EFL_TYPES_EOT_TYPES}
{*
 * @brief This type describes the version of EFL with an optional variant.
 *
 * This may be used to query the current running version of EFL. Or it can be
 * passed by applications at startup time to inform EFL of the version a
 * certain application was built for.
 *
 * @since 1.22
 *
 * @ingroup Efl_Version
  }
{*< Major component of the version (>= 1).
              *
              * @since 1.22  }
{*< Minor component of the version (>= 0).
              *
              * @since 1.22  }
{*< Micro component of the version (>= 0).
              *
              * @since 1.22  }
{*< Revision component of the version (>= 0).
                 *
                 * @since 1.22  }
(* Const before type ignored *)
{*< Special version string for this build of EFL, @c null
                       * for vanilla (upstream) EFL. Contains
                       * @c EFL_VERSION_FLAVOR.
                       *
                       * @since 1.22  }
(* Const before type ignored *)
{*< Contains @c EFL_BUILD_ID.
                         *
                         * @since 1.22  }
type
  PEfl_Version = ^TEfl_Version;
  TEfl_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
      flavor : Pchar;
      build_id : Pchar;
    end;
{$endif}
{$endif}

implementation


end.
