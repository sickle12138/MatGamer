<<<<<<< HEAD
function Rect = getWindowRect(class,name)
%��ȡ������
hwnd = py.win32gui.FindWindow(class, name);
%��ȡλ��
rect = py.win32gui.GetWindowRect(hwnd);
%ת��ΪMATLABԪ������
cell_rect = cell(rect);
width = cell_rect{3} - cell_rect{1};
height = cell_rect{4} - cell_rect{2};
Rect=[cell_rect{1} cell_rect{2} width height];
=======
function Rect = getWindowRect(class,name)
%��ȡ������
hwnd = py.win32gui.FindWindow(class, name);
%��ȡλ��
rect = py.win32gui.GetWindowRect(hwnd);
%ת��ΪMATLABԪ������
cell_rect = cell(rect);
width = cell_rect{3} - cell_rect{1};
height = cell_rect{4} - cell_rect{2};
Rect=[cell_rect{1} cell_rect{2} width height];
>>>>>>> 3e6dae8363adb3e199bd7991ba6b923201361fe0
end