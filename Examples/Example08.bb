;	BlitzPointer - Adding Pointers to Blitz.
;	Copyright (C) 2015 Project Kube (Michael Fabian Dirks)
;
;	This program is free software: you can redistribute it and/or modify
;	it under the terms of the GNU Lesser General Public License as
;	published by the Free Software Foundation, either version 3 of the 
;	License, or (at your option) any later version.
;
;	This program is distributed in the hope that it will be useful,
;	but WITHOUT ANY WARRANTY; without even the implied warranty of
;	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;	GNU General Public License for more details.
;
;	You should have received a copy of the GNU Lesser General Public License
;	along with this program.  If not, see <http:;www.gnu.org/licenses/>.

; ---------------------------------------------------------------------------- ;
; Example 6 - Variable Pointers
; ---------------------------------------------------------------------------- ;
; Variable Pointers, the one thing we have all waited for in addition to every-
;  thing else. Now we can pass things by reference instead of copying to & from
;  a bank. Unfortunately it only works for Integers, Floats and Types.

; For Integers, all you have to do is declare a variable and then call the func-
;  tion that retrieves the pointer:
Global MyVariable% = 1
Global MyVariablePtr% = 0
MyVariablePtr = BP_GetVariablePointerInt(MyVariable)

; Same for Floats, slightly different function though
Global MyVariable2# = 1.2
Global MyVariable2Ptr% = 0
MyVariable2Ptr = BP_GetVariablePointerFloat(MyVariable2)

; Now we can directly modify them in memory, which means that we can modify them
;  from anywhere - inside and outside our program. What you do with this is up
;  to your imagination, just don't fuck up. Computers don't like that.

; Usage Example
Print MyVariable
PokeMemoryInt(MyVariable, 283)
Print MyVariable

