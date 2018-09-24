# sandbox-ruby-book
reference: https://ruby-book.jnito.com/

## Install

- `bundle install --path vendor/bundle`

## Execute some command

- `bundle exec SOME_COMMAND`

## Simple file watch and execute test (using node.js)

- `yarn global add chokidar-cli`
- `chokidar '**/*.rb' -c "bundle exec rspec"`
