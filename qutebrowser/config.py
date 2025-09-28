import catppuccin

config.load_autoconfig()

catppuccin.setup(c, 'mocha', True)

# A dark mode for qutebrowser with adblocking enabled
config.set("colors.webpage.darkmode.enabled", True)

config.set("content.blocking.method", "both")

# Disable dark mode for specific websites
config.set("colors.webpage.darkmode.enabled", False, "https://chatgpt.com/*")

config.set("colors.webpage.darkmode.enabled", False, "https://chatgpt.com/*")
config.set("colors.webpage.darkmode.enabled", False, "https://www.youtube.com/*")
config.set("colors.webpage.darkmode.enabled", False, "https://github.com/*")
config.set("colors.webpage.darkmode.enabled", False, "https://discord.com/*")
