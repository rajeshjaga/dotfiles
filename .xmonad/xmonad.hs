import Data.Tree
import Data.Maybe(fromJust)

import XMonad

import System.Exit 
import XMonad.Util.SpawnOnce

import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.Loggers
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.EwmhDesktops
import XMonad.ManageHook
import XMonad.Hooks.ManageHelpers

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
--import XMonad.Util.ClickableWorkspaces

-- data ColorSchemes = ColorSchemes{ black ,white ,gray ,yellow ,orange ,red ,purple ,blue ,cyan ,green :: String }
-- Colors --
-- Catppuccin mocha theme
-- myCatppuccinColors :: ColorSchemes
-- myCatppuccinColors = ColorSchemes{
-- } 

--modkey
myModMask = mod4Mask

-- Launcher Menu
myLauncher,myLauncherAlt :: String
myLauncher = "dmenu_run -fn 'FiraCode -14' -nb '#1e1e2e' -nf '#cdd6f4' -sf '#1e1e2e' -sb '#89decb'"
myLauncherAlt = "rofi -show drun"

-- fonts
myFont :: String
myFont = "JetBrainsMonoNerdFont"

-- workspaces
workspaces :: [WorkspaceId]
workspaces = map show [1 .. 9 :: Int]

-- file explorer
myFileExplorer, myFileExplorerAlt :: String
myFileExplorer  = "kitty -e ranger"
myFileExplorerAlt  = "pcmanfm"

-- my default browser
mybrowser :: String
mybrowser = "firefox"

-- my default terminal
myTerminal :: String
myTerminal = "kitty"

-- colors of window borders
myNormalBorderColor, myFocusBorderColor :: String
myNormalBorderColor = "#1e1e2e"
myFocusBorderColor = "#b4befe"

-- width of the window border
myBorderWidth :: Dimension
myBorderWidth = 3

-- toggle key to override xmobar
toggleStructsKey :: XConfig Layout -> (KeyMask, KeySym)
toggleStructsKey XConfig{ modMask = m} = (m .|. shiftMask, xK_i)

-- xmobar PP config
myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " | ",
      ppTitleSanitize   = xmobarStrip,
      ppCurrent         = wrap " " "" . xmobarBorder "Bottom" "#94e2d5" 3,
      ppHidden          = white . wrap " " "",
      ppHiddenNoWindows = lowWhite . wrap " " "",
      ppUrgent          = red . wrap (yellow "!") (yellow "!"),
      ppOrder           = \[ws, l, _, wins] -> [ws, l, wins],
      ppExtras          = [logTitles formatFocused formatUnfocused]
      }
    where
      formatFocused   = wrap (white   "[") (white   "]") . magenta . ppWindow
      formatUnfocused   = wrap (lowWhite   "[") (lowWhite   "]") . blue . ppWindow

      ppWindow :: String -> String
      ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w). shorten 25

      blue, lowWhite, magenta, red, white, yellow :: String -> String
      magenta   = xmobarColor "#eba0ac" ""
      blue      = xmobarColor "#89b4fa" ""
      white     = xmobarColor "#cdd6f4" ""
      yellow    = xmobarColor "#f9e2af" ""
      red       = xmobarColor "#f38ba8" ""
      lowWhite  = xmobarColor "#bac2de" ""


-- layouts
myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes


-- startup apps
myStartupHook :: X ()
myStartupHook = do
  spawnOnce "$HOME/dotfiles/.config/scripts/wall.sh"
  spawnOnce "dunst -c $HOME/dotfiles/.config/dunst/dunstrc -startup_notification"
  spawnOnce "nm-applet"
  spawnOnce "picom -f -i -m=1.0 -r 0 -c -i 0.7 -l 0 -t 0 -b"
  spawnOnce "lxsession --session=xmonadwm --de=xmonad & "
  spawnOnce "nwg-look -a"
  spawnOnce "trayer --edge top --align right --SetDockType true \
            \--SetPartialStrut true --expand true --width 10 \
            \--transparent true --tint 0x1e1e2e --height 32"

myManageHook :: ManageHook
myManageHook = (composeAll
                        [ className =? "Gimp"         --> doFloat,
                        className =? "firefox"      --> doShift "2",
                        className =? "kitty"      --> doShift "1",
                        className =? "alacritty"      --> doShift "1",
                        isDialog                    --> doFloat
                        ])

myconfig = def
    { modMask                   = myModMask,
      layoutHook                = myLayout,
      startupHook               = myStartupHook,
      borderWidth               = myBorderWidth,
      focusedBorderColor        = myFocusBorderColor,
      normalBorderColor         = myNormalBorderColor,
      manageHook                = myManageHook
    }
    `additionalKeysP`
    [ ("M-<Return>",        spawn myTerminal)
    , ("M-d",               spawn myLauncher)
    , ("M-p",               spawn myLauncherAlt)
    , ("M-e",               spawn myFileExplorer)
    , ("M-S-e",             spawn myFileExplorerAlt)
    , ("M-b",               spawn mybrowser)
    , ("M-S-c",             kill)
    , ("M-n",               refresh)
    , ("M-S-q",             io exitSuccess)
    , ("M-r",               spawn "xmonad --recompile && xmonad --restart")
    , ("M-<Space>",         sendMessage NextLayout)
    ]

main :: IO ()
main = xmonad 
      . ewmhFullscreen
      . ewmh
      . withEasySB (statusBarProp "xmobar ~/dotfiles/.xmobarr" (pure myXmobarPP)) toggleStructsKey
      $ myconfig
