# Vyolet

Zola theme for [ystorian.com](https://ystorian.com).

## Usage

Add the **Vyolet** theme as a submodule to an existing git repository:

```shell
git subtree add https://github.com/ystorian/vyolet.git themes/vyolet
```

## Dependencies

The following repositories were forked to be used as git submodules in this
theme. They are locked to specific branches named
`vyolet-<repository>-<version>` (e.g. `vyolet-bulma-0.9.5`) to allow for easier
checkout based on tags.

### Bulma

Add the Bulma repository in `vendor/bulma`, and keep only the `sass` subdirectory.

```shell
git submodule add git@github.com:ystorian/bulma.git vendor/bulma
cd vendor/bulma
git sparse-checkout init --cone
git sparse-checkout set sass
git checkout vyolet-bulma-0.9.5
```

### Lucide

Add the Lucide repository in `vendor/lucide`, and keep only the `icons` subdirectory.

```shell
git submodule add git@github.com:ystorian/lucide.git vendor/lucide
cd vendor/lucide
git sparse-checkout init --cone
git sparse-checkout set icons
git checkout vyolet-lucide-0.274.0
```

## Theming

Colors are defined in:

- `assets/sass/_variables.scss`
- `static/appicon/icon.svg`
- `static/appicon/manifest.json`

When `icon.svg` is modified, icons must be regenerated with `./update-appicon.sh`.

## Front matter

These front matter variables are available for all markdown pages:

```toml
[extra.translation]

# Set to false to hide the "This page has been automatically translated" message.
# The message is only displayed if the page is translated.
# See languages.en.translations.notice in config.toml.
# Default value: true
notice = false
```

## Building

### Versioning

The version of Zola, and short git commit of your site repository, are shown in the
metadata of the generated pages:

```html
<meta name="generator" content="zola 17.2.1" />
<meta name="theme" content="vyolet" />
<meta name="commit_id" content="1a2b3c" />
```

To use this feature, set the `zola_version` and `commit_id` environment
variables.

For example add this to your build script:

```shell
export zola_version=$(zola --version)
export commit_id=$(git rev-parse --short HEAD)
```

> Note:
>
> - The environment variables above are used in `templates/macro/head.html`.
> - The `commit_id` is only shown if the site is built from a git repository.
> It is not the commit of the theme repository, but of the site repository.

## License

- **[vyolet](https://github.com/ystorian/vyolet): MIT**
- [bulma](https://github.com/jgthms/bulma): MIT
- [zola](https://github.com/getzola/zola): MIT
- [bulma-pricingtable](https://github.com/Wikiki/bulma-pricingtable): MIT
