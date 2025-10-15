target("nubwork.core.tests.unit")
    set_kind("binary")
    set_group("tests.unit")

    add_tests("junit", { runargs = {
        "--reporters=junit",
        "--out=" .. junit_out("nubwork.core.tests.unit"),
    }})

    add_deps("nubwork.doctest", "nubwork.core")
    
    add_includedirs(".")
    add_files("**.cpp")
