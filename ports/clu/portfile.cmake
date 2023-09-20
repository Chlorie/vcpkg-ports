vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/clu
    REF c6d922acdcdbed6c833e897a4b43a84899e9f12b
    SHA512 7a323ee0d659d743a2e0617a2e735786fde621a969f07f17dac007c492b2bb1e6b69ea1a2ae7115accce5d1ec0719341ac311d621fbd6eabd03145d91e647afb
    HEAD_REF main
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES 
    testing CLU_BUILD_TESTS
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        ${FEATURE_OPTIONS}
        -DCLU_BUILD_EXAMPLES:BOOL=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/clu)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/clu RENAME copyright)
