add_executable(dummy dummy.cpp)
target_include_directories(dummy PUBLIC ${MONGOCXX_INCLUDE_DIRS} ${BSONCXX_INCLUDE_DIRS})
target_link_libraries(dummy ${MONGOCXX_LIBS} ${BSONCXX_LIBS})