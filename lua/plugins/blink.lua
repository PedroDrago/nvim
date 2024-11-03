return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  -- dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = {
      -- preset = 'default',
      ['<C-j>'] = { 'select_next' },
      ['<C-k>'] = { 'select_prev' },
      ['<C-CR>'] = { 'select_and_accept' },
      ['<C-Enter>'] = { 'select_and_accept' },
      ['<C-Return>'] = { 'select_and_accept' },
      ['<C-i>'] = { 'select_and_accept' },
      ['<C-y>'] = { 'select_and_accept' },
    },

    highlight = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },
    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',

    -- experimental auto-brackets support
    -- accept = { auto_brackets = { enabled = true } }

    -- experimental signature help support
    -- trigger = { signature_help = { enabled = true } }
  },
  fuzzy = {
    -- frencency tracks the most recently/frequently used items and boosts the score of the item
    use_frecency = true,
    -- proximity bonus boosts the score of items matching nearby words
    use_proximity = true,
    max_items = 200,
    -- controls which sorts to use and in which order, these three are currently the only allowed options
    sorts = { 'label', 'kind', 'score' },

    prebuilt_binaries = {
      -- Whether or not to automatically download a prebuilt binary from github. If this is set to `false`
      -- you will need to manually build the fuzzy binary dependencies by running `cargo build --release`
      download = true,
      -- When downloading a prebuilt binary, force the downloader to resolve this version. If this is unset
      -- then the downloader will attempt to infer the version from the checked out git tag (if any).
      --
      -- Beware that if the FFI ABI changes while tracking main then this may result in blink breaking.
      force_version = false,
      -- When downloading a prebuilt binary, force the downloader to use this system triple. If this is unset
      -- then the downloader will attempt to infer the system triple from `jit.os` and `jit.arch`.
      -- Check the latest release for all available system triples
      --
      -- Beware that if the FFI ABI changes while tracking main then this may result in blink breaking.
      force_system_triple = nil,
    },
  },
}
