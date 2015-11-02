#include <fstream>
#include <array>

using namespace std;
typedef array<double,3> cartesian;

void writeOut(ofstream&, double, cartesian, cartesian);
cartesian compForce(cartesian);

int main(){
	const double h = 0.01d;
	const int maxit = 1000;

	cartesian r, v, a;
	r.at(0) = 0; r.at(1) = 0; r.at(2) = 1;
	v.at(0) = 0; v.at(1) = 0; v.at(2) = 0;
    a = compForce(r);

	ofstream results;
	results.open("results.csv");
	results << "time,rx,ry,rz,vx,vy,vz" << endl;
	writeOut(results,0,r,v);


	for(unsigned i = 1; i <= maxit; i++){
		for(size_t j = 0; j < a.size(); j++) {
			v.at(j) += 0.5*h*a.at(j);
			r.at(j) += h*v.at(j);
        }
		a = compForce(r);
		for(size_t j = 0; j < a.size(); j++) {
			v.at(j) += 0.5*h*a.at(j);
		}
		writeOut(results,i*h,r,v);
	}
	results.close();

	return 0;
}

void writeOut(ofstream& destination, double t, cartesian r, cartesian v){
		destination << t << ",";
		for(size_t j = 0; j < r.size(); j++) { destination << r.at(j) << ",";	}
		for(size_t j = 0; j < v.size(); j++) { destination << v.at(j) << ",";	}
		destination << endl;
}

cartesian compForce(cartesian x){
    cartesian f;
	for(size_t j = 0; j < f.size(); j++){ f.at(j) = - x.at(j); }
    return f;
}
