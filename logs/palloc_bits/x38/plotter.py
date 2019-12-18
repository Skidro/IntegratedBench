import matplotlib.pyplot as plt

class Plotter:
    def __init__ (self):
        return

    def barplot (self, data, ax):
        ax.bar (range (1, len (data) + 1), data, width = 0.5,
                color = 'red', alpha = 0.6, hatch = 'x')

        return ax
