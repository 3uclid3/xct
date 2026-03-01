target("tpl")
    set_kind("binary")
    set_group("app")

    add_deps(
        "tpl.core" 
    )

    add_files("main.cpp")
