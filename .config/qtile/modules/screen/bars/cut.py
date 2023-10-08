from libqtile import  bar, widget
from libqtile.config import Screen

from . import color as c
# ---------------------
#    SCREEN WIDGETS
# ---------------------
def sep(bg):
    return widget.Sep(background=bg, padding=10, linewidth=0)


def left_arrow(bg_color, fg_color):
    return widget.TextBox(
        text="\ue0b8", padding=-1, fontsize=24, background=bg_color, foreground=fg_color
    )


def right_arrow(bg_color, fg_color):
    return widget.TextBox(
        text="\uE0Ba", padding=-1, fontsize=24, background=bg_color, foreground=fg_color
    )

widget_defaults = dict(
    font="Noto Sans Mono",
    fontsize=13,
)
extension_defaults = widget_defaults.copy()

bar_widgets = [
    sep(c.secondary),
    # Date
    # --------------
    widget.CurrentLayout(background=c.secondary, padding=10),
    left_arrow(c.primary, c.secondary),
    widget.Clock(
        background=c.primary,
        format="%d %b %A | %H:%M",
        padding=5,
    ),
    # Current Layout
    # --------------
    left_arrow(c.bg, c.primary),
    widget.Spacer(),
    # Worksapces
    # --------------
    widget.GroupBox(
        highlight_method="text",
        fontsize=18,
        active=c.fg, 
        inactive=c.inactive,
        this_current_screen_border=c.active,
        urgent_border=c.primary,
        urget_text=c.fg,
    ),
    widget.Spacer(),
    right_arrow(c.bg, c.primary),
    widget.KeyboardLayout(configured_keyboards=["us", "ir"], background=c.primary),
    widget.Volume(background=c.primary, padding=10),
    widget.Net(
        prefix="k",
        background=c.primary,
        padding=0,
        format="{interface} |{down:.2}KB ↓↑{up:.2}KB"
    ),
    right_arrow(c.primary, c.secondary),
    widget.QuickExit(background=c.secondary, fmt="OFF", padding=5),
    sep(c.secondary),
]

# Bars
bar_widgets1 = bar_widgets.copy()
bar_widgets2 = bar_widgets.copy()
bar1 = bar.Bar(bar_widgets1, background=c.bg, size=20, opacity=.9)
bar2 = bar.Bar(bar_widgets2, background=c.bg, size=24)

# Screens
screen1 = Screen(bottom=bar1)
screen2 = Screen(bottom=bar2)