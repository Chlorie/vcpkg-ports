vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO maikel/libunifex
    REF 3b54b4534b6108ecf1a7b74313547d9c1f29cb4a
    SHA512 f7d710499dd8f8436ffa43bb459ce517530aea0e8356245b76da7b6a333a9890ca07773f25bf9fd0ac4c4ef765e1886ee8f5b9cc308e98cd1f30d8334c4991b2
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
