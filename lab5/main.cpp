#include <bits/types/struct_timespec.h>
#include <cstdint>
#include <ctime>
#include <opencv4/opencv2/videoio.hpp>
#include <opencv4/opencv2/core.hpp>
#include <opencv4/opencv2/highgui.hpp>
#include <opencv4/opencv2/opencv.hpp>
#include <iostream>

using namespace cv;
using namespace std;

int main(int, char **) {
  int64_t programmStart = getTickCount();
  double timeSum = 0.0;
  Mat frame;
  VideoCapture cap;
  // open the default camera using default API
  // cap.open(0);
  // OR advance usage: select any API backend
  int deviceID = 0;        // 0 = open default camera
  int apiID = cv::CAP_ANY; // 0 = autodetect default API
  // open selected camera using selected API
  cap.open(deviceID, apiID);
  // check if we succeeded
  if (!cap.isOpened()) {
    cerr << "ERROR! Unable to open camera\n";
    return -1;
  }
  //--- GRAB AND WRITE LOOP
  cout << "Start grabbing" << endl << "Press any key to terminate" << endl;
  Mat modifiedFrame;

  double fps = 0;
  double currFps = getTickFrequency() / (getTickCount() - programmStart);
  int i = 0;
  while(1) {
    ++i;
    int64_t start = getTickCount();
    
    // wait for a new frame from camera and store it into 'frame'
    cap.read(frame);
    // check if we succeeded
    if (frame.empty()) {
      cerr << "ERROR! blank frame grabbed\n";
      break;
    }
    // Edit image
    GaussianBlur(frame, modifiedFrame, Size(21, 21), 0);
    for (int r = 0; r < modifiedFrame.rows; ++r) {
      for (int c = 0; c < modifiedFrame.cols; ++c) {
        auto &color = modifiedFrame.at<Vec3b>(r, c); // rgb format: color(r, g, b)
        color[2] = color[2] / 10 * 8;
      }
    }

    putText(modifiedFrame, "HEIGHT: " + std::to_string(modifiedFrame.rows), Point(10, 60), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(0, 0, 0), 2);
    putText(modifiedFrame, "WIDTH: " + std::to_string(modifiedFrame.cols), Point(10, 100), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(0, 0, 0), 2);

    putText(frame, "HEIGHT: " + std::to_string(modifiedFrame.rows), Point(10, 60), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(0, 0, 0), 2);
    putText(frame, "WIDTH: " + std::to_string(modifiedFrame.cols), Point(10, 100), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(0, 0, 0), 2);

    fps += getTickFrequency() / (getTickCount() - start);
    if (i == 10) {
      currFps = fps / 10;
      i = 0;
      fps = 0;
    }
    putText(modifiedFrame, "FPS: " + std::to_string(round(currFps * 1000) / 1000), Point(10, 20), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(0, 0, 0), 2);
    putText(frame, "FPS: " + std::to_string(round(currFps * 1000) / 1000), Point(10, 20), FONT_HERSHEY_SIMPLEX, 0.8, Scalar(0, 0, 0), 2);

    // show live and wait for a key with timeout long enough to show images
    imshow("Live", frame);
    imshow("Live1", modifiedFrame);
    if (waitKey(5) >= 0) {
      break;
    }
    timeSum += (getTickCount() - start) / getTickFrequency();
  }
  destroyAllWindows();

  double time = (getTickCount() - programmStart) / getTickFrequency();
  cout << "Fraction: " << timeSum / time << endl;
  return 0;
}
