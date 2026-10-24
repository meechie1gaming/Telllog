# TellLog

Windower 4 addon for FFXI. Saves every tell you receive to a log file and keeps a list of new tells you can pull up after being away.

**Author:** Meechie
**Version:** 1.0

## Install

1. Create `Windower/addons/TellLog/`
2. Put `telllog.lua` in that folder
3. In game: `//lua load telllog`

To load it every time, add `lua load telllog` to `Windower/scripts/init.txt`.

## Commands

| Command | What it does |
| --- | --- |
| `//tl` | Shows tells received since the last clear |
| `//tl show` | Same as `//tl` |
| `//tl clear` | Empties the new tells list. The log file is not touched |

`//telllog` works in place of `//tl`.

## How It Works

- Every tell you receive is added to `tells_<Character>.log` in the addon folder, one line per tell:

  ```
  [2026-09-16 20:55:55] Sender: message
  ```

- Each character gets its own log file. The addon never clears it, so delete the file yourself to start fresh.
- Every tell also goes on the new tells list. `//tl` prints that list and leaves it in place, so run `//tl clear` once you've read them.
- The new tells list is kept in memory only. It empties when the addon reloads. The log file keeps everything.
- Only tells you receive are logged, not tells you send.
