import dracula.draw

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 2,
        'horizontal': 3
    }
})


config.load_autoconfig(False)

# bindings.commands = {"normal": {";w": "hint links spawn --detach mpv --force-window yes {hint-url}", "pt": "pin-tab"}}
config.bind('pt', 'tab-pin')
config.bind(';w','hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind(';W','spawn --detach mpv --force-window yes {url}')
config.bind(';I','hint images spawn --output-messages wget -P "/home/nephitejnf/Downloads/Qute/" {hint-url}')
# password management
config.bind('ee','spawn --userscript qute-pass')
config.bind('eu','spawn --userscript qute-pass --username-only')
config.bind('ep','spawn --userscript qute-pass --password-only')
config.bind('eo','spawn --userscript qute-pass --otp-only')


# Enable automatic webpage dark mode where possible to give consistent dark design.
c.colors.webpage.darkmode.enabled = True


EXEMPT = [
    "https://*.youtube.com/*",
    "https://youtube.com/*",
    "https://*.x.com/*",
    "https://x.com/*",
    "https://*.github.com/*",
    "https://github.com/*",
    "https://*.linkedin.com/*",
    "https://linkedin.com/*",
    "https://*.chat.openai.com/*",
    "https://chat.openai.com/*",
    "https://*.chatgpt.com/*",
    "https://chatgpt.com/*",
]

for site in EXEMPT:
    config.set("colors.webpage.darkmode.enabled", False, site)


c.tabs.position = 'left'

# # Hide the tab bar
# c.tabs.show = 'never'
#
# # Hide the status bar
# c.statusbar.show = 'never'

# Hide tabs
config.bind('tt', 'set tabs.show never')  # Press 'tt' to hide tabs
config.bind('to', 'set tabs.show always')  # Press 'tT' to show tabs

# Hide status bar
config.bind('ss', 'set statusbar.show never')  # Press 'ss' to hide status bar
config.bind('so', 'set statusbar.show always')  # Press 'sS' to show status bar


# c.colors.tabs.even.bg = 'darkgreen'
# c.colors.tabs.odd.bg = 'darkgreen'

c.content.blocking.method = 'adblock'
c.content.blocking.adblock.lists = [
        "https://easylist.to/easylist/easylist.txt",
        "https://easylist.to/easylist/easyprivacy.txt",
        "https://easylist.to/easylist/fanboy-social.txt",
        "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
        "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt",
        #"https://gitlab.com/curben/urlhaus-filter/-/raw/master/urlhaus-filter.txt",
        "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
        "https://www.i-dont-care-about-cookies.eu/abp/",
        "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
]

c.content.pdfjs = True
c.content.autoplay = False

c.editor.command = ["kitty", "-e", "hx", "{file}", "-c", "normal {line}G{column0}l"]

c.input.insert_mode.auto_load = True

c.tabs.background = True
c.tabs.title.format_pinned = '{index} {audio}'

c.url.open_base_url = True
c.url.start_pages = 'https://search.realnephestate.xyz/'
c.url.default_page = 'about:blank'

c.url.searchengines = {"DEFAULT": "https://search.realnephestate.xyz/search?q={}",
        "ddg": "https://duckduckgo.com/?q={}",
        "ksl": "https://classifieds.ksl.com/search?keyword={}",
        "tw": "https://twitch.tv/{}",
        "dlive": "https://dlive.tv/{}",
        "ig": "https://infogalactic.com/w/index.php?search={}",
        "yt": "https://www.youtube.com/results?search_query={}"}

c.window.title_format = '{perc}{current_title}{title_sep}nephestate browser'
