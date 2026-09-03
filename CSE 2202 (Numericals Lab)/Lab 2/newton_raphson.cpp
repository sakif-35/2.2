#include <bits/stdc++.h>
using namespace std;

double f(double x){
    double ans = 3*x - cos(x) - 1; 
    return ans;
}

double f1(double x){
    double ans = 3 + sin(x);
    return ans;
}

int main() {
    int a = 0, b = 1;
    while(f(a)*f(b)>=0){
        a++;
        b++;
    }
    double prev = -10, curr = a;
    while(prev!=curr){
        prev = curr;
        curr = prev - f(prev)/f1(prev);
    }
    cout << curr << endl;

    return 0;
}