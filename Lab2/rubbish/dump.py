from PyQt5 import QtCore, QtDesigner
from gui import *
from main import *
from PyQt5.QtWidgets import (
    QApplication,
    QMainWindow,
    QMessageBox,
    QDialog,
    QTableWidgetItem,
    QHeaderView,
)

def dump_ui(widget, path):
    builder = QtDesigner.QFormBuilder()
    stream = QtCore.QFile(path)
    stream.open(QtCore.QIODevice.WriteOnly)
    builder.save(stream, widget)
    stream.close()

app = QApplication([''])


# dialog = Ui_MainWindow()
dialog = QDialog()
main_win = MainWindow()
ui = gui.Ui_MainWindow()
ui.setupUi(main_win)
# ui = Ui_MainWindow()
# ui.setupUi(dialog)
# dialog.show()

# dump_ui(dialog, 'myui.ui')
dump_ui(main_win, 'myui.ui')