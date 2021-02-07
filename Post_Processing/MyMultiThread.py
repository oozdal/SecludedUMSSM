import os

class MyMultiThread():
    def __init__(self):
        pass 
 
    def CreateScreens(self,NumberofScreen,ScreenBaseName):
        self.NumberofScreen = NumberofScreen
        self.ScreenBaseName = ScreenBaseName
        for screen_no in range(1,self.NumberofScreen+1):
            os.system('screen -S '+self.ScreenBaseName+'_'+str(screen_no))

    def CreateDetachedScreens(self,NumberofScreen,ScreenBaseName):
        self.NumberofScreen = NumberofScreen
        self.ScreenBaseName = ScreenBaseName
        for screen_no in range(1,self.NumberofScreen+1):
            self.ScreenFullName = self.ScreenBaseName+'_'+str(screen_no)
            os.system('screen -S '+self.ScreenFullName+' -d -m')
        

    def DetachScreen(self,ScreenNameToDetach):
        self.ScreenNameToDetach = ScreenNameToDetach
        os.system("screen -d "+self.ScreenNameToDetach)

    def AttachScreen(self,ScreenNameToAttach):
        self.ScreenNameToAttach = ScreenNameToAttach
        os.system("screen -r "+ScreenNameToAttach)

    def KillScreen(self,ScreenNameToKill):
        self.ScreenNameToKill = ScreenNameToKill
        os.system("screen -X -S "+self.ScreenNameToKill+" kill")
            
 




