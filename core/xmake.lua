target("tpl.core")
    set_kind("static")
    set_group("lib")

    add_includedirs("include", { public = true })

    add_headerfiles("include/**.hpp")
    add_files("src/**.cpp")
    