;============================== Start Auto-Execution Section ==============================
; Always run as admin
if !A_IsAdmin {
    Run '*RunAs "' A_AhkPath '" "' A_ScriptFullPath '"'
    ExitApp
}

; Keeps script permanently running
Persistent

; Ensures that there is only a single instance of this script running.
#SingleInstance Force

; Makes a script unconditionally use its own folder as its working directory.
; Ensures a consistent starting directory.
SetWorkingDir A_ScriptDir

; sets title matching to search for "containing" instead of "exact"
SetTitleMatchMode 2

GroupAdd "saveReload", "A_ScriptName"

;============================== Save Reload / Quick Stop ==============================
if WinActive("ahk_group saveReload") {
    ; Use Control+S to save your script and reload it at the same time.
    ~^s:: {
        Reload
        return
    }

    ; Hard exit that just closes the script
    ^Esc::ExitApp
}

;============================== Main Script ==============================

; Your main code here.
; Global hotkeys
; Global hotstrings
; etc...

;============================== Program 1 ==============================
; Evertything between here and the next #IfWinActive will ONLY work in someProgram.exe
; This is called being "context sensitive"
; if WinActive("ahk_exe someProgram.exe") {

;}

;============================== ini Section ==============================
; Do not remove /* or */ from this section. Only modify if you're
; storing values to this file that need to be permanantly saved.
/*
[SavedVariables]
Key=Value
*/
;============================== End Script ==============================