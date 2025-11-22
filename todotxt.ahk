#IfWinActive, ahk_class Notepad++

; toggle Done
^.::
^+.:: 
      clipSaved := ClipBoardAll
      SendInput {home}{home}{shift down}{end}{end}{shift up}{ctrl down}x{ctrl up}
      Sleep 75
      output := Clipboard
      If (SubStr(output, 1, 2) != "x ")
      {
            If InStr("(A)(B)(C)(D)(E)", SubStr(output, 1, 3)) {
                  output := SubStr(output, 5)
                  
            }
            SendInput {Raw}x %A_YYYY%-%A_MM%-%A_DD% %output%
      }
      Else
      {
            output := SubStr(output, 14)
            SendInput {Raw}%output%
      }
      Clipboard := clipSaved
      clipSaved := ""
      output := ""
      Return
      
; Assign priority (A)
^+$Up::
      clipSaved := ClipBoardAll
      SendInput {home}{home}{shift down}{end}{end}{shift up}{ctrl down}x{ctrl up}
      Sleep 75
      output := Clipboard
      If (RegExMatch(output, "^\([[:upper:]]\)"))
            output := SubStr(output, 5)
      SendInput {Raw}(A) %output%
      Clipboard := clipSaved
      clipSaved := ""
      output := ""
      Return

; Clear Priority
^+$Left::
      clipSaved := ClipBoardAll
      SendInput {home}{home}{shift down}{end}{end}{shift up}{ctrl down}x{ctrl up}
      Sleep 75
      output := Clipboard
      If (RegExMatch(output, "^\([[:upper:]]\)"))
            output := SubStr(output, 5)
      SendInput {Raw}%output%
      Clipboard := clipSaved
      clipSaved := ""
      output := ""
      Return

; Lower Priority
^+$Down::
      priority := ""
      clipSaved := ClipBoardAll
      SendInput {home}{home}{shift down}{end}{end}{shift up}{ctrl down}x{ctrl up}
      Sleep 75
      output := Clipboard
      priority := SubStr(output, 1, 3)
      If (InStr("(A)(B)(C)(D)(E)", priority)) {
            remainder := SubStr(output, 4)
            switch priority {
                  case "(A)": output := "(B)" . remainder
                  case "(B)": output := "(C)" . remainder
                  case "(C)": output := "(D)" . remainder
                  case "(D)": output := "(E)" . remainder
                  case "(E)": output := SubStr(remainder, 2)
            }
      }
      SendInput {Raw}%output%
      Clipboard := clipSaved
      clipSaved := ""
      output := ""
      Return