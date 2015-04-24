
require( "bit" )
-- require( "movement15" )
require( "movement50" )
-- require( "debugger" )
require( "joystick" )
require( "manipulator" )
require( "spinning" )

-- This value is supposed to detach real output
-- and turn some test information on.
DEBUG = true

local BOARDS_CNT = 3
valves = { 0, 0, 0 }
inputs = { 0, 0, 0 }

function main()
    print( "Initializing valve test window" )
    for i=1, BOARDS_CNT do
        valveSetInputs( i-1, 0 )
        valveSetOutputs( i-1, 0 )
    end
    mov = Mover()
    
    -- ESCON controllers initialization.
    -- initEscon()
    
    prevBtn = false

    while true do
        sleep( 0.1 )
        -- [[
        -- if ( not DEBUG ) then
            -- Valve test window outputs query
            for i=1, BOARDS_CNT do
                local valve = valveOutputs( i-1 )
                -- If not equal
                if ( valve ~= valves[i] ) then
                    -- Apply all changes.
                    for i = 1, BOARDS_CNT do
                        local valve = valveOutputs( i-1 )
                        valves[i] = valve
                    end
                    -- Send to host.
                    remoteInvokeOutputs( valves )
                    -- Break comparing.
                    break
                end
            end
        -- end
        -- ]]
        
        
        -- print( "Before joysticks" )
        -- Process joysticks.
        joyProcess( valves )
                
        if ( joyBtn() ) then
          if ( prevBtn ~= true ) then
              prevBtn = true
              stopEscon()
          end
                
          local zeroSpin = false
          local turn, fwd = joyVal( 1 )
          -- print( "fwd = " .. tostring( fwd ) )
          if ( fwd < -JOY_TRESHOLD ) then
              -- pause()
              zeroSpin = true
              res, err = pcall( mov.oneStepForward, mov )
              if ( not res ) then
                  print( err )
              end
          elseif ( fwd > JOY_TRESHOLD ) then
              --pause()
              zeroSpin = true
              res, err = pcall( mov.oneStepBackward, mov )
              if ( not res ) then
                  print( err )
              end
          end
          
          -- Process spinning       
          -- print( "Here 01" )
          if ( zeroSpin ) then
              turn = 0.0
          end
          
          prevSpinDir = prevSpinDir or "idle"
          if ( turn > JOY_TRESHOLD ) then
              if ( prevSpinDir and prevSpinDir ~= "cw" ) then
                  prevSpinDir = "cw"
                  spin_clockwise()
              end
          elseif ( turn < -JOY_TRESHOLD ) then
              if ( prevSpinDir and prevSpinDir ~= "ccw" ) then
                  prevSpinDir = "ccw"
                  spin_counterclockwise()
              end
          else
              if ( prevSpinDir and prevSpinDir ~= "idle" ) then
                  prevSpinDir = "idle"
                  spin_stop()
              end
          end

        else        
          if ( prevBtn ~= false ) then
              prevBtn = false
              spin_stop()
          end

          -- print( "Here 02" )
          -- Process manipulator.
          local hor, vert = joyVal( 3 )
  
          -- print( string.format( "hor = %s, ver = %s", tostring( hor ), tostring( vert ) ) )
          -- print( "Here 02.5" )
          esconSetSpeed( 1, hor )
          -- print( "Here 02.75" )
          esconSetSpeed( 2, vert )
          
          -- print( "Here 03" )
          local hor, vert = joyVal( 4 )
          esconSetSpeed( 3, vert )
  
          esconSetSpeed( 4, hor )        

        end
    end
end

function sleep( t, mask, stri )
    t = t or 1
    t = t * 1000
    local report = true
    local doStop = false
    for i=1, t do
        if ( type( mask ) == 'table' ) then
            for j=1, #mask do
                if ( bit.band( mask[j], inputs[j] ) > 0 ) then
                    --print( string.format( "Input detected: \'%s\'", tostring( stri ) ) )
                    print( string.format( "suitable input (%i, %i, %i) for mask (%i, %i, %i)", inputs[1], inputs[2], inputs[3], mask[1], mask[2], mask[3] ) )
                    report = nil
                    doStop = true
                    break
                end
            end
        else
            if ( report ) then
                --print( "not a table" )
                report = nil
            end
        end
        if ( doStop ) then
            break
        end
        msleep( 1 )
    end
    if ( report ) then
        print( string.format( "empty input (%i, %i, %i) for mask (%i, %i, %i)", inputs[1], inputs[2], inputs[3], mask[1], mask[2], mask[3] ) )
    end
    --print( string.format( "%i, %i, %i", inputs[1], inputs[2], inputs[3] ) )
end

function remoteInvokeOutputs( vals )
    local stri = "setValves( { "
    local cnt = #vals
    for i=1, cnt do
        stri = stri .. tostring( vals[i] or 0 )
        if ( i ~= cnt ) then
            stri = stri .. ", "
        else
            stri = stri .. " "
        end
    end
    stri = stri .. "} )"
    cmd( stri )
end

function cmd( str )
  if ( DEBUG ) then
    print( str )
  end
  
  send( str )
end

-- calls from HOST
-- =============================
function setInputs( vals )
    local cnt = #vals
    for i = 1, cnt do
        valveSetInputs( i-1, vals[i] )
        inputs[i] = vals[i]
    end
end

function setAcc( x, y, z )
    print( string.format( "acc: %i, %i, %i", x, y, z ) )
end

function setMag( x, y, z )
    print( string.format( "mag: %i, %i, %i", x, y, z ) )
end

function setTemp( t )
    print( string.format( "temp: %i", t ) )
end

-- ==============================

main()
