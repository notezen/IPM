
find_package( Qt4 REQUIRED QtCore )
#set( QT_USE_QTCORE     True )
#set( QT_USE_QTGUI      True )
#set( QT_USE_QTNETWORK  True )
#set( QT_USE_QTXML      True )
include( ${QT_USE_FILE} )

set( Boost_USE_STATIC_LIBS True )
set( Boost_USE_MULTITHREADED True )
find_package( Boost COMPONENTS thread filesystem REQUIRED )
#find_package( Threads )

include_directories( "./src" 
                     "${ROOT}/peer_abst/src" 
                     "${ROOT}/peer_qxmpp/src"
                     "${ROOT}/luamcuctrl/src"   
                     ${LUA_INCLUDE_DIR} 
                     ${Boost_INCLUDE_DIRS} 
                     ${CMAKE_CURRENT_BINARY_DIR} )

file( GLOB src     "./src/*.cpp" )
file( GLOB headers "./src/*.h" )
file( GLOB ui      "./src/*.ui" )
file( GLOB qrc     "./src/*.qrc" )
message( STATUS "SRC = ${src}" )
message( STATUS "HEADERS = ${headers}" )

Qt4_WRAP_CPP( mocSrc ${headers} )
set( src ${src} ${mocSrc} )

QT4_WRAP_UI( uiSrc ${ui} )
set( src ${src} ${uiSrc} )

QT4_ADD_RESOURCES( qrcSrc ${qrc} )
set( src ${src} ${qrcSrc} )

add_executable( app_host ${src} )
set( libs ${LUA_LIBRARIES}
          peer_qxmpp 
          luamcuctrl
          ${QT_LIBRARIES} 
          ${CMAKE_THREAD_LIBS_INIT} 
          ${Boost_LIBRARIES} )
target_link_libraries( app_host ${libs} )
install( TARGETS app_host DESTINATION "." )
install( DIRECTORY "src_lua/" DESTINATION "." )
install( DIRECTORY "etc/" DESTINATION "." )
