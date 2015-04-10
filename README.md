[![Gem Version](https://badge.fury.io/rb/stringprep.png)](http://badge.fury.io/rb/stringprep)
[![Github Version](https://img.shields.io/github/release/steakknife/stringprep.svg)](https://github.com/steakknife/stringprep/release)
[![Build Status](https://travis-ci.org/steakknife/stringprep.svg?branch=master)](https://travis-ci.org/steakknife/stringprep)
[![Coverage Status](https://coveralls.io/repos/steakknife/stringprep/badge.png?branch=master)](https://coveralls.io/r/steakknife/stringprep?branch=master)
[![Dependency Status](https://gemnasium.com/steakknife/stringprep.svg)](https://gemnasium.com/steakknife/stringprep)
[![Code Climate](https://codeclimate.com/github/steakknife/stringprep.png)](https://codeclimate.com/github/steakknife/stringprep)
![License](https://img.shields.io/badge/License-MIT-blue.svg)
[![Gittip](https://img.shields.io/badge/Gittip-support_future_development-green.svg)](https://www.gittip.com/steakknife/)
![Awesome](https://img.shields.io/badge/Awesome-%F0%9F%98%8E-blue.svg)

# Stringprep

Pure Ruby implementation

## Usage

```ruby
require 'stringprep'

# code can be a 1 character string OR an Integer,
# and it will return the same type that was passed

Stringprep.in_a1 "\u1234"      # code in Table A.1 ?
# => false
# or
Stringprep.in_a1 0x1234
# => false

Stringprep.in_c11 "\u1234"     # code in Table C.1.1 ?
# => false

Stringprep.in_c21_c22 "\u1234" # code in Table C.2.1 or C.2.2 ?
# => false

Stringprep.map_b2 "\u1234"     # map Table B.2
# => "ሴ"
```

## Installation

### Signed gem

    [sudo] gem cert --add <(curl -L https://raw.githubusercontent.com/steakknife/stringprep/master/gem-public_cert.pem) # adds my cert (do once)
    [sudo] gem install stringprep -P HighSecurity

### Bundler

    gem 'stringprep'

## Contributors

! Your Name Here ! (in neon lights, top of the bill even)

## Author

Barry Allard

## License

MIT

## References

- Stringprep [rfc3454](http://tools.ietf.org/html/rfc3454)
