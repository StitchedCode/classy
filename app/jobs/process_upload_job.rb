# frozen_string_literal: true
class ProcessUploadJob < ActiveJob::Base
  queue_as :default

  def perform(upload_id)
    upload = Upload.find(upload_id)
    Upload::Processor.perform(upload)
  end
end
