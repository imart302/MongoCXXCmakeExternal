include(ExternalProject)

set(MONGOCXX_PREFIX mongocxx)

ExternalProject_Add(mongocxx_project 
    PREFIX ${MONGOCXX_PREFIX}
    SOURCE_DIR ${CMAKE_SOURCE_DIR}/3rdparty/mongo-cxx-driver-r3.6.5
    BINARY_DIR ${CMAKE_SOURCE_DIR}/build/3rdparty/${MONGOCXX_PREFIX}/build
    CMAKE_ARGS -DBUILD_SHARED_AND_STATIC_LIBS=ON
    INSTALL_COMMAND ""
)

add_library(mongocxx SHARED IMPORTED)
set_target_properties(mongocxx PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/build/3rdparty/${MONGOCXX_PREFIX}/build/src/mongocxx/libmongocxx.so)

add_library(bsoncxx SHARED IMPORTED)
set_target_properties(bsoncxx PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/build/3rdparty/${MONGOCXX_PREFIX}/build/src/bsoncxx/libbsoncxx.so)

set(MONGOCXX_LIBS mongocxx PARENT_SCOPE)
set(BSONCXX_LIBS bsoncxx PARENT_SCOPE)

set(MONGOCXX_INCLUDE_DIRS ${CMAKE_SOURCE_DIR}/3rdparty/mongo-cxx-driver-r3.6.5/src PARENT_SCOPE)
set(BSONCXX_INCLUDE_DIRS ${CMAKE_SOURCE_DIR}/3rdparty/mongo-cxx-driver-r3.6.5/src 
                         ${CMAKE_BINARY_DIR}/3rdparty/mongocxx/build/src
                         ${CMAKE_BINARY_DIR}/3rdparty/mongocxx/build/install/include/bsoncxx/v_noabi 
                         PARENT_SCOPE)