# msk-mdi/tap

Homebrew cask for [MdEdit](https://github.com/msk-mdi/MDedit), a native
in-place WYSIWYG markdown editor for macOS 26.

```sh
brew install msk-mdi/tap/mdedit
```

MdEdit lands in /Applications, ready to open, and the `mdedit` command
(`mdedit --render notes.md`) on your path. `brew upgrade` updates it, and
`brew uninstall --zap mdedit` removes it with its settings.

MdEdit is not notarized by Apple (that takes a paid developer account), so the
cask clears the quarantine flag on the downloaded app; macOS opens it without
the "could not verify" prompt.
