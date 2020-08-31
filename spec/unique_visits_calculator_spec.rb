describe UniqueVisitsCalculator do
  describe 'run' do
    shared_examples 'it raises runtime error' do
      it 'should raise Runtime error' do
        expect { subject }.to raise_error(RuntimeError, output)
      end
    end
    let(:output) { 'No data to calculate from!' }

    subject { UniqueVisitsCalculator.new(traffic).run }

    context 'when traffic is nil' do
      let(:traffic) { nil }

      it_behaves_like 'it raises runtime error'
    end

    context 'when traffic is empty array' do
      let(:traffic) { [] }

      it_behaves_like 'it raises runtime error'
    end

    context 'when traffic is valid array' do
      let(:traffic) do
        ['/home 111.111.111.111', '/home/1 123.123.123.123', '/home/2 111.111.111.111', '/home 123.123.123.123',
         '/home/2 123.123.123.123', '/home/2 111.111.111.111', '/home/1 111.111.111.111', '/home 222.222.222.222']
      end
      let(:output) { { '/home' => 3, '/home/2' => 2, '/home/1' => 2 } }

      it { is_expected.to eq(output) }
    end
  end
end
