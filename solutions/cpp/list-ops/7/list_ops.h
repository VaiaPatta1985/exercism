#pragma once
#include <vector>
#include <functional>
namespace list_ops {

template<typename T> void append(std::vector<T>& v1, const std::vector<T>& v2) {
    for (const auto& element : v2) {
        v1.push_back(element);
    }
};

template<typename T> std::vector<T> concat(const std::vector<std::vector<T>>& v) {
    std::vector<T> result;
    for (const auto& in_vec : v) {
        for (const auto& element : in_vec) {
            result.push_back(element);
        }
    }
    return result;
};

template<typename T> std::vector<T> reverse(const std::vector<T>& v) {
    const int len = v.size();
    std::vector<T> result;
    for (auto idx = len - 1; idx >= 0; idx--) {
        result.push_back(v[idx]);
    }
    return result;
};

template<typename T> size_t length(const std::vector<T>& v) {
    return v.size();//todo do from scratch
};

template<typename T, typename L> std::vector<T> filter(const std::vector<T>& v, L lam) {
    const std::function<bool(T)> f = lam;
    std::vector<T> result;
    for (const auto& element : v) {
        if (f(element)) {
            result.push_back(element);
        }
    }
    return result;
};

template<typename T, typename L> T foldl(const std::vector<T>& v, const T& whatever,
                                         L lam) {
    const std::function<T(T,T)> f = lam;
    T result = whatever;
    for (const auto& element : v) {
        result = f(result, element);
    }
    return result;
};

template<typename T, typename L> T foldr(const std::vector<T>& v, const T& whatever,
                                         L lam) {
    const int len = v.size();
    const std::function<T(T,T)> f = lam;
    T result = whatever;
    for (auto idx = len - 1; idx >= 0; idx--) {
        result = f(result, v[idx]);
    }
    return result;
};


template<typename T, typename L> auto map(const std::vector<T>& v, L lam) {
    /*if (v.empty()) {return v;}//wrong type!
    auto x = lam(v[0]);
    using S = decltype(x);*/
    using S = std::invoke_result_t<L, T>;
    const std::function<S(T)> f = lam;
    std::vector<S> result;
    for (const auto& element : v) {
        result.push_back(f(element));
    }
    return result;
};//*/
/*
template<typename T, typename L> std::vector<T> map(const std::vector<T>& v, L lam) {
    const std::function<T(T)> f = lam;
    std::vector<T> result;
    for (const auto& element : v) {
        result.push_back(f(element));
    }
    return result;
};//*/
}  // namespace list_ops
