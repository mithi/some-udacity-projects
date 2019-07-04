#include "PIDController.h"

PIDController::PIDController() {}
PIDController::~PIDController() {}

void PIDController::set(double p, double i, double d) {

  this->Kp = p;
  this->Ki = i;
  this->Kd = d;

  this->previous_error = 0.;
  this->total_error = 0.;

  this->p_error = 0.;
  this->i_error = 0.;
  this->d_error = 0.;

  this->tune = false;
}

void PIDController::do_tune() {

  this->N = 300;
  this->start_n = 20;

  this->tune = true;
  this->best_error = 1.e99;
  this->n = 0;
  this->total_squared_error = 0.;

  this->should_reset = false;

}

bool PIDController::should_reset_now() {
  return this->should_reset;
}

double PIDController::get_Kp() const {
  return this->Kp;
}

double PIDController::get_Ki() const {
  return this->Ki;
}

double PIDController::get_Kd() const {
  return this->Kd;
}

double PIDController::set_Kp(const double p) {
  this->Kp = p;
}

double PIDController::set_Ki(const double i) {
  this->Ki = i;
}

double PIDController::set_Kd(const double d) {
  this->Kd = d;
}

double PIDController::compute(const double error){

  if (this->tune) {

    this->n++;

    if (this->n >= this->start_n) {
      this->total_squared_error += error * error;
    }

    if (this->n >= this->N) {
      this->evaluate();
      this->should_reset = true;
    } else {
      this->should_reset = false;
    }
  }


  this->p_error = error;
  this->i_error += error;
  this->d_error = error - this->previous_error;
  this->previous_error = error;

  this->r = -1. * (this->Kp * this->p_error +
                   this->Ki * this->i_error +
                   this->Kd * this->d_error);

  // constrain value between -1. and 1.
  this->r = this->r > 1. ? 1. : this->r;
  this->r = this->r < -1. ? -1. : this->r;

  return this->r;
}

double PIDController::evaluate(){

  double diff = this->N - this->start_n;
  double current_error = this->total_squared_error / diff;

  double* current_k;
  double* current_d;

  if (this->tune_state == 0 ) {
    current_k = &Kp;
    current_d = &dp;
  } else if (this->tune_state == 1) {
    current_k = &Ki;
    current_d = &di;
  } else {
    current_k = &Kd;
    current_d = &dd;
  }

  if (current_error < best_error) {

    best_error = current_error;
    *current_d *= 1.1;

    if (this->rolled_back) { this->rolled_back = false; }

  } else {

    if (this->rolled_back) {

      *current_k += *current_d;
      *current_d *= 0.9;

    } else

      *current_k -= 2 * (*current_d);
      this->rolled_back = true;
    }
  }

  *current_k += *current_d;

  tune_state = (tune_state + 1) % 3;
  this->n = 0;
  this->total_squared_error = 0.;
}
