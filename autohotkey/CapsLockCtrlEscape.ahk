/*  --------------------------------------------------------------------------------
    CapsLockCtrlEscape.ahk
    --------------------------------------------------------------------------------

    Modify CapsLock to do lovely things.
    Like the Universe, it is a work in progress.

    Intended behaviour (mostly working ok):

    - Pressing and quickly (<250ms) releasing CapsLock should map to pressing Esc (for Vim)
    - Holding Caps while pressing other keys should map to holding Ctrl (for Emacs)
    - Win+Caps to toggle actual CapsLock

    Bonus - Emacs Everywhere! (possibly buggy):
    
    ^A - Home, ^E - End
    ^B, ^F, ^P, ^N - Left, Right, Up, Down
    ^H, ^D - Backspace, Delete

    - Holding Alt while pressing the above simulates holding, e.g., Ctrl+Left - i.e., 
      jump by word instead of char
    - Holding Shift *should* work appropriately, to select text through the movement
    - The above remaps only occur through Caps, preserving the original window Ctrl-combos

    To-Do:
    - More emacs bindings? (kill-line, etc.)
    - kill ring? (Might be difficult and hacky. Named buffers a la Vim might be better)
    - #IfWinActive exclusion groups (this does not work AT ALL through RDP or maybe 
      with VMs either. SSH is probably also not a safe bet.)
*/


; Win+Caps to toggle capslock
SetCapsLockState, AlwaysOff
g_CapsLockOn := False
#CapsLock::
    if (g_CapsLockOn)
    {
        SetCapsLockState, Off
        g_CapsLockOn := False
    }
    else {
        SetCapsLockState, On
        g_CapsLockOn := True
    }
    Return


g_ControlRepeatDetected := false ; Prevent repeatedly processing CapsDown
g_LastCtrlKeyDownTime := 0
g_AbortSendEsc := false          

*CapsLock::
    if (g_ControlRepeatDetected)
    {
        return
    }
    send,{Ctrl down}
    g_LastCtrlKeyDownTime := A_TickCount
    g_AbortSendEsc := false
    g_ControlRepeatDetected := true

    return

*CapsLock Up::
    send,{Ctrl up}
    g_ControlRepeatDetected := false
    if (g_AbortSendEsc)
    {
        return
    }
    current_time := A_TickCount
    time_elapsed := current_time - g_LastCtrlKeyDownTime
    if (time_elapsed <= 250)
    {
        SendInput {Esc}
    }
    return

; If any key is pressed while Caps is held, abort from sending Esc when Caps released

 ~*^a::
    g_AbortSendEsc := true
    return
~*^b::
    g_AbortSendEsc := true
    return
~*^c::
    g_AbortSendEsc := true
    return
~*^d::
    g_AbortSendEsc := true
    return
~*^e::
    g_AbortSendEsc := true
    Return
~*^f::
    g_AbortSendEsc := true
    return
~*^g::
    g_AbortSendEsc := true
    return
~*^h::
    g_AbortSendEsc := true
    return
~*^i::
    g_AbortSendEsc := true
    return
~*^j::
    g_AbortSendEsc := true
    return
~*^k::
    g_AbortSendEsc := true
    return
~*^l::
    g_AbortSendEsc := true
    return
~*^m::
    g_AbortSendEsc := true
    return
~*^n::
    g_AbortSendEsc := true
    return
~*^o::
    g_AbortSendEsc := true
    return
~*^p::
    g_AbortSendEsc := true
    return
~*^q::
    g_AbortSendEsc := true
    return
~*^r::
    g_AbortSendEsc := true
    return
~*^s::
    g_AbortSendEsc := true
    return
~*^t::
    g_AbortSendEsc := true
    return
~*^u::
    g_AbortSendEsc := true
    return
~*^v::
    g_AbortSendEsc := true
    return
~*^w::
    g_AbortSendEsc := true
    return
~*^x::
    g_AbortSendEsc := true
    return
~*^y::
    g_AbortSendEsc := true
    return
~*^z::
    g_AbortSendEsc := true
    return


HandleKey(asKey, isAlt) 
{
    ; Because all the stuff above is already intercepting Caps and sending
    ; them as Ctrl-combos, we need our hotstrings to be based on Ctrl, and check to see
    ; if it was sent via Caps

    global g_ControlRepeatDetected
    if (g_ControlRepeatDetected) {
        ; If ALT is also pressed, we want to jump by word, so preserve the "ctrl" key
        if isAlt 
            Send, %asKey%
        else 
            Send, {Ctrl up}%asKey%{Ctrl down}
    } 

    ; If Caps not pressed, disable the hotkey and pass it through to the app
    else 
    {        
        Hotkey, %A_ThisHotkey%,, Off
        Send %A_ThisHotkey%
        Hotkey, %A_ThisHotkey%,, On
    }
    return
}


; ^a::HandleKey("{Home}", 0)
; !^a::HandleKey("{Home}", 1)
; ^+a::HandleKey("+{Home}", 0)
; !^+a::HandleKey("+{Home}", 1)

^e::HandleKey("{End}", 0)
!^e::HandleKey("{End}", 1)
^+e::HandleKey("+{End}", 0)
!^+e::HandleKey("+{End}", 1)

^b::HandleKey("{Left}", 0)
!^b::HandleKey("{Left}", 1)
^+b::HandleKey("+{Left}", 0)
!^+b::HandleKey("+{Left}", 1)

^f::HandleKey("{Right}", 0)
!^f::HandleKey("{Right}", 1)
^+f::HandleKey("+{Right}", 0)
!^+f::HandleKey("+{Right}", 1)

^p::HandleKey("{Up}", 0)
!^p::HandleKey("{Up}", 1)
^+p::HandleKey("+{Up}", 0)
!^+p::HandleKey("+{Up}", 1)

^n::HandleKey("{Down}", 0)
!^n::HandleKey("{Down}", 1)
^+n::HandleKey("+{Down}", 0)
!^+n::HandleKey("+{Down}", 1)

^h::HandleKey("{BackSpace}", 0)
!^h::HandleKey("{BackSpace}", 1)

^d::HandleKey("{Delete}", 0)
!^d::HandleKey("{Delete}", 1)