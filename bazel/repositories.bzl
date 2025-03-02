load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def prometheus_cpp_repositories():
    maybe(
        http_archive,
        name = "civetweb",
        strip_prefix = "civetweb-1.15",
        sha256 = "90a533422944ab327a4fbb9969f0845d0dba05354f9cacce3a5005fa59f593b9",
        urls = [
            "https://github.com/civetweb/civetweb/archive/v1.15.tar.gz",
        ],
        build_file = "@com_github_jupp0r_prometheus_cpp//bazel:civetweb.BUILD",
    )

    maybe(
        http_archive,
        name = "com_google_googletest",
        sha256 = "b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5",
        strip_prefix = "googletest-release-1.11.0",
        urls = [
            "https://github.com/google/googletest/archive/release-1.11.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "com_github_curl",
        sha256 = "93fb2cd4b880656b4e8589c912a9fd092750166d555166370247f09d18f5d0c0",
        strip_prefix = "curl-7.83.1",
        urls = [
            "https://github.com/curl/curl/releases/download/curl-7_83_1/curl-7.83.1.tar.gz",
            "https://curl.haxx.se/download/curl-7.83.1.tar.gz",
        ],
        build_file = "@com_github_jupp0r_prometheus_cpp//bazel:curl.BUILD",
    )

    maybe(
        http_archive,
        name = "com_github_google_benchmark",
        sha256 = "6132883bc8c9b0df5375b16ab520fac1a85dc9e4cf5be59480448ece74b278d4",
        strip_prefix = "benchmark-1.6.1",
        urls = [
            "https://github.com/google/benchmark/archive/v1.6.1.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "net_zlib_zlib",
        sha256 = "91844808532e5ce316b3c010929493c0244f3d37593afd6de04f71821d5136d9",
        strip_prefix = "zlib-1.2.12",
        urls = [
            "https://mirror.bazel.build/zlib.net/zlib-1.2.12.tar.gz",
            "https://zlib.net/zlib-1.2.12.tar.gz",
            "https://storage.googleapis.com/bazel-mirror/zlib.net/zlib-1.2.12.tar.gz",
        ],
        build_file = "@com_github_jupp0r_prometheus_cpp//bazel:zlib.BUILD",
    )
