require 'rails_helper'

RSpec.describe Upload::Processor, type: :model do
  context 'success' do
    let(:project) { create(:project) }
    let(:upload) { create(:upload, project_name: project.name) }

    it 'creates a text record for each row in body' do
      expect do
        described_class.perform(upload)
      end.to change(Text, :count).by(upload.body.count)
    end

    it 'associates each text with the project' do
      expect do
        described_class.perform(upload)
      end.to change { project.texts.count }.by(upload.body.count)
    end
  end

  context 'failure' do
    it 'fails if the project can not be found' do
      unassociated_upload = create(:upload)
      expect { described_class.perform(unassociated_upload) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end