vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/miraipp
    REF 5e120468e08bb434528278ee747c89d8ae1f5243
    SHA512 5f89e42780586612957ed6a72b41438be711640c8f28ddcb3f0bc570f0db1783996efd3da49f099cc5deb84a4525ad94846adc259297c3d90e17cef5d1939bd8
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
