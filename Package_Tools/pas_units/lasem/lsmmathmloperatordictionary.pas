unit lsmmathmloperatordictionary;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2008 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_MATHML_OPERATOR_DICTIONARY_H}
{$define LSM_MATHML_OPERATOR_DICTIONARY_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlenums.h>}
{$include <lsmmathmlattributes.h>}
type
  PLsmMathmlOperatorDictionaryEntry = ^TLsmMathmlOperatorDictionaryEntry;
  TLsmMathmlOperatorDictionaryEntry = record
      name : Pchar;
      form : TLsmMathmlForm;
      left_space : TLsmMathmlSpace;
      right_space : TLsmMathmlSpace;
      stretchy : Tgboolean;
      fence : Tgboolean;
      accent : Tgboolean;
      large_op : Tgboolean;
      movable_limits : Tgboolean;
      separator : Tgboolean;
      min_size : TLsmMathmlSpace;
      max_size : TLsmMathmlSpace;
      symmetric : Tgboolean;
    end;

function lsm_mathml_operator_dictionary_lookup(utf8:Pchar; form:TLsmMathmlForm):PLsmMathmlOperatorDictionaryEntry;cdecl;external liblasem;
procedure lsm_mathml_operator_dictionary_cleanup;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:45:53 ===


implementation



end.
