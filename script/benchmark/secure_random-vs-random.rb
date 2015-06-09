require 'benchmark/ips'

require 'securerandom'

size = 32

PRNG = Random.new

Benchmark.ips do |x|
  x.report('securerandom') do
    SecureRandom.hex((size+1)/2)[0...size]
  end
  x.report('random') do
    [PRNG.bytes(size)].pack('m')[0...size]
  end
end

__END__

ruby script/benchmark/secure_random-vs-random.rb
Calculating -------------------------------------
  securerandom    17.843k i/100ms
        random    30.491k i/100ms
-------------------------------------------------
  securerandom    265.681k (± 6.4%) i/s - 1.338M
        random    472.108k (± 9.1%) i/s - 2.348M
