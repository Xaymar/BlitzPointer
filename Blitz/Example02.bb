; ---------------------------------------------------------------------------- ;
; Example 2 - Calling Functions (Beginner)
; ---------------------------------------------------------------------------- ;
; License: Creative Commons Attribution 2.0
; Author: Michael Fabian Dirks<michael.dirks@realitybends.de>
; Prerequisite: Example 1

; Since we now know how to retrieve a function pointer, how about we call it?

Include "Example_Shared.bb"
ExampleInit()

Global fpOurFunction = 0
Function OurFunction()
	If fpOurFunction = 0 Then
		fpOurFunction = BlitzPointer_GetFunctionPointer()
		Return
	EndIf
	
	Text 0, 0, "Function Pointer"
	Text 0,15, "  0x" + Replace(RSet(Hex(fpOurFunction),8)," ","0")
End Function
OurFunction()

While Not KeyHit(1)
	ExampleUpdate()
	
;   BlitzPointer offers many ways of calling our function pointer. Each one
;    describes different return types, parameter count and parameter types. 
;   Let's use the one that doesn't return a value for now.
	BlitzPointer_CallFunctionV fpOurFunction
;   Now if we run the program, instead of a fixed native call, we're calling a
;    function pointer instead. Pretty useful in my opinion, especially for UI,
;    networking, fake classes, etc.
;   We'll talk about the other ways of calling a function in Example 3.
	
	ExampleLoop()
Wend

End
;~IDEal Editor Parameters:
;~C#Blitz3D