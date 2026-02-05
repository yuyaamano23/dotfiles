-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- keybinds.luaを読み込む
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.disable_default_key_bindings = true

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- key binding
config.leader = { key = "j", mods = "CTRL", timeout_milliseconds = 1000 }

-- デフォルトの起動ディレクトリを設定
config.default_cwd = "/Users/yuyaamano/workspace"

config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'

config.automatically_reload_config = true
config.font_size = 12.0
config.line_height = 1.1
config.font = wezterm.font_with_fallback({
  { family = "JetBrains Mono", weight = "Bold" },
  { family = "BIZ UDGothic", weight = "Bold" },
})

-- 日本語入力を可能にする
config.use_ime = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20
-- タブバーを非表示
config.window_decorations = "RESIZE"
-- タブが1つしか無いときに非表示
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar= false

-- タブバーを透明にする
config.colors = {
  tab_bar = {
    background = "none",
    inactive_tab_edge = "none",
  },
}
-- タブバーを背景と同じ色にする
-- タブ同士の境界線を非表示
config.window_background_gradient = {
  colors = { "#000000" },
}

-- タブバーの+を消す
config.show_new_tab_button_in_tab_bar = false
-- タブバーの閉じるボタンを消す
config.show_close_tab_button_in_tabs = false
-- アクティブ pane が相対的に強調
config.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.6,
}


local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

-- アクティブタブにパスに基づいたタイトルをつける
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"

  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background

  -- パス情報の取得と加工
  local pane = tab.active_pane
  local title = pane.title -- フォールバック用
  local working_dir = pane.current_working_dir

  if working_dir then
    local path = working_dir.file_path
    local home = wezterm.home_dir
    
    if path == home then
      title = "~"
    else
      -- パスの最後の一節（ディレクトリ名）を取得
      -- workspace/my-project -> my-project
      title = path:match("([^/]+)/?$") or title
    end
  end

  -- 表示用の余白を含めたタイトル（truncateを使わず、最低限の表示を優先）
  title = "  " .. title .. "   "
  local display_title = "  " .. title .. "      "

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

config.color_scheme = 'Darcula (base16)'

-- and finally, return the configuration to wezterm
return config
