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

; Launch calculator
#c::
    Run calc.exe
    return

; Launch Browser
#b::
    Run chrome.exe
    return

; Launch Task Manager
#Escape::
    Send ^+{Escape}
    return

ToggleApplication(processName, launchPath)
{
    IfWinExist ahk_exe %processName%
        WinActivate ahk_exe %processName%
    else
        run, %launchPath%
    WinWait ahk_exe %processName%
    WinActivate ahk_exe %processName%
    WinWaitActive ahk_exe %processName%
}

; Open Spotify
#s::
    ToggleApplication("Spotify.exe", "C:\Users\justp\AppData\Roaming\Spotify\Spotify.exe")
    return

; Open Telegram
#t::
    ToggleApplication("Telegram.exe", "C:\Users\justp\AppData\Roaming\Telegram Desktop\Telegram.exe")
    return

; Disable CapsLock completely
CapsLock::		; CapsLock
+CapsLock::	; Shift+CapsLock
!CapsLock::	; Alt+CapsLock
^CapsLock::		; Ctrl+CapsLock
#CapsLock::		; Win+CapsLock
^!CapsLock::	; Ctrl+Alt+CapsLock		
^!#CapsLock::	; Ctrl+Alt+Win+CapsLock
^+CapsLock::
+!CapsLock::
+^!CapsLock::
return

; Second layer
#If, GetKeyState("CapsLock", "P")
    a::Send {Blind}{CapsLock}
    h::Left
    j::Down
    k::Up
    l::Right
    d::Delete
    c::Escape
