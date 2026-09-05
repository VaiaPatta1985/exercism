#include "simple_linked_list.h"


namespace simple_linked_list {
std::size_t List::size() const {
    return this->current_size;
}

void List::push(int entry) {
    auto new_element = new Element(entry);
    new_element->next = this->head;
    this->head = new_element;
    this->current_size++;
}

int List::pop() {
    if (this->current_size == 0) {
        throw (std::underflow_error("Cannot pop from an empty list."));
    }
    auto result = this->head->data;
    auto old_head = this->head;
    this->head = this->head->next;
    delete old_head;
    this->current_size--;
    return result;
}

void List::reverse() {
    if (this->head == nullptr) {
        return;
    }
    std::vector<Element*> element_ptr_list = {this->head};
    auto current_element_ptr = this->head;
    auto len = this->current_size;
    while (current_element_ptr != nullptr) {
        this->head = current_element_ptr;
        current_element_ptr = current_element_ptr->next;
        element_ptr_list.push_back(current_element_ptr);
    }
    element_ptr_list[0]->next = nullptr;
    for (long unsigned int idx = 1; idx < len; idx++) {
        element_ptr_list[idx]->next = element_ptr_list[idx - 1];
    }
}

List::~List() {
    while (this->current_size != 0) {
        this->pop();
    }
}
}  // namespace simple_linked_list
