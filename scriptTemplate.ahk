;============================== Start Auto-Execution Section ==============================
; Always run as admin
if !A_IsAdmin {
    Run "*RunAs", A_ScriptFullPath
    ExitApp
}

; Keeps script permanently running
Persistent

; Disable Caps Lock key
SetCapsLockState "AlwaysOff"

; Ensures that there is only a single instance of this script running.
#SingleInstance Force

; Makes a script unconditionally use its own folder as its working directory.
; Ensures a consistent starting directory.
SetWorkingDir %A_ScriptDir%

; sets title matching to search for "containing" instead of "exact"
SetTitleMatchMode(2)

GroupAdd("saveReload", A_ScriptName)

return

;============================== Save Reload / Quick Stop ==============================
If WinActive("ahk_group saveReload") {
    ; Use Control+S to save your script and reload it at the same time.
    CapsLock & s:: {
        TrayTip("Reloading updated script", A_ScriptName)
        SetTimer("RemoveTrayTip", 1500)
        Sleep(1750)
        Reload()
        return
    }

    ; Removes any popped up tray tips.
    RemoveTrayTip:
    SetTimer("RemoveTrayTip", "Off")
    TrayTip()
    return

    ; Hard exit that just closes the script
    CapsLock:: {
        if (A_TimeSincePriorHotkey < 400 && A_PriorHotkey = "CapsLock") {
            ExitApp()
        }
        Return
    }
}

;============================== Main Script ==============================

; Your main code here.
; Global hotkeys
; Global hotstrings
; etc...

;============================== Program 1 ==============================
; Evertything between here and the next #IfWinActive will ONLY work in someProgram.exe
; This is called being "context sensitive"
; if WinActive("ahk_exe someProgram.exe") {}

;============================== ini Section ==============================
; Do not remove /* or */ from this section. Only modify if you're
; storing values to this file that need to be permanantly saved.
/*
[SavedVariables]
Key=Value
*/
;============================== End Script ==============================