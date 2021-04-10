vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/miraipp
    REF 5bdce6ffa8f6bca8f90c52e9cebb187c466b345c
    SHA512 c509215ebce904a396aa3d90aa1074107db17f1008b35c465b3929dd2e52bb20bd85e0a0235fe82ed50d84aaf116fa7bb4217cf60c7d315efbad48ea50ab4ab7
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
