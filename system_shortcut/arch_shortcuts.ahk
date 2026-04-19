; Ctrl+Win+W = Ctrl+Win+T (Always on Top)
^#w::Send("^#t")

; Alt+A = Win+Alt+Left (switch desktop left)
!a::Send("#!{Left}")

; Alt+D = Win+Alt+Right (switch desktop right)
!d::Send("#!{Right}")

; Alt+W = Win+Alt+Up
!w::Send("#!{Up}")

; Alt+S = Win+Alt+Down
!s::Send("#!{Down}")

; Win+W = Win+Tab (Task View)
#w::Send("#{Tab}")

; Alt+Z = Toggle Maximize/Restore (middle button)
!z:: {
    if WinGetMinMax("A") = 1
        WinRestore("A")
    else
        WinMaximize("A")
}

; Alt+X = Minimize window (native minus button action)
!x::WinMinimize("A")