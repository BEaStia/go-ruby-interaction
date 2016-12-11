require 'ffi'
require 'benchmark'
require 'date'

module GoFuncs
  extend FFI::Library
  ffi_lib './goFuncs.so'
  attach_function :ParseShortDate, [:string], :int
end

n = 50000
str = "2013-Feb-03"
Benchmark.bm do |x|
  x.report { n.times { Date.parse(str).day } }
  x.report { n.times { GoFuncs.ParseShortDate(str) } }
end