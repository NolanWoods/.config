; this must remain at top of file
SetTitleMatchMode 2


; Control key  ^
; Alt key      !
; Shift key    +
; Windows key  # 

:*:nwg``::nolan.woods@gov.ab.ca
:*:nwd``::nolan.woods@devfacto.com
:*:dnw``::DEVFACTO\nolan.woods
:*:nnw``::nolan@nolanwoods.net
:*:lts``::launchTestServer
:*:--``::—
:*C:comp``::competency
:*C:Comp``::Competency
:*:init``::initialize
:*:repo``::repository
:*:gh``::github.com/

; To Do:
; - greek alphabet, entered as gl` → λ
;   http://en.wikipedia.org/wiki/Greek_alphabet

; - alphabet mode, where typing g` enters greek alphabet mode, and each letter or pair insta-converts 
;   to the greek char. exited by pressing ` again


; - diacritics. ALL the diacritics. Quotation marks. Dingbats
; - more math, logic, arrows, & other
;   http://en.wikipedia.org/wiki/List_of_logic_symbols
;   http://symbolcodes.tlt.psu.edu/bylanguage/index.html


#Include c:\users\nolan.woods\.config\autohotkey\CapsLockCtrlEscape.ahk

;-------------------------------------------------------------------------------------------
; Allows for the script to be reloaded everytime it's saved
;-------------------------------------------------------------------------------------------

;SetTimer,UPDATEDSCRIPT,1000
; 
;UPDATEDSCRIPT:
;	FileGetAttrib,attribs,%A_ScriptFullPath%
;	IfInString,attribs,A
;	{
;		FileSetAttrib,-A,%A_ScriptFullPath%
;		Sleep,500
;		Reload
;	}
;	return

;-------------------------------------------------------------------------------------------
; Ctrl + Shift + Alt + R to Reload
;-------------------------------------------------------------------------------------------

^+!r::
	Reload
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
	IfMsgBox, Yes, Edit
	return

;-------------------------------------------------------------------------------------------
; allow ctrl+shift+s in visual studio but block it in other apps
;-------------------------------------------------------------------------------------------

#IfWinActive , Microsoft Visual Studio
	$^+s:: send, !fl ;Ctrl-Shift-S => Alt+F, L: Visual Studio's "Save All"
	return
#IfWinActive
	$^+s:: ;Ctrl-Shift-S => nothing


#IfWinActive, Microsoft SQL Server Management Studio
	::sel::select * from 
	::lj::left join
#IfWinActive
;-------------------------------------------------------------------------------------------
; ctrl + alt + shift + space to toggle Always-on-top
;-------------------------------------------------------------------------------------------

^+!SPACE::  Winset, Alwaysontop, , A

;-------------------------------------------------------------------------------------------
; Fix Ctrl+Backspace in various windows
;-------------------------------------------------------------------------------------------

#IfWinActive , TreeSheets
	^BS:: send, ^+{left}{delete}
#IfWinActive

;-------------------------------------------------------------------------------------------
; Macro to Format as <code> in Anki
;-------------------------------------------------------------------------------------------
#IfWinActive , Add
^!+c:: 
	send ^+{x}
	sleep 50
	send ^{Home}<code>^{End}</code>{Esc}		
	return
#IfWinActive

;-------------------------------------------------------------------------------------------
; Ctrl + Alt + PrintScreen -> Screenshot and open in irfanview
;-------------------------------------------------------------------------------------------
^!PrintScreen::
	send !{PrintScreen}
	run, "%A_ProgramFiles%\IrfanView\i_view32.exe"
	WinWaitActive, ahk_class IrfanView
	send ^v
	return

;-------------------------------------------------------------------------------------------
; Misc hotstrings
;-------------------------------------------------------------------------------------------


:*:...``::…
:*:..``::…

:*:->``::→
:*:<-``::←

; Punctuation

:*:sec``::§
:*:para``::¶
:*:dot``::·
:*:bul``::•
:*:!?``::‽
:*:dagger2``::‡
:*:dagger``::†
:*:degree``::°
:*:deg``::°
:*:!``::¡
:*:?``::¿
:*:numero``::№
:*:num``::№
:*:%%%``::‱
:*:%%``::‰
:*:(c)``::©
:*:(p)``::℗
:*:(r)``::®
:*:sm``::℠
:*:tm``::™
:*:aster``::⁂

; Math

:*:<=``::≤
:*:>=``::≥
:*:+-``::±
:*:!=``::≠
:*:%``::÷
:*:*``::×
:*:/``::∕
:*:rt``::√
:*:3rt``::∛
:*:4rt``::∜
:*:inf``::∞
:*:alef``::ℵ
:*:funcf``::ƒ
:*:prime``::′
:*:prime2``::″
:*:prime3``::‴
:*:thus``::∴
:*:|-``::⌈
:*:-|``::⌉
:*:|_``::⌊
:*:_|``::⌋
:*:(+)``::⊕
:*:(*)``::⊗

:*:^0``::⁰
:*:^1``::¹
:*:^2``::²
:*:^3``::³
:*:^4``::⁴
:*:^5``::⁵
:*:^6``::⁶
:*:^7``::⁷
:*:^8``::⁸
:*:^9``::⁹
:*:^+``::⁺
:*:^-``::⁻
:*:^=``::⁼
:*:^(``::⁽
:*:^)``::⁾
:*:^n``::ⁿ
:*:^i``::ⁱ
:*:_0``::₀
:*:_1``::₁
:*:_2``::₂
:*:_3``::₃
:*:_4``::₄
:*:_5``::₅
:*:_6``::₆
:*:_7``::₇
:*:_8``::₈
:*:_9``::₉
:*:_+``::₊
:*:_-``::₋
:*:_=``::₌
:*:_(``::₍
:*:_)``::₎
:*:_a``::ₐ
:*:_e``::ₑ
:*:_o``::ₒ
:*:_i``::ᵢ
:*:_r``::ᵣ
:*:_u``::ᵤ
:*:_v``::ᵥ
:*:_x``::ₓ
:*:_beta``::ᵦ
:*:_gamma``::ᵧ
:*:_rho``::ᵨ
:*:_phi``::ᵩ
:*:_chi``::ᵪ
:*:1/2``::½
:*:1/4``::¼
:*:3/4``::¾
:*:1/3``::⅓
:*:2/3``::⅔
:*:1/5``::⅕
:*:2/5``::⅖
:*:3/5``::⅗
:*:4/5``::⅘
:*:1/6``::⅙
:*:5/6``::⅚
:*:1/8``::⅛
:*:3/8``::⅜
:*:5/8``::⅝
:*:7/8``::⅞

:*:st``::ˢᵗ
:*:nd``::ⁿᵈ
:*:rd``::ʳᵈ
:*:th``::ᵗʰ

:*:<``::&lt;
:*:>``::&gt;

; Greek
; http://en.wikipedia.org/wiki/Greek_alphabet

:*C:gA``::Α
:*C:ga``::α
:*C:gl``::λ

; :*:``::




