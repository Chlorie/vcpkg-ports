vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/clu
    REF ca05bff1120ae236f4d61c8a6728e963bd64e887
    SHA512 8477185c18ceb11d475dbde26cf3f5098c378918178f287fc5368e236f87646ac4acf09413cdb075923e41c24b40c74a26aec96ca1f451c726fddbd5d9e509f6
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
