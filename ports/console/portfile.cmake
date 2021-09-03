vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/console
    REF e3eea0c71eafd07eeb4dc7c3d1a7c37090cdf355
    SHA512 022022a469d6faf7df58cc58b938242f521e45fff5da7ef391b781243f400b902736fcd7257cdab152bb5ea976548c1e7e667a29df5b3ccc326bb90cb2c09fbc
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/console)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/console RENAME copyright)
