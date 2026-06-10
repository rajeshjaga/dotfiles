-- mapping lib
import Data.IntMap qualified as M
import Data.Map
import Data.Map qualified as Map
-- mayber data type
import Data.Maybe (fromJust)
import Data.Tree
-- system exit
import System.Exit
-- IO Lib
import System.IO
-- main libs intialize
import XMonad
-- log
import XMonad.Hooks.DynamicLog
-- window management
import XMonad.Hooks.EwmhDesktops
-- Status bar
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
-- layouts
import XMonad.Layout
import XMonad.Layout.Accordion
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
-- hooks
import XMonad.ManageHook
-- ungrab lib
-- utils
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Loggers
-- runners lib
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce

-- import XMonad.Util.ClickableWorkspaces

-- modkey
myModMask :: KeyMask
myModMask = mod4Mask

-- Launcher Menu
myLauncher, myLauncherAlt :: String
myLauncher = "dmenu_run -l 10 -fn 'JetBrainsMono Nerd Font -14' -nb '#1e1e2e' -nf '#cdd6f4' -sf '#1e1e2e' -sb '#89decb'"
myLauncherAlt = "rofi -show drun"

-- fonts
myFont :: String
myFont = "JetBrainsMonoNerdFont"

-- workspaces
workspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

-- file explorer
myFileExplorer, myFileExplorerAlt :: String
myFileExplorer = "kitty -c ranger"
myFileExplorerAlt = "pcmanfm"

-- my default browser
mybrowser :: String
mybrowser = "zen-browser"

-- my default terminal
myTerminal, myTerminalAlt :: String
myTerminal = "kitty"
myTerminalAlt = "alacritty"

-- colors of window borders
myNormalBorderColor, myFocusBorderColor :: String
myNormalBorderColor = "#1e1e2e"
myFocusBorderColor = "#b4befe"

-- width of the window border
myBorderWidth :: Dimension
myBorderWidth = 3

myFocusFollowMouse :: Bool
myFocusFollowMouse = True

-- toggle key to override xmobar
toggleStructsKey :: XConfig Layout -> (KeyMask, KeySym)
toggleStructsKey XConfig {modMask = m} = (m .|. shiftMask, xK_i)

myKeys =
  [ ("M-<Return>", spawn myTerminal),
    ("M-S-<Return>", spawn myTerminalAlt),
    ("M-d", spawn myLauncher),
    ("M-p", spawn myLauncherAlt),
    ("M-e", spawn myFileExplorer),
    ("M-S-e", spawn myFileExplorerAlt),
    ("M-b", spawn mybrowser),
    ("M-S-c", kill),
    ("M-n", refresh),
    ("M-S-q", io exitSuccess),
    ("M-q", spawn "xmonad --recompile && xmonad --restart"),
    ("M-<Space>", sendMessage NextLayout),
    ("M-S-o", spawn "$HOME/.config/scripts/wall.sh"),
    ("M-S-m", spawn "xrandr --output HDMI-1-0 --mode 1920x1080 --rate 119.98 --right-of eDP1"),
    ("<XF86AudioRaiseVolume>", spawn "~/dotfiles/.config/scripts/volume.sh -u"),
    ("<XF86AudioLowerVolume>", spawn "~/dotfiles/.config/scripts/volume.sh -d"),
    ("<XF86AudioMute>", spawn "~/dotfiles/.config/scripts/volume.sh -m"),
    ("<XF86MonBrightnessUp>", spawn "~/dotfiles/.config/scripts/brightness up"),
    ("<XF86MonBrightnessDown>", spawn "~/dotfiles/.config/scripts/brightness down")
    -- ("M-<Up>", unGrab >> spawn "~/dotfiles/.config/scripts/brightness up"),
    -- ("M-<Down>", unGrab >> spawn "~/dotfiles/.config/scripts/brightness down")
    -- ("M-h", focus left),
    -- ("M-l", focus right),
    -- ("M-j", focus down),
    -- ("M-k", focus up)
  ]

-- xmobar PP config
myXmobarPP :: PP
myXmobarPP =
  def
    { ppSep = magenta " | ",
      ppTitleSanitize = xmobarStrip,
      ppCurrent = wrap " " "" . white,
      ppTitle = ppWindow,
      -- ppCurrent = wrap " " "" . xmobarBorder "Bottom" "#94e2d5" 3,
      ppHidden = white . wrap " " "",
      ppHiddenNoWindows = mempty,
      -- ppHiddenNoWindows = lowWhite . wrap " " "",
      ppUrgent = red . wrap (yellow "!") (yellow "!"),
      ppOrder = \[ws, l, _, wins] -> [ws, l, wins],
      ppExtras = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused = wrap (white "") (white "") . blue . ppWindow
    formatUnfocused = mempty
    -- formatUnfocused = wrap (lowWhite "") (lowWhite "") . blue . ppWindow

    -- passing window name, window class to xmobar
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if Prelude.null w then "untitled" else w) . shorten 25

    -- color scheme to xmobar
    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta = xmobarColor "#eba0ac" ""
    blue = xmobarColor "#89b4fa" ""
    white = xmobarColor "#cdd6f4" ""
    yellow = xmobarColor "#f9e2af" ""
    red = xmobarColor "#f38ba8" ""
    lowWhite = xmobarColor "#45475a" ""

-- event hooked
myEventHook = mempty

-- layouts
myLayoutHook = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1 -- Default number of windows in the master pane
    ratio = 1 / 2 -- Default proportion of screen occupied by master pane
    delta = 3 / 100 -- Percent of screen to increment by when resizing panes

-- startup apps
myStartupHook :: X ()
myStartupHook = do
  spawnOnce "wal -i $HOME/Pictures/wally/forest.jpg"
  spawnOnce "dunst -c $HOME/dotfiles/.config/dunst/dunstrc -startup_notification"
  spawnOnce "nm-applet"
  spawnOnce "picom"
  spawnOnce "lxsession --session=xmonadwm --de=xmonad & "
  spawnOnce "nwg-look -a"
  spawnOnce "xrandr --output HDMI-1-0 --mode 1920x1080 --refresh 144 --right-of eDP-1"
  spawnOnce
    "trayer --edge top --align right --SetDockType true \
    \--SetPartialStrut true --expand true --width 10 \
    \--transparent true --tint 0x1e1e2e --height 32"

myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "Gimp" --> doFloat,
      className =? "zen-browser" --> doShift "2",
      className =? "kitty" --> doShift "1",
      className =? "alacritty" --> doShift "1",
      className =? "pavucontrol" --> doFloat,
      isDialog --> doFloat
    ]

myconfig =
  def
    { modMask = myModMask,
      layoutHook = avoidStruts $ myLayoutHook,
      startupHook = myStartupHook,
      borderWidth = myBorderWidth,
      focusedBorderColor = myFocusBorderColor,
      normalBorderColor = myNormalBorderColor,
      manageHook = manageDocks <+> myManageHook,
      handleEventHook = myEventHook,
      focusFollowsMouse = myFocusFollowMouse
    }
    `additionalKeysP` myKeys

--  ("", spawn myTerminal),

main :: IO ()
main =
  xmonad
    . ewmhFullscreen
    . ewmh
    . withEasySB (statusBarProp "xmobar ~/dotfiles/.xmobarrc" (pure myXmobarPP)) toggleStructsKey
    $ myconfig

