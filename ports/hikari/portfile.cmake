vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlorie/hikari
    REF e0e7a671d9d9417bacfa925356e01927c9514c5e
    SHA512 7f5c1e2c01ae44bf5eb2512c830ecfbc4f9fe4720d63f80aa711b4107ec082a19b94b48b50b3741dbeb4b6654a0e58fc7ca6fe7993e6202882c696b757dfefae
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
