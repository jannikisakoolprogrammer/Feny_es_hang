#INCLUDE "Game.agc"
#INCLUDE "Network.agc"

#INSERT "global_game_settings.agc"
// Project: Fény_és_Hang 
// Created: 2020-10-11




// show all errors
SetErrorMode(2)

network_info as Network_NetworkInfo
network_info = Network_CreateNetworkInfo(global_game_settings_IP_ADDRESS_V6, global_game_settings_NAME, global_game_settings_PORT_IPV4, global_game_settings_PORT_IPV6)


window_size AS INTEGER[3] = [global_game_settings_SCREEN_WIDTH,
							 global_game_settings_SCREEN_WIDTH,
							 0]
							 
orientation_allowed AS INTEGER[4] = [1, 1, 1, 1]
fps = global_game_settings_FPS

game AS GAME_GAME
game = Game_CreateGame(global_game_settings_TITLE, window_size, global_game_settings_ALLOW_RESIZE, window_size, orientation_allowed, fps, network_info)
Game_Run(game)
