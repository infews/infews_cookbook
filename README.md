# Infews cookbook

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-exemplar.png?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-exemplar)

Personal recipes for sprouting up my own workstation

## Usage

### Prerequisites

- [system ruby](.ruby-version)
- [bundler](http://bundler.io/)

### Quickstart

```
bundle
bundle exec soloist
```

## Cookbook Usage

### Recipes

- `infews_cookbook::font_anonymous_pro`
- `infews_cookbook::font_inconsolata`
- `infews_cookbook::marked_bonus_pack`

#### Defaults

- `infews_cookbook::font_anonymous_pro`
- `infews_cookbook::font_inconsolata`

## Contributing

### Before committing

```
bundle
bundle exec rake
```

The default rake task includes rubocop, foodcritic, unit specs

### [Rubocop](https://github.com/bbatsov/rubocop)

```
bundle
bundle exec rake rubocop
```

### [FoodCritic](http://acrmp.github.io/foodcritic/)

```
bundle
bundle exec rake foodcritic
```

### Unit specs

Unit specs use [ServerSpec](http://serverspec.org/)

```
bundle
bundle exec rake spec:unit
```

### Integration specs

Integrations specs will run the default recipe on the host system (destructive) and make assertions on the system after
install.

*Note:* It has a precondition that exemplar is _not_ already installed on the system.

```
bundle
bundle exec rake spec:integration
```
