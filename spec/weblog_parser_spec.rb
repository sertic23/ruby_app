describe WeblogParser do
  describe 'run' do
    shared_examples 'matches only real data and skips if IP address is wrong' do
      let(:traffic) { ['/home 123.123.123.123', '/home/1 123.123.123.123', '/home/2 123.123.123.123'] }
      let(:ip_adresses) { ['123.123.123.123', '123.123.123.123', '123.123.123.123'] }
      let(:pages) { ['/home', '/home/1', '/home/2'] }

      it { is_expected.to eq([pages, ip_adresses, traffic]) }
    end
    let(:file_name) { 'data.log' }
    subject { WeblogParser.new(file_name).run }

    context 'when file does not exist' do
      let(:message) { 'File does not exist!' }

      it 'should raise Runtime error' do
        expect { subject }.to raise_error(RuntimeError, message)
      end
    end

    context 'when file is filed with valid data' do
      let(:file_name) { 'spec/fixtures/valid_data.log' }

      it_behaves_like 'matches only real data and skips if IP address is wrong'
    end

    context 'when file is filed with some invalid data' do
      let(:file_name) { 'spec/fixtures/invalid_data.log' }

      it_behaves_like 'matches only real data and skips if IP address is wrong'
    end
  end
end
