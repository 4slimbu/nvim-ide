vim.opt.termguicolors = true
-- Plugins
require("plugins")
-- Configs
require("configs.general")
-- Mappings
require("mappings")

vim.g.dbs = {
  { name = 'kleintext_local_db', url = 'mysql://user:password@127.0.0.1/text' },
  { name = 'kleintext_live_db',  url = 'mysql://root:9dZDdSB%3F0PLB%7DZ%294@104.196.223.92/text' },
  -- { name = 'wismolab_msql', url = 'msql://KasperDeploi:K7ePrUrKnxjSegUa@sy-live-sql-report-01.database.windows.net:1443/sy-live-development'}
}
