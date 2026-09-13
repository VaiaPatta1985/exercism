#pragma once
#include <stdexcept>
#include <mutex>

namespace Bankaccount {
class Bankaccount {
public:

    int balance() const;
    void open();
    void close();
    void deposit(int amount);
    void withdraw(int amount);

private:
    int m_balance{};
    bool m_open = false;
    std::mutex hands_off;
};  // class Bankaccount

}  // namespace Bankaccount
