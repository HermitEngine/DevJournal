---
layout: post
title:  "Hiding Behind Jekyll"
date:   2017-07-25 14:58:17 +0800
categories: devblog
author: "Hermit"
---
So the last site crashed and died amidst a mess of Wordpress plugins and auto-updates. (I admit I got a bit click happy
with the "Install Plugin" button) Here's a clean slate with a static site generator called Jekyll. This pretty much
makes it impossible for the site to go down and it will be ever so snappy in the event I get millions of adoring clicks.
Also, it means that I get to do web updates using markdown in my beloved Vim instead of mucking about with a web
interface.

Here's the update since the last time this site was functional. I did a heck of a lot of experimentation with Vulkan. Initially,
I was following the [Vulkan Tutorial](https://vulkan-tutorial.com) which is all well and good as far as tutorials go but
obviously not a proper way to architect an engine. I had a number of starts and restarts experimenting with different
architectures when I came to the epiphany that a great deal of Vulkan setup boils down to populating structs.
Of course, it makes no sense to write tons of code just to do this when you can simply data drive it and make it more
configurable. So I set out to find a way to do that...

I tried all the usual suspects starting with [Google's Protocol
Buffers](https://developers.google.com/protocol-buffers), [Capn Proto](https://capnproto.org),
[Flatbuffers](https://google.github.io/flatbuffers/), various JSON parsers,
[SQLite](https://www.sqlite.org). Nothing scratched the itch because while they all did the serialization nice and
dandy, I still needed to write code for each struct to map this data to that. And so I rolled my own.

Say hello to [egspload](https://github.com/HermitEngine/egspload)! (Eugene Goh's Struct Parser-Loader... the depths we go
to for the puns) This marks my first foray into the world of opensource. Prior to this, nothing seemed to justify
putting out there, but this seems useful enough that other people may actually want to use and enhance it. It'll be an
interesting experiment if nothing else. I actually borrow a page from protocol buffers and the other guys by creating a
specification file which I parse to generate code. This generated code then does the heavy lifting of the actual
serialization work. So far, I've managed to accomdate both inlined and pointered struct members, C strings and am
confident of doing arrays. Everything is written in good old plain C which is surprisingly refreshing to work in.

As far as build systems go, I've gone ahead and re-adopted [CMake](https://cmake.org). Yep, the same CMake that we turned our collective
noses up at in Gameloft in favour of [Premake](https://github.com/premake/premake-4.x). The main rationale is that everybody is using it, including almost all the
libraries I want to adopt. [GLM](http://glm.g-truc.net), [Freetype](https://www.freetype.org),
[GLFW](http://www.glfw.org)... all CMake. This makes incorporating these libraries super easy. Even the aforementioned
serialization libraries I tested run with it, so switching them in and out was quite convenient.

In other news, I'm out of New Zealand and back to Singapore for the next few months. This has got nothing to do with
code being naturally better the closer you get to the equator but more for personal family reasons. The benefit is that
there's no better way to save money as a poor indie dev than moving back in with your parents!
