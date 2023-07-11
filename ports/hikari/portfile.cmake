vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/hikari
    REF 3d865abc65eed93c138579cc163fdd08670ca994
    SHA512 fbf5cfa6f4c3dd7707dc29a022b40ce033f3a4f2aca5d5d1653dc49c03e8e946c1a65837ab8908f772c633ffce24db3c8c6d71cb45a389b66f79bb17c514976a
    HEAD_REF main
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        ${FEATURE_OPTIONS}
        -DHIKARI_BUILD_EXAMPLES:BOOL=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/hikari)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/hikari RENAME copyright)
