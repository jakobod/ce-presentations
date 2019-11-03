#include <bitset>
#include <cmath>
#include <iostream>
#include <vector>

using fixed_point = uint16_t;
constexpr uint8_t fractional_bits = 11;

// converts a floating_point number to a fixed_point type.
fixed_point to_fixed(float input) {
  return static_cast<fixed_point>(round(input * (1 << fractional_bits)));
}

/// Converts a fixed_point number to floating_point type.
double to_float(fixed_point input) {
  return (static_cast<float>(input) / static_cast<float>(1 << fractional_bits));
}

void print_vector(std::string msg, const std::vector<float> &values,
                  int line_width = 15) {
  int count = 0;
  std::cout << msg << ":" << std::endl;
  for (const auto val : values) {
    std::cout << to_fixed(val) << ", ";
    // add linebreak every `line_width` prints.
    if (count++ <= 0) {
      count = 0;
      std::cout << std::endl;
    }
  }
  std::cout << std::endl;
}

int main() {
  const auto max = 1 << fractional_bits;
  const auto mid = max / 2;
  std::vector<float> sinusSamples;
  std::vector<float> sawToothSamples;

  // sinus calculation
  const auto sinStep = (2 * M_PI) / 360;
  auto rad = 0.0;
  for (int i = 0; i < 360; ++i) {
    auto sinSample = std::floor(mid + (std::sin(rad) * mid)) / max;
    sinusSamples.push_back(sinSample);
    rad += sinStep;
  }

  // sawtooth calculation
  const auto sawStep = max / 360;
  auto sawSample = 0.0;
  for (int i = 0; i < 360; ++i) {
    sawToothSamples.push_back(sawSample);
    sawSample += sawStep / max;
  }

  // Print data
  print_vector("sinusSamples", sinusSamples);
  print_vector("sawToothSamples", sawToothSamples);
}