#pragma once
#include <cmath>
#include <stdexcept>
namespace complex_numbers {
class Complex {
public:
    Complex(double re, double im=0.0);
    operator double() const {
        if (m_im == 0.0) {
            return m_re;
        }
        throw (std::domain_error("Cannot treat nonreal complex as double."));
    };
    double real() const;
    double imag() const;
    double abs() const;
    Complex conj() const;
    Complex exp() const;
    Complex reciprocal() const;
    Complex operator+() const;
    Complex operator-() const;
    Complex operator+(const Complex& other) const;
    Complex operator-(const Complex& other) const;
    Complex operator*(const Complex& other) const;
    Complex operator/(const Complex& other) const;
    Complex& operator+=(const Complex& other);
    Complex& operator-=(const Complex& other);
    Complex& operator*=(const Complex& other);
    Complex& operator/=(const Complex& other);
    bool operator==(const Complex& other) const;
    bool operator!=(const Complex& other) const;
    Complex operator+(double other) const;
    Complex operator-(double other) const;
    Complex operator*(double other) const;
    Complex operator/(double other) const;
    Complex& operator=(double other);
    Complex& operator+=(double other);
    Complex& operator-=(double other);
    Complex& operator*=(double other);
    Complex& operator/=(double other);
    bool operator==(double other) const;
    bool operator!=(double other) const;
private:
    double m_re;
    double m_im;
    double abs_sq() const;
};
Complex operator+(double one, const Complex& other);
Complex operator-(double one, const Complex& other);
Complex operator*(double one, const Complex& other);
Complex operator/(double one, const Complex& other);
bool operator==(double one, const Complex& other);
bool operator!=(double one, const Complex& other);
}  // namespace complex_numbers
