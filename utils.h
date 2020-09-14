// Copyright (C) 2020 Allstar Software (Paul Wallace)

#ifndef UTILS_H
#define UTILS_H

#include <QObject>

class Utils : public QObject
{
    Q_OBJECT
public:
    explicit Utils(QObject *parent = 0);
    Q_INVOKABLE void restartDialog() const;

Q_SIGNALS:
   void restartCountdown();
   void muteCountdown();
};

#endif // UTILS_H
