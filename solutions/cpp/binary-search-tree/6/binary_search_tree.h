#pragma once
#include <iterator>
#include <memory>
namespace binary_search_tree {
template<typename S> struct Node {
    S node_data{};
    Node* left{nullptr};
    Node* right{nullptr};
    Node* up{nullptr};//what else am I going to do, look for it from root every time?
    Node* all_the_way_to_the_left() {
        auto current = this;
        while (current->left != nullptr) {
            current = current->left;
        }
        return current;
    };
    Node* all_the_way_to_the_right() {
        auto current = this;
        while (current->right != nullptr) {
            current = current->right;
        }
        return current;
    };
};

template<typename T> class binary_tree {
public:
    class binary_tree_iterator {
    public:
        bool is_end() const {
            return !((bool) node_ptr);
        };

        binary_tree_iterator(Node<T>* node_ptr) : node_ptr{node_ptr} {};

        binary_tree_iterator& operator++() {
            if (node_ptr->right != nullptr) {
                node_ptr = node_ptr->right;
                if (node_ptr->left != nullptr) {
                    node_ptr = node_ptr->all_the_way_to_the_left();
                }
            } else {
                auto new_node_ptr = node_ptr->up;
                if (new_node_ptr != nullptr) {
                    while (new_node_ptr->right == node_ptr) {
                        node_ptr = new_node_ptr;
                        new_node_ptr = node_ptr->up;
                        if (new_node_ptr == nullptr) {
                            break;
                        }
                    }
                }
                node_ptr = new_node_ptr;
            }
            return *this;
        };

        T& operator*() const {
            return node_ptr->node_data;
        }

        bool operator==(binary_tree_iterator other) const {
            if (is_end() || other.is_end()) {
                return is_end() && other.is_end();
            }
            return **this == *other;
        };

        bool operator!=(binary_tree_iterator other) const {
            if (is_end() || other.is_end()) {
                return !is_end() || !(other.is_end());
            }
            return **this != *other;
        };
    private:
        Node<T>* node_ptr;
    };

    binary_tree_iterator begin() {
        return binary_tree_iterator(m_root->all_the_way_to_the_left());
    };

    binary_tree_iterator end() {
        return binary_tree_iterator(nullptr);
    };

    binary_tree(T root_data) {
        m_root = new Node<T>();
        m_root->node_data = root_data;
    };

    binary_tree(Node<T>* root) : m_root{root} {};

    T data() const {
        return m_root->node_data;
    };

    void insert(T new_node_data) {
        auto node = new Node<T>();
        bool right_child;
        node->node_data = new_node_data;
        auto current = m_root;
        while (true) {
            if (new_node_data > current->node_data) {
                if (current->right != nullptr) {
                    current = current->right;
                } else {
                    right_child = true;
                    break;
                }
            } else {
                if (current->left != nullptr) {
                    current = current->left;
                } else {
                    right_child = false;
                    break;
                }
            }
        }
        if (right_child) {
            current->right = node;
        } else {
            current->left = node;
        }
        node->up = current;
    };

    std::unique_ptr<binary_tree<T>> left() {
        if (m_root->left == nullptr) {
            return nullptr;
        }
        auto result = std::make_unique<binary_tree>(m_root->left);
        return result;
    };

    std::unique_ptr<binary_tree<T>> right() {
        if (m_root->right == nullptr) {
            return nullptr;
        }
        auto result = std::make_unique<binary_tree>(m_root->right);
        return result;
    };
private:
    Node<T>* m_root;
};
}  // namespace binary_search_tree
