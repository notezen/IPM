
#include "luajoyctrl.h"
#include "joyctrl_top.h"

static const char META[] = "LUA_JOYCTRL_META";
static const char LIB_NAME[] = "luajoyctrl";

static int create( lua_State * L )
{
    int cnt = lua_gettop( L );
    JoyCtrlTop * io = new JoyCtrlTop();
    JoyCtrlTop * * p = reinterpret_cast< JoyCtrlTop * * >( lua_newuserdata( L, sizeof( JoyCtrlTop * ) ) );
    *p = dynamic_cast<JoyCtrlTop *>( io );
    luaL_getmetatable( L, META );
    lua_setmetatable( L, -2 );
    return 1;
}

static int gc( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    if ( io )
        delete io;
    return 0;
}

static int self( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    lua_pushlightuserdata( L, reinterpret_cast< void * >(io) );
    return 1;
}

static int open( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    bool res = io->open();
    lua_pushboolean( L, ( res ) ? 1 : 0 );
    return 1;
}

static int close( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    io->close();
    return 0;
}

static int isOpen( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    bool res = io->isOpen();
    lua_pushboolean( L, ( res ) ? 1 : 0 );
    return 1;
}

static int queryState( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    bool res = io->queryState();
    lua_pushboolean( L, res ? 1 : 0 );
    return 1;
}

static int adcX( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    int index = static_cast<int>( lua_tonumber( L, 2 ) );
    int res   = io->adcX( index );
    lua_pushnumber( L, static_cast<lua_Number>( res ) );
    return 1;
}

static int adcY( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    int index = static_cast<int>( lua_tonumber( L, 2 ) );
    int res   = io->adcY( index );
    lua_pushnumber( L, static_cast<lua_Number>( res ) );
    return 1;
}

static int nullX( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    int index = static_cast<int>( lua_tonumber( L, 2 ) );
    bool res   = io->nullX( index );
    lua_pushboolean( L, res ? 1 : 0 );
    return 1;
}

static int nullY( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    int index = static_cast<int>( lua_tonumber( L, 2 ) );
    bool res   = io->nullY( index );
    lua_pushboolean( L, res ? 1 : 0 );
    return 1;
}

static int stopBtn( lua_State * L )
{
    JoyCtrlTop * io = *reinterpret_cast<JoyCtrlTop * *>( lua_touserdata( L, 1 ) );
    bool res   = io->stopBtn();
    lua_pushboolean( L, res ? 1 : 0 );
    return 1;
}




static const struct luaL_reg META_FUNCTIONS[] = {
    { "__gc",          gc },
    { "pointer",       self },
    // Open/close routines
    { "open",          open },
    { "close",         close },
    { "isOpen",        isOpen },
    
    { "queryState",    queryState },
    { "adcX",          adcX },
    { "adcY",          adcY },
    { "nullX",         nullX },
    { "nullY",         nullY },
    { "stopBtn",       stopBtn },

    { NULL,            NULL },
};

static void createMeta( lua_State * L )
{
    int top = lua_gettop( L );
    luaL_newmetatable( L, META );  // create new metatable for file handles
    // file methods
    lua_pushliteral( L, "__index" );
    lua_pushvalue( L, -2 );  // push metatable
    lua_rawset( L, -3 );       // metatable.__index = metatable
    luaL_register( L, NULL, META_FUNCTIONS );

    lua_settop( L, top );
}

static const struct luaL_reg FUNCTIONS[] = {
    { "create",  create },
    { NULL, NULL },
};

static void registerFunctions( lua_State * L )
{
    luaL_register( L, LIB_NAME, FUNCTIONS );
}

extern "C" int DECLSPEC luaopen_luajoyctrl( lua_State * L )
{
    createMeta( L );
    registerFunctions( L );
    return 0;
}





