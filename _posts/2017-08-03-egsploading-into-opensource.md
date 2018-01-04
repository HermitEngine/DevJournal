---
layout: post
title: Egsploading Into Opensource
date: 2017-08-03
categories: devblog
---

I never thought I would be an opensource developer. Sure, I'd use the free code but never thought I would contribute.
However, this code just screamed that it wanted to be set free, so who am I to deny it?

It all started with the hunt for a good serializer. I went through [Google's Protocol
Buffers](https://developers.google.com/protocol-buffers), [Cap'n Proto](https://capnproto.org) and
[Flatbuffers](https://google.github.io/flatbuffers/) but needed something a little less intrusive so that I could
populate Vulkan structs without writing excessive amounts of code or tearing apart the whole library. In the end, I
rolled my own.

All in all, I am pleased with the results. It is simple to use and fills a niche that was previously lacking. Also,
being able to say to the world "This is complete! Come have a look!" is immensely satisfying, even if it is only a tiny
cog in the machine. So here, have a gander!

![egspload](images/GitHub-Mark-Light-32px.png) [egspload](https://github.com/HermitEngine/egspload)

The next step will be the 4th iteration of the Vulkan renderer, this time data driven! I am moderately confident that
this will be the one that takes off, given that I now have the answer to "But where is all my data coming from?" That
question has been plaguing me the last few attempts.

The last thing of note is that after forcing myself to work in straight C for this one library, I've actually grown to
like it. I've not run into any of the conundrums I've faced with the "C with namespaces and other luxuries" approach.
There has been zero temptation to use even "acceptable STL" like vectors, and everything feels much more elegant.
Perhaps less is indeed more!
