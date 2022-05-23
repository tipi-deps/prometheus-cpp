licenses(["notice"])  # MIT license

config_setting(
    name = "osx",
    constraint_values = [
        "@bazel_tools//platforms:osx",
    ],
)

config_setting(
    name = "windows",
    constraint_values = [
        "@bazel_tools//platforms:windows",
    ],
)

cc_library(
    name = "libcivetweb",
    srcs = [
        "src/civetweb.c",
        "src/response.inl",
    ],
    hdrs = [
        "include/civetweb.h",
    ],
    copts = [
        "-DOPENSSL_API_1_1",
        "-DUSE_IPV6",
        "-DNDEBUG",
        "-DNO_CGI",
        "-DNO_CACHING",
        "-DNO_FILES",
        "-DNO_SSL_DL",
        "-UDEBUG",
    ],
    includes = [
        "include",
    ],
    linkopts = select({
        ":windows": [],
        "//conditions:default": ["-lpthread"],
    }) + select({
        ":osx": [],
        ":windows": [],
        "//conditions:default": ["-lrt"],
    }),
    deps = [
        "@boringssl//:crypto",
        "@boringssl//:ssl",
    ],
    textual_hdrs = [
        "src/md5.inl",
        "src/handle_form.inl",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "civetweb",
    srcs = [
        "src/CivetServer.cpp",
    ],
    hdrs = [
        "include/CivetServer.h",
    ],
    copts = [
        "-DOPENSSL_API_1_1",
        "-DUSE_IPV6",
        "-DNDEBUG",
        "-DNO_CGI",
        "-DNO_CACHING",
        "-DNO_SSL_DL",
        "-DNO_FILES",
    ],
    includes = [
        "include",
    ],
    linkopts = select({
        ":windows": [],
        "//conditions:default": ["-lpthread"],
    }) + select({
        ":osx": [],
        ":windows": [],
        "//conditions:default": ["-lrt"],
    }),
    visibility = ["//visibility:public"],
    deps = [
        ":libcivetweb",
    ],
)
