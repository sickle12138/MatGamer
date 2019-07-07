<<<<<<< HEAD
function Rect = getWindowRect(class,name)
%获取窗体句柄
hwnd = py.win32gui.FindWindow(class, name);
%获取位置
rect = py.win32gui.GetWindowRect(hwnd);
%转换为MATLAB元胞数组
cell_rect = cell(rect);
width = cell_rect{3} - cell_rect{1};
height = cell_rect{4} - cell_rect{2};
Rect=[cell_rect{1} cell_rect{2} width height];
=======
function Rect = getWindowRect(class,name)
%获取窗体句柄
hwnd = py.win32gui.FindWindow(class, name);
%获取位置
rect = py.win32gui.GetWindowRect(hwnd);
%转换为MATLAB元胞数组
cell_rect = cell(rect);
width = cell_rect{3} - cell_rect{1};
height = cell_rect{4} - cell_rect{2};
Rect=[cell_rect{1} cell_rect{2} width height];
>>>>>>> 3e6dae8363adb3e199bd7991ba6b923201361fe0
end