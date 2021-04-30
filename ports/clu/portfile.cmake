vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/clu
    REF ae183c8c1e873df35d4eda6df3ebba7cb6253273
    SHA512 3f1bd9176c4df954fe3b28857d09d12de2e451088625405579caa2fb6307b14b3506c45a3f8c6eef54a4326b9e050f2b6fd473a71f3dfa7ee6a7df37efbf7964
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
