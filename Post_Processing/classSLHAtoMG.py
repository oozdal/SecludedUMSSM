import os
import shutil

class CopySLHAtoMG():
    def __init__(self):
        pass

    def CheckSLHA(self,SLHAPath):
        return os.path.isfile(SLHAPath)

    def CopySLHAtoCards(self, SLHAPath, CardsPath):
        shutil.copy2(SLHAPath, CardsPath)             # complete target filename given
