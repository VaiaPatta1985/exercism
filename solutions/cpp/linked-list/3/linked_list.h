#pragma once
#include <stdexcept>

namespace linked_list {
template<typename T> struct Element {
    T content{};
    Element* next{nullptr};
    Element* previous{nullptr};
};

template<typename T> class List {
private:
    Element<T>* m_head{nullptr};
    Element<T>* m_tail{nullptr};
    int m_len{};
public:
    List() {};
    List(List& other) = delete;
    List(List&& other) = delete;

    void push(const T& content) {
        auto element = new Element<T>();
        element->content = content;
        if (m_len == 0) {
            m_head = element;
        } else {
            element->previous = m_tail;
            m_tail->next = element;
        }
        m_tail = element;
        m_len++;
    };

    T pop() {
        if (m_len == 0) {
            throw (std::domain_error("Cannot pop an empty list."));
        }
        const auto result = m_tail->content;
        const auto goodbye = m_tail;
        m_tail = m_tail->previous;
        if (m_tail != nullptr) {
            m_tail->next = nullptr;
        }
        delete goodbye;
        m_len--;
        return result;
    };

    T shift() {
        if (m_len == 0) {
            throw (std::domain_error("Cannot shift an empty list."));
        }
        const auto result = m_head->content;
        const auto goodbye = m_head;
        m_head = m_head->next;
        if (m_head != nullptr) {
            m_head->previous = nullptr;
        }
        delete goodbye;
        m_len--;
        return result;
    };

    void unshift(const T& content) {
        auto element = new Element<T>();
        element->content = content;
        if (m_len == 0) {
            m_tail = element;
        } else {
            element->next = m_head;
            m_head->previous = element;
        }
        m_head = element;
        m_len++;
    };

    int count() const {
        return m_len;
    };

    bool erase(const T& content) {
        auto current = m_head;
        while (current != nullptr) {
            if (current->content == content) {
                if (current == m_head) {
                    m_head = current->next;
                } else {
                    current->previous->next = current->next;
                }
                if (current == m_tail) {
                    m_tail = current->previous;
                } else {
                    current->next->previous = current->previous;
                }
                delete current;
                m_len--;
                return true;
            }
            current = current->next;
        }
        return false;
    };

    ~List() {
        while (count() > 0) {
            pop();
        }
    };
};
}  // namespace linked_list
