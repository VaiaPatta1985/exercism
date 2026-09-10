#include "simple_linked_list.h"


namespace simple_linked_list {
std::size_t List::size() const {
    return current_size;
}

void List::push(int entry) {
    auto new_element = new Element(entry);
    new_element->next = head;
    head = new_element;
    current_size++;
}

int List::pop() {
    if (current_size == 0) {
        throw (std::underflow_error("Cannot pop from an empty list."));
    }
    const auto result = head->data;
    const auto old_head = head;
    head = head->next;
    delete old_head;
    current_size--;
    return result;
}

void List::reverse() {
    if (head == nullptr) {
        return;
    }
    std::vector<Element*> element_ptr_list = {head};
    auto current_element_ptr = head;
    const int len = current_size;
    while (current_element_ptr != nullptr) {
        head = current_element_ptr;
        current_element_ptr = current_element_ptr->next;
        element_ptr_list.push_back(current_element_ptr);
    }
    element_ptr_list[0]->next = nullptr;
    for (int idx = 1; idx < len; idx++) {
        element_ptr_list[idx]->next = element_ptr_list[idx - 1];
    }
}

List::~List() {
    while (current_size != 0) {
        pop();
    }
}
}  // namespace simple_linked_list
