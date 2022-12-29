cmake_minimum_required(VERSION 3.5)

project(QT VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets)
find_package(SqliteOrm REQUIRED)

message(STATUS "Working here:" + ${CMAKE_SOURCE_DIR})

include_directories(
    ../MCIA
)

set(BACKEND_DIR "../MCIA")
set(DLL_DIR "C:/Users/mirel/Documents/GitHub/MCIA-TEaMS/MCIA/x64/Debug")

set(BACKEND_SOURCES
        ${BACKEND_DIR}/Answer.cpp
        ${BACKEND_DIR}/AuthService.cpp
        ${BACKEND_DIR}/CodedException.cpp
        ${BACKEND_DIR}/DatabaseManagement.cpp
        ${BACKEND_DIR}/DBPage.cpp
        ${BACKEND_DIR}/Genre.cpp
        ${BACKEND_DIR}/Movie.cpp
        ${BACKEND_DIR}/MovieGenre.cpp
        ${BACKEND_DIR}/MovieIntermediary.cpp
        ${BACKEND_DIR}/OperationStatus.cpp
        ${BACKEND_DIR}/Question.cpp
        ${BACKEND_DIR}/User.cpp
        ${BACKEND_DIR}/UserAnswerQuestion.cpp
        ${BACKEND_DIR}/DBValidation.cpp
        ${BACKEND_DIR}/WatchedMovie.cpp    
        ${BACKEND_DIR}/WishList.cpp
        ${BACKEND_DIR}/OperationStatusToMessage.cpp
        ../Validation/Validator.cpp
)


set(PROJECT_SOURCES
        main.cpp
        mainwindow.cpp
        # mainwindow.h
        mainwindow.ui
        homewindow.cpp
        homewindow.ui
        ${BACKEND_SOURCES}
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(QT
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )
# Define target properties for Android with Qt 6 as:
#    set_property(TARGET QT APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
#                 ${CMAKE_CURRENT_SOURCE_DIR}/android)
# For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation
else()
    if(ANDROID)
        add_library(QT SHARED
            ${PROJECT_SOURCES}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        add_executable(QT
            ${PROJECT_SOURCES}
        )
    endif()
endif()

target_link_libraries(QT 
    PRIVATE Qt${QT_VERSION_MAJOR}::Widgets
    PRIVATE sqlite_orm::sqlite_orm
)

set_target_properties(QT PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS QT
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(QT)
endif()
