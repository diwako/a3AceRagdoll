# Diwako's ACE Ragdolling
## Description
Been playing with a group for a long time now and noticed that people immediately know if players are dead or not just according to the way they go down when shot. I kind of wanted to add some uncertainty back to the gameplay when using ace medical.

With this script players will not go into the ace death animation immediately when losing consciousness. Just like they are dying they ragdoll, but will snap to the ace death animation once the ragdolling is done, which pretty much means other players need to check the body to confirm death.

This script can be used on players and AI as well. However, it is recommended to use this on players only.

This mod works in SP and MP.

## Requirements:
In order to use this script, you need to run these mods alongside it:
* CBA
* ACE Medical

## Installation and configuration:
Mount this mod and configure it in Eden editor.
Any configuration will be done within Eden editor and in `Settings -> Addon Options -> Diwako's ACE Ragdoll`

## Troubleshooting
In any event, that something goes wrong, you can disable ragdolling by setting the variable `diwako_ragdoll_ragdolling` to `false` on all machines.\
Additionally for ingame error handling you can either run ACE's headbug fix or reapply unconsciousness and take it away again.

## Additional
Discussion can be found in the [BI Thread](https://forums.bohemia.net/forums/topic/215720-release-ragdolling-on-player-ace-unconsciousness/), for bug reports please use the thread on the BI forums.

## License
Copyright 2018 diwako

This work (diwako_ace_ragdoll or the like) uses the license Arma Public License Share Alike (APL-SA)

https://www.bohemia.net/community/licenses/arma-public-license-share-alike