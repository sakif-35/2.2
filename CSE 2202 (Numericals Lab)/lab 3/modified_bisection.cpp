#include<bits/stdc++.h>
using namespace std;

vector<int> vec;
double f(double x){
    double ans = vec[0];
    for(int i=1; i<vec.size(); i++){
        ans = ans*x + vec[i];
    }
    return ans;
}

int main(){
    cout << fixed << setprecision(7);
    int degree;
    cin >> degree;
    vec.resize(degree+1);
    for(int i=0; i<=degree; i++){
        cin >> vec[i];
    }
    double p = (double)vec[1]/vec[0], q = (double)vec[2]/vec[0];
    double upper = sqrt(p*p - 2*q), lower = -1*upper, ds = 0.1;
    double l = 0, r = lower, a = l, b = r, c = 0;
    double tolerable = 0.00001, error = 100;
    double prev = 0, curr = 0;
    vector<double> roots;
    while(r<=upper){
        l = r;
        r = l + ds;
        a = l;
        b = r;
        c = INT_MAX;
        error = 100;
        if(f(a)*f(b)<0){
            while(error>tolerable){
                prev = c;
                c = (a+b)/2;
                if(f(a)*f(c)<0) b = c;
                else if(f(c)*f(b)<0) a = c;
                else break;
                curr = c;
                error = abs((curr-prev)/curr);
            }
            roots.push_back(c);
        }
        
    }
    for(auto x : roots){
        cout << x << endl;
    }
}