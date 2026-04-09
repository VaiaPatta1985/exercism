"""Complex numbers and basic complex arithmetic."""
from math import exp, cos, sin


class ComplexNumber:
    """
    Class implementing complex numbers along with ==, +, -, *, /, |z|, z*, exp(z).
    """
    def __init__(self, real, imaginary):
        self.real, self.imaginary = real, imaginary

    def __eq__(self, other):
        if isinstance(other, ComplexNumber):
            return self.real == other.real and self.imaginary == other.imaginary
        return self.imaginary == 0

    def __add__(self, other):
        if isinstance(other, ComplexNumber):
            return ComplexNumber(self.real + other.real,
                                 self.imaginary + other.imaginary)
        return ComplexNumber(self.real + other, self.imaginary)

    def __radd__(self, other):
        return ComplexNumber(self.real + other, self.imaginary)

    def __mul__(self, other):        
        if isinstance(other, ComplexNumber):
            return ComplexNumber(self.real * other.real -
                                 self.imaginary * other.imaginary,
                                 self.real * other.imaginary +
                                 self.imaginary * other.real)
        return ComplexNumber(self.real * other, self.imaginary * other)

    def __rmul__(self, other):
        return ComplexNumber(self.real * other, self.imaginary * other)

    def __sub__(self, other):        
        if isinstance(other, ComplexNumber):
            return ComplexNumber(self.real - other.real,
                                 self.imaginary - other.imaginary)
        return ComplexNumber(self.real - other, self.imaginary)

    def __rsub__(self, other):
        return ComplexNumber(other - self.real, -self.imaginary)

    def __truediv__(self, other):
        if isinstance(other, ComplexNumber):
            return ComplexNumber(
                (self.real * other.real + self.imaginary * other.imaginary) /
                (other.real ** 2 + other.imaginary ** 2),
                (self.imaginary * other.real - self.real * other.imaginary) /
                (other.real ** 2 + other.imaginary ** 2))
        return ComplexNumber(self.real / other, self.imaginary / other)

    def __rtruediv__(self, other):
        return ComplexNumber(self.real * other /
                             (self.real ** 2 + self.imaginary ** 2),
                             -self.imaginary * other /
                             (self.real ** 2 + self.imaginary ** 2))
    
    def __abs__(self):
        return (self.real ** 2 + self.imaginary ** 2) ** 0.5

    def conjugate(self):
        return ComplexNumber(self.real, -self.imaginary)

    def exp(self):
        return ComplexNumber(exp(self.real) * cos(self.imaginary),
                             exp(self.real) * sin(self.imaginary))
