
function spin_clockwise()
  print("spin clockwise ...")
  cmd( "bmsd:move( 10, 90, 90 )" )
  cmd( "bmsd:start()" )
end

function spin_counterclockwise()
  print("spin counterclockwise ...")
  cmd( "bmsd:move( -10, 90, 90 )" )
  cmd( "bmsd:start()" )
end

function spin_stop()
  print("spin stop ...")
  cmd( "bmsd:stop()" )
end
