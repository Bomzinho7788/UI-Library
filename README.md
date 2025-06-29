# UI Library - Documentação Detalhada

Documentação completa com explicações de cada função, métodos, parâmetros e exemplos de uso.

---

Carregamento do UILibrary

```lua
local UILibrary = loadstring(game:HttpGet("https://github.com/Bomzinho7788/UI-Library/edit/main/Source.Lua"))()
```

---

## ✅ UILibrary.new(title)

Cria a janela principal da interface com o título fornecido.

```lua
local window = UILibrary.new("Meu Título")
```

Parâmetros:

* `title` (string): texto exibido no topo da UI.

---

## ✅ window\:Tab(name, icon)

Cria uma nova aba na interface.

```lua
local aba = window:Tab("Principal", "rbxassetid://12345678")
```

Parâmetros:

* `name` (string): nome da aba.
* `icon` (string, opcional): assetId do ícone da aba.

---

## ✅ aba\:Button({...})

Cria um botão clicável com animações.

```lua
local btn = aba:Button({
  Name = "Clique Aqui",
  Callback = function()
    print("Botão clicado!")
  end,
  Disabled = false,
  Color = Color3.fromRGB(45, 45, 45),
  HoverColor = Color3.fromRGB(55, 55, 55),
  ClickColor = Color3.fromRGB(65, 65, 65)
})
```

### Métodos do botão:

* `btn:SetName(nome)` → altera o texto do botão.
* `btn:SetDisabled(boolean)` → ativa/desativa o botão.
* `btn:SetColors(cor, hover, click)` → altera as cores.
* `btn:SetVisible(boolean)` → esconde/mostra.
* `btn:Click()` → simula um clique manualmente.
* `btn:Update({...})` → redefine as propriedades com nova tabela.

---

## ✅ aba\:TextBox({...})

Caixa de texto com título e placeholder.

```lua
local caixa = aba:TextBox({
  Name = "Nickname",
  Placeholder = "Digite...",
  Default = "Texto inicial",
  Callback = function(txt)
    print(txt)
  end,
  ClearOnFocus = true
})
```

### Métodos:

* `caixa:SetText(valor)`
* `caixa:GetText()`
* `caixa:SetPlaceholder(texto)`
* `caixa:SetName(nome)`
* `caixa:SetVisible(boolean)`
* `caixa:Focus()`
* `caixa:Clear()`
* `caixa:Update({...})`

---

## ✅ aba\:Dropdown({...})

Menu suspenso com múltiplas opções.

```lua
local drop = aba:Dropdown({
  Name = "Escolha",
  Options = {"A", "B", "C"},
  Default = "B",
  Callback = function(opcao)
    print("Selecionado:", opcao)
  end
})
```

### Métodos:

* `drop:SetOptions({"X", "Y"})`
* `drop:SetValue("X")`
* `drop:GetValue()`
* `drop:SetName(nome)`
* `drop:SetVisible(boolean)`
* `drop:Update({...})`

---

## ✅ aba\:ColorPicker({...})

Abre uma janela para selecionar cor com suporte a HEX e RGB.

```lua
local picker = aba:ColorPicker({
  Name = "Escolher Cor",
  Default = Color3.fromRGB(255, 0, 0),
  Callback = function(cor)
    print("Nova cor:", cor)
  end
})
```

### Métodos:

* `picker:SetColor(Color3)`
* `picker:GetColor()`
* `picker:SetName(nome)`
* `picker:SetVisible(boolean)`
* `picker:Update({...})`

---

## ✅ aba\:Toggle({...})

Cria um botão de ativar/desativar (tipo switch).

```lua
local toggle = aba:Toggle({
  Name = "Ativar Som",
  Default = true,
  Callback = function(status)
    print("Ativado?", status)
  end
})
```

### Métodos:

* `toggle:SetValue(boolean)`
* `toggle:GetValue()`
* `toggle:SetName(nome)`
* `toggle:SetVisible(boolean)`
* `toggle:Update({...})`

---

## ✅ window\:ToggleMinimize()

Minimiza ou restaura a UI.

```lua
window:ToggleMinimize()
```

---

## ✅ window\:SetMinimizeIcon(iconId, color)

Define o ícone e cor do botão de restaurar.

```lua
window:SetMinimizeIcon(1234567890, Color3.fromRGB(255, 255, 255))
```

---

## ✅ Fechar UI Manualmente

```lua
game:GetService("CoreGui"):FindFirstChild("ModernUI"):Destroy()
```

---

## 🤝 Feito por [@Bomzinho7788](https://github.com/Bomzinho7788)
