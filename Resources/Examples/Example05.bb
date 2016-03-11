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
; Example 5 - Calling Functions (Advanced)
; ---------------------------------------------------------------------------- ;
; License: Creative Commons Attribution 2.0
; Author: Michael Fabian Dirks<michael.dirks@realitybends.de>
; Prerequisite: Example 4

; In Blitz, there are only three real types: Int, Float and String - anything
;  else is a pointer that can be represented using Int. That is why almost all
;  Blitz functions return an Int.
; Using this knowledge we can try (and succeed) passing a Type Object into a 
;  function - using nothing more than the Int() function.

Include "Example_Shared.bb"
ExampleInit()

; We'll have to define a Type that can be passed to our function, any Type will
;  do fine.
Type MyType
	Field Test
	Field Name$
End Type

; The function can be defined like any other Blitz function.
Global fpMyTypeFunc = 0
Function MyTypeFunc(This.MyType)
	If fpMyTypeFunc = 0 Then
		fpMyTypeFunc = BP_GetFunctionPointer()
		Return
	EndIf
	If This = Null Then Return
	
	; Display the content of the Type Object.
	Text 0, Handle(This) * 15, This\Test + This\Name
End Function
MyTypeFunc(Null)

; And create two testing objects.
Local MT1.MyType = New MyType
MT1\Test = 1
MT1\Name = "First Object"

Local MT2.MyType = New MyType
MT2\Name = "Second Object"

While Not KeyHit(1)
	ExampleUpdate()
	
;    Now in order to pass a Type Object to a function, we have to get a pointer
;     from it. Thankfully, Blitz has this already built in: Int().
	If KeyDown(2) Then BP_CallFunctionVI fpMyTypeFunc, Int(MT1)
	If KeyDown(3) Then BP_CallFunctionVI fpMyTypeFunc, Int(MT2)
	
	ExampleLoop()
Wend
End
;~IDEal Editor Parameters:
;~C#Blitz3D