function findMonitor()
    local monitor = peripheral.find('monitor')
    if monitor == nil then error('Monitor not found') end
    monitor.setTextScale(1)
    monitor.setTextColor(colors.white)
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
    monitor.setCursorPos(1, 1)

    function monitor.writeLine(text)
        monitor.write(text)
        local _, y = monitor.getCursorPos()
        local _, monitorHeight = monitor.getSize()
        if y >= monitorHeight then
            monitor.scroll(1)
            y = monitorHeight
        else
            y = y + 1
        end
        monitor.setCursorPos(1, y)
    end

    return monitor
end

function findChest(emulateItems)
    local chest = peripheral.find('chest')
    if chest == nil then error('Chest not found') end
    if emulateItems and runningAsEmulator() then
        chest.setItem(1, {name = 'minecraft:stone', count = 64})
    end
    return chest
end

function runningAsEmulator()
    return string.find(_G._HOST, 'Minecraft') == nil
end    

return {
    findMonitor = findMonitor,
    findChest = findChest,
    runningAsEmulator = runningAsEmulator
}