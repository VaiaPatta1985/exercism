#pragma once
#include <vector>
#include <functional>
namespace list_ops {

template<typename T> void append(std::vector<T>& v1, std::vector<T> v2) {
    for (auto idx = 0; idx < (int) v2.size(); idx++) {
        v1.push_back(v2[idx]);//todo do from scratch
    }
};

template<typename T> std::vector<T> concat(std::vector<std::vector<T>> v) {
    std::vector<T> result;
    for (auto idx = 0; idx < (int) v.size(); idx++) {
        for (auto in_idx = 0; in_idx < (int) v[idx].size(); in_idx++) {
            result.push_back(v[idx][in_idx]);//todo do from scratch
        }
    }
    return result;
};

template<typename T> std::vector<T> reverse(std::vector<T> v) {
    std::vector<T> result;
    for (int idx = v.size() - 1; idx >= 0; idx--) {
        result.push_back(v[idx]);//todo do from scratch
    }
    return result;
};

template<typename T> size_t length(std::vector<T> v) {
    return v.size();//todo do from scratch
};

template<typename T, typename L> std::vector<T> filter(std::vector<T> v, L lam) {
    std::function<bool(T)> f = lam;
    std::vector<T> result;
    for (auto idx = 0; idx < (int) v.size(); idx++) {//todo do from scratch
        if (f(v[idx])) {result.push_back(v[idx]);}
    }
    return result;
};

template<typename T, typename L> T foldl(std::vector<T> v, T whatever, L lam) {
    std::function<T(T,T)> f = lam;
    T result = whatever;
    for (auto idx = 0; idx < (int) v.size(); idx++) {//todo do from scratch
        result = f(result, v[idx]);
    }
    return result;
};

template<typename T, typename L> T foldr(std::vector<T> v, T whatever, L lam) {
    std::function<T(T,T)> f = lam;
    T result = whatever;
    for (int idx = v.size() - 1; idx >= 0; idx--) {//todo do from scratch
        result = f(result, v[idx]);
    }
    return result;
};


template<typename T, typename L> auto map(std::vector<T> v, L lam) {
    if (v.empty()) {return v;}//wrong type!
    auto x = lam(v[0]);
    using S = decltype(x);
    std::function<S(T)> f = lam;
    std::vector<S> result;
    for (auto idx = 0; idx < (int) v.size(); idx++) {//todo do from scratch
        result.push_back(f(v[idx]));
    }
    return result;
};//*/
/*
template<typename T, typename L> std::vector<T> map(std::vector<T> v, L lam) {
    std::function<T(T)> f = lam;
    std::vector<T> result;
    for (auto idx = 0; idx < (int) v.size(); idx++) {//todo do from scratch
        result.push_back(f(v[idx]));
    }
    return result;
};//*/
}  // namespace list_ops
