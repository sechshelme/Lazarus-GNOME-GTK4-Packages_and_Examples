
unit domain;
interface

{
  Automatically converted by H2Pas 1.0.0 from domain.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    domain.h
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
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef foodomainhfoo}
{$define foodomainhfoo}
{**
  This file is part of avahi.

  avahi is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2.1 of the
  License, or (at your option) any later version.

  avahi is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General
  Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with avahi; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
** }
{* \file domain.h Domain name handling functions  }
{$include <inttypes.h>}
{$include <sys/types.h>}
{$include <avahi-common/cdecl.h>}
{* The maximum length of a a fully escaped domain name C string. This
 * is calculated like this: RFC1034 mandates maximum length of FQDNs
 * is 255. The maximum label length is 63. To minimize the number of
 * (non-escaped) dots, we comprise our maximum-length domain name of
 * four labels á 63 characters plus three inner dots. Escaping the
 * four labels quadruples their length at maximum. An escaped domain
 * name has the therefore the maximum length of 63*4*4+3=1011. A
 * trailing NUL and perhaps two unnecessary dots leading and trailing
 * the string brings us to 1014.  }

const
  AVAHI_DOMAIN_NAME_MAX = 1014;  
{* Maximum size of an unescaped label  }
  AVAHI_LABEL_MAX = 64;  
{* @ \name Normalization  }
{* Normalize a domain name into canonical form. This drops trailing
 * dots and removes useless backslash escapes.  }
(* Const before type ignored *)

function avahi_normalize_name(s:Pchar; ret_s:Pchar; size:Tsize_t):Pchar;cdecl;external;
{* Normalize a domain name into canonical form. This drops trailing
 * dots and removes useless backslash escapes. avahi_free() the
 * result!  }
(* Const before type ignored *)
function avahi_normalize_name_strdup(s:Pchar):Pchar;cdecl;external;
{* @  }
{* @ \name Comparison  }
{* Return 1 when the specified domain names are equal, 0 otherwise  }
(* Const before type ignored *)
(* Const before type ignored *)
function avahi_domain_equal(a:Pchar; b:Pchar):longint;cdecl;external;
{* Return some kind of hash value for the domain, useful for using domains as hash table keys.  }
(* Const before type ignored *)
function avahi_domain_hash(name:Pchar):dword;cdecl;external;
{* @  }
{* @ \name Escaping  }
{* Read the first label from the textual domain name *name, unescape
 * it and write it to dest, *name is changed to point to the next label }
(* Const before type ignored *)
function avahi_unescape_label(name:PPchar; dest:Pchar; size:Tsize_t):Pchar;cdecl;external;
{* Escape the domain name in *src and write it to *ret_name  }
(* Const before type ignored *)
function avahi_escape_label(src:Pchar; src_length:Tsize_t; ret_name:PPchar; ret_size:Psize_t):Pchar;cdecl;external;
{* @  }
{* @ \name Validity Checks  }
{* Return 1 when the specified string contains a valid generic DNS-SD
 * service type (i.e. a series of words starting with "_"), 0
 * otherwise  }
(* Const before type ignored *)
function avahi_is_valid_service_type_generic(t:Pchar):longint;cdecl;external;
{* Return 1 when the specified string contains a valid strict DNS-SD
 * service type (i.e. consisting of only two words, the latter being
 * either _udp or _tcp), 0 otherwise  }
(* Const before type ignored *)
function avahi_is_valid_service_type_strict(t:Pchar):longint;cdecl;external;
{* Return 1 when the specified string contains a valid DNS-SD service
 * subtype, 0 otherwise  }
(* Const before type ignored *)
function avahi_is_valid_service_subtype(t:Pchar):longint;cdecl;external;
{* Return 1 when the specified string contains a valid domain name, 0 otherwise  }
(* Const before type ignored *)
function avahi_is_valid_domain_name(t:Pchar):longint;cdecl;external;
{* Return 1 when the specified string contains a valid DNS-SD service name, 0 otherwise  }
(* Const before type ignored *)
function avahi_is_valid_service_name(t:Pchar):longint;cdecl;external;
{* Return 1 when the specified string contains a valid non-FQDN host name (i.e. without dots), 0 otherwise  }
(* Const before type ignored *)
function avahi_is_valid_host_name(t:Pchar):longint;cdecl;external;
{* Return 1 when the specified string contains a valid FQDN host name (i.e. with more than one label and non-numerical), 0 otherwise. \since 0.6.9  }
(* Const before type ignored *)
function avahi_is_valid_fqdn(t:Pchar):longint;cdecl;external;
{* @  }
{* @ \name DNS-SD service name handling  }
{* Construct a valid complete DNS-SD service name from a name, a type and a domain  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function avahi_service_name_join(p:Pchar; size:Tsize_t; name:Pchar; _type:Pchar; domain:Pchar):longint;cdecl;external;
{* Split a full service name into name, type and domain  }
(* Const before type ignored *)
function avahi_service_name_split(p:Pchar; name:Pchar; name_size:Tsize_t; _type:Pchar; type_size:Tsize_t; 
           domain:Pchar; domain_size:Tsize_t):longint;cdecl;external;
{* @  }
{* @ \name DNS-SD Subtype handling  }
{* Return a pointer to the type section of a subtype i.e. _foo._sub._bar._tcp => _bar._tcp  }
(* Const before type ignored *)
(* Const before type ignored *)
function avahi_get_type_from_subtype(t:Pchar):Pchar;cdecl;external;
{* @  }
{$endif}

implementation


end.
