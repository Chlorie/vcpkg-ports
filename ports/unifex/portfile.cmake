vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/libunifex
    REF 9869196338016939265964b82c7244915de6a12f
    SHA512 361d9b397aac43d79438e3aa1ecd15e20df8c846067c60c45d0c26933b22111b435143557acd49349c96b399aeba9770618a4eb1e0a39c21a1d804ce7cc62992
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DBUILD_TESTING:BOOL=OFF
        -DBUILD_GMOCK:BOOL=OFF
        -DINSTALL_GTEST:BOOL=OFF
        -DUNIFEX_BUILD_EXAMPLES:BOOL=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/unifex)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/unifex RENAME copyright)
