local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = Game.CoreGui

local UILibrary = {}
UILibrary.__index = UILibrary

function UILibrary.new(title)
	local library = {}
	setmetatable(library, UILibrary)

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "ModernUI"
	ScreenGui.Parent = CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Size = UDim2.new(0, 500, 0, 350)
	MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
	MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	MainFrame.BorderSizePixel = 0
	MainFrame.Parent = ScreenGui

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 8)
	UICorner.Parent = MainFrame

	local Shadow = Instance.new("ImageLabel")
	Shadow.Name = "Shadow"
	Shadow.BackgroundTransparency = 1
	Shadow.Position = UDim2.new(0, -15, 0, -15)
	Shadow.Size = UDim2.new(1, 30, 1, 30)
	Shadow.ZIndex = -1
	Shadow.Image = "rbxassetid://5554236805"
	Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	Shadow.ScaleType = Enum.ScaleType.Slice
	Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
	Shadow.Parent = MainFrame

	local TitleBar = Instance.new("Frame")
	TitleBar.Name = "TitleBar"
	TitleBar.Size = UDim2.new(1, 0, 0, 30)
	TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TitleBar.BorderSizePixel = 0
	TitleBar.Parent = MainFrame

	local TitleBarFix = Instance.new("Frame")
	TitleBarFix.Name = "TitleBar"
	TitleBarFix.AnchorPoint = Vector2.new(0, 1)
	TitleBarFix.Position = UDim2.new(0, 0, 1, 0)
	TitleBarFix.Size = UDim2.new(1, 0, 0, 8)
	TitleBarFix.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TitleBarFix.BorderSizePixel = 0
	TitleBarFix.Parent = TitleBar

	local UICornerTitle = Instance.new("UICorner")
	UICornerTitle.CornerRadius = UDim.new(0, 8)
	UICornerTitle.Parent = TitleBar

	local TitleText = Instance.new("TextLabel")
	TitleText.Name = "Title"
	TitleText.Size = UDim2.new(1, -60, 1, 0)
	TitleText.Position = UDim2.new(0, 10, 0, 0)
	TitleText.BackgroundTransparency = 1
	TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
	TitleText.TextSize = 16
	TitleText.Font = Enum.Font.GothamSemibold
	TitleText.TextXAlignment = Enum.TextXAlignment.Left
	TitleText.Text = title or "Modern UI Library"
	TitleText.Parent = TitleBar

	local MinimizeButton = Instance.new("TextButton")
	MinimizeButton.Name = "MinimizeButton"
	MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
	MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
	MinimizeButton.BackgroundTransparency = 1
	MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeButton.TextSize = 18
	MinimizeButton.Font = Enum.Font.GothamBold
	MinimizeButton.Text = "-"
	MinimizeButton.Parent = TitleBar

	local CloseButton = Instance.new("TextButton")
	CloseButton.Name = "CloseButton"
	CloseButton.Size = UDim2.new(0, 30, 0, 30)
	CloseButton.Position = UDim2.new(1, -30, 0, 0)
	CloseButton.BackgroundTransparency = 1
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.TextSize = 18
	CloseButton.Font = Enum.Font.GothamBold
	CloseButton.Text = "×"
	CloseButton.Parent = TitleBar

	local RestoreButton = Instance.new("ImageButton")
	RestoreButton.Name = "RestoreButton"
	RestoreButton.Size = UDim2.new(0, 32, 0, 32)
	RestoreButton.Position = UDim2.new(0, 0, 0, 0)
	RestoreButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	RestoreButton.BorderSizePixel = 0
	RestoreButton.Image = "rbxassetid://7072706318"
	RestoreButton.ImageColor3 = Color3.fromRGB(200, 200, 200)
	RestoreButton.Visible = false
	RestoreButton.Parent = ScreenGui

	local UICornerRestore = Instance.new("UICorner")
	UICornerRestore.CornerRadius = UDim.new(0, 8)
	UICornerRestore.Parent = RestoreButton

	local TabContainer = Instance.new("Frame")
	TabContainer.Name = "TabContainer"
	TabContainer.Size = UDim2.new(0, 120, 1, -30)
	TabContainer.Position = UDim2.new(0, 0, 0, 30)
	TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TabContainer.BorderSizePixel = 0
	TabContainer.Parent = MainFrame

	local UICornerTabContainer = Instance.new("UICorner")
	UICornerTabContainer.CornerRadius = UDim.new(0, 8)
	UICornerTabContainer.Parent = TabContainer

	local TabButtonHolder = Instance.new("ScrollingFrame")
	TabButtonHolder.Name = "TabButtonHolder"
	TabButtonHolder.Size = UDim2.new(1, 0, 1, 0)
	TabButtonHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabButtonHolder.BackgroundTransparency = 1
	TabButtonHolder.ScrollBarThickness = 2
	TabButtonHolder.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
	TabButtonHolder.BottomImage = ""
	TabButtonHolder.TopImage = ""
	TabButtonHolder.BorderSizePixel = 0
	TabButtonHolder.Parent = TabContainer

	local TabButtonList = Instance.new("UIListLayout")
	TabButtonList.SortOrder = Enum.SortOrder.LayoutOrder
	TabButtonList.Padding = UDim.new(0, 5)
	TabButtonList.Parent = TabButtonHolder

	local TabButtonPadding = Instance.new("UIPadding")
	TabButtonPadding.PaddingTop = UDim.new(0, 10)
	TabButtonPadding.PaddingLeft = UDim.new(0, 10)
	TabButtonPadding.PaddingRight = UDim.new(0, 10)
	TabButtonPadding.PaddingBottom = UDim.new(0, 10)
	TabButtonPadding.Parent = TabButtonHolder

	local ContentContainer = Instance.new("Frame")
	ContentContainer.Name = "ContentContainer"
	ContentContainer.Size = UDim2.new(1, -130, 1, -40)
	ContentContainer.Position = UDim2.new(0, 125, 0, 35)
	ContentContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	ContentContainer.BorderSizePixel = 0
	ContentContainer.ClipsDescendants = true
	ContentContainer.Parent = MainFrame

	local Frame = Instance.new("Frame")
	Frame.Parent = CoreGui.ModernUI.MainFrame.TabContainer
	Frame.AnchorPoint = Vector2.new(1, 1)
	Frame.BackgroundColor3 = Color3.new(0.12549, 0.12549, 0.12549)
	Frame.BorderColor3 = Color3.new(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(1, 0, 1, 0)
	Frame.Size = UDim2.new(0, 4, 1, 0)

	library.ScreenGui = ScreenGui
	library.MainFrame = MainFrame
	library.TabButtonHolder = TabButtonHolder
	library.ContentContainer = ContentContainer
	library.Tabs = {}
	library.ActiveTab = nil
	library.Minimized = false
	library.OriginalPosition = MainFrame.Position

	local function minimizeUI()
		library.Minimized = true
		MainFrame.Visible = false
		RestoreButton.Visible = true
		RestoreButton.Position = UDim2.new(0, MainFrame.AbsolutePosition.X, 0, MainFrame.AbsolutePosition.Y)
	end

	-- Função para restaurar
	local function restoreUI()
		library.Minimized = false
		MainFrame.Visible = true
		RestoreButton.Visible = false
		MainFrame.Position = library.OriginalPosition
	end

	MinimizeButton.MouseButton1Click:Connect(minimizeUI)
	RestoreButton.MouseButton1Click:Connect(restoreUI)
	CloseButton.MouseButton1Click:Connect(function()
		ScreenGui:Destroy()
	end)

	local UserInputService = game:GetService("UserInputService")
	local draggingRestore = false
	local dragStartRestore
	local startPosRestore

	RestoreButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or 
			input.UserInputType == Enum.UserInputType.Touch then
			draggingRestore = true
			dragStartRestore = input.Position
			startPosRestore = RestoreButton.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					draggingRestore = false
				end
			end)
		end
	end)

	RestoreButton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or 
			input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if draggingRestore and (input.UserInputType == Enum.UserInputType.MouseMovement or 
			input.UserInputType == Enum.UserInputType.TouchMovement) then
			local delta = input.Position - dragStartRestore
			RestoreButton.Position = UDim2.new(
				startPosRestore.X.Scale, 
				startPosRestore.X.Offset + delta.X, 
				startPosRestore.Y.Scale, 
				startPosRestore.Y.Offset + delta.Y
			)
		end
	end)

	local dragging = false
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		library.OriginalPosition = MainFrame.Position
	end

	TitleBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or 
			input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = MainFrame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	TitleBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or 
			input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	function library:SetMinimizeIcon(iconId, color)
		RestoreButton.Image = "rbxassetid://"..tostring(iconId)
		if color then
			RestoreButton.ImageColor3 = color
		end
	end

	function library:ToggleMinimize()
		if library.Minimized then
			restoreUI()
		else
			minimizeUI()
		end
	end

	return library
end

