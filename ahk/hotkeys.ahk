; Close window
!q::
    Send !{F4}
    return

; Reload script
#+r::
    Reload
    return

; Arrow Down
#n::
    Send {Down}
    return

; Arrow Up
#p::
    Send {Up}
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

; Open Windows Terminal
#t::
    ToggleApplication("WindowsTerminal.exe", "wt.exe")
    return

; Open Spotify
#s::
    ToggleApplication("Spotify.exe", "C:\Users\justp\AppData\Roaming\Spotify\Spotify.exe")
    return

; Open Telegram
#m::
    ToggleApplication("Telegram.exe", "C:\Users\justp\AppData\Roaming\Telegram Desktop\Telegram.exe")
    return