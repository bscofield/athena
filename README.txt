athena
    by Ben Scofield
    http://github.com/bscofield/athena/tree/master

== DESCRIPTION:

Athena is a Ruby microframework for RESTful web applications. 

== FEATURES/PROBLEMS:

* Update to Rack 0.9
* Extract routing to modules
* Extract rendering engine to modules
* MethodNotAllowed exception should return allowed methods
* Handle redirects

== SYNOPSIS:

  # In a config.ru or rackup file:

  require 'athena'
  
  use Rack::Static, :urls => ['/images', '/stylesheets'], :root => 'public'

  Athena.load_resources
  run Athena::Application.new

== REQUIREMENTS:

* FIXME (list of requirements)

== INSTALL:

* sudo gem install athena

== LICENSE:

(The MIT License)

Copyright (c) 2009 Ben Scofield

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
