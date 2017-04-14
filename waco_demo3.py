from __future__ import unicode_literals

import os
import sys

from demo_opts import get_device
from luma.core.render import canvas

from waco import padding_left, padding_right, padding_top, padding_bottom

import PIL

import av


def main(num_iterations=sys.maxsize, fps=1):
    device = get_device()
    x = padding_left
    y = padding_top
    r_w = x + (device.width - padding_right)
    r_h = device.height - (y + padding_bottom)

    video_path = os.path.abspath(os.path.join(os.path.dirname(__file__),
        'movie.mp4'))
    clip = av.open(video_path)

    for frame in clip.decode(video=0):
        print('{} ------'.format(frame.index))
        img = frame.to_image()
        size = device.width, device.height
        img = img.resize(size, PIL.Image.ANTIALIAS)
        print(img)
        device.display(img)


if __name__ == "__main__":
    try:
        main(fps=1)
    except KeyboardInterrupt:
        pass
