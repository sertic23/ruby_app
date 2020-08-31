describe PageVisitsOutputFormatter do
  describe 'run' do
    let(:load_per_page) { { '/home' => 3, '/home/2' => 2, '/home/1' => 2 } }

    subject { PageVisitsOutputFormatter.new(load_per_page).run }

    context 'when it is not unique adresses' do
      let(:formated_output) { "/home 3 visits\n/home/2 2 visits\n/home/1 2 visits\n" }

      it { is_expected.to eq(formated_output) }
    end

    context 'when it is unique adresses' do
      let(:formated_output) { "/home 3 unique views\n/home/2 2 unique views\n/home/1 2 unique views\n" }

      subject { PageVisitsOutputFormatter.new(load_per_page, true).run }

      it { is_expected.to eq(formated_output) }
    end

    context 'when there is a page that has one visit' do
      let(:load_per_page) { { '/home' => 3, '/home/2' => 2, '/home/1' => 1 } }
      let(:formated_output) { "/home 3 unique views\n/home/2 2 unique views\n/home/1 1 unique view\n" }

      subject { PageVisitsOutputFormatter.new(load_per_page, true).run }

      it { is_expected.to eq(formated_output) }
    end
  end
end
