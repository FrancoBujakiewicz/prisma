
 import XMonad
 import XMonad.Actions.SpawnOn
 import XMonad.Util.EZConfig (additionalKeysP)
 import XMonad.Util.SpawnOnce
 import XMonad.Layout.Spacing
 import XMonad.Layout.MultiToggle
 import XMonad.Layout.MultiToggle.Instances
 import XMonad.Layout.Fullscreen
 import qualified XMonad.StackSet as W

 myWorkspaces :: [String]
 myWorkspaces = [ "1", "2", "3" ]

 layout = smartSpacing 4

       $ mkToggle (NOBORDERS ?? FULL ?? EOT)
       $ tiled ||| Mirror tiled ||| Full

   where

     tiled = Tall 1 (3/100) (1/2)

 startUpHook = do

   windows $ W.greedyView "2"
   spawnOnce "feh --bg-scale $HOME/Pictures/Wallpapers/Wallpaper.png"
   spawnOn "2" "betterlockscreen -l blur; wait $!; alacritty"

 main :: IO ()

 main = xmonad

  $ fullscreenSupportBorder
  $ def {

  startupHook = startUpHook,
  modMask = mod4Mask,
  layoutHook = layout,
  workspaces = myWorkspaces,
  borderWidth = 3,
  normalBorderColor = "#000000",
  focusedBorderColor = "#FFFFFF",
  focusFollowsMouse = False

 } `additionalKeysP` [

   ("M4-f", sendMessage $ Toggle FULL),
   ("M4-r", spawn "$HOME/.config/rofi/launcher.sh;"),
   ("M4-C-w", kill),
   ("M4-s", spawn "flameshot gui"),
   ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%"),
   ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%"),
   ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),
   ("<XF86MonBrightnessUp>", spawn "brightnessctl set +5%"),
   ("<XF86MonBrightnessDown>", spawn "brightnessctl set 5%-"),
   ("C-1", windows $ W.shift "1"),
   ("C-2", windows $ W.shift "2"),
   ("C-3", windows $ W.shift "3"),
   ("M1-C-l", spawn "betterlockscreen -l blur")]

