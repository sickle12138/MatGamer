function key(index)
py.win32api.keybd_event(int32(index), int32(0), int32(0), int32(0))
end