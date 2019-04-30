#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>

int main() {
  const auto max = 1 << 11;
  const auto mid = max/2;
  std::vector<uint16_t> sinusSamples;  // vector mit samples
  std::vector<uint16_t> sawToothSamples;

  // sinus calculation
  const auto sinStep = (2 * M_PI) / 360;
  auto rad = 0.0;
  for (int i = 0; i < 360; ++i) {
    auto sinSample = std::floor(mid + (std::sin(rad) * mid));
    sinusSamples.push_back(sinSample);
    rad += sinStep;
  }

  // sawtooth calculation
  const auto sawStep = max / 360;
  auto sawSample = 0;
  for(int i = 0; i < 360; ++i) {
    sawToothSamples.push_back(sawSample);
    sawSample += sawStep;
  }

  // plot this stuff into Mat and show it.
  // sinus
  cv::Size sinSize(360*4, max);
  cv::Mat sinPic(sinSize, CV_8UC3, cv::Scalar(255, 255, 255));

  int x = 0;
  for (const auto& value : sinusSamples) {
    cv::drawMarker(sinPic, cv::Point(x, max-value-1), cv::Scalar(255, 0, 0), cv::MARKER_CROSS, 1, 20);
    x += 4;
  }

  cv::namedWindow("plot", cv::WINDOW_NORMAL);
  cv::imshow("plot", sinPic);
  cv::waitKey(0);

  // sawtooth
  cv::Size sawSize(360*8, max);
  cv::Mat sawPic(sawSize, CV_8UC3, cv::Scalar(255, 255, 255));
  x = 0;
  for (const auto& value : sawToothSamples) {
    cv::drawMarker(sawPic, cv::Point(x, max-value-1), cv::Scalar(255, 0, 0), cv::MARKER_CROSS, 1, 20);
    x += 4;
  }
  for (const auto& value : sawToothSamples) {
    cv::drawMarker(sawPic, cv::Point(x, max-value-1), cv::Scalar(255, 0, 0), cv::MARKER_CROSS, 1, 20);
    x += 4;
  }

  cv::imshow("plot", sawPic);
  cv::waitKey(0);


}