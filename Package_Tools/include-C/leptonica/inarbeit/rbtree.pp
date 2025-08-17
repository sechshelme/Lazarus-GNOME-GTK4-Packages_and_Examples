
unit rbtree;
interface

{
  Automatically converted by H2Pas 1.0.0 from rbtree.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rbtree.h
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
PL_Rbtree  = ^L_Rbtree;
PL_Rbtree_Node  = ^L_Rbtree_Node;
PRb_Type  = ^Rb_Type;
Pxxxxxxxxxx  = ^xxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{====================================================================*
 -  Copyright (C) 2001 Leptonica.  All rights reserved.
 -
 -  Redistribution and use in source and binary forms, with or without
 -  modification, are permitted provided that the following conditions
 -  are met:
 -  1. Redistributions of source code must retain the above copyright
 -     notice, this list of conditions and the following disclaimer.
 -  2. Redistributions in binary form must reproduce the above
 -     copyright notice, this list of conditions and the following
 -     disclaimer in the documentation and/or other materials
 -     provided with the distribution.
 -
 -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 -  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 -  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL ANY
 -  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 -  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 -  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 -  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *==================================================================== }
{
 * Modified from the excellent code here:
 *     http://en.literateprograms.org/Red-black_tree_(C)?oldid=19567
 * which has been placed in the public domain under the Creative Commons
 * CC0 1.0 waiver (http://creativecommons.org/publicdomain/zero/1.0/).
 *
 * When the key is generated from a hash (e.g., string --> uint64),
 * there is always the possibility of having collisions, but to make
 * the collision probability very low requires using a large hash.
 * For that reason, the key types are 64 bit quantities, which will result
 * in a negligible probabililty of collisions for millions of hashed values.
 * Using 8 byte keys instead of 4 byte keys requires a little more
 * storage, but the simplification in being able to ignore collisions
 * with the red-black trees for most applications is worth it.
  }
{$ifndef  LEPTONICA_RBTREE_H}
{$define LEPTONICA_RBTREE_H}
{! The three valid key types for red-black trees, maps and sets.  }
{! RBTree Key Type  }
type
  Txxxxxxxxxx =  Longint;
  Const
    L_INT_TYPE = 1;
    L_UINT_TYPE = 2;
    L_FLOAT_TYPE = 3;

{!
     * Storage for keys and values for red-black trees, maps and sets.
     * <pre>
     * Note:
     *   (1) Keys and values of the valid key types are all 64-bit
     *   (2) (void *) can be used for values but not for keys.
     * </pre>
      }
type
  PRb_Type = ^TRb_Type;
  TRb_Type = record
      case longint of
        0 : ( itype : Tl_int64 );
        1 : ( utype : Tl_uint64 );
        2 : ( ftype : Tl_float64 );
        3 : ( ptype : pointer );
      end;


  PRB_TYPE = ^TRB_TYPE;
  TRB_TYPE = TRb_Type;
  PL_Rbtree = ^TL_Rbtree;
  TL_Rbtree = record
      root : PL_Rbtree_Node;
      keytype : Tl_int32;
    end;

  TL_Rbtree = TL_AMAP;
{ hide underlying implementation for map  }
  TL_Rbtree = TL_ASET;
{ hide underlying implementation for set  }
  PL_Rbtree_Node = ^TL_Rbtree_Node;
  TL_Rbtree_Node = record
      key : TRb_Type;
      value : TRb_Type;
      left : PL_Rbtree_Node;
      right : PL_Rbtree_Node;
      parent : PL_Rbtree_Node;
      color : Tl_int32;
    end;

  TL_Rbtree_Node = TL_AMAP_NODE;
{ hide tree implementation  }
  TL_Rbtree_Node = TL_ASET_NODE;
{ hide tree implementation  }
{$endif}
{ LEPTONICA_RBTREE_H  }

implementation


end.
