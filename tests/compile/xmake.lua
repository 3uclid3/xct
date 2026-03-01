for _, testfile in ipairs(os.files("src/**.compile.pass.cpp")) do
    local name = path.basename(testfile):gsub("%.compile.pass$", "")
    target("tpl." .. name .. ".test.compile.pass")
        set_kind("object")
        set_default(false)
        set_group("tests/compile")
        add_tests("compile", {build_should_pass = true})

        add_deps("tpl.core", "tpl.test.shared")

        add_files(testfile)
end

for _, testfile in ipairs(os.files("src/**.compile.fail.cpp")) do
    local name = path.basename(testfile):gsub("%.compile.fail$", "")
    target("tpl." .. name .. ".test.compile.fail")
        set_kind("object")
        set_default(false)
        set_group("tests/compile")
        add_tests("compile", {build_should_fail = true})

        set_warnings("none")

        add_deps("tpl.core", "tpl.test.shared")

        add_files(testfile)
end
