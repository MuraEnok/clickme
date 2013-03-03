library(yaml)

context("opts")

test_that("initialize options", {
    set_root_path(system.file("examples", package="clickme"))
    opts <- initialize_opts()
    expect_equal(opts$path$ractives, file.path(get_root_path(), opts$name$ractives))
})

test_that("add ractive options", {
    set_root_path(system.file("examples", package="clickme"))
    opts <- add_ractive_opts("force_directed")
    expect_equal(opts$path$ractive, file.path(opts$path$ractives, opts$name$ractive))
    expect_equal(opts$path$data, file.path(opts$path$ractive, opts$name$data))
    expect_equal(opts$path$external, file.path(opts$path$ractive, opts$name$external))
    expect_equal(opts$path$template, file.path(opts$path$ractive, opts$name$template))

    expect_equal(opts$path$config_file, file.path(opts$path$template, opts$name$config_file))
    expect_equal(opts$path$template_file, file.path(opts$path$template, opts$name$template_file))
    expect_equal(opts$path$translator_file, file.path(opts$path$template, opts$name$translator_file))

    expect_equal(opts$relative_path$ractive, file.path(opts$name$ractives, opts$name$ractive))
    expect_equal(opts$relative_path$data, file.path(opts$relative_path$ractive, opts$name$data))
    expect_equal(opts$relative_path$external, file.path(opts$relative_path$ractive, opts$name$external))
})

test_that("add visualization options", {
    set_root_path(system.file("examples", package="clickme"))
    opts <- get_opts("force_directed")

    expect_equal(opts$path$data_file, file.path(opts$path$data, paste0(opts$name$data_file, ".json")))
    expect_equal(opts$name$viz_file, paste0(opts$name$data_file, "-", opts$name$ractive, ".html"))
    expect_equal(opts$path$viz_file, file.path(get_root_path(), opts$name$viz_file))
})


test_that("get ractive configuration", {
        set_root_path(system.file("examples", package="clickme"))
        opts <- get_opts("force_directed")

        expect_true(is.numeric(opts$template_config$width))
        expect_true(is.numeric(opts$template_config$height))
        expect_true(is.character(opts$template_config$scripts))
        expect_true(is.character(opts$template_config$styles))
})