#INCLUDE "Network.agc"

TYPE Game_Game
	network_info AS Network_NetworkInfo
	network AS INTEGER
ENDTYPE


FUNCTION Game_CreateGame(_window_title AS STRING,
						 _window_size AS INTEGER[],
						 _window_allow_resize AS INTEGER,
						 _virtual_resolution AS INTEGER[],
						 _orientation_allowed AS INTEGER[],
						 _sync_rate AS INTEGER,
						 _network_info AS Network_NetworkInfo)
						 
	game AS Game_Game
	
	REM Set up window.
	Game_SetUpWindow(_window_title,
					 _window_size,
					 _window_allow_resize,
					 _virtual_resolution,
					 _orientation_allowed,
					 _sync_rate)
	
	REM Pass network info information.
	game.network_info = _network_info
	
	REM Create network / host game.
	Game_SetUpNetwork(game)
	
ENDFUNCTION game


FUNCTION Game_SetUpWindow(_window_title AS STRING,
						 _window_size AS INTEGER[],
						 _window_allow_resize AS INTEGER,
						 _virtual_resolution AS INTEGER[],
						 _orientation_allowed AS INTEGER[],
						 _sync_rate AS INTEGER)
	// set window properties
	SetWindowTitle(_window_title) REM Light and Sound
	SetWindowSize(_window_size[0],
				  _window_size[1],
				  _window_size[2])
	SetWindowAllowResize(_window_allow_resize) // allow the user to resize the window

	// set display properties
	SetVirtualResolution(global_game_settings_SCREEN_WIDTH,
						 global_game_settings_SCREEN_HEIGHT) // doesn't have to match the window
	SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
	SetSyncRate(global_game_settings_FPS,
				0 ) // 30fps instead of 60 to save battery
	SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
	UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts
ENDFUNCTION


FUNCTION Game_SetUpNetwork(_game REF AS Game_Game)
	_game.network = HostNetwork(_game.network_info.ip_address_ipv6, _game.network_info.name, _game.network_info.port_ipv4, _game.network_info.port_ipv6)
ENDFUNCTION


FUNCTION Game_Run(_game REF AS Game_Game)

	msg AS STRING

	do
		msg = msg + "1"
		network_message = CreateNetworkMessage()
		AddNetworkMessageString(network_message, msg)
		SendNetworkMessage(_game.network,
						   0,
						   network_message)
		

		Print( ScreenFPS() )
		Print(GetDeviceIPv6())
		Sync()
	loop

ENDFUNCTION
