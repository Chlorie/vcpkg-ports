vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/clu
    REF 86a5eae74f146eb1e9ba0e37b88b5e7b9693307f
    SHA512 a524b3e95602bc4fbb446f5b9a323dba60951c5f35a41a93167fb527caed732755944c0baaf387918bc4fa7fd22e78bb4dddc6e3e778e061f38917cce8bf50ab
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS -DBUILD_EXAMPLES:BOOL=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/clu)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/clu RENAME copyright)
