#h::WinMinimize, A
#f::
   WinGet MX, MinMax, A
   If MX
        WinRestore A
   Else WinMaximize A
