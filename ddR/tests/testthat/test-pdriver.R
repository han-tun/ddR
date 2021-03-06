context("Tests specific to the parallel driver")

l <- list(1:10, letters, rnorm(5))


test_that("Parallel is indeed the default driver", {

    useBackend()
    expect_s4_class(ddR.env$driver, "parallel.ddR")

})


test_that("useBackend recovers from a bad call", {

    expect_error(useBackend(parallel.ddR, type="LASERWOLF_FAN_CLUB"))
    useBackend("parallel")

})


test_that("useBackend can switch and use PSOCK", {

    useBackend("parallel", type="PSOCK")

    dl1 <- dlist(1:4)
    dl2 <- dlist(5)

    out <- collect(dmapply(c, dl1, dl2))

    expect_equal(out, list(1:5))

    # Necessary so that remaining tests run using correct cluster type
    useBackend("parallel")

})


test_that("Can pass vector of hostnames", {

    useBackend("parallel", spec = c("localhost", "localhost"), type="PSOCK")

    dl <- dlist(1:10, letters, rnorm(10))
    l <- collect(dl)

    out <- collect(dmapply(head, dl))

    expect_equal(out, lapply(l, head))

    # Necessary so that remaining tests run using correct cluster type
    useBackend("parallel")

})


test_that("mapply with different parallel backends", {
# Windows can't FORK
if(.Platform$OS.type != "windows"){

    useBackend("parallel", 2, type = "FORK")
    dl2 <- do.call(dlist, l)

    # This sets up a different local cluster
    useBackend("parallel", type = "PSOCK", executors = 3)
    dl3 <- do.call(dlist, l)

    expect_error({out <- collect(dmapply(c, dl2, dl3))}, "[Bb]ackend")

    # Necessary so that remaining tests run using correct cluster type
    useBackend("parallel")

}})
