require( "joystick" )

local escon_started = {}

function initEscon()
    send( "escon:setSpeed( 1, 0 )" )
    send( "escon:start( 1 )" )
    
    send( "escon:setSpeed( 2, 0 )" )
    send( "escon:start( 2 )" )
    
    send( "escon:setSpeed( 3, 0 )" )
    send( "escon:start( 3 )" )
    
    send( "escon:setSpeed( 4, 0 )" )
    send( "escon:start( 4 )" )
end

function startStopEscon( ind, val )
    --print( "startStop entered" )
    --print( string.format( "ind = %s, val = %s", tostring(ind), tostring(val) ) )
    if ( math.abs( val ) > JOY_TRESHOLD ) then
        --print( "startStop start" )
        if ( not escon_started[ ind ] ) then
            escon_started[ ind ] = true
            send( string.format( "escon:start( %i )", ind ) )
        end
        --print( "startStop left" )
        return true
    else
        --print( "startStop stop" )
        if ( escon_started[ ind ] ) then
            escon_started[ ind ] = false
            send( string.format( "escon:stop( %i )", ind ) )
        end
    end
    return false
end

function esconSetSpeed( ind, val )
    if ( startStopEscon( ind, val ) ) then
        -- print( string.format( "setSpeed %s", tostring( val ) ) )
        local speed = joyToSpeed( val )
        -- print( "after joyToSpeed" )
        local stri = string.format( "escon:setSpeed( %i, %i )", ind, val )
        send( stri )
    end
end
