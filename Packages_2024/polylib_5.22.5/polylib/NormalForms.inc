{$IFDEF read_interface}


{
    This file is part of PolyLib.

    PolyLib is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    PolyLib is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with PolyLib.  If not, see <http://www.gnu.org/licenses/>.
 }

procedure Smith(A:PMatrix; U:PPMatrix; V:PPMatrix; Product:PPMatrix);cdecl;external libpolylib;
procedure Hermite(A:PMatrix; H:PPMatrix; U:PPMatrix);cdecl;external libpolylib;

// === Konventiert am: 5-2-26 19:36:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
