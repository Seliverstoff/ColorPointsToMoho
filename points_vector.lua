ScriptName = "SS_ImportColorsPointData"
SS_ImportColorsPointData = {}

function SS_ImportColorsPointData:Name()
    return "ExportPointsData"
end

function SS_ImportColorsPointData:Version()
    return "0.1"
end

function SS_ImportColorsPointData:Description()
    return ""
end

function SS_ImportColorsPointData:Creator()
    return "Seliverstoff School"
end

function SS_ImportColorsPointData:UILabel()
    return "Import Points Color Data " .. SS_ImportColorsPointData:Version()
end

function SS_ImportColorsPointData:IsEnabled(moho)
    if (moho.layer:LayerType() ~= MOHO.LT_VECTOR) then
        return false -- creating new objects in the middle of an action can lead to unexpected results
    end
    return true
end

function SS_ImportColorsPointData:Run(moho)
    local chosenFile = LM.GUI.OpenFile("Выберите файл данных")

    if chosenFile == "" then
        print("Файл не выбран.")
    else
        -- Здесь вы можете добавить свою логику для работы с выбранным файлом
        print("Выбранный файл: " .. chosenFile)

        local file = io.open(chosenFile, "r")
        if not file then
            print("Не удалось открыть файл: " .. chosenFile)
            return
        end

        local vectorLayer = moho:LayerAsVector(moho.layer)
        local mesh = vectorLayer:Mesh()
    
        for line in file:lines() do
            local pointIndex, x, y, r, g, b, a = string.match(line, "(%d+):([%-%d%.]+):([%-%d%.]+):([%-%d%.]+):([%-%d%.]+):([%-%d%.]+):([%-%d%.]+)")
            if pointIndex and x and y and r and g and b and a then
                pointIndex = tonumber(pointIndex)
                x = tonumber(x)
                y = tonumber(y)
                r = tonumber(r)
                g = tonumber(g)
                b = tonumber(b)
                a = tonumber(a)
            
            -- Устанавливаем цвет для указанной точки
                if pointIndex <= mesh:CountPoints() then
                    local point = mesh:Point(pointIndex) -- в Lua индексы начинаются с 1, в Moho - с 0
                    point.fColored = true
                    local ptCol = LM.rgb_color:new_local()
                    ptCol.r = r;
                    ptCol.g = g;
                    ptCol.b = b;
                    ptCol.a = a;
                    point.fColor:SetValue(moho.drawingLayerFrame, ptCol)
                end
            end
        end
    
        -- Закрываем файл
        file:close()
    end
end  

