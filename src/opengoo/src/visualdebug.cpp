#include "og_world.h"
#include "wog_level.h"
#include "og_ball.h"
#include "flags.h"

#include <QPainter>
#include <QTime>
#include <QVector2D>

extern OGBall* _nearestBall;
extern OGBall* _selectedBall;

namespace visual_debug
{
const qreal K = 10.0;
bool _initImages = true;
QList<QImage> _images;
const qreal DEGREE = 57.2957795;
}

using namespace visual_debug;

void visualDebug(QPainter* painter, OGWorld* world, qreal zoom)
{
    QPen pen(Qt::yellow,  2.0 * zoom);

    painter->setOpacity(1);
    painter->setPen(pen);

    painter->drawEllipse(QPointF(0, 0), 10.0 * zoom, 10.0 * zoom); // center of word   

    if (world->nearestball() != 0)
    {
        qreal x, y;

        QPointF pos = world->nearestball()->GetPosition().toPointF();
        x = pos.x() * K;
        y = pos.y() * K * (-1);

        pen.setColor(Qt::green);
        painter->setPen(pen);
        painter->drawEllipse(QPointF(x, y), 10, 10);
    }
}
