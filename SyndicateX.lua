local url = "https://raw.githubusercontent.com/siadan2209-afk/SyndicateX/main/SyndicateX.lua"

local success, source = pcall(game.HttpGet, game, url)
if not success then
    warn("[SYNDICATE X] Gagal mengambil script.")
    return
end

if type(loadstring) ~= "function" then
    warn("[SYNDICATE X] loadstring tidak tersedia di lingkungan ini.")
    return
end

local compileSuccess, runFunction = pcall(loadstring, source)
if not compileSuccess or type(runFunction) ~= "function" then
    warn("[SYNDICATE X] Gagal memuat script.")
    return
end

local runSuccess, err = pcall(runFunction)
if not runSuccess then
    warn("[SYNDICATE X] Error saat menjalankan script:", err)
end
