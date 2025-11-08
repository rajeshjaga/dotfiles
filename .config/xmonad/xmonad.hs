import XMonad
import XMonad.Util.EZConfig

myModMask :: String
myModMask = "mod4Mask"

myterminal :: String
myTerminal = "kitty"

main :: IO()
main = xmonad $ def
    { modMask = myModMask
    }
    `additionalKeysP`
    [ ("M-<return>", spawn myTerminal),
    ]
