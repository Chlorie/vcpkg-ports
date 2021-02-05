vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/clu
    REF a30fd21ef97a0d5e24028be91a7adb0caba02367
    SHA512 f235442120cd882e5a4061c223331df980176a612bb20dbaf3f7bd596703fcb01d3fcc802209f80e8659f843076c22d8e63525509172832bf7861ece8782e95e
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS -DCLU_INSTALL:BOOL=ON
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/clu)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/clu RENAME copyright)
