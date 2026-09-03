#include <bits/stdc++.h>
using namespace std;

double f(double x){
    double ans = (x*x)*x + exp(-x) - 5*sin(x) - 2; 
    return ans;
}

double f1(double x){
    double ans = 3*(x*x) - exp(-x) - 5*cos(x);
    return ans;
}

double h(double x){
    double ans = x*(x*(x+5)+2)-1;
    return ans;
}

int main() {
    
    double a = 0.5, b = 0.4;
    double prev_prev = -10, prev = a, curr = b, e = 10;
    cout << fixed << setprecision(8);
    while(e>=0.000001){
        prev_prev = prev;
        prev = curr;
        curr = prev - ((prev-prev_prev)/(f(prev)-f(prev_prev)))*f(prev);
        e = abs(curr-prev);
    }
    cout << curr << endl;
    cout << h(curr) << endl;

    return 0;
}