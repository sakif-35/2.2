#include<bits/stdc++.h>
using namespace std;

double f(double x){
    double ans = sin(x) + exp(-x) - (x/5);
    return ans; 
}

int main(){
    double a = 2, b = 7, c = 0, curr = 0, prev = a, e = 1, count = 0; 
    while(e>0.000001){
        count++;
        cout << count << "|";
        cout << fixed << setprecision(7) << a << "|" ;
        cout << fixed << setprecision(7) << b << "|" ;
        cout << fixed << setprecision(7) << f(a) << "|" ;
        cout << fixed << setprecision(7) << f(b) << "|" ;
        double interval = abs(a-b);    
        prev = c;
        c = (a+b)/2;
        cout << fixed << setprecision(7) << c << "|" ;
        cout << fixed << setprecision(7) << f(c) << "|" ;
        if(f(a)*f(c)<0) b = c;
        else if(f(c)*f(b)<0) a = c;
        curr = c;
        e = abs((curr-prev)/curr);
        cout << endl;
    }

    cout << fixed << setprecision(7) << c ;

    return 0;
}