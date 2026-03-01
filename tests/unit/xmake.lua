function get_tests_runargs(name)
    if has_config("junit_report") then
        return {
            "--reporters=junit",
            "--out=" .. path.join(os.projectdir(), "build", string.format("%s.junit.xml", name))
        }
    else 
        return {}
    end
end

target("tpl.test.unit")
    set_kind("binary")
    set_default(false)
    set_group("tests/unit")

    add_tests("unit", {runargs = get_tests_runargs("tpl.test.unit") })

    add_deps("tpl.core", "tpl.test.shared")
    add_packages("doctest")
    
    add_defines("DOCTEST_CONFIG_USE_STD_HEADERS")

    add_files("src/**.cpp")