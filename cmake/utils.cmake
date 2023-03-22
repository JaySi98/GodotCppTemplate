# List of clang-format options:
# https://clang.llvm.org/docs/ClangFormat.html
function(add_clang_format_target)
    if(NOT CLANG_FORMAT)
        find_program(CLANG_FORMAT clang-format)
    endif()

    if(CLANG_FORMAT)
        if(BUILD_EXECUTABLE)
            add_custom_target(clang-format
                COMMAND ${CLANG_FORMAT}
                -i ${EXE_SOURCES} ${HEADERS}
                WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
            )
        elseif(BUILD_HEADERS_ONLY)
            add_custom_target(clang-format
                COMMAND ${CLANG_FORMAT}
                -i ${HEADERS}
                WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
            )
        else()
            add_custom_target(clang-format
                COMMAND ${CLANG_FORMAT}
                -i ${SOURCES} ${HEADERS}
                WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
            )
        endif()
    endif()
endfunction()

# List of clang-tidy options:
# https://clang.llvm.org/extra/clang-tidy/
if(ENABLE_CLANG_TIDY)
	find_program(CLANGTIDY clang-tidy)
		if(CLANGTIDY)
			set(CMAKE_CXX_CLANG_TIDY ${CLANGTIDY} 
				# -extra-arg=-Wno-unknown-warning-option
			)
		message("Clang-Tidy has been setup.\n")
	else()
		message(SEND_ERROR "Clang-Tidy requested but executable not found.\n")
	endif()
endif()
