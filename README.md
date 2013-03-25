# PICO

A light Web Service client framework targeting iOS platform.


## Feature Highlight
1. Support WSDL driven development, [code generator](https://github.com/bulldog2011/mwsc) tool is provided to auto-genearte proxy from WSDL. 
2. Support SOAP 1.1/1.2 and XML based web service. 
3. Support automatic SOAP/XML to Objective-C object binding, performance comparable to iOS native XML parser.
4. Built on popular and mature [AFNetworking](https://github.com/AFNetworking/AFNetworking) library for iOS.
5. Has been verified with industrial level Web Service like Amazon ECommerce Web Serivce and eBay Finding/Shopping/Trading Web Service. 
6. Support asychronous service invocation, flexible HTTP/SOAP header setting, timeout setting, encoding setting, logging, etc.

## The Big Picture
![The Big Picture](http://bulldog2011.github.com/images/pico/big_picture.png)


## Adding Pico to Your Project

#### Source Files
// TODO

#### Static library
// TODO

##WSDL Driven Development Flow
1. Genearte Objective-C proxy from WSDL
2. Create new iOS project, add Pico runtime and generated proxy into your project
4. Implement appliction logic and UI, call proxy to invoke web service as needed.


## Version History


#### 0.5.0 — *March 25, 2013*

  * Initial version:)
  

##Docs
1. [Wsdl Driven Development on iOS - the Big Picture](http://bulldog2011.github.com/blog/2013/03/25/wsdl-driven-development-on-ios-the-big-picture/)


##Current Limitation
1. ARC([Automatic Reference Counting](http://en.wikipedia.org/wiki/Automatic_Reference_Counting)) is not supported yet.
2. Only Document/Literal style Web Service is support, RPC style Web Serivice is not supported



##Copyright and License
(The MIT License)

Copyright (c) 2013 Leansoft Technology <51startup@sina.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 