target("tpl.test.shared")
    set_kind("static")
    set_group("tests/shared")
    set_default(false)

    add_includedirs("include", { public = true })
    add_headerfiles("include/**.hpp")
    add_files("src/**.cpp")

