# Vim 配置使用说明

这是一套偏 VS Code 工作台风格的 Vim/MacVim 配置，包含左侧文件树、顶部文件
标签、状态栏、模糊搜索、项目全文搜索、代码补全、LSP、Git 修改标记和快速跳转。

## 安装

配置使用 [vim-plug](https://github.com/junegunn/vim-plug) 管理插件。首次启动
Vim 时，如果系统有 `curl`，配置会自动安装 vim-plug 并执行 `:PlugInstall`。

也可以手动安装：

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
```

更新或删除插件：

```vim
:PlugUpdate
:PlugClean
```

项目搜索依赖 `ripgrep`（`rg`）。文件图标需要 Nerd Font；MacVim 默认使用
`MesloLGS NF` 14 号字体。如果图标显示成方框，请安装 Nerd Font，或修改
`vimrc` 中的 `guifont`。

## 按键约定

- `<leader>` 是空格键。
- `Space fg` 表示依次按空格、`f`、`g`，不需要同时按下。
- `<C-n>` 表示 `Ctrl+n`。
- `<S-Tab>` 表示 `Shift+Tab`。
- 以下自定义快捷键主要在普通模式下使用。

## 启动方式

| 命令 | 效果 |
| --- | --- |
| `vim` | 以当前目录为项目根目录，打开左侧文件树和右侧编辑区 |
| `vim .` | 打开当前目录，效果同工作台 |
| `vim path/to/dir` | 将指定目录设为工作目录并打开文件树 |
| `vim path/to/file` | 打开文件，在左侧文件树中定位它，并把文件所在目录设为工作目录 |
| `vim file1 file2` | 打开多个文件，并显示为顶部标签 |

## 文件树

文件树由 NERDTree 提供，默认位于左侧，并显示隐藏文件、文件图标和 Git 状态。

| 操作 | 效果 |
| --- | --- |
| `Ctrl+n` | 显示或隐藏文件树 |
| `Space e` | 在文件树中定位当前文件 |
| `Space tw` | 将文件树宽度调整为 40 列 |
| `Enter` 或 `o` | 打开光标所在的文件或展开/收起目录 |
| `t` | 在新的 Vim tab 页中打开文件 |
| `i` | 水平分屏打开文件 |
| `s` | 垂直分屏打开文件 |
| `I` | 显示或隐藏文件树中的隐藏文件 |
| `m` | 打开新增、移动、删除等文件操作菜单 |
| `R` | 刷新当前目录 |
| `?` | 显示 NERDTree 帮助 |

在文件树中按 buffer 切换快捷键时，配置会自动回到右侧编辑窗口，不会把左侧
文件树替换掉。

## 顶部文件标签与 buffer

每个打开的文件都是一个 Vim buffer。`vim-buftabline` 会在窗口顶部为每个文件
显示标签和 buffer 编号；当前文件会高亮，修改但尚未保存的文件会显示标记。

| 操作 | 效果 |
| --- | --- |
| `Space bn` | 切换到下一个已打开文件 |
| `Space bp` | 切换到上一个已打开文件 |
| `Space bd` | 关闭当前文件 buffer |
| `Space fb` | 搜索并选择所有已打开的 buffer |
| `:buffer 编号` | 按顶部显示的编号切换文件，例如 `:buffer 3` |
| `:ls` | 列出所有 buffer |
| 鼠标单击顶部标签 | 切换到该文件 |

如果文件有未保存的修改，执行 `Space bd` 时 Vim 会阻止关闭；先使用 `:w` 保存，
或明确使用 `:bd!` 放弃修改。

## 文件与项目搜索

| 操作 | 效果 |
| --- | --- |
| `Ctrl+p` | 使用 CtrlP 按文件名查找文件 |
| `Space ff` | 使用 fzf 模糊查找项目文件 |
| `Space fb` | 使用 fzf 查找已打开的 buffer |
| `Space fg` | 输入关键词并全文搜索项目 |
| `Space /` | `Space fg` 的简短替代键 |
| `Space fw` | 搜索光标所在的单词 |
| `:Rg keyword` | 全文搜索 `keyword` |
| `:Rg` | 提示输入搜索关键词 |
| `:Rg! keyword` | 用全屏 fzf 窗口显示结果 |

全文搜索包含隐藏文件，但排除 `.git` 目录。结果窗口右侧带预览，常用操作：

| 操作 | 效果 |
| --- | --- |
| `Enter` | 打开选中的文件或搜索结果 |
| `Ctrl+j` / `Ctrl+k` | 向下/向上移动选择 |
| `Ctrl+/` | 显示或隐藏预览窗口 |
| `Esc` | 退出搜索 |

## 编辑与移动

| 操作 | 效果 |
| --- | --- |
| `H` | 移到当前行行首 |
| `L` | 移到当前行行尾 |
| `J` | 向下移动 5 行 |
| `K` | 向上移动 5 行 |
| `Space ts` | 显示或隐藏空格、Tab 和行尾多余空白 |
| `gcc` | 注释或取消注释当前行 |
| `gc` 加移动命令 | 注释或取消注释指定范围，例如 `gcip` 注释当前段落 |
| `cs旧新` | 替换包围符号，例如 `cs"'` 把双引号改为单引号 |
| `ds符号` | 删除包围符号，例如 `ds"` 删除双引号 |
| `ys` 加移动命令和符号 | 添加包围符号，例如 `ysiw"` 给当前单词加双引号 |

`auto-pairs` 会自动补全括号和引号。系统支持剪贴板时，Vim 默认剪贴板会与系统
剪贴板互通。

## 快速跳转

EasyMotion：

| 操作 | 效果 |
| --- | --- |
| `Space Space w` | 在可见窗口中跳转到单词 |
| `Space Space f` | 按字符跳转 |
| `Space Space j` | 向下按行跳转 |
| `Space Space k` | 向上按行跳转 |

Sneak：

| 操作 | 效果 |
| --- | --- |
| `s` 加两个字符 | 向前跳到这两个字符，例如 `sfu` |
| `S` 加两个字符 | 向后跳到这两个字符 |

Sneak 同样支持可视模式和操作符等待模式。

## 自动补全

补全来源包括 LSP、当前 buffer 内容和文件路径。

| 操作 | 效果 |
| --- | --- |
| `Tab` | 补全菜单出现时选择下一项；否则插入 Tab |
| `Shift+Tab` | 补全菜单出现时选择上一项；否则执行退格 |
| `Enter` | 接受当前补全项；没有补全菜单时正常换行 |
| `Ctrl+Space` | 手动触发补全 |
| `Ctrl+@` | 某些终端无法识别 `Ctrl+Space` 时的替代键 |

## Markdown 编辑与 MacVim 内预览

打开 Markdown 文件时，右侧会自动创建一个 Glow 渲染预览分屏；预览留在 MacVim
窗口内，每次保存都会自动刷新；切换到非 Markdown 文件时会自动关闭。此功能需要安装 Glow：

```sh
brew install glow
```

如果此前使用过旧的浏览器预览，请完全退出并重新打开一次 MacVim，使旧插件的
自动命令从当前进程中卸载。

预览窗口固定为约 60 列宽，并单独关闭空白字符标记；Glow 会以分页模式从文档开头
显示，可在预览中用方向键或 `j`、`k` 滚动。正文窗口不会再挤压预览宽度。

| 操作 | 效果 |
| --- | --- |
| `Space mp` | 跳转到当前文件已有的预览；没有预览时新建右侧预览分屏 |
| `Space mt` | 打开当前 Markdown 文件的大纲目录（Toc） |
| `Ctrl+w h` / `Ctrl+w l` | 在正文和右侧预览之间切换 |

`vim-markdown` 同时提供 Markdown 语法高亮、标题折叠和目录功能。关闭预览分屏时，
在预览窗口输入 `:q` 即可；不会关闭左侧正文。

Neovim 复用这份 Vim 配置，但会改用 `render-markdown.nvim` 在当前编辑缓冲区内
直接渲染标题、列表、代码块等元素，不创建 Glow 分屏。首次运行 `nvim` 后执行
`:PlugInstall` 安装 Neovim 专用依赖；`Space mp` 可开关行内渲染。

## LSP 代码功能

LSP 功能需要为当前文件类型安装语言服务器：

```vim
:LspInstallServer
:LspStatus
```

| 操作 | 效果 |
| --- | --- |
| `gd` | 跳转到定义 |
| `gD` | 跳转到声明 |
| `gi` | 跳转到实现 |
| `gr` | 查找引用 |
| `gy` | 跳转到类型定义 |
| `Space lh` | 显示悬浮文档 |
| `Space lr` | 重命名符号 |
| `Space lf` | 格式化当前文档 |
| `Space ld` | 显示当前文档诊断 |
| `[d` | 跳到上一条诊断 |
| `]d` | 跳到下一条诊断 |
| `Space o` | 显示或隐藏 Vista 符号大纲 |

Java 使用 `eclipse-jdt-ls`。它由 `vim-lsp-settings` 安装到
`~/.local/share/vim-lsp-settings/servers/eclipse-jdt-ls`。首次打开 Java
项目时，JDTLS 需要一些时间索引项目和下载 Maven 元数据。

## Git 状态

`vim-gitgutter` 会在行号左侧显示工作区改动：

- `+`：新增行。
- `~`：修改行。
- `-`：删除行。
- `^`：文件第一行之前有删除内容。

NERDTree 中也会显示文件级 Git 状态。此配置只负责显示状态，不会自动提交或
修改 Git 仓库。

## 界面与文件类型设置

- 使用 Code Dark 配色；不可用时回退到 Vim 的 `slate` 配色。
- 总是显示顶部标签、状态栏、行号、当前行高亮和 Git/LSP 标记列。
- 默认使用 4 空格缩进并将 Tab 展开为空格。
- Go 保留真实 Tab。
- Shell、Ruby、JavaScript、HTML、CSS、XML 使用 2 空格缩进。
- Python、C、C++、Lua 使用 4 空格缩进。
- 新分屏默认在当前窗口下方或右侧打开。
- 支持 UTF-8、GBK/GB18030、Big5、日文和韩文等常见编码探测。

## 插件清单

| 插件 | 用途 |
| --- | --- |
| `preservim/nerdtree` | 左侧文件树 |
| `Xuyuanp/nerdtree-git-plugin` | 文件树 Git 状态 |
| `ryanoasis/vim-devicons` | 文件图标 |
| `tiagofumo/vim-nerdtree-syntax-highlight` | 文件树图标和文件类型着色 |
| `ctrlpvim/ctrlp.vim` | 文件名模糊搜索 |
| `vim-airline/vim-airline` | 底部状态栏 |
| `vim-airline/vim-airline-themes` | Airline 主题 |
| `ap/vim-buftabline` | 顶部打开文件标签 |
| `godlygeek/tabular` | Markdown 表格对齐依赖 |
| `preservim/vim-markdown` | Markdown 高亮、目录和折叠 |
| `tomasiser/vim-code-dark` | Code Dark 配色 |
| `sheerun/vim-polyglot` | 多语言语法和文件类型支持 |
| `uiiaoo/java-syntax.vim` | Java 语法高亮（泛型、注解、函数和标准库类型） |
| `airblade/vim-gitgutter` | 行级 Git 修改标记 |
| `tpope/vim-commentary` | 快速注释 |
| `tpope/vim-surround` | 编辑引号、括号和标签等包围符号 |
| `jiangmiao/auto-pairs` | 自动补全括号和引号 |
| `editorconfig/editorconfig-vim` | 读取项目 `.editorconfig` |
| `prabirshrestha/vim-lsp` | LSP 客户端 |
| `mattn/vim-lsp-settings` | 安装和配置语言服务器 |
| `prabirshrestha/asyncomplete.vim` | 异步补全框架 |
| `prabirshrestha/asyncomplete-lsp.vim` | LSP 补全来源 |
| `prabirshrestha/asyncomplete-buffer.vim` | 当前 buffer 补全来源 |
| `prabirshrestha/asyncomplete-file.vim` | 文件路径补全来源 |
| `easymotion/vim-easymotion` | 可见文本快速跳转 |
| `justinmk/vim-sneak` | 两字符快速跳转 |
| `liuchengxu/vista.vim` | 代码符号大纲 |
| `junegunn/fzf` | fzf 核心 |
| `junegunn/fzf.vim` | 文件、buffer 和搜索结果选择器 |

## 常用 Vim 命令

| 命令 | 效果 |
| --- | --- |
| `:w` | 保存当前文件 |
| `:q` | 关闭当前窗口 |
| `:wq` | 保存并关闭 |
| `:q!` | 放弃当前窗口中的未保存修改并关闭 |
| `:e path` | 打开文件 |
| `:split path` | 水平分屏打开文件 |
| `:vsplit path` | 垂直分屏打开文件 |
| `Ctrl+w h/j/k/l` | 在分屏之间移动 |
| `:source ~/.vim/vimrc` | 不重启 Vim，重新加载配置 |

## 排查问题

- 插件命令不存在：运行 `:PlugInstall`，然后重启 Vim。
- 项目搜索不可用：确认终端中可以执行 `rg --version`。
- 图标显示方框：安装 Nerd Font，并检查 `vimrc` 中的 `guifont`。
- LSP 跳转无反应：运行 `:LspStatus`，再用 `:LspInstallServer` 安装服务器。
- 关闭文件提示未保存：先执行 `:w`，或用 `:bd!` 明确放弃修改。
