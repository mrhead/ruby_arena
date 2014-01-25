# ruby_arena
[![Code
Climate](https://codeclimate.com/github/mrhead/ruby_arena.png)](https://codeclimate.com/github/mrhead/ruby_arena)
[![Build Status](https://travis-ci.org/mrhead/ruby_arena.png)](https://travis-ci.org/mrhead/ruby_arena)

![Screenshot from the game](https://github.com/mrhead/ruby_arena/blob/master/screenshot.png?raw=true)

Ruby Arena is a game for programmers and people who wants to learn how to program in Ruby.

Instead of controling your robot with keys you have to program its AI (artifical intelligence) and see if it can beat other robots!

This project has been inspired by [robocode][robocode] (Java, .NET) and [rrobots][rrobots] (Ruby).

## Goals of the project

- create arena from scratch
- learn
- have fun!

## How to run arena (and battles)

```
gem install ruby_arena
ruby_arena path_to/robot.rb path_to/another_robot.rb
```

You can run game with some predefined robots (levels).

```
ruby_arena -l 0 path_to/your_ai.rb
```

You can see example robot here: https://gist.github.com/mrhead/7917528. Just put it to some dir in ruby_arena.

```
ruby_arena test_robots/test_ai.rb test_robots/test_ai.rb # ...
```

### Example robots (AIs)

If you have your own robot (well AI), then please publish it as gist and then add it here:

* https://gist.github.com/mrhead/7917528
* https://gist.github.com/mrhead/8086991
* https://gist.github.com/mrhead/8087011

Please note that mentioned Ais are not were nice (code) and pretty stupid right now, but at least you can try to run them.

### How to create your own robot (AI)

Just extend `RubyArena::Ai` class and implement your own `#tick` method.

```
class TestAi < RubyArena::Ai
  def tick(events)
    fire # do nothing but fire when possible
  end
end
```

### API for AI

AI api is very similar to robot api from [rrobots][rrobots].

```
# change speed by 1, max to 8
accelerate 

# change speed by -1, min to -8
decelerate

# turn robot, gun and radar
turn(angle)

# turn gun and radar
turn_gun(angle)

# turn radar
turn_radar(angle)

# fire a bullet
fire

# change radar view angle
set_radar_view_angle(angle)
```

You can do each action just once in each tick, so:

```
turn(2)
turn(2)
```

Will do just turn by 2 degrees. In is the same for other actions.

## Current status

Project is in very early stage with unstable API. Any contribution (your own robot, reported issue, new pull request, advice regarding code/OO design) is very much appreciated.

However you can already start the game and the battle between robots! Detais were mentioned above.

## How to contribute

1. Fork the repo
2. Create your own branch
3. Do your changes
4. Create pull request

### Rules for contribution

* Everything needs to be tested! Well not everything. I really do not have an idea how to test Gui. But rest of the code must be tested before merging to master. If you do not now how to test it, than open new issue and we can discuss it.
* If something is hard to implement or change, then please refactor the code first so change is easy and then implement it.

## License

ruby_arena is Copyright © 2013-2014 Patrik Bóna. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/mrhead/ruby_arena/blob/master/LICENSE.md) file.

[robocode]: http://robocode.sourceforge.net/
[rrobots]: http://rrobots.rubyforge.org/
