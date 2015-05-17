; ---------------------------------------------------------------------------- ;
; Example 4 - Calling Functions (Advanced)
; ---------------------------------------------------------------------------- ;
; License: Creative Commons Attribution 2.0
; Author: Michael Fabian Dirks<michael.dirks@realitybends.de>
; Prerequisite: Example 3

; Returned values aren't everything, don't you agree? That is why BlitzPointer
;  offers you the ability to pass parameters too, even allowing you to pass Type
;  Objects without having to use Handle() and Object() (both slow functions).
; At the time of writing this example, BlitzPointer supports four parameters at
;  most - plenty of space to pass type objects and variables on.

; There are three parameter types in Blitz that we can use:
; ---------------------------------------------------------------------------- ;
;  Type    Id  Description      Calling Function
; ---------------------------------------------------------------------------- ;
;   int     I   32-bit Integer   BlitzPointer_CallFunction*I
;   float   F   Floating Point   BlitzPointer_CallFunction*F
;   pointer P   Memory Pointer   BlitzPointer_CallFunction*P

; Watch out:
;  Calling a function that has parameters without giving enough parameters will
;  fill those parameters with values that have been on the stack (and possibly
;  corrupt the stack too - you never know).

Include "Example_Shared.bb"
ExampleInit()

; Example Function: Divide p1 by 60 and return the result.
Global fpCurInGameSecond = 0
Function CurInGameSecond%(p1%=0)
	If fpCurInGameSecond = 0 Then
		fpCurInGameSecond = BlitzPointer_GetFunctionPointer()
		Return
	EndIf
	Text   5, 15, "IIFunction"
	Text 125, 15, p1
	
	Return (p1 Shr 2) / 15 ; Division by 60
End Function
CurInGameSecond()

; Example Function: Multiply p1 by p2 and return the result.
Global fpCurInGameSecondEx = 0
Function CurInGameSecondEx#(p1%=0, p2#=0)
	If fpCurInGameSecondEx = 0 Then
		fpCurInGameSecondEx = BlitzPointer_GetFunctionPointer()
		Return
	EndIf
	
	Text   5, 30, "FIFFunction"
	Text 125, 30, p1
	Text 245, 30, p2
	
	Return p1 * p2
End Function
CurInGameSecondEx()

; Example Function: Convert between Float and Int easily
;  For this to work we must take and return a float.
Global fpConvertIntFloat
Function ConvertIntFloat#(p1#=0)
	If fpConvertIntFloat = 0 Then
		fpConvertIntFloat = BlitzPointer_GetFunctionPointer()
		Print Hex(fpConvertIntFloat)
		WaitKey()
		Return
	EndIf
	
	Return p1
End Function
ConvertIntFloat()

; Pointer-parameters are a bit trickier and require memory access, see UserLibs.txt.

Local Frame% = 0
While Not KeyHit(1)
	ExampleUpdate()
	
	Text   0, 0, "Functions"
	Text 120, 0, "Parameter 1"
	Text 240, 0, "Parameter 2"
	Text 360, 0, "Parameter 3"
	Text 480, 0, "Parameter 4"
	Text 600, 0, "Result"
	
	Text 605, 15, BlitzPointer_CallFunctionII(fpCurInGameSecond, Frame)
	Text 605, 30, BlitzPointer_CallFunctionFIF(fpCurInGameSecondEx, Frame, 0.016666666)
	
	Local TempFlt# = Frame / 60.0
	Local TempInt% = BlitzPointer_CallFunctionIF(fpConvertIntFloat, TempFlt)
	Text   5, 60, "Float -> Int"
	Text 125, 60, TempFlt
	Text 605, 60, Hex(TempInt)
	
	Text   5, 75, "Int -> Float"
	Text 125, 75, Hex(TempInt)
	Text 605, 75, BlitzPointer_CallFunctionFI(fpConvertIntFloat, TempInt)
	
	ExampleLoop()
	
	; Allow us to pause execution
	While KeyDown(57)
		WaitTimer(Example_Timer)
	Wend
	
	Frame=Frame+1
Wend
End
;~IDEal Editor Parameters:
;~C#Blitz3D