vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/miraipp
    REF d7eb85919c8ccc76a3e7bbbc96e8a19d192450e2
    SHA512 916609b3084456f9a8622f48c8bd9bd5b93d330ba0650840d8fb80000570f6eb6a0ed7dd80cd689081934fd991fc8c9df79df42eec0a6c68721b3af8a6187fdd
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS -DMIRAI_BUILD_EXAMPLES:BOOL=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/miraipp)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/miraipp RENAME copyright)
