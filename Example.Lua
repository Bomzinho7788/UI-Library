local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Bomzinho7788/UI-Library/refs/heads/main/Source"))()

local window = UILibrary.new("Exemplo Completo")
window:SetMinimizeIcon(7072706318, Color3.fromRGB(255, 255, 255))

local aba = window:Tab("Principal", "rbxassetid://7072706318")

local btn = aba:Button({
    Name = "Clique Aqui",
    Callback = function()
        print("Botão pressionado!")
    end
})
btn:SetName("Clique para Testar")
btn:SetDisabled(false)
btn:SetColors(Color3.fromRGB(60,60,60), Color3.fromRGB(70,70,70), Color3.fromRGB(80,80,80))
btn:Click()
btn:SetVisible(true)
btn:Update({Text = "Atualizado!"})

local caixa = aba:TextBox({
    Name = "Apelido",
    Placeholder = "Digite algo...",
    Default = "Jogador",
    ClearOnFocus = true,
    Callback = function(text)
        print("Texto digitado:", text)
    end
})
caixa:SetText("NovoNome")
print("Texto atual:", caixa:GetText())
caixa:SetPlaceholder("Novo placeholder")
caixa:SetName("Novo Título")
caixa:SetVisible(true)
caixa:Focus()
caixa:Clear()
caixa:Update({Text = "Atualizado", Placeholder = "Escreva...", Default = "Padrao"})

local drop = aba:Dropdown({
    Name = "Escolha",
    Options = {"A", "B", "C"},
    Default = "B",
    Callback = function(opcao)
        print("Escolhido:", opcao)
    end
})
drop:SetOptions({"X", "Y", "Z"})
drop:SetValue("Z")
print("Selecionado:", drop:GetValue())
drop:SetName("Nova Lista")
drop:SetVisible(true)
drop:Update({Options = {"1", "2"}, Default = "1"})

local cor = aba:ColorPicker({
    Name = "Escolher Cor",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(corSelecionada)
        print("Cor:", corSelecionada)
    end
})
cor:SetColor(Color3.fromRGB(0, 255, 255))
print("Cor atual:", cor:GetColor())
cor:SetName("Cor Atualizada")
cor:SetVisible(true)
cor:Update({Value = Color3.fromRGB(255, 255, 0)})

local toggle = aba:Toggle({
    Name = "Modo Ativo",
    Default = true,
    Callback = function(status)
        print("Toggle:", status)
    end
})
toggle:SetValue(false)
print("Estado atual:", toggle:GetValue())
toggle:SetName("Toggle Atualizado")
toggle:SetVisible(true)
toggle:Update({Value = true})

wait(2)
window:ToggleMinimize()
wait(2)
window:ToggleMinimize()
