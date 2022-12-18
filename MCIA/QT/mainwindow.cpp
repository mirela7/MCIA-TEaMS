#include "mainwindow.h"
#include "./ui_mainwindow.h"
#include <iostream>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QFile stylesFile("stylesheet.qss");
    if(!stylesFile.exists())
        std::cerr << "File doesnt exist";

    stylesFile.open(QFile::ReadOnly);

    if (!stylesFile.isOpen())
        std::cerr << "File is not open";
    QString StyleSheet = QLatin1String(stylesFile.readAll());
    qApp->setStyleSheet(StyleSheet);
}

MainWindow::~MainWindow()
{
    delete ui;
}

