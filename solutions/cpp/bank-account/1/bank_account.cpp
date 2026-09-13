#include "bank_account.h"

namespace Bankaccount {

int Bankaccount::balance() const {
    if (m_open) {
        return m_balance;
    }
    throw (std::runtime_error("Account is closed."));
}
void Bankaccount::open() {
    if (!m_open) {
        hands_off.lock();
        m_open = true;
        hands_off.unlock();
    } else {
        throw (std::runtime_error("Account is open."));
    }
}
void Bankaccount::close() {
    if (m_open) {
        hands_off.lock();
        m_open = false;
        m_balance = 0;
        hands_off.unlock();
    } else {
        throw (std::runtime_error("Account is closed."));
    }
}
void Bankaccount::deposit(int amount) {
    if (m_open) {
        if (amount >= 0) {
            hands_off.lock();
            m_balance += amount;
            hands_off.unlock();
        } else {
            throw (std::runtime_error("Amounts cannot be negative."));
        }
    } else {
        throw (std::runtime_error("Account is closed."));
    }
}
void Bankaccount::withdraw(int amount) {
    if (m_open) {
        if (amount >= 0) {
            if (amount <= m_balance) {
                hands_off.lock();
                m_balance -= amount;
                hands_off.unlock();
            } else {
                throw (std::runtime_error("Requested amount not available."));
            }
        } else {
            throw (std::runtime_error("Amounts cannot be negative."));
        }
    } else {
        throw (std::runtime_error("Account is closed."));
    }
}
}
