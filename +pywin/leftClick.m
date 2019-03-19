function leftClick
py.win32api.mouse_event(py.win32con.MOUSEEVENTF_LEFTDOWN, int32(0), int32(0), int32(0), int32(0))
py.win32api.mouse_event(py.win32con.MOUSEEVENTF_LEFTUP, int32(0), int32(0), int32(0), int32(0))
end