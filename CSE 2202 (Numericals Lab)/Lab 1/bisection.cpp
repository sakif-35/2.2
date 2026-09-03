#include<bits/stdc++.h>
using namespace std;

double f(double x){
    double ans = 3*x - cos(x) - 1;
    return ans;
}

int main(){
    double a = 0, b = 1, c = 0, e = 0, curr = 0, prev = 0, count = 0;
    while(f(a)*f(b)>0){
        a++;
        b++;
    }
    while(true){
        count++;
        //c = (a*f(b) - b*f(a))/(f(b) - f(a));
        c = (a+b)/2;
        if(f(a)*f(c)<0) b = c;
        else if(f(c)*f(b)<0) a = c;
        else break;
    }

    cout << c << endl << count;

    return 0;
}