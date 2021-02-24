vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/miraipp
    REF 7fafdc6834e3062f182512879f1b45f46f417026
    SHA512 f0ce88b0749220e9e58a6caa17a1fa7194c99788f08ad6c73481880c0aa87ff5c728fa27e1037506b534c3c8142050edb473801d06fc45338bb4848332735c37
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS -DMIRAI_INSTALL:BOOL=ON
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/miraipp)
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/miraipp RENAME copyright)
