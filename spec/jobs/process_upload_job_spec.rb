require 'rails_helper'

RSpec.describe ProcessUploadJob, type: :job do
  it 'delegates to the service object' do
    upload = create(:upload)
    expect(Upload::Processor).to receive(:perform).with(upload)
    described_class.perform_now(upload.id)
  end
end
