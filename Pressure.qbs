import qbs

Project {
    Application {
        name: "Pressure"

        qbsSearchPaths: "qbsmodules"

        Depends { name: "Qt"; submodules: ["quick", "network", "websockets"] }
        Depends { name: "cpp" }
        Depends { name: "steem" }
        Depends { name: "libqtqmltricks-qtqmlmodels" }

        cpp.cxxLanguageVersion: "c++14"
        cpp.includePaths: "vendor/QuickPromise"
        cpp.rpaths: qbs.hostOS.contains("osx")? ["@executable_path/../Frameworks"] : []

        files: [
            "AccountKeys.cpp",
            "AccountKeys.hpp",
            "KeyPair.cpp",
            "KeyPair.hpp",
            "KeyStore.cpp",
            "KeyStore.hpp",
            "Promise.cpp",
            "Promise.hpp",
            "QmlJsonRpcProvider.cpp",
            "QmlJsonRpcProvider.hpp",
            "TransactionFoundry.cpp",
            "TransactionFoundry.hpp",
            "main.cpp",
            "qml.qrc",
            "vendor/QuickPromise/qptimer.h",
            "vendor/QuickPromise/qptimer.cpp",
            "vendor/QuickPromise/quickpromise.qrc",
        ]
    }

    SubProject {
        filePath: "vendor/QtQmlModels/QtQmlModels.qbs"
        Properties {
            name: "QtQmlModels"
        }
    }
}
