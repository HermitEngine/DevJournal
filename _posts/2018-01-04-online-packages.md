---
layout: post
title: Online Packages
date: 2018-01-04
categories: devblog
---

With the Vulkan work in an early but stable juncture, it's now time to look at serialization because everything runs off data and all architecture grows from it. There are going to be two main concepts:

### ObjectId

Ids are used to uniquely identify each asset. It is a 64-bit integer consisting of:
* running sequence number
* asset type
* package index

### Mod Packs

Packs contain any number of different assets. It also contains dependency information on other Packs by mapping their Pack Ids to a running index number (which also serves to track precedence). Once a third-party pack is mapped, assets can now reference objects from within said pack.

### Editor Stuff

Not included in the distributable are mappings of string to ids. This will allow an editor to reference assets with human-friendly names instead of flat ids. I can currently see no overriding need to bloat the final pack with these strings as users will never see them. Also, I want to not have any silly string comparisons in the engine when I don't have to.

The vision is to have the game able to parse and display markdown. End-users will have a screen where they can browse an online list of mod packs, comment on them, and use them without having to worry about dependency information. The most straightforward way of doing this is to set up a standard forum software, and access it using some sort of REST api. This way, it can be viewed both on the web as well as through the game interface. I would also like to be able to render all discussions in the game interface as well. A user will never have to interact with the website, accept for the signup process when they want to get involved with the hypothetical community.

As far as the game in concerned, the user will be able to create and progress worlds which gets stored into packs which can be uploaded. Other users can then download these worlds and play them to another progress state. In this sense, worlds are single-dependency mod packs. Unsure on whether and how to expose multiple dependencies or to have that purely be an editor option.

#### Note to self:

* Upgrade website to https using Let's Encrypt

* Install [Vanilla Forums](https://vanillaforums.com)

* Install [REST api for Vanilla](https://github.com/kasperisager/vanilla-api)

* Write php script to support mod upload that autocreates a discussion with data like
	* Mod Author
	* Version info and ancestry
	* Dependencies
	* Thumbnail
	* Description
	* Screenshots


* Public-key encryption to validate the "one true line" ancestry. Also to validate that content comes from us. Use cryptlib unless curl can support this intrinsically. It is okay if the user loses the key due to an uninstall. The "one true line" will simply end but he will still be able to branch as normal with a new private key.

