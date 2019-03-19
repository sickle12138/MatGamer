function setMouse(x,y)
%x为到屏幕左边距离
%y为到屏幕顶部距离
py.win32api.SetCursorPos(int32([x,y]))
end