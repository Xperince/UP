import sys
from PyQt6 import QtWidgets

class WindowManager:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(WindowManager, cls).__new__(cls)
            cls._instance._initialized = False
        return cls._instance

    def __init__(self):
        if not self._initialized:
            self.app = QtWidgets.QApplication(sys.argv)
            self.current_window = None
            self.current_user_id = None
            self._initialized = True

    def set_current_userID(self, userID):
        self.current_user_id = userID

    def get_current_userID(self):
        return self.current_user_id

    def show_mainsklad(self):

        from mainsklad import Ui_mainsklad

        if self.current_window:
            self.current_window.close()

        self.mainsklad_window = QtWidgets.QMainWindow()
        self.mainsklad_ui = Ui_mainsklad()
        self.mainsklad_ui.setupUi(self.mainsklad_window)

        self.current_window = self.mainsklad_window
        self.mainsklad_window.show()

    def show_registration(self):

        from register import Ui_regui

        if self.current_window:
            self.current_window.close()

        self.reg_window = QtWidgets.QMainWindow()
        self.reg_ui = Ui_regui()
        self.reg_ui.setupUi(self.reg_window)

        self.current_window = self.reg_window
        self.reg_window.show()

    def run(self):

        self.show_registration()
        sys.exit(self.app.exec())
