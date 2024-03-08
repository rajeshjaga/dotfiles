import XMonad
import System.Exit 
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.EwmhDesktops

mylauncher :: String
mylauncher = "dmenu_run -fn 'FiraCode -14' -nb '#1e1e2e' -nf '#cdd6f4' -sf '#1e1e2e' -sb '#89decb'"

workspaces :: [WorkspaceId]
workspaces = map show [1 .. 9 :: Int]

mod :: KeyMask
mod = mod4Mask

myFileExplorer :: String
myFileExplorer  = "kitty -e ranger"

mybrowser :: String
mybrowser = "thorium-browser"

borderWidth :: Dimension
borderWidth = 1

myTerminal :: String
myTerminal = "kitty"

normalBorderColor, focusBorderColor :: String
normalBorderColor = "#1e1e2e"
focusBorderColor = "#1c1dfe"



myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes


startupHook :: ()
startupHook = return()  

main :: IO ()
main = xmonad . ewmhFullscreen . ewmh =<< xmobar myconfig

myconfig = def
    { modMask = mod4Mask
    , layoutHook = myLayout
    }
    `additionalKeysP`
    [ ("M-<Return>",        spawn myTerminal)
    , ("M-d",               spawn mylauncher)
    , ("M-e",               spawn myFileExplorer)
    , ("M-S-e",             spawn "pcmanfm")
    , ("M-b",               spawn mybrowser)
    , ("M-S-c",             kill)
    , ("M-n",               refresh)
    , ("M-S-r",             io exitSuccess)
    , ("M-r",               spawn "xmonad --recompile && xmonad --restart")
    , ("M-<Space>",         sendMessage NextLayout)
    , ("M-S-<Space>",       setLayout $ XMonad.myLayout conf)
    ]
