#include "SimplePIDController.h"

using namespace std;

SimplePIDController::SimplePIDController() {}
SimplePIDController::~SimplePIDController() {}

void SimplePIDController::set(double p, double i, double d) {

  this->Kp = p;
  this->Ki = i;
  this->Kd = d;

  this->previous_error = 0.0;

  this->p_error = 0.0;
  this->i_error = 0.0;
  this->d_error = 0.0;

  this->n = 0.0;
  this->total_square_error = 0.0;
}

double SimplePIDController::compute(const double error){

  // Uncomment the lines below if you are manually tuning
  /*
  this->n++;
  this->total_square_error += error * error;
  double average_error = this->total_square_error / this->n;

  cout << " #" << this->n
       << " running average: " << average_error
       << " running total: " << this->total_square_error << endl;
  */

  this->p_error = error;
  this->i_error += error;
  this->d_error = error - this->previous_error;
  this->previous_error = error;

  this->r = -1. * (this->Kp * this->p_error +
                   this->Ki * this->i_error +
                   this->Kd * this->d_error);
  return this->r;
}
