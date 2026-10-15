# msk-mdi/tap

Homebrew casks and formulae for my macOS apps and tools.

## MdEdit

[MdEdit](https://github.com/msk-mdi/MDedit) is a native in-place WYSIWYG
markdown editor for macOS 26.

```sh
brew install msk-mdi/tap/mdedit
```

MdEdit lands in /Applications, ready to open, and the `mdedit` command
(`mdedit --render notes.md`) on your path. `brew upgrade` updates it, and
`brew uninstall --zap mdedit` removes it with its settings.

## ToWatchDB

[ToWatchDB](https://github.com/msk-mdi/ToWatchDB) tracks the movies and shows
you watch, for macOS 15 or later.

```sh
brew install msk-mdi/tap/towatchdb
```

ToWatchDB lands in /Applications, ready to open. `brew upgrade` updates it,
and `brew uninstall --zap towatchdb` removes it with its library.

## macpack

[macpack](https://github.com/msk-mdi/macpack) exports macOS settings to a
portable profile and applies them on another Mac, from a terminal UI.

```sh
brew install msk-mdi/tap/macpack
```

`brew upgrade` updates it.

## Gatekeeper

These apps are not notarized by Apple (that takes a paid developer account),
so the casks clear the quarantine flag on the downloaded app; macOS opens it
without the "could not verify" prompt.
