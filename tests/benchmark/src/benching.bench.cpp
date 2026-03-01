#include <benchmark/benchmark.h>

#include <string>

namespace tpl { namespace {

static auto bm_string_creation(benchmark::State& state) -> void
{
    for (auto _ : state)
    {
        std::string empty_string;
        benchmark::DoNotOptimize(empty_string);
    }
}

BENCHMARK(bm_string_creation);

}} // namespace tpl

BENCHMARK_MAIN();