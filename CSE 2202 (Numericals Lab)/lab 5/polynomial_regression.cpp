#include <bits/stdc++.h>
using namespace std;

void gauss_jordan(vector<vector<double>> &mat){
    int n = mat.size();
    for(int i=0; i<n; i++){
        for(int j=0; j<n; j++){
            if(i!=j){
                double pivot = mat[j][i]/mat[i][i];
                for(int k=0; k<=n; k++){
                    mat[j][k] = mat[j][k] - pivot*mat[i][k];
                }
            }
        }
    }
}

int main() {

    int n;
    cin >> n;
    vector<double> x(n),y(n);
    double sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0, sumX3 = 0, sumX4 = 0, sumX2Y = 0;
    for(int i=0; i<n; i++){
        cin >> x[i] >> y[i];
        sumX += x[i];
        sumY += y[i];
        sumXY += (x[i]*y[i]);
        sumX2 += (x[i]*x[i]);
        sumX3 += (x[i]*x[i]*x[i]);
        sumX4 += (x[i]*x[i]*x[i]*x[i]);
        sumX2Y += (x[i]*x[i]*y[i]);
    }

    vector<vector<double>> mat = {{n,sumX,sumX2,sumY},{sumX,sumX2,sumX3,sumXY},{sumX2,sumX3,sumX4,sumX2Y}};

    gauss_jordan(mat);

    double a = mat[0][3], b = mat[1][3], c = mat[2][3];

    return 0;
}