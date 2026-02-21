class SecureList(list):
    def __getitem__(self, subscript):
        try: return super().__getitem__(subscript)
        finally: del self[subscript]
    def __repr__(self):
        try: return super().__repr__()
        finally: self.clear()
