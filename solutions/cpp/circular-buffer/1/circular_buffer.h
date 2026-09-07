#pragma once
#include <vector>
#include <stdexcept>
namespace circular_buffer {

template<typename T> class circular_buffer {
public:
    circular_buffer(int len) : m_len{len} {
        T element{};
        for (auto idx = 0; idx < m_len; idx++) {
            m_elements.push_back(element);
        }
    };

    T read() {
        if (m_count == 0) {
            throw (std::domain_error("Buffer empty."));
        }
        auto result = m_elements[m_start];
        m_count--;
        m_start++;
        m_start %= m_len;
        return result;
    };

    void clear() {
        while (m_count > 0) {
            read();
        }
    };

    void write(T element) {
        if (m_count == m_len) {
            throw (std::domain_error("Buffer full."));
        }
        m_elements[m_end] = element;
        m_count++;
        m_end++;
        m_end %= m_len;
    };

    void overwrite(T element) {
        if (m_count < m_len) {
            write(element);
        } else {
            m_elements[m_end] = element;
            m_end++;
            m_end %= m_len;            
            m_start++;
            m_start %= m_len;
        }
    };
private:
    const int m_len;
    int m_count = 0;
    int m_start = 0;
    int m_end = 0;
    std::vector<T> m_elements;
};

}  // namespace circular_buffer
