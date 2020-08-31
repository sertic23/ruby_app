describe PageLoadCalculator do
  describe 'run' do
    shared_examples 'it raises runtime error' do
      it 'should raise Runtime error' do
        expect { subject }.to raise_error(RuntimeError, output)
      end
    end
    let(:output) { 'No data to calculate from!' }

    subject { PageLoadCalculator.new(pages).run }

    context 'when pages is nil' do
      let(:pages) { nil }

      it_behaves_like 'it raises runtime error'
    end

    context 'when pages is empty array' do
      let(:pages) { [] }

      it_behaves_like 'it raises runtime error'
    end

    context 'when pages is valid array' do
      let(:pages) { ['/home', '/home/1', '/home/2', '/home', '/home/2', '/home/2'] }
      let(:output) { { '/home/2' => 3, '/home' => 2, '/home/1' => 1 } }

      it { is_expected.to eq(output) }
    end
  end
end
