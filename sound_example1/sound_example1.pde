import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 128;
float[] spectrum = new float[bands];

void setup() {
  size(1280, 360);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);
  strokeWeight(10);
  for(int i = 0; i < bands; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  line( i*10, height, i*10, height - spectrum[i]*height*5 );
  } 
}
