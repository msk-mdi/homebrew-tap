# msk-mdi/tap

Homebrew formulae for [MdEdit](https://github.com/msk-mdi/MDedit), a native
in-place WYSIWYG markdown editor for macOS 26.

```sh
brew install msk-mdi/tap/mdedit
ln -sf "$(brew --prefix mdedit)/MdEdit.app" /Applications/MdEdit.app
```

The formula builds MdEdit on your Mac (it needs Xcode 26 or its Command Line
Tools), so the app opens without Gatekeeper's warning. `brew upgrade mdedit`
updates it; `brew install --HEAD msk-mdi/tap/mdedit` builds the latest `main`.
