# ruby_arena

Ruby Arena is a game for programmers and people who wants to learn how to program in Ruby.

Instead of controling your robot with keys you have to program its AI (artifical intelligence) and see if it can beat other robots!

This project has been inspired by [robocode](http://robocode.sourceforge.net/) (Java, .NET) and [rrobots](http://rrobots.rubyforge.org/) (Ruby).

## Goals of the project

- create arena from scratch
- learn
- have fun!

## How to run arena (and battles)

```
git@github.com:mrhead/ruby_arena.git
cd ruby_arena
bundle # or gem install gosu
./bin/ruby_arena.rb path_to/robot.rb path_to/another_robot.rb
```

You can see example robot here: https://gist.github.com/mrhead/7917528. Just put it to some dir in ruby_arena.

```
./bin/ruby_arena.rb test_robots/test_ai.rb test_robots/test_ai.rb # ...
```

### Example robots (AIs)

If you have your own robot (well AI), then please publish it as gist and then add it here:

* https://gist.github.com/mrhead/7917528

## Current status

Project is in very early stage with unstable API. Any contribution (your own robot, reported issue, new pull request, advice regarding code/OO design) is very much appreciated.

## How to contribute

1. Fork the repo
2. Create your own branch
3. Do your changes
4. Create pull request

### Rules for contribution

* Everything needs to be tested! Well not everything. I really do not have an idea how to test Gui. But rest of the code must be tested before merging to master. If you do not now how to test it, than open new issue and we can discuss it.
* If something is hard to implement or change, then please refactor the code first so change is easy and then implement it.
