
function spin_clockwise()
  send( "bmsd:move( 10, 90, 90 )" )
  send( "bmsd:start()" )
end

function spin_counterclockwise()
  send( "bmsd:move( -10, 90, 90 )" )
  send( "bmsd:start()" )
end

function spin_stop()
  send( "bmsd:stop()" )
end
