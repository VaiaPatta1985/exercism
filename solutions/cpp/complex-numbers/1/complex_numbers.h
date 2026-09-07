#pragma once
#include <cmath>
namespace complex_numbers {
class Complex {
public:
    Complex(double re, double im=0);
    //operator double() const;
    double real() const;
    double imag() const;
    double abs() const;
    Complex conj() const;
    Complex exp() const;
    Complex reciprocal() const;
    Complex operator+() const;
    Complex operator-() const;
    Complex operator+(Complex other) const;
    Complex operator-(Complex other) const;
    Complex operator*(Complex other) const;
    Complex operator/(Complex other) const;
    //void operator=(Complex other);
    void operator+=(Complex other);
    void operator-=(Complex other);
    void operator*=(Complex other);
    void operator/=(Complex other);
    bool operator==(Complex other) const;
    bool operator!=(Complex other) const;
    Complex operator+(double other) const;
    Complex operator-(double other) const;
    Complex operator*(double other) const;
    Complex operator/(double other) const;
    void operator=(double other);
    void operator+=(double other);
    void operator-=(double other);
    void operator*=(double other);
    void operator/=(double other);
    bool operator==(double other) const;
    bool operator!=(double other) const;
private:
    double m_re;
    double m_im;
    double abs_sq() const;
};
Complex operator+(double one, Complex other);
Complex operator-(double one, Complex other);
Complex operator*(double one, Complex other);
Complex operator/(double one, Complex other);
bool operator==(double one, Complex other);
bool operator!=(double one, Complex other);
}  // namespace complex_numbers
