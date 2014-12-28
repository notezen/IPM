
require( "luajoyctrl" )

JOY_TRESHOLD = 25

function joyProcess( valves )
    -- print( "Entered joyProcess()" )
    if ( not joystick ) then
      -- print( "one" )
      local j = luajoyctrl.create()       
      j:open()
      joystick = j
    end
    
    local j = joystick
    -- print( "two" )
    if ( not j:isOpen() ) then
        -- print( "three" )
        j:open()
    end
    
    if ( not j:isOpen() ) then
        print( "ERROR: no joysticks board detected!" )
        return
    end
    
    j:queryState()
    local adcX = {}
    local adcY = {}
    local nullX = {}
    local nullY = {}
    local stopBtn

    stopBtn = j:stopBtn()
    
    
    -- print( string.format( "stopBtn: %s", stopBtn and "true" or "false" ) )

    -- print( "Joystick table" )
    joyValues = joyValues or {}
    for i=0, 3 do
        adcX[i+1]  = j:adcX( i )
        adcY[i+1]  = j:adcY( i )
        nullX[i+1] = j:nullX( i )
        nullY[i+1] = j:nullY( i )
        --[[
        print( string.format( "adcX[%i]: %3i; adcY[%i]: %3i; nullX: %s, nullY: %s", 
                              i,  
                              adcX[i+1], 
                              i, 
                              adcY[i+1], 
                              nullX[i+1] and "true" or "false", 
                              nullY[i+1] and "true" or "false" ) )
        ]]
        
        local y = (adcX[i+1] - 511) * 100 / 512
        local x = (adcY[i+1] - 511) * 100 / 512
        joyValues[ i+1 ] = { x = x, y = y }
        --print( string.format( "k[%i]=%i, %i", i, joyValues[i+1].x, joyValues[i+1].y ) )
    end

    --[[
    -- 0-th joystick controls 0 and 1 outputs depending on where 
    -- it is bended, to the left or to the right.
    local valve = valves[0]
    if ( adcX[0] < 1024 ) then
        valve = bit.bor( valve, 1 )
    elseif ( adcX[0] > 3072 ) then
        valve = bit.bor( valve, 2 )
    else
        valve = bit.band( valve, 0xFFFFFFFF - 3 )
    end
    -- the same with 2 and 3 outs. They are 
    -- made dependant on Y axis of 0-th joystick.
    if ( adcY[0] < 1024 ) then
        valve = bit.bor( valve, 4 )
    elseif ( adcY[0] > 3072 ) then
        valve = bit.bor( valve, 8 )
    else
        valve = bit.band( valve, 0xFFFFFFFF - 12 )
    end
 
    if ( valve ~= valves[0] ) then
        valves[0] = valve
        remoteInvokeOutputs( valves )
    end
    ]]
end


function joyToSpeed( val )
    local a = math.abs( val )
    if (  a < JOY_TRESHOLD ) then
        return 0
    end
    local s = 100 / (100 - JOY_TRESHOLD)
    if ( val > 0 ) then
        return s*(a - JOY_TRESHOLD)
    else
        return s*(JOY_TRESHOLD - a)
    end
end

function joyVal( ind )
    if ( DEBUG ) then
        -- virtual joystics
        local x, y = joy( ind )
        return x, y
    end
    
    x, y = joyValues[ ind ].x, joyValues[ ind ].y
    return x, y
end
