<h1 align="center">⚡ Neovim Programming Setup</h1>

<p align="center">
  <b>Minimal. Fast. Brutal efficiency.</b><br/>
  Built for serious C++ developers & competitive programmers.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.9+-green?style=for-the-badge&logo=neovim">
  <img src="https://img.shields.io/badge/Language-C++-blue?style=for-the-badge&logo=c%2B%2B">
  <img src="https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-orange?style=for-the-badge">
</p>

---

## 🚀 Why This Setup?

Most Neovim configs are bloated.

This one is:
- ⚡ **Fast as hell**
- 🧠 **Optimized for CP**
- 🧰 **Only essential plugins**
- 🔥 **Zero distraction workflow**

---

## 📦 Features

### ✨ Core Highlights

- 🌙 **Gruvbox Theme** – clean, eye-friendly
- 🌳 **Treesitter** – modern syntax highlighting
- 🔍 **Telescope** – instant fuzzy search
- 🌲 **Nvim Tree** – file explorer
- ⚡ **clangd LSP** – real-time intelligence
- 🤖 **Autocomplete (nvim-cmp)**
- 🧠 **LeetCode Integration**
- 🖥️ **Floating Terminal**
- 🔥 **One-key compile & run**

---

## ⚡ Installation

### 1. Install Dependencies

#### 🐧 Linux (Ubuntu)
```bash
sudo apt update
sudo apt install neovim clangd g++ git
```

#### 🍎 macOS
```bash
brew install neovim llvm
```

---

### 2. Backup Existing Config

```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

---

### 3. Clone

```bash
git clone https://github.com/<your-username>/<repo-name> ~/.config/nvim
```

---

### 4. Launch

```bash
nvim
```

👉 Plugins auto-install via `lazy.nvim`

---

## 🧠 Workflow

### 🔥 Write → Run → Debug in seconds

- Open file
- Press `<leader>r`
- Done.

No IDE. No distractions.

---

## ⌨️ Keybindings (Important)

### 🔍 Navigation

| Key | Action |
|-----|------|
| `<leader>f` | Find files |
| `<leader>g` | Search text |
| `<leader>e` | Toggle explorer |
| `<leader>t` | Open terminal |

---

### 🧠 LSP

| Key | Action |
|-----|------|
| `gd` | Go to definition |
| `gr` | References |
| `K` | Docs |
| `<leader>rn` | Rename |

---

### ⚡ Power Moves

| Key | Action |
|-----|------|
| `<leader>r` | Compile & run |
| `<leader><Enter>` | Run with input/output |
| `<leader>j/k` | Move lines |
| `<leader>y` | System clipboard |

---
## 🧠 LeetCode Setup & Usage

This config comes with built-in support for **`leetcode.nvim`**, so you can solve problems directly inside Neovim.

---

### 🔐 First-Time Login

1. Open Neovim:
```bash
nvim
```

2. Run:
```vim
:Leet login
```

3. A browser window will open → **log in to LeetCode**

4. After login → return to Neovim ✅

---

### 🚀 Basic Commands

| Command | Action |
|--------|--------|
| `:Leet` | Open LeetCode dashboard |
| `:Leet list` | Show problems |
| `:Leet random` | Open random problem |
| `:Leet daily` | Daily challenge |
| `:Leet test` | Run test cases |
| `:Leet submit` | Submit solution |

---

### ⚡ Workflow

1. Open problem:
```vim
:Leet list
```

2. Select problem → press `<Enter>`

3. Solve inside Neovim

4. Run test cases:
```vim
:Leet test
```

5. Submit:
```vim
:Leet submit
```

---

### 🧠 Local Testing (Auto Template)

When you open a problem, this config automatically injects:

```cpp
#ifndef ONLINE_JUDGE
#include <bits/stdc++.h>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(NULL);

    Solution sol;

    // 🔥 Write your test here

    return 0;
}
#endif
```

👉 This lets you:
- Run custom test cases locally
- Debug faster than browser

---

### ⚠️ Notes

- Default language is set to **C++**
- Make sure you have:
  - `node` installed (required by plugin)
  - Internet connection for login

---

### 💡 Pro Tip

Use this flow:

```
:Leet random → solve → :Leet test → :Leet submit
```

Daily 20 mins = massive improvement 🚀

## ⚡ Running Code

### Quick Run
```bash
g++ -std=c++17 % -O2 -o out && ./out
```

### File-based Run
```bash
input:  in.txt
output: out.txt
```

---

## 📁 Plugins

- `lazy.nvim`
- `gruvbox`
- `nvim-treesitter`
- `telescope.nvim`
- `nvim-tree`
- `nvim-lspconfig`
- `nvim-cmp`
- `leetcode.nvim`

---

## ⚠️ macOS Fix

If compilation fails:

```bash
/opt/homebrew/bin/g++-15
```

Already handled in config:

```lua
vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH
```

---

## 🎯 Philosophy

> Speed > Looks  
> Keyboard > Mouse  
> Practice > Setup

---

## 💡 Roadmap

- [ ] Debugger (DAP)
- [ ] Git integration
- [ ] Snippets
- [ ] Statusline

---

## ⭐ Support

If this helps you:

👉 Star the repo  
👉 Fork it  
👉 Make it better  

---

## 🧠 Author

Built by someone who got tired of slow editors during contests.

---

## ⚔️ Final Thought

> “Your editor should disappear. Only logic should remain.”
