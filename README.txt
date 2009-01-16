classy-inheritance
    by Andrew Stone
    http://stonean.com

== DESCRIPTION:

Classy Inheritance adds a depends_on class method to your ActiveRecord model so that you can define requisite objects.

This functionality is provided using the existing ActiveRecord methods without monkey patching any core code. Essentially, it provides an easy interface to generate code that anyone could add to their model to receive the same result. Depending on the parameters to your depends_on call, it may add some of the following methods: validates_presence_of, validates_associated, has_one or belongs_to.

== SYNOPSIS:

class User < ActiveRecord::Base
  depends_on :profile, :attrs => [:first_name, :last_name, :email]
end

# Pass-through methods to profile attributes.  Now you don't have to manage
# two different objects.
@user.first_name = 'Andrew'
@user.last_name = 'Stone'
@user.email = 'andy@stonean.com'

# Manages profile relationship for you
@user.save

== INSTALL:

sudo gem install classy-inheritance

== LICENSE:

(The MIT License)

Copyright (c) 2009 Andrew Stone

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
