on run argv
  tell application "iTerm"
    repeat with aWindow in windows
      tell aWindow
        tell current session
          set transparency to argv
        end tell
      end tell
    end repeat
  end tell
end
