#pragma once
#include <vector>
#include <functional>
namespace list_ops {

template<typename T> void append(std::vector<T>& v1, std::vector<T> v2) {
    int len = v2.size();
    for (auto idx = 0; idx < len; idx++) {
        v1.push_back(v2[idx]);
    }
};

template<typename T> std::vector<T> concat(std::vector<std::vector<T>> v) {
    int len = v.size();
    std::vector<T> result;
    for (auto idx = 0; idx < len; idx++) {
        auto in_vec = v[idx];
        int in_len = in_vec.size();
        for (auto in_idx = 0; in_idx < in_len; in_idx++) {
            result.push_back(in_vec[in_idx]);
        }
    }
    return result;
};

template<typename T> std::vector<T> reverse(std::vector<T> v) {
    int len = v.size();
    std::vector<T> result;
    for (auto idx = len - 1; idx >= 0; idx--) {
        result.push_back(v[idx]);
    }
    return result;
};

template<typename T> size_t length(std::vector<T> v) {
    return v.size();//todo do from scratch
};

template<typename T, typename L> std::vector<T> filter(std::vector<T> v, L lam) {
    int len = v.size();
    std::function<bool(T)> f = lam;
    std::vector<T> result;
    for (auto idx = 0; idx < len; idx++) {
        auto element = v[idx];
        if (f(element)) {
            result.push_back(element);
        }
    }
    return result;
};

template<typename T, typename L> T foldl(std::vector<T> v, T whatever, L lam) {
    int len = v.size();
    std::function<T(T,T)> f = lam;
    T result = whatever;
    for (auto idx = 0; idx < len; idx++) {
        result = f(result, v[idx]);
    }
    return result;
};

template<typename T, typename L> T foldr(std::vector<T> v, T whatever, L lam) {
    int len = v.size();
    std::function<T(T,T)> f = lam;
    T result = whatever;
    for (auto idx = len - 1; idx >= 0; idx--) {
        result = f(result, v[idx]);
    }
    return result;
};


template<typename T, typename L> auto map(std::vector<T> v, L lam) {
    /*if (v.empty()) {return v;}//wrong type!
    auto x = lam(v[0]);
    using S = decltype(x);*/
    using S = std::invoke_result_t<L, T>;
    std::function<S(T)> f = lam;
    std::vector<S> result;
    int len = v.size();
    for (auto idx = 0; idx < len; idx++) {
        result.push_back(f(v[idx]));
    }
    return result;
};//*/
/*
template<typename T, typename L> std::vector<T> map(std::vector<T> v, L lam) {
    std::function<T(T)> f = lam;
    std::vector<T> result;
    int len = v.size();
    for (auto idx = 0; idx < len; idx++) {
        result.push_back(f(v[idx]));
    }
    return result;
};//*/
}  // namespace list_ops
