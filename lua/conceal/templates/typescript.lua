local utils = require("conceal.templates.utils")

-- Don't conceal:
-- as
-- in
-- is
-- nonlocal
-- try/except/finally/raise
-- async/await

-- some keywords have multiple contexts:
-- from * import *      vs yield from   (handled below)
-- if/else vs for/else  vs try/else     (else always goes to same token)
-- import * as          vs with * as    (as is not concealed)

local keywords = {}
for _, keyword in ipairs({
	"export",
	"import",
	"class",
	"function",
	"if",
	"else",
	"break",
	"continue",
	"return",
	"yield",
	"for",
	"while",
	"type",
	"interface",
	"const",
	"infer",
}) do
	keywords[keyword] = utils.query_builder(keyword)
end

return keywords
