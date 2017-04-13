import time
import datetime
from demo_opts import get_device
from luma.core.render import canvas

from waco import padding_left, padding_right, padding_top, padding_bottom


def rectangle(device, draw):
    x = padding_left
    y = padding_top
    w = x + (device.width - padding_right)
    h = device.height - padding_bottom

    # Draw a rectangle.
    draw.rectangle((x, y, w, h), outline="blue", fill="white")


def main():
    device = get_device()

    for _ in range(2):
        with canvas(device) as draw:
            rectangle(device, draw)
    time.sleep(15)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        pass
