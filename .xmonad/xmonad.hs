import XMonad

import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.InsertPosition

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab
import XMonad.Util.SpawnOnce

import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spacing

import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

main :: IO ()
main = do
        xmproc <- spawnPipe "~/.fehbg"
        xmproc <- spawnPipe "picom"
	xmonad $ ewmhFullscreen $ ewmh $ withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey$ docks $ myConfig



myConfig = def
	{ modMask = mod4Mask
	, layoutHook = spacingWithEdge 5 $ myLayout
	, manageHook = insertPosition End Newer
	, startupHook = startup
	, terminal = "konsole"	
	, workspaces = myWorkspaces
	, borderWidth = 0
	}
	`additionalKeysP`
	[ ("M-S-s", unGrab *> spawn "scrot -s -e 'xclip -selection clipboard -t image/png -i $f && rm $f'")		-- Take a screenshot of an area
	, ("M-C-s", unGrab *> spawn "scrot -e 'xclip -selection clipboard -t image/png -i $f && rm $f'")
	, ("M-x", kill)							-- Close windows
	, ("M-r", spawn ".config/rofi/launchers/ribbon/launcher.sh")	-- Run launcher
	, ("M-p", spawn ".config/rofi/powermenu/powermenu.sh")		-- Run power menu
	]

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , isDialog            --> doFloat
    ]


startup = do
	spawnOnce "picom -cC --corner-radius 10"

myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myLayout = avoidStruts ( tiled ||| Mirror tiled ||| Full )
	where
		tiled = Tall nmaster delta ratio
		nmaster = 1
		ratio = 2/3
		delta = 3/100


myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#888888" ""

