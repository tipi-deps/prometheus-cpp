include(GenerateExportHeader)

add_library(core export.cpp)

set_target_properties(core
  PROPERTIES
    OUTPUT_NAME ${PROJECT_NAME}-core
    DEFINE_SYMBOL PROMETHEUS_CPP_CORE_EXPORTS
)

generate_export_header(core
  BASE_NAME ${PROJECT_NAME}-core
  EXPORT_FILE_NAME include/prometheus/detail/core_export.h
)

add_library(pull export.cpp)

set_target_properties(pull
  PROPERTIES
    OUTPUT_NAME ${PROJECT_NAME}-pull
    DEFINE_SYMBOL PROMETHEUS_CPP_PULL_EXPORTS
)

generate_export_header(pull
  BASE_NAME ${PROJECT_NAME}-pull
  EXPORT_FILE_NAME include/prometheus/detail/pull_export.h
)

add_library(push export.cpp) 

set_target_properties(push
  PROPERTIES
    OUTPUT_NAME ${PROJECT_NAME}-push
    DEFINE_SYMBOL PROMETHEUS_CPP_PUSH_EXPORTS
)

generate_export_header(push
  BASE_NAME ${PROJECT_NAME}-push
  EXPORT_FILE_NAME include/prometheus/detail/push_export.h
)

install(
    TARGETS core push pull
    INCLUDES DESTINATION "include"
)

install(
    DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/include/
    DESTINATION "${include_install_dir}"
    FILES_MATCHING PATTERN "*.[ih]*"
)