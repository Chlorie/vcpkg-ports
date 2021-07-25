vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/libunifex
    REF e3ad3ac5928a9c520699cd8d27c0bd58f224473f
    SHA512 daf11bafd29470f1d646156f320b638b32798d941506b63c9d89345863fccd56f5ee6c410f0c510831a6305396c223e1dd3847298d25df4a8d5b2db9b4051e53
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
