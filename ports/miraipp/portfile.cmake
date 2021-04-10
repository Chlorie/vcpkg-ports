vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/miraipp
    REF 910e6a3df30e772d8d95e68208a7fb6e5ce30b4f
    SHA512 0b7ead90ed81a9663b84f1540ede7c0abb8623ea2e9313b9f4ee45f189beee76462a4cc9689b2c379aa3472014704774b8a07ee61b4ddf0bdcc319eb7997b757
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
