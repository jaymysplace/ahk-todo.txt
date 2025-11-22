# ahk-todo.txt
AutoHotKey script to do add some some hotkeys for todo.txt into a text editor (in particular Notepad++)

Adds the following hotkeys, that trigger when Notepad++ is the active window:

- `CTRL + SHIFT + Up Arrow` Set the current task to Priority (A)
- `CTRL + SHIFT + Down Arrow` Lower the Priority of the selected task (A) becomes (B), (B) becomes (C) etc. (E) becomes unprioritsed.
- `CTRL + SHIFT + Left Arrow` Remove Priority frmom the selected task
- `CTRL + SHIFT + .` or `CTRL + .` Mark the selected task as complete. Tasks that are already marked as complete will be marked as incomplete.

Notepad++ has a built-in function to alphabetise all lines in the document. I assign this to `CTRL + SHIFT + Right Arrow` to complete the set