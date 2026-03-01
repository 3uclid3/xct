#include <tpl.test.shared/doctest.hpp>

#include <tpl/core.hpp>

namespace tpl { namespace {

TEST_CASE("return_true: should return true")
{
    CHECK(return_true());
}

}} // namespace tpl
