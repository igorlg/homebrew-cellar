# Igor's Homebrew repo

This repository contains formulas and Casks for Homebrew, for things that haven't gone upstream yet, or I just wanted to fork.

Contributions are welcome!

# Installation

```
$ brew install igorlg/cellar/<formula>
```

See __Contents__ below for available formulas

# Contents

## Capstan

Formula: [capstan.rb](https://github.com/igorlg/homebrew-cellar/blob/bottles/Formula/capstan.rb)

Install OSv's image manager [Capstan](https://github.com/cloudius-systems/capstan/blob/master/README.md). Capstan is written in Go, so the formula depends on the Go compiler and downloads all dependencies usign `go get -d`.
Binary bottle is available [here](https://github.com/igorlg/homebrew-cellar/releases/tag/v0.0.2).

## AWS SessionManager Plugin

Formula: [aws-session-manager-plugin.rb](https://github.com/igorlg/homebrew-cellar/blob/bottles/Formula/aws-session-manager-plugin.rb)

This formula was [forked](https://github.com/dkanejs/homebrew-aws-session-manager-plugin) from [David Kane](https://github.com/dkanejs)'s awesome formula. My only change was to remove the dependency to the Homebrew `awscli` formula,
so that the plugin can be installed via Homebrew, even if the [AWS CLI](https://aws.amazon.com/cli/) is managed by other tool, such as Python's `pip`.
