#include<bits/stdc++.h>
using namespace std;

vector<int> vec = {1,-3, -3,11,-6};
vector<double> roots;

double f(double x){
    double ans = vec[0];
    for(int i=1; i<vec.size(); i++){
        ans = ans*x + vec[i];
    }
    return ans;
}


int main(){
    cout << fixed << setprecision(7);
    double p = (double)vec[1]/vec[0], q = (double)vec[2]/vec[0];
    double upper = sqrt(p*p - 2*q), lower = -1*upper;
    double l = 0, r = lower, ds = 0.1, a = 0, b = 0, c = 0;
    double prev = 0, curr = 0;
    double tolerable = 0.000000001, error = 100;
    while(r<=upper){
        l = r;
        r = l + ds;
        a = l, b = r, c = INT_MAX;
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
    for(auto x : roots) cout << x << endl;
}