function UILibrary:Tab(name, icon)
	local tab = {}

	local tabButton = Instance.new("TextButton")
	tabButton.Name = name.."Tab"
	tabButton.Size = UDim2.new(1, 0, 0, 36)
	tabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	tabButton.BorderSizePixel = 0
	tabButton.Text = ""
	tabButton.AutoButtonColor = false
	tabButton.Parent = self.TabButtonHolder

	local UICornerTabButton = Instance.new("UICorner")
	UICornerTabButton.CornerRadius = UDim.new(0, 6)
	UICornerTabButton.Parent = tabButton

	local TabIcon
	if icon then
		TabIcon = Instance.new("ImageLabel")
		TabIcon.Name = "Icon"
		TabIcon.Size = UDim2.new(0, 20, 0, 20)
		TabIcon.Position = UDim2.new(0, 8, 0.5, -10)
		TabIcon.BackgroundTransparency = 1
		TabIcon.Image = icon
		TabIcon.Parent = tabButton
	end

	local TabText = Instance.new("TextLabel")
	TabText.Name = "TabText"
	TabText.Size = UDim2.new(1, icon and -36 or -16, 1, 0)
	TabText.Position = UDim2.new(0, icon and 36 or 8, 0, 0)
	TabText.BackgroundTransparency = 1
	TabText.TextColor3 = Color3.fromRGB(200, 200, 200)
	TabText.TextSize = 14
	TabText.Font = Enum.Font.GothamMedium
	TabText.TextXAlignment = Enum.TextXAlignment.Left
	TabText.Text = name
	TabText.Parent = tabButton

	local TabIndicator = Instance.new("Frame")
	TabIndicator.Name = "Indicator"
	TabIndicator.Size = UDim2.new(0, 3, 0.7, 0)
	TabIndicator.Position = UDim2.new(0, 0, 0.15, 0)
	TabIndicator.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
	TabIndicator.BorderSizePixel = 0
	TabIndicator.BackgroundTransparency = 1
	TabIndicator.Parent = tabButton

	local TabContent = Instance.new("ScrollingFrame")
	TabContent.Name = name.."Content"
	TabContent.Size = UDim2.new(1, 0, 1, 0)
	TabContent.BackgroundTransparency = 1
	TabContent.BorderSizePixel = 0
	TabContent.ScrollBarThickness = 3
	TabContent.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
	TabContent.Visible = false
	TabContent.Parent = self.ContentContainer
	TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabContent.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local ContentList = Instance.new("UIListLayout")
	ContentList.SortOrder = Enum.SortOrder.LayoutOrder
	ContentList.Padding = UDim.new(0, 5)
	ContentList.Parent = TabContent

	local ContentPadding = Instance.new("UIPadding")
	ContentPadding.PaddingTop = UDim.new(0, 5)
	ContentPadding.PaddingLeft = UDim.new(0, 10)
	ContentPadding.PaddingRight = UDim.new(0, 10)
	ContentPadding.PaddingBottom = UDim.new(0, 10)
	ContentPadding.Parent = TabContent

	tabButton.MouseButton1Click:Connect(function()
		self:SelectTab(name)
	end)

	tab.Button = tabButton
	tab.Content = TabContent
	tab.Indicator = TabIndicator

	table.insert(self.Tabs, tab)

	self.TabButtonHolder.CanvasSize = UDim2.new(0, 0, 0, ContentList.AbsoluteContentSize.Y + 20)

	if #self.Tabs == 1 then
		self:SelectTab(name)
	end

	local sectionFunctions = {}

	function sectionFunctions:Button(args)
		local text = args.Name or args.Text or args.title or args.Title or "Button"
		local callback = args.Callback or args.callback or function() end
		local disabled = args.Disabled or args.disabled or false
		local color = args.Color or args.color or Color3.fromRGB(45, 45, 45)
		local hoverColor = args.HoverColor or args.hoverColor or Color3.fromRGB(55, 55, 55)
		local clickColor = args.ClickColor or args.clickColor or Color3.fromRGB(65, 65, 65)

		local TweenService = game:GetService("TweenService")

		local ButtonFrame = Instance.new("Frame")
		ButtonFrame.Name = text.."ButtonFrame"
		ButtonFrame.Size = UDim2.new(1, 0, 0, 36)
		ButtonFrame.BackgroundTransparency = 1
		ButtonFrame.Parent = TabContent

		local Button = Instance.new("TextButton")
		Button.Name = text.."Button"
		Button.Size = UDim2.new(1, 0, 1, 0)
		Button.BackgroundColor3 = color
		Button.BorderSizePixel = 0
		Button.Text = ""
		Button.AutoButtonColor = false
		Button.Active = not disabled
		Button.Parent = ButtonFrame

		local UICornerButton = Instance.new("UICorner")
		UICornerButton.CornerRadius = UDim.new(0, 6)
		UICornerButton.Parent = Button

		local ButtonText = Instance.new("TextLabel")
		ButtonText.Name = "ButtonText"
		ButtonText.Size = UDim2.new(1, -16, 1, 0)
		ButtonText.Position = UDim2.new(0, 8, 0, 0)
		ButtonText.BackgroundTransparency = 1
		ButtonText.TextColor3 = disabled and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(230, 230, 230)
		ButtonText.TextSize = 14
		ButtonText.Font = Enum.Font.GothamMedium
		ButtonText.TextXAlignment = Enum.TextXAlignment.Left
		ButtonText.Text = text
		ButtonText.Parent = Button

		Button.MouseEnter:Connect(function()
			if not disabled then
				TweenService:Create(Button, TweenInfo.new(0.2), {
					BackgroundColor3 = hoverColor
				}):Play()
			end
		end)

		Button.MouseLeave:Connect(function()
			TweenService:Create(Button, TweenInfo.new(0.2), {
				BackgroundColor3 = color
			}):Play()
		end)

		Button.MouseButton1Down:Connect(function()
			if not disabled then
				TweenService:Create(Button, TweenInfo.new(0.1), {
					BackgroundColor3 = clickColor
				}):Play()
			end
		end)

		Button.MouseButton1Up:Connect(function()
			if not disabled then
				TweenService:Create(Button, TweenInfo.new(0.1), {
					BackgroundColor3 = hoverColor
				}):Play()
			end
		end)

		Button.MouseButton1Click:Connect(function()
			if not disabled then
				callback()
			end
		end)

		local ButtonMethods = {}

		function ButtonMethods:SetName(newText)
			ButtonText.Text = newText
			return self
		end

		function ButtonMethods:SetDisabled(isDisabled)
			disabled = isDisabled
			Button.Active = not disabled
			ButtonText.TextColor3 = disabled and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(230, 230, 230)
			Button.BackgroundColor3 = disabled and Color3.fromRGB(30, 30, 30) or color
			return self
		end

		function ButtonMethods:SetColors(newColor, newHoverColor, newClickColor)
			color = newColor or color
			hoverColor = newHoverColor or hoverColor
			clickColor = newClickColor or clickColor

			if not disabled then
				Button.BackgroundColor3 = color
			end
			return self
		end

		function ButtonMethods:SetVisible(visible)
			ButtonFrame.Visible = visible
			return self
		end

		function ButtonMethods:Click()
			if not disabled then
				callback()
			end
			return self
		end

		function ButtonMethods:Update(newArgs)
			if newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title then
				self:SetText(newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title)
			end

			if newArgs.Disabled or newArgs.disabled ~= nil then
				self:SetDisabled(newArgs.Disabled or newArgs.disabled)
			end

			if newArgs.Color or newArgs.color or newArgs.HoverColor or newArgs.hoverColor or newArgs.ClickColor or newArgs.clickColor then
				self:SetColors(
					newArgs.Color or newArgs.color,
					newArgs.HoverColor or newArgs.hoverColor,
					newArgs.ClickColor or newArgs.clickColor
				)
			end

			if newArgs.Callback or newArgs.callback then
				callback = newArgs.Callback or newArgs.callback
			end
			return self
		end

		return ButtonMethods
	end

	function sectionFunctions:TextBox(args)
		local text = args.Name or args.Text or args.title or args.Title or "Text Box"
		local placeholder = args.Placeholder or args.placeholder or "Digitar aqui..."
		local callback = args.Callback or args.callback or function() end
		local default = args.Default or args.default or args.Value or args.value or ""
		local clearOnFocus = args.ClearOnFocus or args.clearOnFocus or false

		local TweenService = game:GetService("TweenService")

		local TextBoxFrame = Instance.new("Frame")
		TextBoxFrame.Name = text.."TextBoxFrame"
		TextBoxFrame.Size = UDim2.new(1, 0, 0, 56)
		TextBoxFrame.BackgroundTransparency = 1
		TextBoxFrame.Parent = TabContent

		local TextBoxContainer = Instance.new("Frame")
		TextBoxContainer.Name = text.."TextBoxContainer"
		TextBoxContainer.Size = UDim2.new(1, 0, 1, 0)
		TextBoxContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		TextBoxContainer.BorderSizePixel = 0
		TextBoxContainer.Parent = TextBoxFrame

		local UICornerTextBox = Instance.new("UICorner")
		UICornerTextBox.CornerRadius = UDim.new(0, 6)
		UICornerTextBox.Parent = TextBoxContainer

		local TextBoxTitle = Instance.new("TextLabel")
		TextBoxTitle.Name = "TextBoxTitle"
		TextBoxTitle.Size = UDim2.new(1, -8, 0, 20)
		TextBoxTitle.Position = UDim2.new(0, 8, 0, 6)
		TextBoxTitle.BackgroundTransparency = 1
		TextBoxTitle.TextColor3 = Color3.fromRGB(230, 230, 230)
		TextBoxTitle.TextSize = 14
		TextBoxTitle.Font = Enum.Font.GothamMedium
		TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
		TextBoxTitle.Text = text
		TextBoxTitle.Parent = TextBoxContainer

		local TextBoxBg = Instance.new("Frame")
		TextBoxBg.Name = "TextBoxBg"
		TextBoxBg.Size = UDim2.new(1, -16, 0, 24)
		TextBoxBg.Position = UDim2.new(0, 8, 0, 28)
		TextBoxBg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		TextBoxBg.BorderSizePixel = 0
		TextBoxBg.Parent = TextBoxContainer

		local UICornerTextBoxBg = Instance.new("UICorner")
		UICornerTextBoxBg.CornerRadius = UDim.new(0, 4)
		UICornerTextBoxBg.Parent = TextBoxBg

		local TextBoxInput = Instance.new("TextBox")
		TextBoxInput.Name = "TextBoxInput"
		TextBoxInput.Size = UDim2.new(1, -8, 1, 0)
		TextBoxInput.Position = UDim2.new(0, 8, 0, 0)
		TextBoxInput.BackgroundTransparency = 1
		TextBoxInput.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBoxInput.PlaceholderColor3 = Color3.fromRGB(140, 140, 140)
		TextBoxInput.TextSize = 14
		TextBoxInput.Font = Enum.Font.Gotham
		TextBoxInput.TextXAlignment = Enum.TextXAlignment.Left
		TextBoxInput.PlaceholderText = placeholder
		TextBoxInput.Text = default
		TextBoxInput.ClearTextOnFocus = clearOnFocus
		TextBoxInput.Parent = TextBoxBg

		local TextBoxBorder = Instance.new("Frame")
		TextBoxBorder.Name = "TextBoxBorder"
		TextBoxBorder.Size = UDim2.new(1, 0, 0, 2)
		TextBoxBorder.Position = UDim2.new(0, 0, 1, -2)
		TextBoxBorder.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
		TextBoxBorder.BorderSizePixel = 0
		TextBoxBorder.Parent = TextBoxBg
		TextBoxBorder.BackgroundTransparency = 1

		local UICornerBorder = Instance.new("UICorner")
		UICornerBorder.CornerRadius = UDim.new(0, 2)
		UICornerBorder.Parent = TextBoxBorder

		TextBoxInput.Focused:Connect(function()
			TweenService:Create(TextBoxBorder, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
			TweenService:Create(TextBoxBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
		end)

		TextBoxInput.FocusLost:Connect(function(enterPressed)
			TweenService:Create(TextBoxBorder, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
			TweenService:Create(TextBoxBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()

			if enterPressed then
				callback(TextBoxInput.Text)
			end
		end)

		local TextBoxMethods = {}

		function TextBoxMethods:SetText(value)
			TextBoxInput.Text = tostring(value)
			return self
		end

		function TextBoxMethods:GetText()
			return TextBoxInput.Text
		end

		function TextBoxMethods:SetPlaceholder(newPlaceholder)
			TextBoxInput.PlaceholderText = newPlaceholder
			return self
		end

		function TextBoxMethods:SetName(newTitle)
			TextBoxTitle.Text = newTitle
			return self
		end

		function TextBoxMethods:SetVisible(visible)
			TextBoxFrame.Visible = visible
			return self
		end

		function TextBoxMethods:Focus()
			TextBoxInput:CaptureFocus()
			return self
		end

		function TextBoxMethods:Clear()
			TextBoxInput.Text = ""
			return self
		end

		function TextBoxMethods:Update(newArgs)
			if newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title then
				self:SetName(newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title)
			end

			if newArgs.Placeholder or newArgs.placeholder then
				self:SetPlaceholder(newArgs.Placeholder or newArgs.placeholder)
			end

			if newArgs.Default or newArgs.default or newArgs.Value or newArgs.value then
				self:SetText(newArgs.Default or newArgs.default or newArgs.Value or newArgs.value)
			end

			if newArgs.ClearOnFocus or newArgs.clearOnFocus ~= nil then
				TextBoxInput.ClearTextOnFocus = newArgs.ClearOnFocus or newArgs.clearOnFocus
			end

			if newArgs.Callback or newArgs.callback then
				callback = newArgs.Callback or newArgs.callback
			end
			return self
		end

		return TextBoxMethods
	end

	function sectionFunctions:Dropdown(args)
		local text = args.Name or args.Text or args.title or args.Title or "Dropdown"
		local options = args.Options or args.options or args.List or args.list or {}
		local default = args.Default or args.default or args.Value or args.value or "Select..."
		local callback = args.Callback or args.callback or function() end

		local open = false
		local TweenService = game:GetService("TweenService")

		local DropdownFrame = Instance.new("Frame")
		DropdownFrame.Name = text.."DropdownFrame"
		DropdownFrame.Size = UDim2.new(1, 0, 0, 56)
		DropdownFrame.BackgroundTransparency = 1
		DropdownFrame.Parent = TabContent
		DropdownFrame.ClipsDescendants = true

		local Dropdown = Instance.new("Frame")
		Dropdown.Name = text.."Dropdown"
		Dropdown.Size = UDim2.new(1, 0, 0, 56)
		Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Dropdown.BorderSizePixel = 0
		Dropdown.Parent = DropdownFrame

		local UICornerDropdown = Instance.new("UICorner")
		UICornerDropdown.CornerRadius = UDim.new(0, 6)
		UICornerDropdown.Parent = Dropdown

		local DropdownText = Instance.new("TextLabel")
		DropdownText.Name = "DropdownText"
		DropdownText.Size = UDim2.new(1, -8, 0, 20)
		DropdownText.Position = UDim2.new(0, 8, 0, 6)
		DropdownText.BackgroundTransparency = 1
		DropdownText.TextColor3 = Color3.fromRGB(230, 230, 230)
		DropdownText.TextSize = 14
		DropdownText.Font = Enum.Font.GothamMedium
		DropdownText.TextXAlignment = Enum.TextXAlignment.Left
		DropdownText.Text = text
		DropdownText.Parent = Dropdown

		local DropdownButton = Instance.new("TextButton")
		DropdownButton.Name = "DropdownButton"
		DropdownButton.Size = UDim2.new(1, -16, 0, 24)
		DropdownButton.Position = UDim2.new(0, 8, 0, 28)
		DropdownButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		DropdownButton.BorderSizePixel = 0
		DropdownButton.Text = ""
		DropdownButton.AutoButtonColor = false
		DropdownButton.Parent = Dropdown

		local UICornerButton = Instance.new("UICorner")
		UICornerButton.CornerRadius = UDim.new(0, 4)
		UICornerButton.Parent = DropdownButton

		local SelectedText = Instance.new("TextLabel")
		SelectedText.Name = "SelectedText"
		SelectedText.Size = UDim2.new(1, -30, 1, 0)
		SelectedText.Position = UDim2.new(0, 8, 0, 0)
		SelectedText.BackgroundTransparency = 1
		SelectedText.TextColor3 = Color3.fromRGB(255, 255, 255)
		SelectedText.TextSize = 14
		SelectedText.Font = Enum.Font.Gotham
		SelectedText.TextXAlignment = Enum.TextXAlignment.Left
		SelectedText.Text = default
		SelectedText.Parent = DropdownButton
		SelectedText.ClipsDescendants = true
		SelectedText.TextTruncate = Enum.TextTruncate.AtEnd

		local ArrowIcon = Instance.new("ImageLabel")
		ArrowIcon.Name = "ArrowIcon"
		ArrowIcon.Size = UDim2.new(0, 16, 0, 16)
		ArrowIcon.Position = UDim2.new(1, -24, 0.5, -8)
		ArrowIcon.BackgroundTransparency = 1
		ArrowIcon.Image = "rbxassetid://7072706318"
		ArrowIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)
		ArrowIcon.Parent = DropdownButton

		local OptionContainer = Instance.new("Frame")
		OptionContainer.Name = "OptionContainer"
		OptionContainer.Size = UDim2.new(1, -16, 0, 0)
		OptionContainer.Position = UDim2.new(0, 8, 0, 56)
		OptionContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		OptionContainer.BorderSizePixel = 0
		OptionContainer.ClipsDescendants = true
		OptionContainer.Visible = false
		OptionContainer.Parent = Dropdown

		local UICornerOptionContainer = Instance.new("UICorner")
		UICornerOptionContainer.CornerRadius = UDim.new(0, 4)
		UICornerOptionContainer.Parent = OptionContainer

		local OptionList = Instance.new("ScrollingFrame")
		OptionList.Name = "OptionList"
		OptionList.Size = UDim2.new(1, 0, 1, 0)
		OptionList.BackgroundTransparency = 1
		OptionList.BorderSizePixel = 0
		OptionList.ScrollBarThickness = 2
		OptionList.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
		OptionList.Parent = OptionContainer
		OptionList.CanvasSize = UDim2.new(0, 0, 0, 0)
		OptionList.AutomaticCanvasSize = Enum.AutomaticSize.Y

		local OptionListLayout = Instance.new("UIListLayout")
		OptionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		OptionListLayout.Padding = UDim.new(0, 4)
		OptionListLayout.Parent = OptionList

		local OptionListPadding = Instance.new("UIPadding")
		OptionListPadding.PaddingTop = UDim.new(0, 4)
		OptionListPadding.PaddingLeft = UDim.new(0, 4)
		OptionListPadding.PaddingRight = UDim.new(0, 4)
		OptionListPadding.PaddingBottom = UDim.new(0, 4)
		OptionListPadding.Parent = OptionList

		local function updateDropdown()
			if #options > 0 then
				local optionHeight = math.min(#options * 28 + (#options - 1) * 4 + 8, 120)

				if open then
					OptionContainer.Visible = true

					local dropdownTween = TweenService:Create(
						DropdownFrame,
						TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{Size = UDim2.new(1, 0, 0, 56 + optionHeight)}
					)

					local containerTween = TweenService:Create(
						OptionContainer,
						TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
						{Size = UDim2.new(1, -16, 0, optionHeight)}
					)

					local arrowTween = TweenService:Create(
						ArrowIcon,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 180}
					)

					dropdownTween:Play()
					containerTween:Play()
					arrowTween:Play()
					OptionList.CanvasPosition = Vector2.new(0, 0)
				else
					local dropdownTween = TweenService:Create(
						DropdownFrame,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(1, 0, 0, 56)}
					)

					local containerTween = TweenService:Create(
						OptionContainer,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(1, -16, 0, 0)}
					)

					local arrowTween = TweenService:Create(
						ArrowIcon,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0}
					)

					dropdownTween:Play()
					containerTween:Play()
					arrowTween:Play()

					containerTween.Completed:Connect(function()
						if not open then
							OptionContainer.Visible = false
						end
					end)
				end
			end
		end

		local function createOption(option, index)
			local OptionButton = Instance.new("TextButton")
			OptionButton.Name = "Option_"..option
			OptionButton.Size = UDim2.new(1, 0, 0, 28)
			OptionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			OptionButton.BorderSizePixel = 0
			OptionButton.Text = ""
			OptionButton.AutoButtonColor = false
			OptionButton.LayoutOrder = index
			OptionButton.Parent = OptionList
			OptionButton.BackgroundTransparency = 1

			local UICornerOption = Instance.new("UICorner")
			UICornerOption.CornerRadius = UDim.new(0, 4)
			UICornerOption.Parent = OptionButton

			local OptionLabel = Instance.new("TextLabel")
			OptionLabel.Name = "OptionLabel"
			OptionLabel.Size = UDim2.new(1, -8, 1, 0)
			OptionLabel.Position = UDim2.new(0, 8, 0, 0)
			OptionLabel.BackgroundTransparency = 1
			OptionLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
			OptionLabel.TextSize = 14
			OptionLabel.Font = Enum.Font.Gotham
			OptionLabel.TextXAlignment = Enum.TextXAlignment.Left
			OptionLabel.Text = option
			OptionLabel.ClipsDescendants = true
			OptionLabel.TextTruncate = Enum.TextTruncate.AtEnd
			OptionLabel.Parent = OptionButton
			OptionLabel.TextTransparency = 1

			TweenService:Create(OptionButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, index * 0.05), {
				BackgroundTransparency = 0
			}):Play()

			TweenService:Create(OptionLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, index * 0.05), {
				TextTransparency = 0
			}):Play()

			OptionButton.MouseEnter:Connect(function()
				TweenService:Create(OptionButton, TweenInfo.new(0.2), {
					BackgroundColor3 = Color3.fromRGB(55, 55, 55)
				}):Play()
			end)

			OptionButton.MouseLeave:Connect(function()
				TweenService:Create(OptionButton, TweenInfo.new(0.2), {
					BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				}):Play()
			end)

			OptionButton.MouseButton1Click:Connect(function()
				local selectionEffect = Instance.new("Frame")
				selectionEffect.Size = UDim2.new(1, 0, 1, 0)
				selectionEffect.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
				selectionEffect.BackgroundTransparency = 0.8
				selectionEffect.BorderSizePixel = 0
				selectionEffect.ZIndex = 2
				selectionEffect.Parent = OptionButton

				local selectionCorner = Instance.new("UICorner")
				selectionCorner.CornerRadius = UDim.new(0, 4)
				selectionCorner.Parent = selectionEffect

				TweenService:Create(selectionEffect, TweenInfo.new(0.3), {
					BackgroundTransparency = 1
				}):Play()

				game:GetService("Debris"):AddItem(selectionEffect, 0.3)

				SelectedText.Text = option
				open = false
				updateDropdown()
				callback(option)
			end)
		end

		local function updateOptions()
			for _, child in ipairs(OptionList:GetChildren()) do
				if child:IsA("TextButton") then
					child:Destroy()
				end
			end

			for i, option in ipairs(options) do
				createOption(option, i)
			end
		end

		DropdownButton.MouseEnter:Connect(function()
			TweenService:Create(DropdownButton, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			}):Play()
		end)

		DropdownButton.MouseLeave:Connect(function()
			TweenService:Create(DropdownButton, TweenInfo.new(0.2), {
				BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			}):Play()
		end)

		DropdownButton.MouseButton1Click:Connect(function()
			open = not open
			updateDropdown()
		end)

		updateOptions()

		local DropdownMethods = {}

		function DropdownMethods:SetOptions(newOptions)
			options = newOptions or {}
			updateOptions()
			if open then
				updateDropdown()
			end
			return self
		end

		function DropdownMethods:SetValue(value)
			if table.find(options, value) then
				SelectedText.Text = value
				callback(value)
			end
			return self
		end

		function DropdownMethods:GetValue()
			return SelectedText.Text
		end

		function DropdownMethods:SetName(newText)
			DropdownText.Text = newText
			return self
		end

		function DropdownMethods:SetVisible(visible)
			DropdownFrame.Visible = visible
			return self
		end

		function DropdownMethods:Update(newArgs)
			if newArgs.Options or newArgs.options or newArgs.List or newArgs.list then
				self:SetOptions(newArgs.Options or newArgs.options or newArgs.List or newArgs.list)
			end

			if newArgs.Default or newArgs.default or newArgs.Value or newArgs.value then
				self:SetValue(newArgs.Default or newArgs.default or newArgs.Value or newArgs.value)
			end

			if newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title then
				self:SetName(newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title)
			end

			if newArgs.Callback or newArgs.callback then
				callback = newArgs.Callback or newArgs.callback
			end
			return self
		end

		return DropdownMethods
	end

	function sectionFunctions:ColorPicker(args)
		local text = args.Name or args.Text or args.title or args.Title or "Color Picker"
		local defaultColor = args.Default or args.default or args.Value or args.value or Color3.fromRGB(255, 0, 0)
		local callback = args.Callback or args.callback or function() end

		local h, s, v = Color3.toHSV(defaultColor)
		local r, g, b = defaultColor.R, defaultColor.G, defaultColor.B

		local UserInputService = game:GetService("UserInputService")
		local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
		local TweenService = game:GetService("TweenService")

		local ColorPickerFrame = Instance.new("Frame")
		ColorPickerFrame.Name = text.."ColorPickerFrame"
		ColorPickerFrame.Size = UDim2.new(1, 0, 0, 56)
		ColorPickerFrame.BackgroundTransparency = 1
		ColorPickerFrame.Parent = TabContent

		local ColorPicker = Instance.new("Frame")
		ColorPicker.Name = text.."ColorPicker"
		ColorPicker.Size = UDim2.new(1, 0, 0, 56)
		ColorPicker.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		ColorPicker.BorderSizePixel = 0
		ColorPicker.Parent = ColorPickerFrame

		local UICornerColorPicker = Instance.new("UICorner")
		UICornerColorPicker.CornerRadius = UDim.new(0, 6)
		UICornerColorPicker.Parent = ColorPicker

		local ColorPickerText = Instance.new("TextLabel")
		ColorPickerText.Name = "ColorPickerText"
		ColorPickerText.Size = UDim2.new(1, -8, 0, 20)
		ColorPickerText.Position = UDim2.new(0, 8, 0, 6)
		ColorPickerText.BackgroundTransparency = 1
		ColorPickerText.TextColor3 = Color3.fromRGB(230, 230, 230)
		ColorPickerText.TextSize = isMobile and 16 or 14
		ColorPickerText.Font = Enum.Font.GothamMedium
		ColorPickerText.TextXAlignment = Enum.TextXAlignment.Left
		ColorPickerText.Text = text
		ColorPickerText.Parent = ColorPicker

		local ColorDisplay = Instance.new("Frame")
		ColorDisplay.Name = "ColorDisplay"
		ColorDisplay.Size = UDim2.new(0, 24, 0, 24)
		ColorDisplay.Position = UDim2.new(1, -32, 0, 16)
		ColorDisplay.BackgroundColor3 = defaultColor
		ColorDisplay.BorderSizePixel = 0
		ColorDisplay.Parent = ColorPicker

		local UICornerColorDisplay = Instance.new("UICorner")
		UICornerColorDisplay.CornerRadius = UDim.new(0, 4)
		UICornerColorDisplay.Parent = ColorDisplay

		local ColorPickerButton = Instance.new("TextButton")
		ColorPickerButton.Name = "ColorPickerButton"
		ColorPickerButton.Size = UDim2.new(1, -120, 0, 24)
		ColorPickerButton.Position = UDim2.new(0, 8, 0, 28)
		ColorPickerButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		ColorPickerButton.BorderSizePixel = 0
		ColorPickerButton.Text = ""
		ColorPickerButton.AutoButtonColor = false
		ColorPickerButton.Parent = ColorPicker

		local UICornerButton = Instance.new("UICorner")
		UICornerButton.CornerRadius = UDim.new(0, 4)
		UICornerButton.Parent = ColorPickerButton

		local ColorHexDisplay = Instance.new("TextLabel")
		ColorHexDisplay.Name = "ColorHexDisplay"
		ColorHexDisplay.Size = UDim2.new(1, -16, 1, 0)
		ColorHexDisplay.Position = UDim2.new(0, 8, 0, 0)
		ColorHexDisplay.BackgroundTransparency = 1
		ColorHexDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
		ColorHexDisplay.TextSize = isMobile and 16 or 14
		ColorHexDisplay.Font = Enum.Font.Gotham
		ColorHexDisplay.TextXAlignment = Enum.TextXAlignment.Left
		ColorHexDisplay.Text = string.format("#%02X%02X%02X", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))
		ColorHexDisplay.Parent = ColorPickerButton

		local ColorPickerPopup = Instance.new("Frame")
		ColorPickerPopup.Name = "ColorPickerPopup"
		ColorPickerPopup.Size = UDim2.new(0, 300, 0, 350)
		ColorPickerPopup.Position = UDim2.new(0.5, -150, 0.5, -175)
		ColorPickerPopup.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		ColorPickerPopup.BorderSizePixel = 0
		ColorPickerPopup.Visible = false
		ColorPickerPopup.Parent = CoreGui.ModernUI
		ColorPickerPopup.ZIndex = 100

		local UICornerPopup = Instance.new("UICorner")
		UICornerPopup.CornerRadius = UDim.new(0, 6)
		UICornerPopup.Parent = ColorPickerPopup

		local Shadow = Instance.new("ImageLabel")
		Shadow.Name = "Shadow"
		Shadow.Size = UDim2.new(1, 40, 1, 40)
		Shadow.Position = UDim2.new(0, -20, 0, -20)
		Shadow.BackgroundTransparency = 1
		Shadow.Image = "rbxassetid://6015897843"
		Shadow.ImageColor3 = Color3.new(0, 0, 0)
		Shadow.ImageTransparency = 0.6
		Shadow.ScaleType = Enum.ScaleType.Slice
		Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
		Shadow.ZIndex = 99
		Shadow.Parent = ColorPickerPopup

		local TopBar = Instance.new("Frame")
		TopBar.Name = "TopBar"
		TopBar.Size = UDim2.new(1, 0, 0, 40)
		TopBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		TopBar.BorderSizePixel = 0
		TopBar.ZIndex = 101
		TopBar.Parent = ColorPickerPopup

		local UICornerTopBar = Instance.new("UICorner")
		UICornerTopBar.CornerRadius = UDim.new(0, 6)
		UICornerTopBar.Parent = TopBar

		local BottomFrame = Instance.new("Frame")
		BottomFrame.Name = "BottomFrame"
		BottomFrame.Size = UDim2.new(1, 0, 0, 20)
		BottomFrame.Position = UDim2.new(0, 0, 1, -20)
		BottomFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		BottomFrame.BorderSizePixel = 0
		BottomFrame.ZIndex = 100
		BottomFrame.Parent = TopBar

		local TitleLabel = Instance.new("TextLabel")
		TitleLabel.Name = "TitleLabel"
		TitleLabel.Size = UDim2.new(1, -50, 1, 0)
		TitleLabel.Position = UDim2.new(0, 10, 0, 0)
		TitleLabel.BackgroundTransparency = 1
		TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
		TitleLabel.TextSize = 16
		TitleLabel.Font = Enum.Font.GothamBold
		TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
		TitleLabel.Text = text .. " - Color Picker"
		TitleLabel.ZIndex = 102
		TitleLabel.Parent = TopBar

		local CloseButton = Instance.new("TextButton")
		CloseButton.Name = "CloseButton"
		CloseButton.Size = UDim2.new(0, 30, 0, 30)
		CloseButton.Position = UDim2.new(1, -35, 0, 5)
		CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		CloseButton.BorderSizePixel = 0
		CloseButton.Text = "X"
		CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseButton.TextSize = 16
		CloseButton.Font = Enum.Font.GothamBold
		CloseButton.ZIndex = 102
		CloseButton.Parent = TopBar

		local UICornerClose = Instance.new("UICorner")
		UICornerClose.CornerRadius = UDim.new(0, 6)
		UICornerClose.Parent = CloseButton

		local ColorPickerContainer = Instance.new("Frame")
		ColorPickerContainer.Name = "ColorPickerContainer"
		ColorPickerContainer.Size = UDim2.new(1, -20, 1, -60)
		ColorPickerContainer.Position = UDim2.new(0, 10, 0, 50)
		ColorPickerContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		ColorPickerContainer.BorderSizePixel = 0
		ColorPickerContainer.ZIndex = 101
		ColorPickerContainer.Parent = ColorPickerPopup

		local UICornerContainer = Instance.new("UICorner")
		UICornerContainer.CornerRadius = UDim.new(0, 6)
		UICornerContainer.Parent = ColorPickerContainer

		local ColorPalette = Instance.new("ImageLabel")
		ColorPalette.Name = "ColorPalette"
		ColorPalette.Size = UDim2.new(1, -20, 0, 150)
		ColorPalette.Position = UDim2.new(0, 10, 0, 10)
		ColorPalette.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
		ColorPalette.BorderSizePixel = 0
		ColorPalette.Image = "rbxassetid://4155801252"
		ColorPalette.ScaleType = Enum.ScaleType.Stretch
		ColorPalette.ZIndex = 102
		ColorPalette.Parent = ColorPickerContainer

		local UICornerPalette = Instance.new("UICorner")
		UICornerPalette.CornerRadius = UDim.new(0, 4)
		UICornerPalette.Parent = ColorPalette

		local ColorPaletteCursor = Instance.new("Frame")
		ColorPaletteCursor.Name = "ColorPaletteCursor"
		ColorPaletteCursor.Size = UDim2.new(0, isMobile and 14 or 10, 0, isMobile and 14 or 10)
		ColorPaletteCursor.AnchorPoint = Vector2.new(0.5, 0.5)
		ColorPaletteCursor.Position = UDim2.new(s, 0, 1 - v, 0)
		ColorPaletteCursor.BackgroundColor3 = Color3.new(1, 1, 1)
		ColorPaletteCursor.BorderSizePixel = 0
		ColorPaletteCursor.ZIndex = 103
		ColorPaletteCursor.Parent = ColorPalette

		local UICornerPaletteCursor = Instance.new("UICorner")
		UICornerPaletteCursor.CornerRadius = UDim.new(1, 0)
		UICornerPaletteCursor.Parent = ColorPaletteCursor

		local HueBar = Instance.new("Frame")
		HueBar.Name = "HueBar"
		HueBar.Size = UDim2.new(1, -20, 0, isMobile and 24 or 16)
		HueBar.Position = UDim2.new(0, 10, 0, 170)
		HueBar.BackgroundTransparency = 0
		HueBar.BorderSizePixel = 0
		HueBar.ZIndex = 102
		HueBar.Parent = ColorPickerContainer

		local HueGradient = Instance.new("UIGradient")
		HueGradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(0.1667, Color3.fromRGB(255, 255, 0)),
			ColorSequenceKeypoint.new(0.3333, Color3.fromRGB(0, 255, 0)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
			ColorSequenceKeypoint.new(0.6667, Color3.fromRGB(0, 0, 255)),
			ColorSequenceKeypoint.new(0.8333, Color3.fromRGB(255, 0, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
		})
		HueGradient.Parent = HueBar

		local UICornerHueBar = Instance.new("UICorner")
		UICornerHueBar.CornerRadius = UDim.new(0, 4)
		UICornerHueBar.Parent = HueBar

		local HueBarCursor = Instance.new("Frame")
		HueBarCursor.Name = "HueBarCursor"
		HueBarCursor.Size = UDim2.new(0, isMobile and 6 or 4, 1, 0)
		HueBarCursor.Position = UDim2.new(h, 0, 0, 0)
		HueBarCursor.BackgroundColor3 = Color3.new(1, 1, 1)
		HueBarCursor.BorderSizePixel = 0
		HueBarCursor.ZIndex = 103
		HueBarCursor.Parent = HueBar

		local UICornerHueCursor = Instance.new("UICorner")
		UICornerHueCursor.CornerRadius = UDim.new(0, 2)
		UICornerHueCursor.Parent = HueBarCursor

		local RGBDisplay = Instance.new("TextLabel")
		RGBDisplay.Name = "RGBDisplay"
		RGBDisplay.Size = UDim2.new(1, -20, 0, 30)
		RGBDisplay.Position = UDim2.new(0, 10, 0, 200)
		RGBDisplay.BackgroundTransparency = 1
		RGBDisplay.TextColor3 = Color3.fromRGB(230, 230, 230)
		RGBDisplay.TextSize = 14
		RGBDisplay.Font = Enum.Font.Gotham
		RGBDisplay.TextXAlignment = Enum.TextXAlignment.Left
		RGBDisplay.Text = string.format("RGB: %d,%d,%d", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))
		RGBDisplay.ZIndex = 102
		RGBDisplay.Parent = ColorPickerContainer

		local ButtonsContainer = Instance.new("Frame")
		ButtonsContainer.Name = "ButtonsContainer"
		ButtonsContainer.Size = UDim2.new(1, -20, 0, 40)
		ButtonsContainer.Position = UDim2.new(0, 10, 1, -50)
		ButtonsContainer.ZIndex = 102
		ButtonsContainer.Transparency = 1
		ButtonsContainer.Parent = ColorPickerContainer

		local CancelButton = Instance.new("TextButton")
		CancelButton.Name = "CancelButton"
		CancelButton.Size = UDim2.new(0.48, 0, 1, 0)
		CancelButton.Position = UDim2.new(0, 0, 0, 0)
		CancelButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		CancelButton.BorderSizePixel = 0
		CancelButton.Text = "Cancel"
		CancelButton.TextColor3 = Color3.fromRGB(230, 230, 230)
		CancelButton.TextSize = isMobile and 16 or 14
		CancelButton.Font = Enum.Font.GothamMedium
		CancelButton.ZIndex = 102
		CancelButton.Parent = ButtonsContainer
		CancelButton.AutoButtonColor = false

		local UICornerCancel = Instance.new("UICorner")
		UICornerCancel.CornerRadius = UDim.new(0, 4)
		UICornerCancel.Parent = CancelButton

		local OkButton = Instance.new("TextButton")
		OkButton.Name = "OkButton"
		OkButton.Size = UDim2.new(0.48, 0, 1, 0)
		OkButton.Position = UDim2.new(0.52, 0, 0, 0)
		OkButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
		OkButton.BorderSizePixel = 0
		OkButton.Text = "Confirm"
		OkButton.TextColor3 = Color3.fromRGB(230, 230, 230)
		OkButton.TextSize = isMobile and 16 or 14
		OkButton.Font = Enum.Font.GothamMedium
		OkButton.ZIndex = 102
		OkButton.Parent = ButtonsContainer
		OkButton.AutoButtonColor = false

		local UICornerOk = Instance.new("UICorner")
		UICornerOk.CornerRadius = UDim.new(0, 4)
		UICornerOk.Parent = OkButton

		local initialColor = defaultColor
		local currentColor = defaultColor
		
		local dragInput, dragStart, startPos
		local function update(input)
			local delta = input.Position - dragStart
			ColorPickerPopup.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y
			)
		end

		TopBar.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				dragStart = input.Position
				startPos = ColorPickerPopup.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragStart = nil
					end
				end)
			end
		end)

		TopBar.InputChanged:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				dragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragStart then
				update(input)
			end
		end)

		local function updateColorFromRGB()
			currentColor = Color3.fromRGB(r * 255, g * 255, b * 255)
			ColorDisplay.BackgroundColor3 = currentColor
			ColorHexDisplay.Text = string.format("#%02X%02X%02X", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))
			RGBDisplay.Text = string.format("RGB: %d,%d,%d", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))

			h, s, v = Color3.toHSV(currentColor)
			ColorPalette.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
			HueBarCursor.Position = UDim2.new(h, 0, 0, 0)
			ColorPaletteCursor.Position = UDim2.new(s, 0, 1 - v, 0)
		end

		local function updateColorFromHSV()
			currentColor = Color3.fromHSV(h, s, v)
			ColorDisplay.BackgroundColor3 = currentColor

			r, g, b = currentColor.R, currentColor.G, currentColor.B

			ColorHexDisplay.Text = string.format("#%02X%02X%02X", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))
			RGBDisplay.Text = string.format("RGB: %d,%d,%d", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))
		end

		local function handleColorPaletteInput(inputObject, inputType)
			if inputType == "Begin" then
				local dragging = true

				local function updatePalette(inputPosition)
					local palettePosition = ColorPalette.AbsolutePosition
					local paletteSize = ColorPalette.AbsoluteSize

					local relativeX = math.clamp(inputPosition.X - palettePosition.X, 0, paletteSize.X)
					local relativeY = math.clamp(inputPosition.Y - palettePosition.Y, 0, paletteSize.Y)

					s = relativeX / paletteSize.X
					v = 1 - (relativeY / paletteSize.Y)

					ColorPaletteCursor.Position = UDim2.new(s, 0, 1 - v, 0)
					updateColorFromHSV()
				end

				if UserInputService.TouchEnabled then
					updatePalette(inputObject.Position)
				else
					updatePalette(game:GetService("Players").LocalPlayer:GetMouse())
				end

				local moveConnection
				moveConnection = UserInputService.InputChanged:Connect(function(inputChanged)
					if dragging then
						if (inputChanged.UserInputType == Enum.UserInputType.MouseMovement or 
							inputChanged.UserInputType == Enum.UserInputType.Touch) then
							if UserInputService.TouchEnabled and inputChanged.UserInputType == Enum.UserInputType.Touch then
								updatePalette(inputChanged.Position)
							elseif inputChanged.UserInputType == Enum.UserInputType.MouseMovement then
								updatePalette(game:GetService("Players").LocalPlayer:GetMouse())
							end
						end
					end
				end)

				local endConnection
				endConnection = UserInputService.InputEnded:Connect(function(inputEnd)
					if (inputEnd.UserInputType == Enum.UserInputType.MouseButton1 or 
						inputEnd.UserInputType == Enum.UserInputType.Touch) then
						dragging = false
						moveConnection:Disconnect()
						endConnection:Disconnect()
					end
				end)
			end
		end

		local function handleHueBarInput(inputObject, inputType)
			if inputType == "Begin" then
				local dragging = true

				local function updateHue(inputPosition)
					local barPosition = HueBar.AbsolutePosition
					local barSize = HueBar.AbsoluteSize

					local relativeX = math.clamp(inputPosition.X - barPosition.X, 0, barSize.X)
					h = relativeX / barSize.X

					HueBarCursor.Position = UDim2.new(h, 0, 0, 0)
					ColorPalette.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
					updateColorFromHSV()
				end

				if UserInputService.TouchEnabled then
					updateHue(inputObject.Position)
				else
					updateHue(game:GetService("Players").LocalPlayer:GetMouse())
				end

				local moveConnection
				moveConnection = UserInputService.InputChanged:Connect(function(inputChanged)
					if dragging then
						if (inputChanged.UserInputType == Enum.UserInputType.MouseMovement or 
							inputChanged.UserInputType == Enum.UserInputType.Touch) then
							if UserInputService.TouchEnabled and inputChanged.UserInputType == Enum.UserInputType.Touch then
								updateHue(inputChanged.Position)
							elseif inputChanged.UserInputType == Enum.UserInputType.MouseMovement then
								updateHue(game:GetService("Players").LocalPlayer:GetMouse())
							end
						end
					end
				end)

				local endConnection
				endConnection = UserInputService.InputEnded:Connect(function(inputEnd)
					if (inputEnd.UserInputType == Enum.UserInputType.MouseButton1 or 
						inputEnd.UserInputType == Enum.UserInputType.Touch) then
						dragging = false
						moveConnection:Disconnect()
						endConnection:Disconnect()
					end
				end)
			end
		end

		ColorPalette.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				handleColorPaletteInput(input, "Begin")
			end
		end)

		HueBar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				handleHueBarInput(input, "Begin")
			end
		end)

		OkButton.MouseEnter:Connect(function()
			TweenService:Create(OkButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(75, 75, 75)}):Play()
		end)

		OkButton.MouseLeave:Connect(function()
			TweenService:Create(OkButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(65, 65, 65)}):Play()
		end)

		OkButton.Activated:Connect(function()
			local fadeTween = TweenService:Create(ColorPickerPopup, TweenInfo.new(0.3), {BackgroundTransparency = 1})
			fadeTween:Play()
			fadeTween.Completed:Connect(function()
				ColorPickerPopup.Visible = false
				ColorPickerPopup.BackgroundTransparency = 0
			end)

			callback(ColorDisplay.BackgroundColor3)
		end)

		CancelButton.MouseEnter:Connect(function()
			TweenService:Create(CancelButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
		end)

		CancelButton.MouseLeave:Connect(function()
			TweenService:Create(CancelButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
		end)

		CancelButton.Activated:Connect(function()
			currentColor = initialColor
			r, g, b = currentColor.R, currentColor.G, currentColor.B
			ColorDisplay.BackgroundColor3 = currentColor
			ColorHexDisplay.Text = string.format("#%02X%02X%02X", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))

			local fadeTween = TweenService:Create(ColorPickerPopup, TweenInfo.new(0.3), {BackgroundTransparency = 1})
			fadeTween:Play()
			fadeTween.Completed:Connect(function()
				ColorPickerPopup.Visible = false
				ColorPickerPopup.BackgroundTransparency = 0
			end)
		end)

		CloseButton.Activated:Connect(function()
			currentColor = initialColor
			r, g, b = currentColor.R, currentColor.G, currentColor.B
			ColorDisplay.BackgroundColor3 = currentColor
			ColorHexDisplay.Text = string.format("#%02X%02X%02X", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))

			local fadeTween = TweenService:Create(ColorPickerPopup, TweenInfo.new(0.3), {BackgroundTransparency = 1})
			fadeTween:Play()
			fadeTween.Completed:Connect(function()
				ColorPickerPopup.Visible = false
				ColorPickerPopup.BackgroundTransparency = 0
			end)
		end)

		ColorPickerButton.Activated:Connect(function()
			initialColor = ColorDisplay.BackgroundColor3
			h, s, v = Color3.toHSV(initialColor)
			r, g, b = initialColor.R, initialColor.G, initialColor.B

			ColorPalette.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
			HueBarCursor.Position = UDim2.new(h, 0, 0, 0)
			ColorPaletteCursor.Position = UDim2.new(s, 0, 1 - v, 0)

			ColorPickerPopup.BackgroundTransparency = 1
			ColorPickerPopup.Visible = true
			TweenService:Create(ColorPickerPopup, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
		end)

		ColorPickerButton.MouseEnter:Connect(function()
			TweenService:Create(ColorPickerButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
		end)

		ColorPickerButton.MouseLeave:Connect(function()
			TweenService:Create(ColorPickerButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
		end)

		local ButtonPadding = Instance.new("UIPadding")
		ButtonPadding.PaddingTop = UDim.new(0, 8)
		ButtonPadding.PaddingBottom = UDim.new(0, 8)
		ButtonPadding.Parent = ColorPickerFrame

		local ColorPickerMethods = {}

		function ColorPickerMethods:SetColor(color)
			if typeof(color) == "Color3" then
				r, g, b = color.R, color.G, color.B
				h, s, v = Color3.toHSV(color)

				ColorDisplay.BackgroundColor3 = color
				ColorHexDisplay.Text = string.format("#%02X%02X%02X", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))

				if ColorPickerPopup.Visible then
					ColorPalette.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
					HueBarCursor.Position = UDim2.new(h, 0, 0, 0)
					ColorPaletteCursor.Position = UDim2.new(s, 0, 1 - v, 0)
					RGBDisplay.Text = string.format("RGB: %d,%d,%d", math.floor(r * 255), math.floor(g * 255), math.floor(b * 255))
				end

				callback(color)
			end
			return self
		end

		function ColorPickerMethods:GetColor()
			return ColorDisplay.BackgroundColor3
		end

		function ColorPickerMethods:SetName(newText)
			ColorPickerText.Text = newText
			if ColorPickerPopup then
				TitleLabel.Text = newText .. " - Color Picker"
			end
			return self
		end

		function ColorPickerMethods:SetVisible(visible)
			ColorPickerFrame.Visible = visible
			return self
		end

		function ColorPickerMethods:Update(newArgs)
			if newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title then
				local newText = newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title
				self:SetName(newText)
			end

			if newArgs.Default or newArgs.default or newArgs.Value or newArgs.value then
				local newColor = newArgs.Default or newArgs.default or newArgs.Value or newArgs.value
				self:SetColor(newColor)
			end

			if newArgs.Callback or newArgs.callback then
				callback = newArgs.Callback or newArgs.callback
			end
			return self
		end

		return ColorPickerMethods
	end

	function sectionFunctions:Toggle(args)
		local text = args.Name or args.Text or args.title or args.Title or "Toggle"
		local default = args.Default or args.default or args.Value or args.value or false
		local callback = args.Callback or args.callback or function() end

		local ToggleFrame = Instance.new("Frame")
		ToggleFrame.Name = text.."ToggleFrame"
		ToggleFrame.Size = UDim2.new(1, 0, 0, 36)
		ToggleFrame.BackgroundTransparency = 1
		ToggleFrame.Parent = TabContent

		local Toggle = Instance.new("TextButton")
		Toggle.Name = text.."Toggle"
		Toggle.Size = UDim2.new(1, 0, 1, 0)
		Toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Toggle.BorderSizePixel = 0
		Toggle.Text = ""
		Toggle.AutoButtonColor = false
		Toggle.Parent = ToggleFrame

		local UICornerToggle = Instance.new("UICorner")
		UICornerToggle.CornerRadius = UDim.new(0, 6)
		UICornerToggle.Parent = Toggle

		local ToggleText = Instance.new("TextLabel")
		ToggleText.Name = "ToggleText"
		ToggleText.Size = UDim2.new(1, -56, 1, 0)
		ToggleText.Position = UDim2.new(0, 8, 0, 0)
		ToggleText.BackgroundTransparency = 1
		ToggleText.TextColor3 = Color3.fromRGB(230, 230, 230)
		ToggleText.TextSize = 14
		ToggleText.Font = Enum.Font.GothamMedium
		ToggleText.TextXAlignment = Enum.TextXAlignment.Left
		ToggleText.Text = text
		ToggleText.Parent = Toggle

		local ToggleBackground = Instance.new("Frame")
		ToggleBackground.Name = "ToggleBackground"
		ToggleBackground.Size = UDim2.new(0, 36, 0, 18)
		ToggleBackground.Position = UDim2.new(1, -44, 0.5, -9)
		ToggleBackground.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		ToggleBackground.BorderSizePixel = 0
		ToggleBackground.Parent = Toggle

		local UICornerToggleBg = Instance.new("UICorner")
		UICornerToggleBg.CornerRadius = UDim.new(1, 0)
		UICornerToggleBg.Parent = ToggleBackground

		local ToggleIndicator = Instance.new("Frame")
		ToggleIndicator.Name = "ToggleIndicator"
		ToggleIndicator.Size = UDim2.new(0, 14, 0, 14)
		ToggleIndicator.Position = UDim2.new(0, 2, 0.5, -7)
		ToggleIndicator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
		ToggleIndicator.BorderSizePixel = 0
		ToggleIndicator.Parent = ToggleBackground

		local UICornerIndicator = Instance.new("UICorner")
		UICornerIndicator.CornerRadius = UDim.new(1, 0)
		UICornerIndicator.Parent = ToggleIndicator

		local toggled = default
		local TweenService = game:GetService("TweenService")

		local function updateToggle()
			if toggled then
				TweenService:Create(ToggleBackground, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 162, 255)}):Play()
				TweenService:Create(ToggleIndicator, TweenInfo.new(0.3), {Position = UDim2.new(1, -16, 0.5, -7), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			else
				TweenService:Create(ToggleBackground, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
				TweenService:Create(ToggleIndicator, TweenInfo.new(0.3), {Position = UDim2.new(0, 2, 0.5, -7), BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
			end

			callback(toggled)
		end

		updateToggle()

		Toggle.MouseEnter:Connect(function()
			TweenService:Create(Toggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}):Play()
		end)

		Toggle.MouseLeave:Connect(function()
			TweenService:Create(Toggle, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
		end)

		Toggle.MouseButton1Click:Connect(function()
			toggled = not toggled
			updateToggle()
		end)

		local ToggleMethods = {}

		function ToggleMethods:Set(value)
			if toggled ~= value then
				toggled = value
				updateToggle()
			end
			return self
		end

		function ToggleMethods:Get()
			return toggled
		end

		function ToggleMethods:Toggle()
			toggled = not toggled
			updateToggle()
			return self
		end

		function ToggleMethods:Update(newArgs)
			if newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title then
				local newText = newArgs.Text or newArgs.text or newArgs.Name or newArgs.name or newArgs.Title or newArgs.title
				ToggleText.Text = newText
			end

			if newArgs.Default or newArgs.default or newArgs.Value or newArgs.value ~= nil then
				local newValue = newArgs.Default or newArgs.default or newArgs.Value or newArgs.value
				if toggled ~= newValue then
					toggled = newValue
					updateToggle()
				end
			end

			if newArgs.Callback or newArgs.callback then
				callback = newArgs.Callback or newArgs.callback
			end
		end

		return ToggleMethods
	end

	if not _G.NotificationSystem then
		_G.NotificationSystem = {
			Notifications = {},
			Count = 0
		}
	end

	function sectionFunctions:Notification(args)
		local title = args.Title or args.title or "Notificação"
		local message = args.Message or args.message or "Esta é uma notificação"
		local duration = args.Duration or args.duration or 3
		local type = args.Type or args.type or "Info"
		local callback = args.Callback or args.callback or function() end

		_G.NotificationSystem.Count = _G.NotificationSystem.Count + 1
		local notificationID = _G.NotificationSystem.Count

		local MainContainer = CoreGui:FindFirstChild("NotificationMainContainer")
		if not MainContainer then
			MainContainer = Instance.new("Frame")
			MainContainer.Name = "NotificationMainContainer"
			MainContainer.Size = UDim2.new(0, 300, 1, 0)
			MainContainer.Position = UDim2.new(1, -320, 0, 0)
			MainContainer.BackgroundTransparency = 1
			MainContainer.Parent = CoreGui.ModernUI

			local UIListLayout = Instance.new("UIListLayout")
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 10)
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
			UIListLayout.Parent = MainContainer

			local UIPadding = Instance.new("UIPadding")
			UIPadding.PaddingBottom = UDim.new(0, 20)
			UIPadding.Parent = MainContainer
		end

		local NotificationContainer = Instance.new("Frame")
		NotificationContainer.Name = "NotificationContainer_" .. notificationID
		NotificationContainer.Size = UDim2.new(0, 300, 0, 0)
		NotificationContainer.BackgroundTransparency = 1
		NotificationContainer.ClipsDescendants = true
		NotificationContainer.LayoutOrder = -notificationID
		NotificationContainer.Parent = MainContainer

		local Notification = Instance.new("Frame")
		Notification.Name = "Notification"
		Notification.Size = UDim2.new(1, 0, 0, 80)
		Notification.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Notification.BorderSizePixel = 0
		Notification.Position = UDim2.new(0, 0, 0, 0)
		Notification.Parent = NotificationContainer

		local UICornerNotification = Instance.new("UICorner")
		UICornerNotification.CornerRadius = UDim.new(0, 6)
		UICornerNotification.Parent = Notification

		local NotificationIcon = Instance.new("ImageLabel")
		NotificationIcon.Name = "NotificationIcon"
		NotificationIcon.Size = UDim2.new(0, 24, 0, 24)
		NotificationIcon.Position = UDim2.new(0, 12, 0, 10)
		NotificationIcon.BackgroundTransparency = 1

		if type == "Info" then
			NotificationIcon.Image = "rbxassetid://72748255249572"
			NotificationIcon.ImageColor3 = Color3.new(0, 0, 255)
		elseif type == "Success" then
			NotificationIcon.Image = "rbxassetid://74977372712126"
			NotificationIcon.ImageColor3 = Color3.fromRGB(255, 0, 0)
		elseif type == "Warning" then
			NotificationIcon.Image = "rbxassetid://102412656011624"
			NotificationIcon.ImageColor3 = Color3.fromRGB(255, 255, 0)
		elseif type == "Error" then
			NotificationIcon.Image = "rbxassetid://138396534444372"
			NotificationIcon.ImageColor3 = Color3.fromRGB(255, 0, 0)
		end
		NotificationIcon.Parent = Notification

		local TitleLabel = Instance.new("TextLabel")
		TitleLabel.Name = "TitleLabel"
		TitleLabel.Size = UDim2.new(1, -52, 0, 20)
		TitleLabel.Position = UDim2.new(0, 42, 0, 12)
		TitleLabel.BackgroundTransparency = 1
		TitleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
		TitleLabel.TextSize = 16
		TitleLabel.Font = Enum.Font.GothamBold
		TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
		TitleLabel.Text = title
		TitleLabel.Parent = Notification

		local MessageLabel = Instance.new("TextLabel")
		MessageLabel.Name = "MessageLabel"
		MessageLabel.Size = UDim2.new(1, -24, 0, 36)
		MessageLabel.Position = UDim2.new(0, 12, 0, 36)
		MessageLabel.BackgroundTransparency = 1
		MessageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		MessageLabel.TextSize = 14
		MessageLabel.Font = Enum.Font.Gotham
		MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
		MessageLabel.TextYAlignment = Enum.TextYAlignment.Top
		MessageLabel.TextWrapped = true
		MessageLabel.Text = message
		MessageLabel.Parent = Notification

		local CloseButton = Instance.new("TextButton")
		CloseButton.Name = "CloseButton"
		CloseButton.Size = UDim2.new(0, 20, 0, 20)
		CloseButton.Position = UDim2.new(1, -24, 0, 2)
		CloseButton.BackgroundTransparency = 1
		CloseButton.Text = ""
		CloseButton.AutoButtonColor = false
		CloseButton.Parent = Notification

		local CloseIcon = Instance.new("ImageLabel")
		CloseIcon.Name = "CloseIcon"
		CloseIcon.Size = UDim2.new(1, 0, 1, 0)
		CloseIcon.BackgroundTransparency = 1
		CloseIcon.Image = "rbxassetid://7072725342"
		CloseIcon.ImageColor3 = Color3.fromRGB(180, 180, 180)
		CloseIcon.Parent = CloseButton

		local ProgressBarContainer = Instance.new("Frame")
		ProgressBarContainer.Name = "ProgressBarContainer"
		ProgressBarContainer.Size = UDim2.new(1, -16, 0, 4)
		ProgressBarContainer.Position = UDim2.new(0, 8, 1, -8)
		ProgressBarContainer.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		ProgressBarContainer.BorderSizePixel = 0
		ProgressBarContainer.Parent = Notification

		local UICornerProgressContainer = Instance.new("UICorner")
		UICornerProgressContainer.CornerRadius = UDim.new(1, 0)
		UICornerProgressContainer.Parent = ProgressBarContainer

		local ProgressBar = Instance.new("Frame")
		ProgressBar.Name = "ProgressBar"
		ProgressBar.Size = UDim2.new(1, 0, 1, 0)
		ProgressBar.BackgroundColor3 = NotificationIcon.ImageColor3
		ProgressBar.BorderSizePixel = 0
		ProgressBar.Parent = ProgressBarContainer

		local UICornerProgress = Instance.new("UICorner")
		UICornerProgress.CornerRadius = UDim.new(1, 0)
		UICornerProgress.Parent = ProgressBar

		local TimeLabel = Instance.new("TextLabel")
		TimeLabel.Name = "TimeLabel"
		TimeLabel.Size = UDim2.new(0, 40, 0, 20)
		TimeLabel.Position = UDim2.new(1, -62, 0, 0)
		TimeLabel.BackgroundTransparency = 1
		TimeLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
		TimeLabel.TextSize = 12
		TimeLabel.Font = Enum.Font.Gotham
		TimeLabel.Text = string.format("%.0fs", duration)
		TimeLabel.Parent = Notification

		local TweenService = game:GetService("TweenService")

		NotificationContainer.Size = UDim2.new(0, 300, 0, 80)
		Notification.Position = UDim2.new(1, 0, 0, 0)
		TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 0, 0, 0)}):Play()

		local progressTween = TweenService:Create(ProgressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)})
		progressTween:Play()

		local timeRemaining = duration
		local connection = nil
		connection = game:GetService("RunService").Heartbeat:Connect(function(dt)
			timeRemaining = timeRemaining - dt
			if timeRemaining <= 0 then
				TimeLabel.Text = "0s"
				if connection then connection:Disconnect() end
			else
				TimeLabel.Text = string.format("%.0fs", timeRemaining)
			end
		end)

		CloseButton.MouseEnter:Connect(function()
			TweenService:Create(CloseIcon, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		end)

		CloseButton.MouseLeave:Connect(function()
			TweenService:Create(CloseIcon, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(180, 180, 180)}):Play()
		end)

		_G.NotificationSystem.Notifications[notificationID] = {
			Container = NotificationContainer,
			ID = notificationID
		}

		local function updateNotificationPositions()
			local activeCount = 0
			for _, notif in pairs(_G.NotificationSystem.Notifications) do
				if notif.Container and notif.Container.Parent then
					activeCount = activeCount + 1
				end
			end
		end

		local function closeNotification()
			if connection then connection:Disconnect() end
			callback("Closed")

			TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Position = UDim2.new(1, 0, 0, 0)}):Play()

			wait(0.3)
			if NotificationContainer and NotificationContainer.Parent then
				_G.NotificationSystem.Notifications[notificationID] = nil
				NotificationContainer:Destroy()
				updateNotificationPositions()
			end
		end

		CloseButton.MouseButton1Click:Connect(closeNotification)

		delay(duration, function()
			if NotificationContainer and NotificationContainer.Parent then
				callback("Timeout")
				closeNotification()
			end
		end)

		updateNotificationPositions()

		local NotificationMethods = {}

		function NotificationMethods:Update(newArgs)
			if newArgs.Title or newArgs.title then
				TitleLabel.Text = newArgs.Title or newArgs.title
			end

			if newArgs.Message or newArgs.message then
				MessageLabel.Text = newArgs.Message or newArgs.message
			end

			if (newArgs.Duration or newArgs.duration) and timeRemaining > 0 then
				local newDuration = newArgs.Duration or newArgs.duration
				local remainingRatio = timeRemaining / duration
				local newTimeRemaining = newDuration * remainingRatio

				duration = newDuration
				timeRemaining = newTimeRemaining

				if progressTween then
					progressTween:Cancel()
				end

				ProgressBar.Size = UDim2.new(remainingRatio, 0, 1, 0)
				progressTween = TweenService:Create(ProgressBar, TweenInfo.new(newTimeRemaining, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)})
				progressTween:Play()

				TimeLabel.Text = string.format("%.0fs", timeRemaining)
			end
		end

		function NotificationMethods:Close()
			closeNotification()
		end

		function NotificationMethods:GetID()
			return notificationID
		end

		return NotificationMethods
	end

	function sectionFunctions:Slider(args)
		local text = args.Name or args.Text or "Slider"
		local min = args.Min or args.min or 0
		local max = args.Max or args.max or 100
		local default = args.Default or args.default or args.Value or args.value or min
		local callback = args.Callback or args.callback or function() end

		local SliderFrame = Instance.new("Frame")
		SliderFrame.Name = text.."SliderFrame"
		SliderFrame.Size = UDim2.new(1, 0, 0, 56)
		SliderFrame.BackgroundTransparency = 1
		SliderFrame.Parent = TabContent

		local Slider = Instance.new("Frame")
		Slider.Name = text.."Slider"
		Slider.Size = UDim2.new(1, 0, 1, 0)
		Slider.BackgroundColor3 = args.BackgroundColor or args.BackgroundColor3 or Color3.fromRGB(45, 45, 45)
		Slider.BorderSizePixel = 0
		Slider.Parent = SliderFrame

		local UICornerSlider = Instance.new("UICorner")
		UICornerSlider.CornerRadius = UDim.new(0, 6)
		UICornerSlider.Parent = Slider

		local SliderText = Instance.new("TextLabel")
		SliderText.Name = "SliderText"
		SliderText.Size = UDim2.new(1, -8, 0, 20)
		SliderText.Position = UDim2.new(0, 8, 0, 6)
		SliderText.BackgroundTransparency = 1
		SliderText.TextColor3 = args.TextColor or args.TextColor3 or Color3.fromRGB(230, 230, 230)
		SliderText.TextSize = 14
		SliderText.Font = Enum.Font.GothamMedium
		SliderText.TextXAlignment = Enum.TextXAlignment.Left
		SliderText.Text = text
		SliderText.Parent = Slider

		local ValueText = Instance.new("TextLabel")
		ValueText.Name = "ValueText"
		ValueText.Size = UDim2.new(0, 40, 0, 20)
		ValueText.Position = UDim2.new(1, -48, 0, 6)
		ValueText.BackgroundTransparency = 1
		ValueText.TextColor3 = args.TextColor or args.TextColor3 or Color3.fromRGB(230, 230, 230)
		ValueText.TextSize = 14
		ValueText.Font = Enum.Font.GothamMedium
		ValueText.TextXAlignment = Enum.TextXAlignment.Right
		ValueText.Text = tostring(default)
		ValueText.Parent = Slider

		local SliderBackground = Instance.new("Frame")
		SliderBackground.Name = "SliderBackground"
		SliderBackground.Size = UDim2.new(1, -16, 0, 6)
		SliderBackground.Position = UDim2.new(0, 8, 0, 32)
		SliderBackground.BackgroundColor3 = args.SliderBgColor or args.SliderBackgroundColor or Color3.fromRGB(60, 60, 60)
		SliderBackground.BorderSizePixel = 0
		SliderBackground.Parent = Slider

		local UICornerSliderBg = Instance.new("UICorner")
		UICornerSliderBg.CornerRadius = UDim.new(1, 0)
		UICornerSliderBg.Parent = SliderBackground

		local SliderFill = Instance.new("Frame")
		SliderFill.Name = "SliderFill"
		SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
		SliderFill.BackgroundColor3 = args.FillColor or args.SliderFillColor or Color3.fromRGB(0, 162, 255)
		SliderFill.BorderSizePixel = 0
		SliderFill.Parent = SliderBackground

		local UICornerSliderFill = Instance.new("UICorner")
		UICornerSliderFill.CornerRadius = UDim.new(1, 0)
		UICornerSliderFill.Parent = SliderFill

		local SliderIndicator = Instance.new("Frame")
		SliderIndicator.Name = "SliderIndicator"
		SliderIndicator.Size = UDim2.new(0, 16, 0, 16)
		SliderIndicator.Position = UDim2.new((default - min) / (max - min), 0, 0.5, -8)
		SliderIndicator.BackgroundColor3 = args.IndicatorColor or args.SliderIndicatorColor or Color3.fromRGB(255, 255, 255)
		SliderIndicator.BorderSizePixel = 0
		SliderIndicator.AnchorPoint = Vector2.new(0.5, 0)
		SliderIndicator.Parent = SliderBackground

		local UICornerIndicator = Instance.new("UICorner")
		UICornerIndicator.CornerRadius = UDim.new(1, 0)
		UICornerIndicator.Parent = SliderIndicator

		local value = default
		local dragging = false

		local function updateSlider()
			value = math.clamp(value, min, max)
			local percent = (value - min) / (max - min)

			SliderFill.Size = UDim2.new(percent, 0, 1, 0)
			SliderIndicator.Position = UDim2.new(percent, 0, 0.5, -8)
			ValueText.Text = tostring(math.floor(value))

			callback(value)
		end

		updateSlider()

		local function handleInputPosition(input)
			local inputPosition
			if input.UserInputType == Enum.UserInputType.MouseMovement or 
				input.UserInputType == Enum.UserInputType.MouseButton1 then
				inputPosition = input.Position
			elseif input.UserInputType == Enum.UserInputType.Touch then
				inputPosition = input.Position
			end

			if inputPosition then
				local percent = math.clamp((inputPosition.X - SliderBackground.AbsolutePosition.X) / SliderBackground.AbsoluteSize.X, 0, 1)
				value = min + (max - min) * percent
				updateSlider()
			end
		end

		SliderBackground.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or 
				input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				handleInputPosition(input)
			end
		end)

		SliderBackground.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or 
				input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			end
		end)

		SliderIndicator.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or 
				input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
			end
		end)

		SliderIndicator.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or 
				input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			end
		end)

		local TouchHitbox = Instance.new("Frame")
		TouchHitbox.Name = "TouchHitbox"
		TouchHitbox.Size = UDim2.new(1, 0, 0, 30)
		TouchHitbox.Position = UDim2.new(0, 0, 0, 20)
		TouchHitbox.BackgroundTransparency = 1
		TouchHitbox.Parent = Slider

		TouchHitbox.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or
				input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				handleInputPosition(input)
			end
		end)

		TouchHitbox.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or
				input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch) then
				handleInputPosition(input)
			end
		end)

		return SliderFrame
	end

	return sectionFunctions
end

function UILibrary:SelectTab(name)
	for _, tab in pairs(self.Tabs) do
		if tab.Button.Name == name.."Tab" then
			tab.Content.Visible = true
			TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}):Play()
			TweenService:Create(tab.Button.TabText, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
			TweenService:Create(tab.Indicator, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
			self.ActiveTab = tab
		else
			tab.Content.Visible = false
			TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
			TweenService:Create(tab.Button.TabText, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
			TweenService:Create(tab.Indicator, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
		end
	end
end

return UILibrary
