unit xraylib_crystal_diffraction;

interface

uses
  fp_xrl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
Copyright (c) 2011  David Sagan
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * The names of the contributors may not be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Bruno Golosio, Antonio Brunetti, Manuel Sanchez del Rio, Tom Schoonjans and Teemu Ikonen ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ANYONE BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 }
{$ifndef XRAYLIB_CRYSTAL_DIFFRACTION_H}
{$define XRAYLIB_CRYSTAL_DIFFRACTION_H}
{$include "xraylib-defs.h"}
{$include "xraylib-error.h"}
{ Note for multithreaded programs:
 * The routines Crystal_ReadCrystals and CrystalAddCrystalStruct are not thread safe if crystals are
 * added to the official array. In this case, locking will have to be used.
 *
 * Parameters:
 * energy    -- KeV
 * rel_angle -- photon angle / bragg angle
 *
 *
 * --------------------------------------------------------------------------------
 *  Allocate and initialize a new crystal array.
 *
  }

function Crystal_ArrayInit(n_crystal_alloc:longint; error:PPxrl_error):PCrystal_Array;cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * free memory from a crystal array.
  }
procedure Crystal_ArrayFree(c_array:PCrystal_Array);cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * Copy a CrystalStruct.
  }
function Crystal_MakeCopy(crystal:PCrystal_Struct; error:PPxrl_error):PCrystal_Struct;cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * Free malloc'd memory in a CrystalStruct.
  }
procedure Crystal_Free(crystal:PCrystal_Struct);cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * Get a pointer to a CrystalStruct of a given material from the crystal_array.
 *
 * If c_array is NULL then the official array of crystals is searched.
 * If not found, NULL is returned.
 * Free the returned struct with Crystal_Free.
  }
function Crystal_GetCrystal(material:Pchar; c_array:PCrystal_Array; error:PPxrl_error):PCrystal_Struct;cdecl;external libxrl;
{--------------------------------------------------------------------------------------------------
 * Bragg angle in radians.
  }
function Bragg_angle(crystal:PCrystal_Struct; energy:Tdouble; i_miller:longint; j_miller:longint; k_miller:longint; 
           error:PPxrl_error):Tdouble;cdecl;external libxrl;
{--------------------------------------------------------------------------------------------------
 * Q scattering factor = Sin(theta) / wavelength
  }
function Q_scattering_amplitude(crystal:PCrystal_Struct; energy:Tdouble; i_miller:longint; j_miller:longint; k_miller:longint; 
           rel_angle:Tdouble; error:PPxrl_error):Tdouble;cdecl;external libxrl;
{--------------------------------------------------------------------------------------------------
 * Atomic Factors f0, f', f''
  }
function Atomic_Factors(Z:longint; energy:Tdouble; q:Tdouble; debye_factor:Tdouble; f0:Pdouble; 
           f_primep:Pdouble; f_prime2:Pdouble; error:PPxrl_error):longint;cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * Compute F_H
 * See also Crystal_F_H_StructureFactor_Partial
  }
function Crystal_F_H_StructureFactor(crystal:PCrystal_Struct; energy:Tdouble; i_miller:longint; j_miller:longint; k_miller:longint; 
           debye_factor:Tdouble; rel_angle:Tdouble; error:PPxrl_error):TxrlComplex;cdecl;external libxrl;
{--------------------------------------------------------------------------------------------------
 * Compute F_H
 * See also Crystal_F_H_StructureFactor
 * The Atomic structure factor has three terms: F = f0 + f' + f''
 * For each of these three terms, there is a corresponding *_flag argument
 * which controls the numerical value used in computing F_H:
 *        *_flag = 0 --> Set this term to 0.
 *        *_flag = 1 --> Set this term to 1. Only used for f0.
 *        *_flag = 2 --> Set this term to the value given
  }
function Crystal_F_H_StructureFactor_Partial(crystal:PCrystal_Struct; energy:Tdouble; i_miller:longint; j_miller:longint; k_miller:longint; 
           debye_factor:Tdouble; rel_angle:Tdouble; f0_flag:longint; f_prime_flag:longint; f_prime2_flag:longint; 
           error:PPxrl_error):TxrlComplex;cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * Compute unit cell volume.
 * Note: Structures obtained from crystal array will have their volume in .volume.
  }
function Crystal_UnitCellVolume(crystal:PCrystal_Struct; error:PPxrl_error):Tdouble;cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * Compute d-spacing between planes.
 * This routine assumes that if crystal.volume is nonzero then it holds a valid value.
 * If (i, j, k) = (0, 0, 0) then zero is returned.
  }
function Crystal_dSpacing(crystal:PCrystal_Struct; i_miller:longint; j_miller:longint; k_miller:longint; error:PPxrl_error):Tdouble;cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * Add a new CrystalStruct to crystal_array.
 * The data is copied to crystal_array.
 * If the material already exists in the array then the existing material data is overwitten.
 * If crystal_array is NULL then the crystals are added to the official array of crystals.
 * Return: 1 on success and 0 on error.
  }
function Crystal_AddCrystal(crystal:PCrystal_Struct; c_array:PCrystal_Array; error:PPxrl_error):longint;cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * Read in a set of crystal structs to crystal_array.
 * If a material already exists in the array then the existing material data is overwitten.
 * If crystal_array is NULL then the crystals are added to the official array of crystals.
 * Return: 1 on success and 0 on error.
  }
function Crystal_ReadFile(file_name:Pchar; c_array:PCrystal_Array; error:PPxrl_error):longint;cdecl;external libxrl;
{--------------------------------------------------------------------------------
 * Returns a NULL-terminated array of strings containing the names of the crystals
 * in c_array. If c_array is NULL, then the builtin array of crystals will be used instead
 * If nCrystals is not NULL, it shall receive the number of crystalnames in the array.
 * The returned array should be freed firstly by using xrlFree to deallocate
 * all individual strings, and subsequently by using xrlFree to deallocate the array
  }
function Crystal_GetCrystalsList(c_array:PCrystal_Array; nCrystals:Plongint; error:PPxrl_error):^Pchar;cdecl;external libxrl;
{$endif}

// === Konventiert am: 8-9-26 17:31:03 ===


implementation



end.
