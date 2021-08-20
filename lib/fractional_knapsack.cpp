#include <iostream>
#include <vector>
#include <bits/stdc++.h>

using std::vector;
using namespace std;
double get_optimal_value(int capacity, vector<int> weights, vector<int> values,int n) {
  double value = 0.0;
  double cap = capacity;
  int val=0;
  vector<double>ratio(n);
  for(int i=0;i<n;i++){
  	ratio[i] = values[i]/weights[i];
  }
  
  while(val!=capacity){
  
double max = *max_element(ratio.begin(),ratio.end());
  int index = max_element(ratio.begin(),ratio.end())-ratio.begin();
  if(cap>=weights[index]){
  	val = val+weights[index];
  	value = value + values[index];
  	cap = cap-val;
  }
  else{
  	val = val + cap;
  	value = value +( cap/weights[index])*values[index];
  	
  	
  }
  values.erase(values.begin()+index);
  weights.erase(weights.begin()+index);
   ratio.erase(ratio.begin()+index); 
}
  return value;
}

int main() {
  int n;
  int capacity;
  std::cin >> n >> capacity;
  vector<int> values(n);
  vector<int> weights(n);
  for (int i = 0; i < n; i++) {
    std::cin >> values[i] >> weights[i];
  }

  double optimal_value = get_optimal_value(capacity, weights, values,n);

  std::cout.precision(10);
  std::cout << optimal_value << std::endl;
  return 0;
}
