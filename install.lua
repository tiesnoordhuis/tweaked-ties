-- installing directly in minecraft
-- using the `wget run <link>` command

local function download(url, path)
    local request = http.request(url)
    local response = request.readAll()
    request.close()
    local file = fs.open(path, "w")
    file.write(response)
    file.close()
end

local function install()
    download("https://raw.githubusercontent.com/tiesnoordhuis/tweaked-ties/main/utils.lua", "utils.lua")
    fs.delete("install.lua")
end

install()