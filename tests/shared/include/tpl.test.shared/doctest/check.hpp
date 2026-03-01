#pragma once

#include <doctest/doctest.h>

#include <tpl.test.shared/doctest/assert_error.hpp>

#if TPL_ASSERT_ENABLED

#define WARN_ASSERTS(expr) WARN_THROWS_AS(expr, tpl::test::assert_error)
#define CHECK_ASSERTS(expr) CHECK_THROWS_AS(expr, tpl::test::assert_error)
#define REQUIRE_ASSERTS(expr) REQUIRE_THROWS_AS(expr, tpl::test::assert_error)

#define WARN_NOASSERT(expr) WARN_NOTHROW(expr)
#define CHECK_NOASSERT(expr) CHECK_NOTHROW(expr)
#define REQUIRE_NOASSERT(expr) REQUIRE_NOTHROW(expr)

#else

#define WARN_ASSERTS(expr) (void)0
#define CHECK_ASSERTS(expr) (void)0
#define REQUIRE_ASSERTS(expr) (void)0

#define WARN_NOASSERT(expr) (void)0
#define CHECK_NOASSERT(expr) (void)0
#define REQUIRE_NOASSERT(expr) (void)0

#endif
