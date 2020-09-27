require_relative '../../lib/invaders/detection_report'

RSpec.describe Invaders::DetectionReport do
  let(:results) {
    [ double('likely result', coordinates: [], confidence: 0.9),
      double('another likely result', coordinates: [], confidence: 0.9),
      double('possible result', coordinates: [], confidence: 0.5),
      double('unlikely result', coordinates: [], confidence: 0.1) ]
  }

  it 'only reports results of 0.8 confidence and above by default' do
    output = StringIO.new

    Invaders::DetectionReport.new(results, out: output).print_report

    output.rewind

    expect(output.readlines.length).to eq(2)
  end

  it 'reports all results at or above the requested minimum level of confidence' do
    output = StringIO.new

    Invaders::DetectionReport.new(results, min_confidence: 0.5, out: output).print_report

    output.rewind

    expect(output.readlines.length).to eq(3)
  end
end
