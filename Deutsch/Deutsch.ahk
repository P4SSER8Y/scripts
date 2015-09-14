; Keyboard for Germany
; Author: 	Troy Cheung
; Date:     2015.09.14
; Version:	Alpha

#SingleInstance Force

QuoteState := true

; aussetzen
>^s:: Suspend

; a-Umlaut
>!a:: Send, {U+00e4}

; u-Umlaut
>!u:: Send, {U+00fc}

; o-Umlaut
>!o:: Send, {U+00f6}

; A-Umlaut
>!+a:: Send, {U+00c4}

; U-Umlaut
>!+u:: Send, {U+00dc}

; O-Umlaut
>!+o:: Send, {U+00d6}

; Eszett
>!s:: Send, {U+00df}

; Anfuehrungszeichen
>!VKDE::
	if QuoteState
	{
		QuoteState := false
		Send, {ASC 132}
	}else{
		QuoteState := true
		Send, {ASC 147}
	}
return
