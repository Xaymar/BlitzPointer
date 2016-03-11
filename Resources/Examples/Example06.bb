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
; Example 6 - Direct Memory Access
; ---------------------------------------------------------------------------- ;
; License: Creative Commons Attribution 2.0
; Author: Michael Fabian Dirks<michael.dirks@realitybends.de>
; Prerequisite: Example 5

;                                --!-!!!-!--
; This Example is aimed at Experts. You will most likely never need this.
;                                --!-!!!-!--

; BlitzPointer ships with functions for direct memory access, allowing you to
;  modify things that were previously out of reach. The functions follow the
;  typical style of Bank access, Peek and Poke:
; PeekMemoryByte%(MemoryAddress%) / PokeMemoryByte(MemoryAddress%, Value%)
; PeekMemoryShort%(MemoryAddress%) / PokeMemoryShort(MemoryAddress%, Value%)
; PeekMemoryInt%(MemoryAddress%) / PokeMemoryInt(MemoryAddress%, Value%)
; PeekMemoryFloat#(MemoryAddress%) / PokeMemoryFloat(MemoryAddress%, Value#)
; PeekMemory%(MemoryAddress%, Length%, Bank%) / PokeMemory%(MemoryAddress%, Length%, Bank%)
;  This function allows you to directly read and write from memory into a Bank
;   or from a Bank, saving you a few instructions per access. It will only read
;   or write as many bytes as your Bank holds and returns the amount of read or
;   written bytes.

; These allow us to do simple direct memory modification, allowing us to do some 
;  things that were previously only possible using MemMove and MemCopy from 
;  the Windows libraries.

; For example, Types in Blitz follow this structure:
; ---------------------------------------------------------------------------- ;
; Offset Type     Description
; ---------------------------------------------------------------------------- ;
;    0   Pointer  Pointer to Field Data
;    4   Pointer  Next Type Object or Type Structure (Last Element Signal)
;    8   Pointer  Prev Type Object or Type Structure (First Element Signal)
;   12   Pointer  Type Structure
;   16   Integer  Reference Count
; 20+    ...      Your Field Data usually follows here.
;
; We can do some fun stuff with this information.

; If you want to know more about the internal structure of Blitz, there are some
;  resources that people have compiled in addition to the official source:
;   Structures: http://www.blitzforum.de/forum/viewtopic.php?t=4320
;   Source Code: http://github.com/blitz-research/

Include "Example_Shared.bb"
ExampleInit()

; Our Type will hold one of every Element.
Type EverythingType
	Field MyInt%
	Field MyFloat#
	Field MyString$
	Field MyObject.EverythingType
;    It is important to note that Blitz doesn't consider Arrays as pointers, but
;     as solid blocks in memory instead. This is why we can't make them dynamic,
;     and have to use Dim or Banks.
	Field MyIntArray%[5]
	Field MyFloatArray#[5]
	Field MyStringArray$[5]
	Field MyObjectArray.EverythingType[5]
End Type

; And create a function that modifies only using pointers.
Global fpMyPointerFunction% = 0
Function MyPointerFunction(Pointer%)
	If fpMyPointerFunction = 0 Then
		fpMyPointerFunction = BP_GetFunctionPointer()
		Return
	EndIf
	
	; Simple Memory modification
	PokeMemoryInt   Pointer + 20, PeekMemoryInt(Pointer + 20) + 1
	PokeMemoryFloat Pointer + 24, PeekMemoryFloat(Pointer + 24) + 1
	
	; Sick of reference counting? Do Circular References without incrementing that!
	PokeMemoryInt	Pointer + 32, Pointer
End Function
MyPointerFunction(0)

Local Instance.EverythingType = New EverythingType

While Not KeyHit(1)
	ExampleUpdate()
	
	MyPointerFunction(Int(Instance))
	
	Text   0, 0, "\MyInt"
	Text 200, 0, Instance\MyInt
	Text   0,15, "\MyFloat"
	Text 200,15, Instance\MyFloat
	; Circular Reference
	Text   0,45, "\MyObject\MyInt"
	Text 200,45, Instance\MyObject\MyInt
	Text   0,60, "\MyObject\MyObject\MyInt"
	Text 200,60, Instance\MyObject\MyObject\MyInt
	
	ExampleLoop()
Wend
End
;~IDEal Editor Parameters:
;~C#Blitz3D