
// Project: Light_And_Sound_Client 
// Created: 2020-10-11

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Light_And_Sound_Client" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 1, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

network_id = JoinNetwork("2a02:8070:d2a5:c200::969c", 2000, "test2")

state = 0
counter = 0
clients = 0
do
	clients = GetNetworkNumClients(network_id)
	if clients > 0
		exit
	endif
		
	inc counter
	if counter = 5
		exit
	endif
	Sleep(1000)
loop
    
if counter < 5:
	do
	rem    Print( ScreenFPS() )

		msg_id = GetNetworkMessage(network_id)
		if msg_id <> 0
			text AS STRING
			text = GetNetworkMessageString(msg_id)
			DeleteNetworkMessage(msg_id)
			print(text)
		endif
		Sync()
	loop
endif
