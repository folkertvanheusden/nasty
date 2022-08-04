project(nasty)
cmake_minimum_required(VERSION 3.2)
add_definitions("-Wall")

set(NASTY_VERSION 1.0)
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DVERSION=\"\\\"${NASTY_VERSION}\\\"\"")

add_executable(
  nasty
  nasty.c
)

include(FindPkgConfig)

pkg_check_modules(GPGME REQUIRED gpgme)
target_link_libraries(nasty ${GPGME_LIBRARIES})
target_include_directories(nasty PUBLIC ${GPGME_INCLUDE_DIRS})
target_compile_options(nasty PUBLIC ${GPGME_CFLAGS_OTHER})
