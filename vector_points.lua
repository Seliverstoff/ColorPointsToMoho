ScriptName = "SS_ExportColorsPointData"
SS_ExportColorsPointData = {}

function SS_ExportColorsPointData:Name()
    return "ExportPointsData"
end

function SS_ExportColorsPointData:Version()
    return "0.1"
end

function SS_ExportColorsPointData:Description()
    return ""
end

function SS_ExportColorsPointData:Creator()
    return "Seliverstoff Schoole"
end

function SS_ExportColorsPointData:UILabel()
    return "Export Points Data " .. SS_ExportColorsPointData:Version()
end


-- local moho = 

-- Функция для сохранения данных в файл
local function SaveToFile(filename, data)
 local file = io.open(filename, "w")
 if file then
  file:write(data)
  file:close()
 else
  print("Ошибка при открытии файла для записи.")
 end
end

local function ExportPointsAndColors(moho)
-- if moho.layer:LayerType() ~= MOHO.LT_VECTOR then
--  print("Активный слой не является векторным слоем")
--  return
-- end

-- local vectorLayer = moho:LayerAsVector(layer)
-- local mesh = vectorLayer:Mesh()
-- local dataToSave = ""

-- for i = 0, mesh:CountPoints() - 1 do
--  local point = mesh:Point(i)
--  local x, y = point:Loc().x, point:Loc().y
--  local color = point:Color() -- Получаем цвет точки
--  local r, g, b, a = color.r, color.g, color.b, color.a -- Извлекаем компоненты цвета
--  dataToSave = dataToSave .. string.format("%d:%f:%f:%d:%d:%d:%d\n", i, x, y, r, g, b, a)
-- end

-- SaveToFile("C:\\PointsAndColors.txt", dataToSave)
end

function SS_ExportColorsPointData:IsEnabled(moho)
    if (moho.layer:LayerType() ~= MOHO.LT_VECTOR) then
        return false -- creating new objects in the middle of an action can lead to unexpected results
    end
    return true
end

function SS_ExportColorsPointData:Run(moho)
    local vectorLayer = moho:LayerAsVector(moho.layer)
    local mesh = vectorLayer:Mesh()
    local dataToSave = ""

    for i = 0, mesh:CountPoints() - 1 do
        local point = mesh:Point(i)
        local x, y = point.fPos.x, point.fPos.y
        local color = point.fColor.value -- Получаем цвет точки
        local r, g, b, a = color.r, color.g, color.b, color.a -- Извлекаем компоненты цвета
        dataToSave = dataToSave .. string.format("%d:%f:%f:%d:%d:%d:%d\n", i, x, y, r, g, b, a)
    end
    print(dataToSave)
    SaveToFile("C:\\PointsAndColors.txt", dataToSave)
end  


-- Вызов функции для экспорта точек и цветов из текущего слоя
--ExportPointsAndColors(moho.layer)