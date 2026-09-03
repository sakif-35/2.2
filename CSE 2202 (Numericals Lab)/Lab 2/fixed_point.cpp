#include<bits/stdc++.h>
using namespace std;

double g(double x){
    double ans = (cos(x)+1)/3; 
    return ans;
}

int main(){

    double prev = 0, curr = g(3.2);
    while(prev!=curr){
        prev = curr;
        curr = g(prev);
    }
    cout << curr << endl;


}