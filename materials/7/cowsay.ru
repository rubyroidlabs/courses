require_relative 'lib/cowsay'
require_relative 'lib/looser'

use Rack::ETag
use Looser
run Cowsay.new
