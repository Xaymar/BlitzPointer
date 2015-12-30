;	BlitzPointer - Adding Pointers to Blitz.
;	Copyright (C) 2015 Xaymar (Michael Fabian Dirks)
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
; Example 8 - Variable-pointers
; ---------------------------------------------------------------------------- ;
; Variable-pointers are really neat. Not only can you have a single variable for
;  a lot of things in many locations (even across thread) but you can pass them
;  to DLLs too! This opens up Blitz to a whole new way of working with DLLs.

; Three functions were added for this, each for the respective type
; - BP_GetVariablePointerInt(Int%) 
; - BP_GetVariablePointerFloat(Float#)
; - BP_GetVariablePointerType(Type.)
; (Strings are not supported sorry.)

; Integers and Floats are really simple, just declare them and grab the pointer.
Global MyInteger% = 66
Global MyFloat# = 66.6
Global Pointer% = 0

; Grab the Integer Pointer and modify the value.
Pointer = BP_GetVariablePointerInt(MyInteger)
Print "MyInteger: " + PeekMemoryInt(Pointer)
PokeMemoryInt(Pointer, 33)
Print "MyInteger: " + PeekMemoryInt(Pointer)

; Grab the Float Pointer and modify the value.
Pointer = BP_GetVariablePointerFloat(MyFloat)
Print "MyFloat: " + PeekMemoryFloat(Pointer)
PokeMemoryFloat(Pointer, 33.3)
Print "MyFloat: " + PeekMemoryFloat(Pointer)

; Types are a tiny bit harder but open up so many possibilities once you get
;  used to them. Start by defining a Type, we'll use a simple one for this.
Type MyType
	Field Check%
End Type

; Now create some elements that we can use when modifying the pointer
Global MyElement.MyType = New MyType
Global MyElement1.MyType = New MyType
Global MyElement2.MyType = New MyType
Global MyElement3.MyType = New MyType
MyElement\Check = -1
MyElement1\Check = $F
MyElement2\Check = $FF
MyElement3\Check = $FFF

; Store the Pointer and original element.
Pointer = BP_GetVariablePointerType(MyElement)
Local TempPointer% = PeekMemoryInt(Pointer)

; Modifying is as simple as storing a new value to the address the pointer is
;  pointing at. The Int() thing is explained in Example 5.
Print "MyElement\Check: " + MyElement\Check
PokeMemoryInt(Pointer, Int(MyElement1))
Print "MyElement\Check: " + MyElement\Check
PokeMemoryInt(Pointer, Int(MyElement2))
Print "MyElement\Check: " + MyElement\Check
PokeMemoryInt(Pointer, Int(MyElement3))
Print "MyElement\Check: " + MyElement\Check

; Always return things to their original condition. Just in case.
PokeMemoryInt(Pointer, TempPointer)
Print "MyElement\Check: " + MyElement\Check

WaitKey()

; You can do some magic with this, such as iterating through types yourself by
;  changing the pointer to the next element or previous element. See Example 6.