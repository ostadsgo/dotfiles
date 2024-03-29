"""
Keyboard shortcuts for qtile.
"""

import os

from libqtile.config import Click, Drag, Key
from libqtile.lazy import lazy

# Modifiers
SUPER = "mod4"
MOD1 = "mod1"

# shortcut set
WIN = ["mod4"]
ALT = ["mod1"]
WIN_SHT = ["mod4", "shift"]
WIN_CTRL = ["mod4", "control"]

TERMINAL = os.environ.get("TERMINAL")


@lazy.function
def change_margin(qtile, size):
    qtile.current_layout.margin += size
    qtile.current_group.layout_all()
    if qtile.current_layout.margin <= 0:
        qtile.current_layout.margin = 0


@lazy.function
def navigate_floating(qtile):
    qtile.current_group.next_window()
    qtile.current_window.bring_to_front()


@lazy.function
def minimize_all(qtile):
    for window in qtile.current_group.windows:
        if hasattr(window, "toggle_minimize"):
            window.toggle_minimize()


# Keyboard bindings
keys = [
    # Window focus
    Key(WIN, "h", lazy.layout.left()),
    Key(WIN, "l", lazy.layout.right()),
    Key(WIN, "j", lazy.layout.down()),
    Key(WIN, "k", lazy.layout.up()),
    Key(WIN, "space", lazy.layout.next()),
    Key(ALT, "tab", navigate_floating()),
    Key(WIN_SHT, "space", lazy.layout.flip()),
    # Move window position
    Key(WIN_SHT, "h", lazy.layout.shuffle_left()),
    Key(WIN_SHT, "l", lazy.layout.shuffle_right()),
    Key(WIN_SHT, "k", lazy.layout.shuffle_up()),
    Key(WIN_SHT, "j", lazy.layout.shuffle_down()),
    Key(WIN_SHT, "Return", lazy.layout.toggle_split()),
    # Grow window
    Key(WIN, "comma", lazy.layout.grow_left()),
    Key(WIN, "period", lazy.layout.grow_right()),
    Key(WIN_SHT, "comma", lazy.layout.grow_down()),
    Key(WIN_SHT, "period", lazy.layout.grow_up()),
    Key(WIN_SHT, "n", lazy.layout.normalize()),
    Key(WIN_SHT, "m", lazy.layout.maximize()),
    Key(WIN, "o", lazy.layout.grow()),
    Key(WIN, "i", lazy.layout.shrink()),
    # Qtile specific
    Key(WIN, "r", lazy.reload_config()),
    Key(WIN_SHT, "r", lazy.restart()),
    Key(WIN_SHT, "q", lazy.shutdown()),
    # Run specific program
    Key(WIN, "Return", lazy.spawn(TERMINAL)),
    Key(WIN, "p", lazy.spawn("launcher")),
    Key(WIN,"Print", lazy.spawn("shot")),
    Key(
        ALT,
        "shift_l",
        lazy.widget["keyboardlayout"].next_keyboard(),
        lazy.spawn("kblayout"),
    ),
    # Window command
    Key(WIN, "q", lazy.window.kill()),
    Key(WIN, "f", lazy.window.toggle_fullscreen()),
    Key(WIN_SHT, "f", lazy.window.toggle_floating()),
    Key(WIN, "x", lazy.window.toggle_maximize()),
    # Screen specific
    Key(WIN, "b", lazy.hide_show_bar()),
    # Layout specific
    Key(WIN, "grave", lazy.next_layout()),
    Key(WIN_SHT, "grave", lazy.prev_layout()),
    Key(WIN, "m", lazy.group.setlayout("max")),
    Key(WIN, "c", lazy.group.setlayout("columns")),
    Key(WIN, "t", lazy.group.setlayout("monadtall")),
    Key(WIN, "w", lazy.group.setlayout("monadwide")),
    # Group (workspace)
    Key(WIN, "bracketright", lazy.screen.next_group(skip_empty=True)),
    Key(WIN, "bracketleft", lazy.screen.prev_group(skip_empty=True)),
    Key(WIN, "Tab", lazy.screen.toggle_group()),
    Key(WIN, "1", lazy.group["1"].toscreen()),
    Key(WIN, "2", lazy.group["2"].toscreen()),
    Key(WIN, "3", lazy.group["3"].toscreen()),
    Key(WIN, "9", lazy.group["9"].toscreen()),
    Key(WIN, "0", lazy.group["0"].toscreen()),
    Key(WIN_SHT, "1", lazy.window.togroup("1", switch_group=False)),
    Key(WIN_SHT, "2", lazy.window.togroup("2", switch_group=False)),
    Key(WIN_SHT, "3", lazy.window.togroup("3", switch_group=False)),
    Key(WIN_SHT, "9", lazy.window.togroup("9", switch_group=False)),
    Key(WIN_SHT, "0", lazy.window.togroup("0", switch_group=False)),
    Key(WIN_SHT, "p", lazy.group["scratchpad"].dropdown_toggle("python")),
    Key(WIN_SHT, "t", lazy.group["scratchpad"].dropdown_toggle("terminal")),
    # Volume keys
    Key([], "XF86AudioRaiseVolume", lazy.spawn("volume inc")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("volume dec")),
    Key([], "XF86AudioMute", lazy.spawn("volume mute")),
    # Custom functions bind to keys
    Key(WIN, "g", change_margin(size=1)),
    Key(WIN_SHT, "g", change_margin(size=-1)),
    Key(WIN, "d", minimize_all()),
]


# Mouse bindings
mouse = [
    Drag(
        WIN,
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        WIN,
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click(WIN, "Button1", lazy.window.bring_to_front()),
]
