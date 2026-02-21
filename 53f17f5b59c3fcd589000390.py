class SecureList(list):
    def __getitem__(self, subscript):
        try: return super().__getitem__(subscript)
        finally: super().__delitem__(subscript)
    def __repr__(self):
        try: return super().__repr__()
        finally: super().clear()
    def __str__(self): return repr(self)
