function Rect = getWindowRect(class,name)
%导入jar包
import com.sun.jna.platform.win32.User32;
import com.sun.jna.platform.win32.WinDef;
%获取窗体句柄
hwnd = User32.INSTANCE.FindWindow(class,name);
%新建一个矩形对象
rect = javaObject('com.sun.jna.platform.win32.WinDef$RECT');
%获取位置
User32.INSTANCE.GetWindowRect(hwnd, rect);
width = rect.right - rect.left;
height = rect.bottom - rect.top;
Rect=[rect.left rect.top width height];
end