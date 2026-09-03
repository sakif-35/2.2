#include <bits/stdc++.h>
using namespace std;

void seidel(vector<vector<double>> &mat, double error, double x, double y, double z, vector<double> &ans){

    double x0 = 0, y0 = 0, z0 = 0, x1 = x, y1 = y, z1 = z;
    double ex = INT_MAX, ey = INT_MAX, ez = INT_MAX;
    while(ex>=error || ey>=error || ez>=error){
        x0 = x1, y0 = y1, z0 = z1;
        x1 = (mat[0][3]-z0*mat[0][2]-y0*mat[0][1])/mat[0][0];
        y1 = (mat[1][3]-z0*mat[1][2]-x1*mat[1][0])/mat[1][1];
        z1 = (mat[2][3]-y1*mat[2][1]-x1*mat[2][0])/mat[2][2];
        ex = abs(x1-x0), ey = abs(y1-y0) , ez = abs(z1-z0);
    }
    ans.push_back(x1);
    ans.push_back(y1);
    ans.push_back(z1);
}


int main() {

    vector<double> v(4);
    vector<vector<double>> mat(3,v);
    for(int i=0; i<3; i++){
        for(int j=0; j<4; j++){
            cin >> mat[i][j];
        }
    }

    vector<double> ans;
    seidel(mat,0.00001,0,0,0,ans);

    for(auto x : ans) cout << x << endl;

    return 0;
}