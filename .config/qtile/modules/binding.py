"""
Bindings for keyboard and mouse
"""

# qtile modules
from libqtile.config import Key, Drag, Click
from libqtile.lazy import lazy

# user modules
from .utils import WIN, WIN_CTRL, WIN_SHT, TERMINAL


# Keyboard bindings
keys = [
    # Window focus
    Key(WIN, "h", lazy.layout.left()),
    Key(WIN, "l", lazy.layout.right()),
    Key(WIN, "j", lazy.layout.down()),
    Key(WIN, "k", lazy.layout.up()),
    Key(WIN, "space", lazy.layout.next()),
    # Move window position
    Key(WIN_SHT, "h", lazy.layout.shuffle_left()),
    Key(WIN_SHT, "l", lazy.layout.shuffle_right()),
    Key(WIN_SHT, "k", lazy.layout.shuffle_up()),
    Key(WIN_SHT, "j", lazy.layout.shuffle_down()),
    # Grow window
    Key(WIN_CTRL, "h", lazy.layout.grow_left()),
    Key(WIN_CTRL, "l", lazy.layout.grow_right()),
    Key(WIN_CTRL, "j", lazy.layout.grow_down()),
    Key(WIN_CTRL, "k", lazy.layout.grow_up()),
    Key(WIN, "n", lazy.layout.normalize()),
    Key(WIN_SHT, "Return", lazy.layout.toggle_split()),
    # Qtile specific
    Key(WIN_CTRL, "r", lazy.reload_config()),
    Key(WIN_CTRL, "q", lazy.shutdown()),
    # Run specific program
    Key(WIN, "Return", lazy.spawn(TERMINAL)),
    Key(WIN, "p", lazy.spawn("rofi -show")),
    # Window commands
    Key(WIN, "w", lazy.window.kill()),
    Key(WIN, "f", lazy.window.toggle_floating()),
    # Screen specific
    Key(WIN, "b", lazy.hide_show_bar()),
    # Layout specific
    Key(WIN, "grave", lazy.next_layout()),
    Key(WIN_SHT, "grave", lazy.prev_layout()),
    # Group (workspace)
    Key(WIN, "bracketright", lazy.screen.next_group(skip_empty=True)),
    Key(WIN, "bracketleft", lazy.screen.prev_group(skip_empty=True)),
    Key(WIN, "Tab", lazy.screen.toggle_group()),
    Key(WIN, "0", lazy.group["0"].toscreen()),
    Key(WIN, "1", lazy.group["1"].toscreen()),
    Key(WIN, "2", lazy.group["2"].toscreen()),
    Key(WIN, "3", lazy.group["3"].toscreen()),
    Key(WIN, "9", lazy.group["9"].toscreen()),
    Key(WIN_SHT, "0", lazy.window.togroup("0", switch_group=True)),
    Key(WIN_SHT, "1", lazy.window.togroup("1", switch_group=True)),
    Key(WIN_SHT, "2", lazy.window.togroup("2", switch_group=True)),
    Key(WIN_SHT, "3", lazy.window.togroup("3", switch_group=True)),
    Key(WIN_SHT, "9", lazy.window.togroup("9", switch_group=True)),
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
    Click(WIN, "Button2", lazy.window.bring_to_front()),
]