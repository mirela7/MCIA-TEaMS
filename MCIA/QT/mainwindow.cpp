#include "mainwindow.h"
#include "./ui_mainwindow.h"
#include <iostream>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    
    loadStylesheet();
    linkSlots();
}


void MainWindow::loadStylesheet()
{
    QFile stylesFile("../../../stylesheet.qss");
    if (!stylesFile.exists())
        qInfo() << "Stylesheet doesnt exist";
    stylesFile.open(QFile::ReadOnly);
    if (!stylesFile.isOpen())
        qInfo() << "Stylesheet could not be opened";
    QString StyleSheet = QLatin1String(stylesFile.readAll());
    qApp->setStyleSheet(StyleSheet);
}

void MainWindow::linkSlots()
{
    connect(ui->btnLogin, SIGNAL(clicked()), this, SLOT(LoginBtnClicked()));
    connect(ui->btnRegister, SIGNAL(clicked()), this, SLOT(RegisterBtnClicked()));
    connect(ui->lneUsername, SIGNAL(textEdited(QString)), this, SLOT(LNETextEdited(QString)));
    connect(ui->lnePassword, SIGNAL(textEdited(QString)), this, SLOT(LNETextEdited(QString)));
}

void MainWindow::LoginBtnClicked()
{
    std::string username = ui->lneUsername->text().toStdString();
    std::string password = ui->lneUsername->text().toStdString();

    try {
        AuthService::LoginUser(*(new User(username, password)));
    }
    catch (CodedException e) {
        /* AuthService throws error if user is not found.*/
        ui->lblUsernameError->setText("Username or password invalid.");
    }
}


void MainWindow::RegisterBtnClicked()
{
    qInfo() << " Register user:";
    std::string username = ui->lneUsername->text().toStdString();
    std::string password = ui->lneUsername->text().toStdString();
    try {
        AuthService::RegisterUser(*(new User(username, password)));
    }
    catch (CodedException e) {
        std::string code = e.GetCode();
        if (code == "username")
            ui->lblUsernameError->setText(QString::fromStdString(e.GetMessage()));
        else
            ui->lblPasswordError->setText(QString::fromStdString(e.GetMessage()));
    }
}

void MainWindow::LNETextEdited(QString string)
{
    if (qobject_cast<QLineEdit*>(sender()) == ui->lneUsername)
        ui->lblUsernameError->setText("");
    else ui->lblPasswordError->setText("");
}

MainWindow::~MainWindow()
{
    delete ui;
}