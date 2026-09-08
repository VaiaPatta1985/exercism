#include "complex_numbers.h"

namespace complex_numbers {
Complex operator+(double one, Complex other) {
    return other + one;
 }

Complex operator-(double one, Complex other) {
    return -other + one;
 }

Complex operator*(double one, Complex other) {
    return other * one;
 }

Complex operator/(double one, Complex other) {
    return other.reciprocal() * one;
 }

bool operator==(double one, Complex other) {
    return other == one;
 }

bool operator!=(double one, Complex other) {
    return other != one;
 }

Complex::Complex(double re, double im) : m_re{re}, m_im{im} { }

/*operator Complex::double() const {
    if (m_im == 0.0) {
        return m_re;
     }
    throw (domain_error("Cannot treat nonreal complex as double."));
}*/

double Complex::abs_sq() const {
    return m_re * m_re + m_im * m_im;
 }

Complex Complex::reciprocal() const {
    auto ab_sq = abs_sq();
    return Complex(m_re / ab_sq, -m_im / ab_sq);
 }

Complex Complex::operator+() const {
    return *this;
 }

Complex Complex::operator-() const {
    return Complex(-m_re, -m_im);
 }

double Complex::real() const {
    return m_re;
 }

double Complex::imag() const {
    return m_im;
 }

double Complex::abs() const {
    return sqrt(abs_sq());
 }

Complex Complex::conj() const {
    return Complex(m_re, -m_im);
 }

Complex Complex::exp() const {
    return std::exp(m_re) * Complex(cos(m_im), sin(m_im));
 }

Complex Complex::operator+(Complex other) const {
    return Complex(m_re + other.real(), m_im + other.imag());
 }

Complex Complex::operator+(double other) const {
    return Complex(m_re + other, m_im);
 }

Complex Complex::operator-(Complex other) const {
    return Complex(m_re - other.real(), m_im - other.imag());
 }

Complex Complex::operator-(double other) const {
    return Complex(m_re - other, m_im);
 }

Complex Complex::operator*(Complex other) const {
    auto o_re = other.real();
    auto o_im = other.imag();
    return Complex(m_re * o_re - m_im * o_im, m_re * o_im + m_im * o_re);
 }

Complex Complex::operator*(double other) const {
    return Complex(other * m_re, other * m_im);
 }

Complex Complex::operator/(Complex other) const {
    return *this * other.reciprocal();
 }

Complex Complex::operator/(double other) const {
    return Complex(m_re / other, m_im / other);
 }

Complex& Complex::operator+=(Complex other) {
    *this = *this + other;
    return *this;
 }

Complex& Complex::operator+=(double other) {
    m_re += other;
    return *this;
 }

Complex& Complex::operator-=(Complex other) {
    *this = *this - other;
    return *this;
 }

Complex& Complex::operator-=(double other) {
    m_re -= other;
    return *this;
 }

Complex& Complex::operator*=(Complex other) {
    *this = *this * other;
    return *this;
 }

Complex& Complex::operator*=(double other) {
    m_re *= other;
    m_im *= other;
    return *this;
 }

Complex& Complex::operator/=(Complex other) {
    *this = *this / other;
    return *this;
 }

Complex& Complex::operator/=(double other) {
    m_re /= other;
    m_im /= other;
    return *this;
 }

bool Complex::operator==(Complex other) const {
    return m_re == other.real() && m_im == other.imag();
 }

bool Complex::operator==(double other) const {
    return m_re == other && m_im == 0.0;
 }

bool Complex::operator!=(Complex other) const {
    return !(*this == other);
 }

bool Complex::operator!=(double other) const {
    return !(*this == other);
}

Complex& Complex::operator=(double other) {
    m_re = other;
    m_im = 0.0;
    return *this;
}
}  // namespace complex_numbers
