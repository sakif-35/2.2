#include<bits/stdc++.h>
using namespace std;

void partial_pivot(vector<vector<double>> &mat){
    for(int i=0; i<2; i++){
        int swap1 = i, swap2 = i;
        double mx = abs(mat[i][i]);
        for(int j=i+1; j<3; j++){
            if(abs(mat[j][i])>mx){
                mx = abs(mat[j][i]);
                swap2 = j;
            }
        }
        swap(mat[swap1],mat[swap2]);
    }
}

void forward_elimination(vector<vector<double>> &mat){
    for(int i=0; i<2; i++){
        double pivot = mat[i][i];
        for(int j=i+1; j<3; j++){
            double x = mat[j][i]/pivot;
            for(int k=0; k<4; k++){
                mat[j][k] -= x*mat[i][k];
            }
        }
    }
}

void backward_substitution(vector<vector<double>> &mat, vector<double> &ans){
    double z = mat[2][3]/mat[2][2];
    double y = (mat[1][3]-mat[1][2]*z)/mat[1][1];
    double x = (mat[0][3]-z*mat[0][2]-y*mat[0][1])/mat[0][0];
    ans.push_back(x);
    ans.push_back(y);
    ans.push_back(z);
}

int main(){

    vector<double> v(4);
    vector<vector<double>> mat(3,v);
    for(int i=0; i<3; i++){
        for(int j=0; j<4; j++){
            cin >> mat[i][j];
        }
    }
    vector<double> ans;

    partial_pivot(mat);
    forward_elimination(mat);
    backward_substitution(mat,ans);
    for(auto x : ans) cout << x << endl;


    return 0;
}