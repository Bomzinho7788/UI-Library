# Modern UI Library para Roblox

Uma biblioteca de interface moderna, poderosa e customizável feita para Roblox com suporte a temas, abas, animações, drag-and-drop e múltiplos componentes.

## ✨ Como importar

```lua
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Bomzinho7788/UI-Library/refs/heads/main/Source"))()

local window = UILibrary.new("Titulo da UI")
```

Parâmetro:

* `Titulo da UI`: Título que aparecerá na barra superior da interface.

---

## 📁 Criando Abas

```lua
local tab = window:Tab("Nome da Aba", "IconeId opcional")
```

Parâmetros:

* `Nome da Aba`: Nome visível no botão da aba.
* `IconeId`: ID opcional de imagem para o ícone.

---

## ▶️ tab\:Button({...})

Cria um botão clicável com texto.

```lua
tab:Button({
    Name = "Texto do Botão",
    Callback = function()
        print("Clicado!")
    end,
    Disabled = false, -- opcional
    Color = Color3.fromRGB(45, 45, 45), -- opcional
    HoverColor = Color3.fromRGB(55, 55, 55),
    ClickColor = Color3.fromRGB(65, 65, 65)
})
```

Métodos retornados:

* `:SetName(text)`
* `:SetDisabled(bool)`
* `:SetColors(cor, hover, click)`
* `:Click()` (simula clique)
* `:SetVisible(bool)`
* `:Update({...})` (atualiza propriedades)

---

## 📄 tab\:TextBox({...})

Cria uma caixa de texto com placeholder e callback ao pressionar Enter.

```lua
tab:TextBox({
    Name = "Label",
    Placeholder = "Digite algo...",
    Callback = function(texto)
        print("Digitado:", texto)
    end,
    Default = "Valor inicial",
    ClearOnFocus = false
})
```

Métodos:

* `:SetText(text)`
* `:GetText()`
* `:Focus()`
* `:Clear()`
* `:SetPlaceholder(text)`
* `:SetName(titulo)`
* `:SetVisible(bool)`
* `:Update({...})`

---

## 📂 tab\:Dropdown({...})

Lista suspensa com opções selecionáveis.

```lua
tab:Dropdown({
    Name = "Escolher",
    Options = {"A", "B", "C"},
    Default = "B",
    Callback = function(opcao)
        print("Selecionado:", opcao)
    end
})
```

Métodos:

* `:SetOptions({})`
* `:SetValue(valor)`
* `:GetValue()`
* `:SetName(nome)`
* `:SetVisible(bool)`
* `:Update({...})`

---

## 🎨 tab\:ColorPicker({...})

Abre um popup para escolher uma cor RGB/HSV com visualização e hex.

```lua
tab:ColorPicker({
    Name = "Cor",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(cor)
        print("Selecionada:", cor)
    end
})
```

Métodos:

* `:SetColor(Color3)`
* `:GetColor()`
* `:SetName(nome)`
* `:SetVisible(bool)`
* `:Update({...})`

---

## ✔️ tab\:Toggle({...})

Cria um interruptor on/off com estado inicial e callback.

```lua
tab:Toggle({
    Name = "Ativar algo",
    Default = true,
    Callback = function(ativo)
        print("Estado:", ativo)
    end
})
```

Métodos:

* `:SetValue(bool)`
* `:GetValue()`
* `:SetName(nome)`
* `:SetVisible(bool)`
* `:Update({...})`

---

## 🕝 Minimizar/Restaurar UI

```lua
window:ToggleMinimize()
```

Definir ícone de restauração:

```lua
window:SetMinimizeIcon(7072706318, Color3.fromRGB(255, 255, 255))
```

---

## ℹ️ Observações

* Todos os componentes usam `UIListLayout` responsivo.
* Altamente customizável via `.Update()` e cores.
* Componentes com animações suaves.
* Suporte a drag do MainFrame e do botão de restauração.

---

## 🤝 Feito por [@Bomzinho7788](https://github.com/Bomzinho7788)
