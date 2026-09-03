#include<bits/stdc++.h>
using namespace std;

double f(double x){
    double ans = 3*x - cos(x) - 1;
    return ans;
}

int main(){
    int a = 0, b = 1;
    while(f(a)*f(b)>=0){
        a++;
        b++;
    }
    double pp = -10, p = a, c = b;
    while(c!=p){
        pp = p;
        p = c;
        c = p - ((p-pp)/(f(p)-f(pp)))*f(p);
    }
    cout << c << endl;

    return 0;
}