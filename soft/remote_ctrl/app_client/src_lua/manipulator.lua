require( "joystick" )

local escon_started = {}
local values = {0,0,0,0}

function initEscon()
  print("init manipulator ...")

    cmd( "escon:setSpeed( 1, 0 )" )
    cmd( "escon:start( 1 )" )
    
    cmd( "escon:setSpeed( 2, 0 )" )
    cmd( "escon:start( 2 )" )
    
    cmd( "escon:setSpeed( 3, 0 )" )
    cmd( "escon:start( 3 )" )
    
    cmd( "escon:setSpeed( 4, 0 )" )
    cmd( "escon:start( 4 )" )
end

function startStopEscon( ind, val )
    -- print( string.format( "ind = %s, val = %s", tostring(ind), tostring(val) ) )
    if ( math.abs( val ) > JOY_TRESHOLD ) then
        if ( not escon_started[ ind ] ) then
            escon_started[ ind ] = true
            cmd( string.format( "escon:start( %i )", ind ) )
        end
        return true
    else
        if ( escon_started[ ind ] ) then
            escon_started[ ind ] = false
            cmd( string.format( "escon:stop( %i )", ind ) )
            values[ind] = 0
        end
    end
    return false
end

function esconSetSpeed( ind, val )
    if ( startStopEscon( ind, val ) and values[ind] ~= val ) then
        -- print( string.format( "setSpeed %s", tostring( val ) ) )
        local speed = joyToSpeed( val )
        -- print( "after joyToSpeed" )
        local stri = string.format( "escon:setSpeed( %i, %i )", ind, val )
        cmd( stri )
        
        values[ind] = val
    end
end
