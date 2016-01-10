# Marked

[![Build Status](https://semaphoreci.com/api/v1/projects/23666953-4757-4fcc-9188-2812cc8a5d8a/655721/badge.svg)](https://semaphoreci.com/shiroyasha/marked)

CommonMark compatible Markdown parser

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add marked to your list of dependencies in `mix.exs`:

        def deps do
          [{:marked, "~> 0.0.1"}]
        end

  2. Ensure marked is started before your application:

        def application do
          [applications: [:marked]]
        end

## Licence

The MIT License (MIT)

Copyright (c) 2016 Igor Šarčević

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
