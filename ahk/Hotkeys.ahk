; Close window
#q::
    WinClose, A
return

; Move window to the right monitor
#+h::
    Send #+{Left}
return

; Move window to the left monitor
#+l::
    Send #+{Right}
return

; Tile window to the left
#^h::
    Send #{Left}
return

; Tile window to the right
#^l::
    Send #{Right}
return

; Minimize window
#h::
    WinMinimize, A
return

; Toggle window maximum size
#f::
    WinGet MX, MinMax, A
    If MX
        WinRestore A
    Else WinMaximize A
        return

; Launch Task Manager
#Escape::
    Send ^+{Escape}
return

; Launch calculator
#c::
    Run "C:\Windows\System32\calc.exe"
    return

; Launch Browser
#b::
    Run chrome.exe
    return

FocusOrLaunch(processName, launchPath)
{
    IfWinExist ahk_exe %processName%
        WinActivate ahk_exe %processName%
    else
        run, %launchPath%
    WinWait ahk_exe %processName%
    WinActivate ahk_exe %processName%
    WinWaitActive ahk_exe %processName%
}

#t::
    FocusOrLaunch("Telegram.exe", "C:\Users\justp\AppData\Roaming\Telegram Desktop\Telegram.exe")
return



Capslock::Esc

Capslock & a::
	KeyWait, Capslock  ; SetCapsLockState may fail without this.
	if GetKeyState("Capslock", "T") = 0
		SetCapsLockState, On
	else
		SetCapsLockState, AlwaysOff
	return

Capslock & h::Send, {Blind}{Left}
Capslock & j::Send, {Blind}{Down}
Capslock & k::Send, {Blind}{Up}
Capslock & l::Send, {Blind}{Right}
Capslock & d::Send, {Blind}{Delete}

Capslock & 1::Send, {Volume_Down}
Capslock & 2::Send, {Volume_Up}
Capslock & 3::Send, {Volume_Mute}
Capslock & 4::Send, {Media_Play_Pause}
Capslock & 5::Send, {Media_Prev}
Capslock & 6::Send, {Media_Next}
