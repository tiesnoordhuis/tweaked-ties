-- installing directly in minecraft
-- using the `wget run <link>` command

local function downloadFile(url, path)
    local response = http.get(url)
    if response and response.getResponseCode() == 200 then
        local content = response.readAll()
        local file = fs.open(path, "w")
        file.write(content)
        file.close()
        print("File " .. path .. " downloaded successfully.")
    else
        print("Failed to download " .. path)
    end
end

local function install()
    download("https://raw.githubusercontent.com/tiesnoordhuis/tweaked-ties/main/utils.lua", "utils.lua")
    fs.delete("install.lua")
end

install()