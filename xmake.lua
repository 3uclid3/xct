set_project("tpl")
set_version("v0.1.0")
set_license("GPL-3.0-or-later")

set_languages("cxx23")
set_exceptions("no-cxx")
set_warnings("allextra", "error")

add_rules("mode.debug", "mode.release", "mode.coverage")
add_rules("plugin.compile_commands.autoupdate", { outputdir = "$(builddir)" })

option("junit_report")
    set_default(false)
    set_showmenu(true)
    set_description("Enable JUnit XML report generation for tests")

option("benchmarks")
    set_default(false)
    set_showmenu(true)
    set_description("Enable Benchmark test targets")

includes(
    "app",
    "core",
    "tests"
)
